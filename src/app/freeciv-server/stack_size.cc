/*
 * \brief  override the stack size
 * \author Christian Prochaska
 * \date   2017-05-17
 */

/*
 * Copyright (C) 2017 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU Affero General Public License version 3.
 */

#include <libc/component.h>

Genode::size_t Libc::Component::stack_size() { return 512*1024; }
