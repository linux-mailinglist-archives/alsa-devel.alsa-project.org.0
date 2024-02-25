Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B92862A40
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Feb 2024 13:10:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC4B2847;
	Sun, 25 Feb 2024 13:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC4B2847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708863052;
	bh=zWF32DUBsnWecC7uE5dqCASntUILYpIKIQ0LqFiGGos=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZAkW02yhdkHYe4TPCZ4CRNyssOcirGX6pqgXQSZRIXbMRNu0z9xlpfuVUQkhd6unT
	 7TlIz0P1QvCKCRJJyY956Fn8MMhm+4rVs9S1+qZPigPaAQEU7vPmP1xL1mmmIy7YqA
	 h8WIxUOTViRLS/Tv/z1C1LHwgtLAIPqcOW0VoFko=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83F20F8057F; Sun, 25 Feb 2024 13:10:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD499F8059F;
	Sun, 25 Feb 2024 13:10:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF635F80246; Sun, 25 Feb 2024 13:07:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B12AFF800ED
	for <alsa-devel@alsa-project.org>; Sun, 25 Feb 2024 13:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B12AFF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=D1frhXY7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708862847; x=1740398847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zWF32DUBsnWecC7uE5dqCASntUILYpIKIQ0LqFiGGos=;
  b=D1frhXY7lQRC8+zn44XdP5uSajHTwe2nHttlcq1QDqqhUhGVtlnZh1vj
   WncaZCpgE7Xddi5lQt/gkaTYTlBRpAie1eOXa9hKPEpi+CW+nAjcPV/PR
   ANTCAjj//AqPGDcrZwXMjMxK3qJOyI+g1s+ybPaTpL2gm79fTBjB4bqUS
   RgGDu1a/9bH/hkra+5ADI1QqbFgfH/FEgToakZr7TatBkxDCXB8aPkxYk
   8nx+aOYKNjwDgUuTF8kMwuCQcw7lQ44lVyepMc//yXQWQKq5dJ2fbgbKV
   uuEzMSOf7OCOgsEXkKmxTKka/84OZCG34hSpmOkveEMZAR+dPESJQq+Is
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="3030814"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000";
   d="scan'208";a="3030814"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 04:07:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000";
   d="scan'208";a="11076825"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Feb 2024 04:07:18 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reDHo-0009Vg-1G;
	Sun, 25 Feb 2024 12:07:16 +0000
Date: Sun, 25 Feb 2024 20:06:24 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/guard 50/70] sound/core/rawmidi.c:1012:6: error:
 cannot jump from this asm goto statement to one of its possible targets
