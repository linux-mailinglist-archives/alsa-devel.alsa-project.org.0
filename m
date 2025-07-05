Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED1AAF9E76
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Jul 2025 08:33:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEDE860208;
	Sat,  5 Jul 2025 08:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEDE860208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751697194;
	bh=W/mW9uDSW3QytN8mOlYBL+H60pioxaCGjkolpFAG8Js=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uijiGZs4//49cV8tRxk5DbvK5j+KM/t5Slf2QBHn/LCLBWu20PPuvMU6kbSjIZPp1
	 Jl/KYZ+jhfZw8eRdsg20dPRSzUwlj57w+lCYLH43fYbTgy4h3g7n/cUEaG832+rFke
	 DJifkAoPQrFdNCxgBIYuN8iqk2Jq+JiyjH8JB3dU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE654F805B5; Sat,  5 Jul 2025 08:32:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98562F805C8;
	Sat,  5 Jul 2025 08:32:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5A30F804CF; Sat,  5 Jul 2025 08:32:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FAC3F80236
	for <alsa-devel@alsa-project.org>; Sat,  5 Jul 2025 08:32:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FAC3F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iFYpQZLH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751697155; x=1783233155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W/mW9uDSW3QytN8mOlYBL+H60pioxaCGjkolpFAG8Js=;
  b=iFYpQZLHvKymFtkL57A6++DymCvf4phKv0Y4jcAifZPvqXhRB5B1HwnB
   Tf395tHTz46KTDUejyY5t0P120OEhnn/pvR+cgUPhb17JPHZsY4qRvtce
   luZpTD3YH1g6p/vUXKPAkLkfxS0iDdbFaM6I0XxRvP2YtYELBTBiRq4Dw
   sm7nqlkRSdbSnCLwXjXWZptCxLshfPNiBLZF0peD152achlOBhQyF4Rth
   VsDh0LcQlExgA3ogdKFyM7P7/n7X48OTNW279TFuh7f/fcG5f6/MxWp/9
   WB3ppf2eomCsbegmRRtNBO25YANucjkdILSuBwfsqrIR7Gs8oEzEAQvfx
   Q==;
X-CSE-ConnectionGUID: te7/dktdT0iT6AzQDW//jQ==
X-CSE-MsgGUID: 1gmSs2DdR42Ftpn8uyd5eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="64605280"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600";
   d="scan'208";a="64605280"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 23:32:29 -0700
X-CSE-ConnectionGUID: XuXqsPzgQ7ySOhEaO6SQEA==
X-CSE-MsgGUID: VpYCxEDGQE2NJc4CS6w7LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600";
   d="scan'208";a="159329031"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jul 2025 23:32:28 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXwRl-0004Lf-2P;
	Sat, 05 Jul 2025 06:32:25 +0000
Date: Sat, 5 Jul 2025 14:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/hda-reorg 29/53] sound/hda/common/hwdep.c:26:6:
 warning: label followed by a declaration is a C23 extension
Message-ID: <202507051454.VintnWOF-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: PQB23YHZECYJGF2P5SGKSW36CCKXXDC3
X-Message-ID-Hash: PQB23YHZECYJGF2P5SGKSW36CCKXXDC3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PQB23YHZECYJGF2P5SGKSW36CCKXXDC3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/hda-reorg
head:   6119728edf86cefcbf7b20e000414c85916e900d
commit: 5b965be899c8e3286f5111b7e90207afe5124b67 [29/53] ALSA: hda: Move common codec driver into sound/hda/common directory
config: riscv-randconfig-001-20250705 (https://download.01.org/0day-ci/archive/20250705/202507051454.VintnWOF-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051454.VintnWOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051454.VintnWOF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/hda/common/hwdep.c:10:
   In file included from include/linux/compat.h:17:
   include/linux/fs.h:3979:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    3979 |         if (unlikely(get_user(c, path)))
         |                      ^
   arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
     274 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
     244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
     207 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
     196 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
>> sound/hda/common/hwdep.c:26:6: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      26 |         if (get_user(verb, &arg->verb))
         |             ^
   arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
     274 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
     244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
     207 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
     196 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   sound/hda/common/hwdep.c:40:6: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      40 |         if (get_user(verb, &arg->verb))
         |             ^
   arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
     274 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
     244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
     207 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
     196 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   3 warnings generated.


vim +26 sound/hda/common/hwdep.c

2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  17  
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  18  /*
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  19   * write/read an out-of-bound verb
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  20   */
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  21  static int verb_write_ioctl(struct hda_codec *codec,
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  22  			    struct hda_verb_ioctl __user *arg)
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  23  {
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  24  	u32 verb, res;
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  25  
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27 @26  	if (get_user(verb, &arg->verb))
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  27  		return -EFAULT;
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  28  	res = snd_hda_codec_read(codec, verb >> 24, 0,
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  29  				 (verb >> 8) & 0xffff, verb & 0xff);
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  30  	if (put_user(res, &arg->res))
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  31  		return -EFAULT;
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  32  	return 0;
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  33  }
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  34  

:::::: The code at line 26 was first introduced by commit
:::::: 2807314d467e7dd929c42050031aabbd28e78f0b [ALSA] hda-intel - Add hwdep interface

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Jaroslav Kysela <perex@perex.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
