Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEDC94C441
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 20:23:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2579A4A;
	Thu,  8 Aug 2024 20:23:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2579A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723141427;
	bh=fBYzb9q58GUyO+F6s8oW2cvMI2xtXQ/irUMXIi6iaFE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LOn5w6a/RGA5l98Svir7I6i306X1NMzX4ucaZQkn01bhDDgO1frC5tVt2QSCAreai
	 ALkms21tAkGx2OnQyXR4rv60CHYpkn0pV5FaE7nyehWhqvcs3i7dBxMUNs/Ea8J8vR
	 rEY6Kzd6MDEcbAwdovp169S9EdKskpC3e4tn5Hk4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA183F806DF; Thu,  8 Aug 2024 20:21:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD4EDF8070C;
	Thu,  8 Aug 2024 20:21:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C08B6F802DB; Thu,  8 Aug 2024 19:53:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BFD8F80236
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 19:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BFD8F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LsSc0sXu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723139569; x=1754675569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fBYzb9q58GUyO+F6s8oW2cvMI2xtXQ/irUMXIi6iaFE=;
  b=LsSc0sXuRd5LAB4lbc6AQPwRVQfeC1FdD4CrNltd6LayB+g8BgsFwpyz
   ZX739A/WVOOIHUApKELk9YhRj4MNNmC8Pp9v72P/nOpiYhyxfCyVZx3XD
   c0r/ilFzJhQdtgwSkjGrwGJPuduyD17TSIUGbIgntzxN5LCFp1rp5CeS9
   VdvGBBK5IlrK77XIYFpRfAqN6oX565x4QP1xB2fCgY5v3/FEobrkk0q4N
   sPvJhU4tjbmvg1CEtUtuPQVWjj0qiqd0GyO2SzUduG/de7Zk0hyvWKHed
   +0N4cv2E7sqhJDvRwZVHc+LwD3RhHUgNDCAsCChg8eH3g2nECSargFryP
   Q==;
X-CSE-ConnectionGUID: Vs0H6sfgS9yaa0lxpRrggQ==
X-CSE-MsgGUID: o7hU5AdaTKSV8rES2wIYQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32433599"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800";
   d="scan'208";a="32433599"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:52:43 -0700
X-CSE-ConnectionGUID: ISTeMbyLSyuhUOk3z5pfCQ==
X-CSE-MsgGUID: Cwk/nXO2RYaAN3s29GK5gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800";
   d="scan'208";a="57537432"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Aug 2024 10:52:41 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc7JW-0006OJ-1p;
	Thu, 08 Aug 2024 17:52:38 +0000
Date: Fri, 9 Aug 2024 01:52:34 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: [tiwai-sound:for-next 69/82] sound/pcmcia/vx/vxpocket.c:273:26:
 error: 'pdev' undeclared; did you mean 'p_dev'?
Message-ID: <202408090110.t0mWbTyh-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: JUDCWT6XS52VZRW32I3DX2HLBO4THDFN
X-Message-ID-Hash: JUDCWT6XS52VZRW32I3DX2HLBO4THDFN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JUDCWT6XS52VZRW32I3DX2HLBO4THDFN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   e95b9f7f2ee05bbef3bf6a4cd7da6e887f17f652
commit: 2acbb5e57230830016e0fb2d61886e7a8c7f59ce [69/82] ALSA: vxpocket: Use standard print API
config: i386-randconfig-141-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090110.t0mWbTyh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090110.t0mWbTyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090110.t0mWbTyh-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/pcmcia/vx/vxpocket.c: In function 'vxpocket_config':
   sound/pcmcia/vx/vxpocket.c:207:13: error: 'struct vx_core' has no member named 'dev'
     207 |         chip->dev = &link->dev;
         |             ^~
   In file included from include/linux/device.h:15,
                    from include/sound/core.h:10,
                    from sound/pcmcia/vx/vxpocket.c:13:
   sound/pcmcia/vx/vxpocket.c: In function 'vxpocket_probe':
>> sound/pcmcia/vx/vxpocket.c:273:26: error: 'pdev' undeclared (first use in this function); did you mean 'p_dev'?
     273 |                 dev_err(&pdev->dev, "vxpocket: cannot create a card instance\n");
         |                          ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/pcmcia/vx/vxpocket.c:273:17: note: in expansion of macro 'dev_err'
     273 |                 dev_err(&pdev->dev, "vxpocket: cannot create a card instance\n");
         |                 ^~~~~~~
   sound/pcmcia/vx/vxpocket.c:273:26: note: each undeclared identifier is reported only once for each function it appears in
     273 |                 dev_err(&pdev->dev, "vxpocket: cannot create a card instance\n");
         |                          ^~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   sound/pcmcia/vx/vxpocket.c:273:17: note: in expansion of macro 'dev_err'
     273 |                 dev_err(&pdev->dev, "vxpocket: cannot create a card instance\n");
         |                 ^~~~~~~


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
