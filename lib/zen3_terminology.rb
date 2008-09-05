require 'noosfero/terminology'

class Zen3Terminology < Noosfero::Terminology::Custom
  include GetText

  def initialize
    # NOTE: the hash values must be marked for translation!! 
    super({
      'My Home Page' => N_('My ePortfolio'),
      'Homepage' => N_('ePortfolio'),
      'Communities' => N_('Groups'),
      'A block that displays your communities' => N_('A block that displays your groups'),
      'A block that displays your friends' => N_('A block that displays your contacts'),
      'The communities in which the user is a member' => N_('The groups in which the user is a member'),
      'All communities' => N_('All groups'),
      'Community' => N_('Group'),
      'One community' => N_('One group'),
      '%{num} communities' => N_('%{num} groups'),
      'Disable search for communities' => N_('Disable search for groups'),
      'Enterprises' => N_('Organizations'),
      'The enterprises where this user works.' => N_('The organizations where this user works.'),
      'A block that displays your enterprises' => N_('A block that displays your organizations.'),
      'All enterprises' => N_('All organizations'),
      'Disable search for enterprises' => N_('Disable search for organizations'),
      'One enterprise' => N_('One organization'),
      '%{num} enterprises' => N_('%{num} organizations'),
      'Favorite Enterprises' => N_('Favorite Organizations'),
      'This user\'s favorite enterprises.' => N_('This user\'s favorite organizations'),
      'A block that displays your favorite enterprises' => N_('A block that displays your favorite organizations'),
      'All favorite enterprises' => N_('All favorite organizations'),
      'A search for enterprises by products selled and local' => N_('A search for organizations by products selled and local'),
      'Edit message for disabled enterprises' => N_('Edit message for disabled organizations'),
      'Add favorite enterprise' => N_('Add favorite organization'),
      'Validation info is the information the enterprises will see about how your organization processes the enterprises validations it receives: validation methodology, restrictions to the types of enterprises the organization validates etc.' => N_('Validation info is the information the organizations will see about how your organization processes the organizations validations it receives: validation methodology, restrictions to the types of organizations the organization validates etc.'),
      'Here are all <b>%s</b>\'s enterprises.' => N_('Here all all <b>%s</b>\'s organizations.'),
      'Here are all <b>%s</b>\'s favorite enterprises.' => N_('Here are all <b>%s</b>\'s favorite organizations.'),
      'Favorite Enterprises' => N_('Favorite Organizations'),
      'Enterprises in "%s"' => N_('Organizations in "%s"'),
      'Register a new Enterprise' => N_('Register a new organization'),
      'One friend' => N_('One contact'),
      '%d friends' => N_('%d contacts'),
      '%d communities' => N_('%d groups'),
      'Are you sure you want to remove %s from your friends list?' => N_('Are you sure you want to remove %s from your contacts list?'),
      'Note that %s will still have you as a friend, unless he/she also wants to remove you from his/her friend list.' => N_('Note that %s will still have you as a friend, unless he/she also wants to remove you from his/her contact list.'),
      'Yes, I want to remove %s from my friend list' => N_('Yes, I want to remove %s from my contact list'),
      'Adding %s as a friend' => N_('Adding %s as a contact'),
      'Are you sure you want to add %s as your friend?' => N_('Are you sure you want to add %s as your contact?'),
      'Note that %s will need to accept being added as your friend.' => N_('Note that %s will need to accept being added as your contact.'),
      'Classify your new friend %s: ' => N_('Classify your new contact %s: '),
      'Yes, I want to add %s as my friend' => N_('Yes, I want to add %s as my contact'),
      'Manage friends' => N_('Manage contacts'),
      'Add friend' => N_('Add contact'),
      'Removing friend: %s' => N_('Removing friend: %s'),
      'Clicking on this button will remove your friend relation with %s.' => N_('Clicking on this button will remove your contact relation with %s.'),
      'You have no friends yet. Go make some.' => N_('You have no contacts yet. Go make some.'),
      '%s\'s friends' => N_('%s\'s contacts'),
      '%s\' friends' => N_('%s\' contacts'),
      'Here are all <b>%s</b>\'s friends.' => N_('Here are all <b>%s</b>\'s contacts.'),
      'Creating new community' => N_('Creating new group'),
    })
  end

end
