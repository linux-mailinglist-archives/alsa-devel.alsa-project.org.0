Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 663E978CD37
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 21:57:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25AFB1DD;
	Tue, 29 Aug 2023 21:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25AFB1DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693339029;
	bh=HeRfm20caj3g2+vo1gWKMS5Yi2oGNRjltWflEWBPuRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sSG/S/ziK+olkd8J8wgR6cGIHLeGEpXSDikoGTUVL0bXI52RMqF25GH+NtfgsGydO
	 jUnEUkZT7I8C6owxv0dsjCSxmxrPncEof2U7oZ1Jq3OpKpA1adxqcjCDNWIBgvYJ5x
	 KuCWjK/nagQSb9L48Vdtu2/1TVUDnYnWau4ojewE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89930F80236; Tue, 29 Aug 2023 21:56:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C10C3F800F5;
	Tue, 29 Aug 2023 21:56:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24971F80155; Tue, 29 Aug 2023 21:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CF31F800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 21:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CF31F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UMXew2di
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693338955; x=1724874955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HeRfm20caj3g2+vo1gWKMS5Yi2oGNRjltWflEWBPuRk=;
  b=UMXew2di7eATr0VUXzvaKYijdyDfKHZiDeY53PbL1CbZLuBiBJC8SW03
   0s37/yv4p9Ijo8CoNKlPa/S4BU26vr3OH/V7hNGdpL8zO588W+U50Q3I8
   veoBcor/XP810MD9ozsbiyrDKCWZuZA1kEVMKhESI+lLP098Ch2jzqCs6
   6qoP3DXSqaR0CNa6TR4LHt1zLDR+QBQbyWieT1J0rBu6hUZvKGAYVRD2N
   Y5bLjrHEbBI47ygFkoDU5DqJmFjAZKXyyZEx96QpB+YX/UOD6eW5q5B2+
   oBsL6dWogZuiD+GYctsTUpxNWhvIwuinU5oywkksO3sfmytjqaSzkwKgs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="372876979"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000";
   d="scan'208";a="372876979"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 12:55:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="912527634"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000";
   d="scan'208";a="912527634"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Aug 2023 12:55:46 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb4oT-00092l-2B;
	Tue, 29 Aug 2023 19:55:45 +0000
