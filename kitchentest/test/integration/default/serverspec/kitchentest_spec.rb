require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'Check /tmp/kitchentest' do
  testfile = file '/tmp/kitchentest'
  it 'it exists' do
    expect(testfile).to be_file
  end
  it 'it contains Hello steve!' do
    expect(testfile).to contain 'Hello Alex!'
  end
  it 'it is owned by root' do
    expect(testfile).to be_owned_by 'root'
  end
  it 'is has group root' do
    expect(testfile).to be_grouped_into 'root'
  end
  it 'it is writeable by root' do
    expect(testfile).to be_writable.by('owner')
  end
  it 'it should not be writable by group' do
    expect(testfile).not_to be_writable.by('group')
  end
  it 'it should not be writable by others' do
    expect(testfile).not_to be_writable.by('others')
  end
end
