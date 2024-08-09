Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B534F94C795
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 02:27:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B146829;
	Fri,  9 Aug 2024 02:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B146829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723163234;
	bh=bMznVnDMGvYpVK4JpHzlDbtBreyy9F5i3xs/YZaXzmc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Izb7wGDyjE2rpIU9AJefmmZxAAbZXcKugSPBXG4LHpWO3AJIRFF2z8A2VPlhdEwoz
	 g4WB9lHcz0VEXLSNybOUdg1XLGP6MIQpJkdUN7g5suLjNUtd2cl2AXdc+cMzX1ePhc
	 sH2sP+6OcwGSXaJbETy57bPO9GLRJh2LRyiS2BTM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E38EFF800BF; Fri,  9 Aug 2024 02:26:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B730F805AE;
	Fri,  9 Aug 2024 02:26:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2A3FF802DB; Fri,  9 Aug 2024 02:21:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E00EF800BF
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 02:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E00EF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NQwI3W2r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723162911; x=1754698911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bMznVnDMGvYpVK4JpHzlDbtBreyy9F5i3xs/YZaXzmc=;
  b=NQwI3W2rZU/BHquGQ2LRL+h330YailIYBinYr8zrhTzsvUD7s/Y06hXC
   fLOJq8CEqgYO5Ztq0ri8cPeJsalcAstVWrBKEDc8VZcDpTrgOcd/+C2RE
   KTaqZQCN2cz6gxNbWqvqB65gkBi/XXbYaNwTnfpVEiCYiBvCZs94Oap8a
   kXiR0P8mrcRt25mNCHna+8sw6r/nb9T0EJr7QNcL1cxk9EPW3QgCP6xz+
   3Bdr1zmBS/KpJeYSs5PXO3lSdvN4jvZDuPQ7RNxSBEqFEUUe340A9/eSY
   g5mYZbCjfNi4ghvCuqP6/5wyUUz2N3Qkrmge6jMxrB13oCViE/wjGOK2c
   g==;
X-CSE-ConnectionGUID: lTyPkFI6RWuAPYJbpdBJpQ==
X-CSE-MsgGUID: jddKG1VVQLaSmOS3pHPqPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21180458"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800";
   d="scan'208";a="21180458"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 17:21:45 -0700
X-CSE-ConnectionGUID: 712Tz4NlRR+W/+TcQ7JXig==
X-CSE-MsgGUID: 0YZY4I9LQiCuW72BMq9psg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800";
   d="scan'208";a="62035655"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 08 Aug 2024 17:21:43 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scDNp-0006fo-2K;
	Fri, 09 Aug 2024 00:21:33 +0000
Date: Fri, 9 Aug 2024 08:20:25 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: [tiwai-sound:for-next 69/83] sound/pcmcia/vx/vxpocket.c:273:12:
 error: use of undeclared identifier 'pdev'; did you mean 'p_dev'?
Message-ID: <202408090809.TAYiyrqJ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: N2SEJO6MYDVVGJRUILEZNPZV5PRV42PJ
X-Message-ID-Hash: N2SEJO6MYDVVGJRUILEZNPZV5PRV42PJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N2SEJO6MYDVVGJRUILEZNPZV5PRV42PJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   c46fc83e3f3c89f18962e43890de90b1c304747a
commit: 2acbb5e57230830016e0fb2d61886e7a8c7f59ce [69/83] ALSA: vxpocket: Use standard print API
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240809/202408090809.TAYiyrqJ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090809.TAYiyrqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090809.TAYiyrqJ-lkp@intel.com/

Note: the tiwai-sound/for-next HEAD c46fc83e3f3c89f18962e43890de90b1c304747a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   sound/pcmcia/vx/vxpocket.c:207:8: error: no member named 'dev' in 'struct vx_core'
     207 |         chip->dev = &link->dev;
         |         ~~~~  ^
>> sound/pcmcia/vx/vxpocket.c:273:12: error: use of undeclared identifier 'pdev'; did you mean 'p_dev'?
     273 |                 dev_err(&pdev->dev, "vxpocket: cannot create a card instance\n");
         |                          ^~~~
         |                          p_dev
   include/linux/dev_printk.h:154:44: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                   ^
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^
   sound/pcmcia/vx/vxpocket.c:251:49: note: 'p_dev' declared here
     251 | static int vxpocket_probe(struct pcmcia_device *p_dev)
         |                                                 ^
   2 errors generated.


vim +273 sound/pcmcia/vx/vxpocket.c

   247	
   248	
   249	/*
   250	 */
   251	static int vxpocket_probe(struct pcmcia_device *p_dev)
   252	{
   253		struct snd_card *card;
   254		struct snd_vxpocket *vxp;
   255		int i, err;
   256	
   257		/* find an empty slot from the card list */
   258		for (i = 0; i < SNDRV_CARDS; i++) {
   259			if (!(card_alloc & (1 << i)))
   260				break;
   261		}
   262		if (i >= SNDRV_CARDS) {
   263			dev_err(&p_dev->dev, "vxpocket: too many cards found\n");
   264			return -EINVAL;
   265		}
   266		if (! enable[i])
   267			return -ENODEV; /* disabled explicitly */
   268	
   269		/* ok, create a card instance */
   270		err = snd_card_new(&p_dev->dev, index[i], id[i], THIS_MODULE,
   271				   0, &card);
   272		if (err < 0) {
 > 273			dev_err(&pdev->dev, "vxpocket: cannot create a card instance\n");
   274			return err;
   275		}
   276	
   277		err = snd_vxpocket_new(card, ibl[i], p_dev, &vxp);
   278		if (err < 0) {
   279			snd_card_free(card);
   280			return err;
   281		}
   282		card->private_data = vxp;
   283	
   284		vxp->index = i;
   285		card_alloc |= 1 << i;
   286	
   287		vxp->p_dev = p_dev;
   288	
   289		return vxpocket_config(p_dev);
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
