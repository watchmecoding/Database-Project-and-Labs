create trigger AddRequest on Requests for insert as
print 'Attempt to add' + STR(@@ROWCOUNT) + ' request(s)'
print 'User ' + current_user if CURRENT_USER != 'dbo'
begin
print 'Insertion attempt has been rejected'
rollback tran end
else print 'Success'
