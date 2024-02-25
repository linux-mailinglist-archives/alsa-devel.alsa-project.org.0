Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9728628C9
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Feb 2024 03:25:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9DC482A;
	Sun, 25 Feb 2024 03:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9DC482A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708827906;
	bh=qJZMG6oQD21tiJgy4N3WoXJ3MQIOMHuuOMchILBCISE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GXpoQ/YSC1DrrP/S/PAyuD6KegZmvl+/OyrA4scRZ9U6Xdyqp3uqSSPaHOV3waSFu
	 9wsMZKV9BRSwWzVG7p76AFRH0Mp81vIef/Hl7FyJ5PXzgmFoqaOM4NDoib9qpxMv21
	 rxyDztj3by1MQdyGzAYmU+JJhAzUvWz5D+h5Vtes=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8E10F80589; Sun, 25 Feb 2024 03:24:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8EF2F8059F;
	Sun, 25 Feb 2024 03:24:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCA8FF80246; Sun, 25 Feb 2024 03:24:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81EFAF80104
	for <alsa-devel@alsa-project.org>; Sun, 25 Feb 2024 03:24:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81EFAF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HaJ70fsE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708827863; x=1740363863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qJZMG6oQD21tiJgy4N3WoXJ3MQIOMHuuOMchILBCISE=;
  b=HaJ70fsEAnrf7UTrfcvhL1qx5OpfDEIbmds8p/rExv4q/+7J8UBOXjme
   ANqk0R3n0rOlZFQ96E8uZhgD8/KUmv4KX0ErouQAJq3CLSAlBRSsapH1B
   7dTDRYnJFk9538zlwSqKQTKHca4S0s1xCAm9vSLGp/pvUW9CejT/iHmaU
   Lt3t8YSTCQ7bNJYFZPjFiEyWU+hostuM13z0JgbUY4rHu14T6fnfOz3pJ
   Dxa8UkBN7UOTbXMqsgJw8q2CJ68H7VGWUflSOiOolwfS7t+8HQVy2BI+N
   AU8t+Iek4Yan9RyHvTs5iUySzGg6p6MMDwzJIapwEIqobHSG0TRX0xzZM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="6921440"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000";
   d="scan'208";a="6921440"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2024 18:24:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000";
   d="scan'208";a="10903140"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2024 18:24:16 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1re4Ba-0009Cu-0f;
	Sun, 25 Feb 2024 02:24:14 +0000
Date: Sun, 25 Feb 2024 10:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/guard 46/70] sound/core/hwdep.c:291:8: error:
 cannot jump from this asm goto statement to one of its possible targets