Date: Wed, 30 Aug 2023 03:55:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] ALSA: control: Use list_for_each_entry_safe()
Message-ID: <202308300312.Uq5j7oU2-lkp@intel.com>
References: <20230829142307.3916823-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829142307.3916823-1-andriy.shevchenko@linux.intel.com>
Message-ID-Hash: 73KAUSTTA6CSHOJFZGNYMLV7RQY3QIUN
X-Message-ID-Hash: 73KAUSTTA6CSHOJFZGNYMLV7RQY3QIUN
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/73KAUSTTA6CSHOJFZGNYMLV7RQY3QIUN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.5 next-20230829]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/ALSA-control-Use-list_for_each_entry_safe/20230829-222521
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230829142307.3916823-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 1/1] ALSA: control: Use list_for_each_entry_safe()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230830/202308300312.Uq5j7oU2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300312.Uq5j7oU2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300312.Uq5j7oU2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:779:27: note: in expansion of macro 'list_next_entry'
     779 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   sound/core/control_led.c:304:17: note: in expansion of macro 'list_for_each_entry_safe'
     304 |                 list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:25: error: invalid type argument of '->' (have 'struct snd_ctl_led_ctl')
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:779:27: note: in expansion of macro 'list_next_entry'
     779 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   sound/core/control_led.c:304:17: note: in expansion of macro 'list_for_each_entry_safe'
     304 |                 list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:779:27: note: in expansion of macro 'list_next_entry'
     779 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   sound/core/control_led.c:304:17: note: in expansion of macro 'list_for_each_entry_safe'
     304 |                 list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:47: error: invalid type argument of unary '*' (have 'struct snd_ctl_led_ctl')
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                               ^~~~~~
   include/linux/container_of.h:23:11: note: in definition of macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |           ^~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:779:27: note: in expansion of macro 'list_next_entry'
     779 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   sound/core/control_led.c:304:17: note: in expansion of macro 'list_for_each_entry_safe'
     304 |                 list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/uapi/linux/sysinfo.h:5,
                    from include/uapi/linux/kernel.h:5,
                    from include/linux/cache.h:5,
                    from include/linux/slab.h:15:
   include/linux/list.h:564:47: error: invalid type argument of unary '*' (have 'struct snd_ctl_led_ctl')
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                               ^~~~~~
   include/linux/stddef.h:16:52: note: in definition of macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                                    ^~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:779:27: note: in expansion of macro 'list_next_entry'
     779 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   sound/core/control_led.c:304:17: note: in expansion of macro 'list_for_each_entry_safe'
     304 |                 list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:779:21: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     779 |              pos = n, n = list_next_entry(n, member))
         |                     ^
   sound/core/control_led.c:304:17: note: in expansion of macro 'list_for_each_entry_safe'
     304 |                 list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/control_led.c: In function 'snd_ctl_led_reset':
   include/linux/container_of.h:18:41: error: incompatible types when assigning to type 'struct snd_ctl_led_ctl' from type 'struct snd_ctl_led_ctl *'
      18 | #define container_of(ptr, type, member) ({                              \
         |                                         ^
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:777:21: note: in expansion of macro 'list_next_entry'
     777 |                 n = list_next_entry(pos, member);                       \
         |                     ^~~~~~~~~~~~~~~
   sound/core/control_led.c:329:9: note: in expansion of macro 'list_for_each_entry_safe'
     329 |         list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/control_led.c:329:40: error: incompatible types when assigning to type 'struct snd_ctl_led_ctl *' from type 'struct snd_ctl_led_ctl'
     329 |         list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |                                        ^~~~~
   include/linux/list.h:779:20: note: in definition of macro 'list_for_each_entry_safe'
     779 |              pos = n, n = list_next_entry(n, member))
         |                    ^
   include/linux/list.h:564:25: error: invalid type argument of '->' (have 'struct snd_ctl_led_ctl')
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:779:27: note: in expansion of macro 'list_next_entry'
     779 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   sound/core/control_led.c:329:9: note: in expansion of macro 'list_for_each_entry_safe'
     329 |         list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:25: error: invalid type argument of '->' (have 'struct snd_ctl_led_ctl')
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:779:27: note: in expansion of macro 'list_next_entry'
     779 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   sound/core/control_led.c:329:9: note: in expansion of macro 'list_for_each_entry_safe'
     329 |         list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:47: error: invalid type argument of unary '*' (have 'struct snd_ctl_led_ctl')
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                               ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:779:27: note: in expansion of macro 'list_next_entry'
     779 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   sound/core/control_led.c:329:9: note: in expansion of macro 'list_for_each_entry_safe'
     329 |         list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:25: error: invalid type argument of '->' (have 'struct snd_ctl_led_ctl')
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:779:27: note: in expansion of macro 'list_next_entry'
     779 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   sound/core/control_led.c:329:9: note: in expansion of macro 'list_for_each_entry_safe'
     329 |         list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:338:27: error: expression in static assertion is not an integer
     338 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:779:27: note: in expansion of macro 'list_next_entry'
     779 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   sound/core/control_led.c:329:9: note: in expansion of macro 'list_for_each_entry_safe'
     329 |         list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:47: error: invalid type argument of unary '*' (have 'struct snd_ctl_led_ctl')
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                               ^~~~~~
   include/linux/container_of.h:23:11: note: in definition of macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |           ^~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:779:27: note: in expansion of macro 'list_next_entry'
     779 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   sound/core/control_led.c:329:9: note: in expansion of macro 'list_for_each_entry_safe'
     329 |         list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:47: error: invalid type argument of unary '*' (have 'struct snd_ctl_led_ctl')
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                                               ^~~~~~
   include/linux/stddef.h:16:52: note: in definition of macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                                    ^~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:779:27: note: in expansion of macro 'list_next_entry'
     779 |              pos = n, n = list_next_entry(n, member))
         |                           ^~~~~~~~~~~~~~~
   sound/core/control_led.c:329:9: note: in expansion of macro 'list_for_each_entry_safe'
     329 |         list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/list.h:779:21: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     779 |              pos = n, n = list_next_entry(n, member))
         |                     ^
   sound/core/control_led.c:329:9: note: in expansion of macro 'list_for_each_entry_safe'
     329 |         list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~


vim +779 include/linux/list.h

