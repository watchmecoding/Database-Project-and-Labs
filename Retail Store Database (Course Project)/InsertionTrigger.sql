create trigger addmoregoods on Goods
for insert as print 'Insertion is not allowed!'
rollback tran