Message-ID: <202402251039.08XAcTR2-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: 4ADYCATQZBCVHA7YM7XT3BOEAJJORQEX
X-Message-ID-Hash: 4ADYCATQZBCVHA7YM7XT3BOEAJJORQEX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ADYCATQZBCVHA7YM7XT3BOEAJJORQEX/>
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
head:   08e50f26c5431175dc7207664c292f3ecc134121
commit: 9c86a0c433a5a99e2d5cc4713609efed801632a1 [46/70] ALSA: hwdep: Use guard() for locking
config: powerpc-randconfig-r081-20240225 (https://download.01.org/0day-ci/archive/20240225/202402251039.08XAcTR2-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251039.08XAcTR2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402251039.08XAcTR2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/core/hwdep.c:291:8: error: cannot jump from this asm goto statement to one of its possible targets
                           if (put_user(device, (int __user *)arg))
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
   sound/core/hwdep.c:273:8: note: possible target of asm goto statement
                           if (get_user(device, (int __user *)arg))
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
   sound/core/hwdep.c:276:4: note: jump exits scope of variable with __attribute__((cleanup))
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
   <scratch space>:163:1: note: expanded from here
   __UNIQUE_ID_guard260
   ^
   sound/core/hwdep.c:273:8: error: cannot jump from this asm goto statement to one of its possible targets
                           if (get_user(device, (int __user *)arg))
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
   sound/core/hwdep.c:291:8: note: possible target of asm goto statement
                           if (put_user(device, (int __user *)arg))
                               ^
   arch/powerpc/include/asm/uaccess.h:66:5: note: expanded from macro 'put_user'
                     __put_user(x, _pu_addr) : -EFAULT;                    \
                     ^
   arch/powerpc/include/asm/uaccess.h:52:9: note: expanded from macro '__put_user'
                                                                   \
                                                                   ^
   sound/core/hwdep.c:276:4: note: jump bypasses initialization of variable with __attribute__((cleanup))
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
   <scratch space>:163:1: note: expanded from here
   __UNIQUE_ID_guard260
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


vim +291 sound/core/hwdep.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  263  
d9a98de218ce18 Takashi Iwai    2005-11-17  264  static int snd_hwdep_control_ioctl(struct snd_card *card,
d9a98de218ce18 Takashi Iwai    2005-11-17  265  				   struct snd_ctl_file * control,
^1da177e4c3f41 Linus Torvalds  2005-04-16  266  				   unsigned int cmd, unsigned long arg)
^1da177e4c3f41 Linus Torvalds  2005-04-16  267  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  268  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  269  	case SNDRV_CTL_IOCTL_HWDEP_NEXT_DEVICE:
^1da177e4c3f41 Linus Torvalds  2005-04-16  270  		{
^1da177e4c3f41 Linus Torvalds  2005-04-16  271  			int device;
^1da177e4c3f41 Linus Torvalds  2005-04-16  272  
^1da177e4c3f41 Linus Torvalds  2005-04-16  273  			if (get_user(device, (int __user *)arg))
^1da177e4c3f41 Linus Torvalds  2005-04-16  274  				return -EFAULT;
f7b2bb8549e352 Dan Carpenter   2011-10-28  275  
9c86a0c433a5a9 Takashi Iwai    2024-02-21  276  			guard(mutex)(&register_mutex);
f7b2bb8549e352 Dan Carpenter   2011-10-28  277  			if (device < 0)
f7b2bb8549e352 Dan Carpenter   2011-10-28  278  				device = 0;
f7b2bb8549e352 Dan Carpenter   2011-10-28  279  			else if (device < SNDRV_MINOR_HWDEPS)
f7b2bb8549e352 Dan Carpenter   2011-10-28  280  				device++;
f7b2bb8549e352 Dan Carpenter   2011-10-28  281  			else
f7b2bb8549e352 Dan Carpenter   2011-10-28  282  				device = SNDRV_MINOR_HWDEPS;
f7b2bb8549e352 Dan Carpenter   2011-10-28  283  
^1da177e4c3f41 Linus Torvalds  2005-04-16  284  			while (device < SNDRV_MINOR_HWDEPS) {
f87135f56cb266 Clemens Ladisch 2005-11-20  285  				if (snd_hwdep_search(card, device))
^1da177e4c3f41 Linus Torvalds  2005-04-16  286  					break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  287  				device++;
^1da177e4c3f41 Linus Torvalds  2005-04-16  288  			}
^1da177e4c3f41 Linus Torvalds  2005-04-16  289  			if (device >= SNDRV_MINOR_HWDEPS)
^1da177e4c3f41 Linus Torvalds  2005-04-16  290  				device = -1;
^1da177e4c3f41 Linus Torvalds  2005-04-16 @291  			if (put_user(device, (int __user *)arg))
^1da177e4c3f41 Linus Torvalds  2005-04-16  292  				return -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  293  			return 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  294  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  295  	case SNDRV_CTL_IOCTL_HWDEP_INFO:
^1da177e4c3f41 Linus Torvalds  2005-04-16  296  		{
d9a98de218ce18 Takashi Iwai    2005-11-17  297  			struct snd_hwdep_info __user *info = (struct snd_hwdep_info __user *)arg;
9c86a0c433a5a9 Takashi Iwai    2024-02-21  298  			int device;
d9a98de218ce18 Takashi Iwai    2005-11-17  299  			struct snd_hwdep *hwdep;
^1da177e4c3f41 Linus Torvalds  2005-04-16  300  
^1da177e4c3f41 Linus Torvalds  2005-04-16  301  			if (get_user(device, &info->device))
^1da177e4c3f41 Linus Torvalds  2005-04-16  302  				return -EFAULT;
9c86a0c433a5a9 Takashi Iwai    2024-02-21  303  			guard(mutex)(&register_mutex);
f87135f56cb266 Clemens Ladisch 2005-11-20  304  			hwdep = snd_hwdep_search(card, device);
9c86a0c433a5a9 Takashi Iwai    2024-02-21  305  			if (!hwdep)
9c86a0c433a5a9 Takashi Iwai    2024-02-21  306  				return -ENXIO;
9c86a0c433a5a9 Takashi Iwai    2024-02-21  307  			return snd_hwdep_info(hwdep, info);
^1da177e4c3f41 Linus Torvalds  2005-04-16  308  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  309  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  310  	return -ENOIOCTLCMD;
^1da177e4c3f41 Linus Torvalds  2005-04-16  311  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  312  

:::::: The code at line 291 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