4d70c74659d974 Andy Shevchenko          2022-11-30  672  
e130816164e244 Andy Shevchenko          2020-10-15  673  /**
e130816164e244 Andy Shevchenko          2020-10-15  674   * list_entry_is_head - test if the entry points to the head of the list
e130816164e244 Andy Shevchenko          2020-10-15  675   * @pos:	the type * to cursor
e130816164e244 Andy Shevchenko          2020-10-15  676   * @head:	the head for your list.
e130816164e244 Andy Shevchenko          2020-10-15  677   * @member:	the name of the list_head within the struct.
e130816164e244 Andy Shevchenko          2020-10-15  678   */
e130816164e244 Andy Shevchenko          2020-10-15  679  #define list_entry_is_head(pos, head, member)				\
e130816164e244 Andy Shevchenko          2020-10-15  680  	(&pos->member == (head))
e130816164e244 Andy Shevchenko          2020-10-15  681  
^1da177e4c3f41 Linus Torvalds           2005-04-16  682  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  683   * list_for_each_entry	-	iterate over list of given type
8e3a67a99231f9 Randy Dunlap             2006-06-25  684   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  685   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  686   * @member:	the name of the list_head within the struct.
^1da177e4c3f41 Linus Torvalds           2005-04-16  687   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  688  #define list_for_each_entry(pos, head, member)				\
93be3c2eb3371f Oleg Nesterov            2013-11-12  689  	for (pos = list_first_entry(head, typeof(*pos), member);	\
e130816164e244 Andy Shevchenko          2020-10-15  690  	     !list_entry_is_head(pos, head, member);			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  691  	     pos = list_next_entry(pos, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  692  
^1da177e4c3f41 Linus Torvalds           2005-04-16  693  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  694   * list_for_each_entry_reverse - iterate backwards over list of given type.
8e3a67a99231f9 Randy Dunlap             2006-06-25  695   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  696   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  697   * @member:	the name of the list_head within the struct.
^1da177e4c3f41 Linus Torvalds           2005-04-16  698   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  699  #define list_for_each_entry_reverse(pos, head, member)			\
93be3c2eb3371f Oleg Nesterov            2013-11-12  700  	for (pos = list_last_entry(head, typeof(*pos), member);		\
e130816164e244 Andy Shevchenko          2020-10-15  701  	     !list_entry_is_head(pos, head, member); 			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  702  	     pos = list_prev_entry(pos, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  703  
^1da177e4c3f41 Linus Torvalds           2005-04-16  704  /**
72fd4a35a82433 Robert P. J. Day         2007-02-10  705   * list_prepare_entry - prepare a pos entry for use in list_for_each_entry_continue()
^1da177e4c3f41 Linus Torvalds           2005-04-16  706   * @pos:	the type * to use as a start point
^1da177e4c3f41 Linus Torvalds           2005-04-16  707   * @head:	the head of the list
3943f42c11896c Andrey Utkin             2014-11-14  708   * @member:	the name of the list_head within the struct.
fe96e57d77481c Randy Dunlap             2006-06-25  709   *
72fd4a35a82433 Robert P. J. Day         2007-02-10  710   * Prepares a pos entry for use as a start point in list_for_each_entry_continue().
^1da177e4c3f41 Linus Torvalds           2005-04-16  711   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  712  #define list_prepare_entry(pos, head, member) \
^1da177e4c3f41 Linus Torvalds           2005-04-16  713  	((pos) ? : list_entry(head, typeof(*pos), member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  714  
^1da177e4c3f41 Linus Torvalds           2005-04-16  715  /**
fe96e57d77481c Randy Dunlap             2006-06-25  716   * list_for_each_entry_continue - continue iteration over list of given type
8e3a67a99231f9 Randy Dunlap             2006-06-25  717   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  718   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  719   * @member:	the name of the list_head within the struct.
fe96e57d77481c Randy Dunlap             2006-06-25  720   *
fe96e57d77481c Randy Dunlap             2006-06-25  721   * Continue to iterate over list of given type, continuing after
fe96e57d77481c Randy Dunlap             2006-06-25  722   * the current position.
^1da177e4c3f41 Linus Torvalds           2005-04-16  723   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  724  #define list_for_each_entry_continue(pos, head, member) 		\
8120e2e5141a42 Oleg Nesterov            2013-11-12  725  	for (pos = list_next_entry(pos, member);			\
e130816164e244 Andy Shevchenko          2020-10-15  726  	     !list_entry_is_head(pos, head, member);			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  727  	     pos = list_next_entry(pos, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  728  
768f3591e2b1cc Pavel Emelyanov          2007-09-18  729  /**
768f3591e2b1cc Pavel Emelyanov          2007-09-18  730   * list_for_each_entry_continue_reverse - iterate backwards from the given point
768f3591e2b1cc Pavel Emelyanov          2007-09-18  731   * @pos:	the type * to use as a loop cursor.
768f3591e2b1cc Pavel Emelyanov          2007-09-18  732   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  733   * @member:	the name of the list_head within the struct.
768f3591e2b1cc Pavel Emelyanov          2007-09-18  734   *
768f3591e2b1cc Pavel Emelyanov          2007-09-18  735   * Start to iterate over list of given type backwards, continuing after
768f3591e2b1cc Pavel Emelyanov          2007-09-18  736   * the current position.
768f3591e2b1cc Pavel Emelyanov          2007-09-18  737   */
768f3591e2b1cc Pavel Emelyanov          2007-09-18  738  #define list_for_each_entry_continue_reverse(pos, head, member)		\
8120e2e5141a42 Oleg Nesterov            2013-11-12  739  	for (pos = list_prev_entry(pos, member);			\
e130816164e244 Andy Shevchenko          2020-10-15  740  	     !list_entry_is_head(pos, head, member);			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  741  	     pos = list_prev_entry(pos, member))
768f3591e2b1cc Pavel Emelyanov          2007-09-18  742  
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  743  /**
fe96e57d77481c Randy Dunlap             2006-06-25  744   * list_for_each_entry_from - iterate over list of given type from the current point
8e3a67a99231f9 Randy Dunlap             2006-06-25  745   * @pos:	the type * to use as a loop cursor.
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  746   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  747   * @member:	the name of the list_head within the struct.
fe96e57d77481c Randy Dunlap             2006-06-25  748   *
fe96e57d77481c Randy Dunlap             2006-06-25  749   * Iterate over list of given type, continuing from current position.
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  750   */
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  751  #define list_for_each_entry_from(pos, head, member) 			\
e130816164e244 Andy Shevchenko          2020-10-15  752  	for (; !list_entry_is_head(pos, head, member);			\
8120e2e5141a42 Oleg Nesterov            2013-11-12  753  	     pos = list_next_entry(pos, member))
e229c2fb3370a0 Arnaldo Carvalho de Melo 2006-03-20  754  
b862815c3ee7b4 Jiri Pirko               2017-02-03  755  /**
b862815c3ee7b4 Jiri Pirko               2017-02-03  756   * list_for_each_entry_from_reverse - iterate backwards over list of given type
b862815c3ee7b4 Jiri Pirko               2017-02-03  757   *                                    from the current point
b862815c3ee7b4 Jiri Pirko               2017-02-03  758   * @pos:	the type * to use as a loop cursor.
b862815c3ee7b4 Jiri Pirko               2017-02-03  759   * @head:	the head for your list.
b862815c3ee7b4 Jiri Pirko               2017-02-03  760   * @member:	the name of the list_head within the struct.
b862815c3ee7b4 Jiri Pirko               2017-02-03  761   *
b862815c3ee7b4 Jiri Pirko               2017-02-03  762   * Iterate backwards over list of given type, continuing from current position.
b862815c3ee7b4 Jiri Pirko               2017-02-03  763   */
b862815c3ee7b4 Jiri Pirko               2017-02-03  764  #define list_for_each_entry_from_reverse(pos, head, member)		\
e130816164e244 Andy Shevchenko          2020-10-15  765  	for (; !list_entry_is_head(pos, head, member);			\
b862815c3ee7b4 Jiri Pirko               2017-02-03  766  	     pos = list_prev_entry(pos, member))
b862815c3ee7b4 Jiri Pirko               2017-02-03  767  
^1da177e4c3f41 Linus Torvalds           2005-04-16  768  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  769   * list_for_each_entry_safe - iterate over list of given type safe against removal of list entry
8e3a67a99231f9 Randy Dunlap             2006-06-25  770   * @pos:	the type * to use as a loop cursor.
^1da177e4c3f41 Linus Torvalds           2005-04-16  771   * @n:		another type * to use as temporary storage
^1da177e4c3f41 Linus Torvalds           2005-04-16  772   * @head:	the head for your list.
3943f42c11896c Andrey Utkin             2014-11-14  773   * @member:	the name of the list_head within the struct.
^1da177e4c3f41 Linus Torvalds           2005-04-16  774   */
^1da177e4c3f41 Linus Torvalds           2005-04-16  775  #define list_for_each_entry_safe(pos, n, head, member)			\
93be3c2eb3371f Oleg Nesterov            2013-11-12  776  	for (pos = list_first_entry(head, typeof(*pos), member),	\
8120e2e5141a42 Oleg Nesterov            2013-11-12  777  		n = list_next_entry(pos, member);			\
e130816164e244 Andy Shevchenko          2020-10-15  778  	     !list_entry_is_head(pos, head, member); 			\
8120e2e5141a42 Oleg Nesterov            2013-11-12 @779  	     pos = n, n = list_next_entry(n, member))
^1da177e4c3f41 Linus Torvalds           2005-04-16  780  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