Message-ID: <202402251935.CGUH0Id9-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 3QK6SSXKZZZOFSK752YKWBEYAAHMABS6
X-Message-ID-Hash: 3QK6SSXKZZZOFSK752YKWBEYAAHMABS6
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3QK6SSXKZZZOFSK752YKWBEYAAHMABS6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/guard
head:   0ba3f403c3b7fdd2683aac6285903f92ba81c32d
commit: 369c285f8405ec663691db39ec59a01c70f80ded [50/70] ALSA: rawmidi: Use guard() for locking
config: powerpc-randconfig-r081-20240225 (https://download.01.org/0day-ci/archive/20240225/202402251935.CGUH0Id9-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251935.CGUH0Id9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402251935.CGUH0Id9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/core/rawmidi.c:1012:6: error: cannot jump from this asm goto statement to one of its possible targets
           if (put_user(device, argp))
               ^
   arch/powerpc/include/asm/uaccess.h:66:5: note: expanded from macro 'put_user'
                     __put_user(x, _pu_addr) : -EFAULT;                    \
                     ^
   arch/powerpc/include/asm/uaccess.h:48:3: note: expanded from macro '__put_user'
                   __put_user_size_goto(__pu_val, __pu_addr, __pu_size, __pu_failed);      \
                   ^
   arch/powerpc/include/asm/uaccess.h:116:10: note: expanded from macro '__put_user_size_goto'
           case 1: __put_user_asm_goto(x, __pus_addr, label, "stb"); break;        \
                   ^
   arch/powerpc/include/asm/uaccess.h:86:2: note: expanded from macro '__put_user_asm_goto'
           asm_volatile_goto(                                      \
           ^
   include/linux/compiler_types.h:366:33: note: expanded from macro 'asm_volatile_goto'
   #define asm_volatile_goto(x...) asm goto(x)
                                   ^
   sound/core/rawmidi.c:996:6: note: possible target of asm goto statement
           if (get_user(device, argp))
               ^
   arch/powerpc/include/asm/uaccess.h:295:5: note: expanded from macro 'get_user'
                     __get_user(x, _gu_addr) :                             \
                     ^
   arch/powerpc/include/asm/uaccess.h:283:2: note: expanded from macro '__get_user'
           __get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);      \
           ^
   arch/powerpc/include/asm/uaccess.h:201:16: note: expanded from macro '__get_user_size_allowed'
                   break;                                                  \
                                                                           ^
   sound/core/rawmidi.c:1000:2: note: jump exits scope of variable with __attribute__((cleanup))
           guard(mutex)(&register_mutex);
           ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
           CLASS(_name, __UNIQUE_ID(guard))
                        ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:5:1: note: expanded from here
   __UNIQUE_ID_guard309
   ^
   sound/core/rawmidi.c:996:6: error: cannot jump from this asm goto statement to one of its possible targets
           if (get_user(device, argp))
               ^
   arch/powerpc/include/asm/uaccess.h:295:5: note: expanded from macro 'get_user'
                     __get_user(x, _gu_addr) :                             \
                     ^
   arch/powerpc/include/asm/uaccess.h:283:2: note: expanded from macro '__get_user'
           __get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);      \
           ^
   arch/powerpc/include/asm/uaccess.h:199:3: note: expanded from macro '__get_user_size_allowed'
                   __get_user_size_goto(x, ptr, size, __gus_failed);       \
                   ^
   arch/powerpc/include/asm/uaccess.h:187:10: note: expanded from macro '__get_user_size_goto'
           case 1: __get_user_asm_goto(x, (u8 __user *)ptr, label, "lbz"); break;  \
                   ^
   arch/powerpc/include/asm/uaccess.h:158:2: note: expanded from macro '__get_user_asm_goto'
           asm_volatile_goto(                                      \
           ^
   include/linux/compiler_types.h:366:33: note: expanded from macro 'asm_volatile_goto'
   #define asm_volatile_goto(x...) asm goto(x)
                                   ^
   sound/core/rawmidi.c:1012:6: note: possible target of asm goto statement
           if (put_user(device, argp))
               ^
   arch/powerpc/include/asm/uaccess.h:66:5: note: expanded from macro 'put_user'
                     __put_user(x, _pu_addr) : -EFAULT;                    \
                     ^
   arch/powerpc/include/asm/uaccess.h:52:9: note: expanded from macro '__put_user'
                                                                   \
                                                                   ^
   sound/core/rawmidi.c:1000:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
           guard(mutex)(&register_mutex);
           ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
           CLASS(_name, __UNIQUE_ID(guard))
                        ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                         ^
   <scratch space>:5:1: note: expanded from here
   __UNIQUE_ID_guard309
   ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
   Depends on [n]: SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
   Selected by [m]:
   - SND_MPC52xx_SOC_EFIKA [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_EFIKA [=y]
   WARNING: unmet direct dependencies detected for ADB_CUDA
   Depends on [n]: MACINTOSH_DRIVERS [=n] && (ADB [=n] || PPC_PMAC [=y]) && !PPC_PMAC64 [=n]
   Selected by [y]:
   - PPC_PMAC [=y] && PPC_BOOK3S [=y] && CPU_BIG_ENDIAN [=y] && POWER_RESET [=y] && PPC32 [=y]


vim +1012 sound/core/rawmidi.c

^1da177e4c3f41 Linus Torvalds 2005-04-16   986  
127ae6f6dad2ed Takashi Iwai   2023-05-23   987  /* ioctl to find the next device; either legacy or UMP depending on @find_ump */
127ae6f6dad2ed Takashi Iwai   2023-05-23   988  static int snd_rawmidi_next_device(struct snd_card *card, int __user *argp,
127ae6f6dad2ed Takashi Iwai   2023-05-23   989  				   bool find_ump)
^1da177e4c3f41 Linus Torvalds 2005-04-16   990  
^1da177e4c3f41 Linus Torvalds 2005-04-16   991  {
127ae6f6dad2ed Takashi Iwai   2023-05-23   992  	struct snd_rawmidi *rmidi;
^1da177e4c3f41 Linus Torvalds 2005-04-16   993  	int device;
127ae6f6dad2ed Takashi Iwai   2023-05-23   994  	bool is_ump;
^1da177e4c3f41 Linus Torvalds 2005-04-16   995  
127ae6f6dad2ed Takashi Iwai   2023-05-23   996  	if (get_user(device, argp))
^1da177e4c3f41 Linus Torvalds 2005-04-16   997  		return -EFAULT;
a7a13d0676335a Dan Carpenter  2010-09-09   998  	if (device >= SNDRV_RAWMIDI_DEVICES) /* next device is -1 */
a7a13d0676335a Dan Carpenter  2010-09-09   999  		device = SNDRV_RAWMIDI_DEVICES - 1;
369c285f8405ec Takashi Iwai   2024-02-21  1000  	guard(mutex)(&register_mutex);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1001  	device = device < 0 ? 0 : device + 1;
127ae6f6dad2ed Takashi Iwai   2023-05-23  1002  	for (; device < SNDRV_RAWMIDI_DEVICES; device++) {
127ae6f6dad2ed Takashi Iwai   2023-05-23  1003  		rmidi = snd_rawmidi_search(card, device);
127ae6f6dad2ed Takashi Iwai   2023-05-23  1004  		if (!rmidi)
127ae6f6dad2ed Takashi Iwai   2023-05-23  1005  			continue;
127ae6f6dad2ed Takashi Iwai   2023-05-23  1006  		is_ump = rawmidi_is_ump(rmidi);
127ae6f6dad2ed Takashi Iwai   2023-05-23  1007  		if (find_ump == is_ump)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1008  			break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1009  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  1010  	if (device == SNDRV_RAWMIDI_DEVICES)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1011  		device = -1;
127ae6f6dad2ed Takashi Iwai   2023-05-23 @1012  	if (put_user(device, argp))
^1da177e4c3f41 Linus Torvalds 2005-04-16  1013  		return -EFAULT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1014  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1015  }
127ae6f6dad2ed Takashi Iwai   2023-05-23  1016  

:::::: The code at line 1012 was first introduced by commit
:::::: 127ae6f6dad2edb2201e27b7e6fa72994b537fad ALSA: rawmidi: Skip UMP devices at SNDRV_CTL_IOCTL_RAWMIDI_NEXT_DEVICE

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
