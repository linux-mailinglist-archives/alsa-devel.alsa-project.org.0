Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C6C94C6ED
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 00:19:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DE47847;
	Fri,  9 Aug 2024 00:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DE47847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723155554;
	bh=IMOYnJQGDlZxOfjjWcL78ah825a4ZixqHX1gxvBkpog=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=B0N/oSrC8YKfxa8h+7Px9WnxXWEEfDx4QWQb/ax/w3K3kmfgq7N7EM+dvWOAREBf2
	 PXIIDtNemG+uUCyWlv/8Fb42HJ0a/l5nYWi4eZLJGMX1Ry9NRtAxHq3+aa9qydImL1
	 bc4EiHDlVOzQZk13j9pPVI8v5nYs2/oQhlnjw8lg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D82EDF805A0; Fri,  9 Aug 2024 00:18:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 222C8F8059F;
	Fri,  9 Aug 2024 00:18:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E42C3F80448; Fri,  9 Aug 2024 00:18:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50BC1F800E3
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 00:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50BC1F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IyhPcvkW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723155472; x=1754691472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IMOYnJQGDlZxOfjjWcL78ah825a4ZixqHX1gxvBkpog=;
  b=IyhPcvkW58+c+A44vZoXK8w6oLgM5r7xVt1sVo+wID8ksuqa0mllzEj0
   gSnnsmKi4BXvZCXJQqQKgfpEMae6dpOkPjGcA89ecjWrlo9jE9BmtfNmy
   I/3SszkpK7vC3SaQkZc+YfmTaQ/EF0VEkBSKhBvr35xMBCj2Yvrt43EpF
   kIsNDSn71iJ/uaIz3h34ryQJLwQH6xsj12yWynrR/EQOEroJP8qHhDQFh
   YhqfEXAvJLnweCA1hh7bB9vDKYP64HglSKmfXSQJzakRef2sa+N+/jetA
   9lEsnfFulaff3/mt7/4d+pmuhGmxBHmGakOFIVeu9Gc/24g6Bvwm4gfLH
   Q==;
X-CSE-ConnectionGUID: WQ11ehHFTLCy85vFGh3HAA==
X-CSE-MsgGUID: tQKbGSjQS6WwGd+ORF6iPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43827898"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800";
   d="scan'208";a="43827898"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 15:17:47 -0700
X-CSE-ConnectionGUID: Flx4yJtPQIGIrgg21KSXow==
X-CSE-MsgGUID: 7kCWkeLuTNS4db+3d489ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800";
   d="scan'208";a="57604308"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Aug 2024 15:17:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scBS2-0006Z2-23;
	Thu, 08 Aug 2024 22:17:42 +0000
Date: Fri, 9 Aug 2024 06:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: [tiwai-sound:for-next 32/83] sound/pcmcia/vx/vxpocket.c:208:8:
 error: no member named 'dev' in 'struct vx_core'
Message-ID: <202408090607.58bm8VK5-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: HFCSMH24H3S6HSPU57GZR2BID75KX2NN
X-Message-ID-Hash: HFCSMH24H3S6HSPU57GZR2BID75KX2NN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFCSMH24H3S6HSPU57GZR2BID75KX2NN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   c46fc83e3f3c89f18962e43890de90b1c304747a
commit: b426b3ba9f6fe17990893c5324727dd217d420b6 [32/83] ALSA: vx_core: Drop unused dev field
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240809/202408090607.58bm8VK5-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090607.58bm8VK5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090607.58bm8VK5-lkp@intel.com/

Note: the tiwai-sound/for-next HEAD c46fc83e3f3c89f18962e43890de90b1c304747a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> sound/pcmcia/vx/vxpocket.c:208:8: error: no member named 'dev' in 'struct vx_core'
     208 |         chip->dev = &link->dev;
         |         ~~~~  ^
   1 error generated.


vim +208 sound/pcmcia/vx/vxpocket.c

6d00a3127972e7 Takashi Iwai      2005-06-30  170  
6d00a3127972e7 Takashi Iwai      2005-06-30  171  
6d00a3127972e7 Takashi Iwai      2005-06-30  172  /*
6d00a3127972e7 Takashi Iwai      2005-06-30  173   * configuration callback
6d00a3127972e7 Takashi Iwai      2005-06-30  174   */
6d00a3127972e7 Takashi Iwai      2005-06-30  175  
15b99ac1729503 Dominik Brodowski 2006-03-31  176  static int vxpocket_config(struct pcmcia_device *link)
6d00a3127972e7 Takashi Iwai      2005-06-30  177  {
af26367f69a474 Takashi Iwai      2005-11-17  178  	struct vx_core *chip = link->priv;
7c5af6ffd69bb2 Dominik Brodowski 2009-10-24  179  	int ret;
6d00a3127972e7 Takashi Iwai      2005-06-30  180  
6d00a3127972e7 Takashi Iwai      2005-06-30  181  	snd_printdd(KERN_DEBUG "vxpocket_config called\n");
6d00a3127972e7 Takashi Iwai      2005-06-30  182  
6d00a3127972e7 Takashi Iwai      2005-06-30  183  	/* redefine hardware record according to the VERSION1 string */
af2b3b503ad1b0 Dominik Brodowski 2006-10-25  184  	if (!strcmp(link->prod_id[1], "VX-POCKET")) {
6d00a3127972e7 Takashi Iwai      2005-06-30  185  		snd_printdd("VX-pocket is detected\n");
6d00a3127972e7 Takashi Iwai      2005-06-30  186  	} else {
6d00a3127972e7 Takashi Iwai      2005-06-30  187  		snd_printdd("VX-pocket 440 is detected\n");
6d00a3127972e7 Takashi Iwai      2005-06-30  188  		/* overwrite the hardware information */
6d00a3127972e7 Takashi Iwai      2005-06-30  189  		chip->hw = &vxp440_hw;
6d00a3127972e7 Takashi Iwai      2005-06-30  190  		chip->type = vxp440_hw.type;
6d00a3127972e7 Takashi Iwai      2005-06-30  191  		strcpy(chip->card->driver, vxp440_hw.name);
6d00a3127972e7 Takashi Iwai      2005-06-30  192  	}
6d00a3127972e7 Takashi Iwai      2005-06-30  193  
90abdc3b973229 Dominik Brodowski 2010-07-24  194  	ret = pcmcia_request_io(link);
7c5af6ffd69bb2 Dominik Brodowski 2009-10-24  195  	if (ret)
db0a5214b8d6cc Takashi Iwai      2014-09-09  196  		goto failed_preirq;
7c5af6ffd69bb2 Dominik Brodowski 2009-10-24  197  
db0a5214b8d6cc Takashi Iwai      2014-09-09  198  	ret = request_threaded_irq(link->irq, snd_vx_irq_handler,
db0a5214b8d6cc Takashi Iwai      2014-09-09  199  				   snd_vx_threaded_irq_handler,
db0a5214b8d6cc Takashi Iwai      2014-09-09  200  				   IRQF_SHARED, link->devname, link->priv);
7c5af6ffd69bb2 Dominik Brodowski 2009-10-24  201  	if (ret)
db0a5214b8d6cc Takashi Iwai      2014-09-09  202  		goto failed_preirq;
7c5af6ffd69bb2 Dominik Brodowski 2009-10-24  203  
1ac71e5a35eebe Dominik Brodowski 2010-07-29  204  	ret = pcmcia_enable_device(link);
7c5af6ffd69bb2 Dominik Brodowski 2009-10-24  205  	if (ret)
7c5af6ffd69bb2 Dominik Brodowski 2009-10-24  206  		goto failed;
6d00a3127972e7 Takashi Iwai      2005-06-30  207  
dd2e5a156525f1 Dominik Brodowski 2009-11-03 @208  	chip->dev = &link->dev;
6d00a3127972e7 Takashi Iwai      2005-06-30  209  
9a017a910346af Dominik Brodowski 2010-07-24  210  	if (snd_vxpocket_assign_resources(chip, link->resource[0]->start,
9a017a910346af Dominik Brodowski 2010-07-24  211  						link->irq) < 0)
6d00a3127972e7 Takashi Iwai      2005-06-30  212  		goto failed;
6d00a3127972e7 Takashi Iwai      2005-06-30  213  
79ca4f3f625e14 Takashi Iwai      2006-04-12  214  	return 0;
6d00a3127972e7 Takashi Iwai      2005-06-30  215  
6d00a3127972e7 Takashi Iwai      2005-06-30  216   failed:
db0a5214b8d6cc Takashi Iwai      2014-09-09  217  	free_irq(link->irq, link->priv);
db0a5214b8d6cc Takashi Iwai      2014-09-09  218  failed_preirq:
fba395eee7d3f3 Dominik Brodowski 2006-03-31  219  	pcmcia_disable_device(link);
15b99ac1729503 Dominik Brodowski 2006-03-31  220  	return -ENODEV;
6d00a3127972e7 Takashi Iwai      2005-06-30  221  }
6d00a3127972e7 Takashi Iwai      2005-06-30  222  

:::::: The code at line 208 was first introduced by commit
:::::: dd2e5a156525f11754d9b1e0583f6bb49c253d62 pcmcia: remove deprecated handle_to_dev() macro

:::::: TO: Dominik Brodowski <linux@dominikbrodowski.net>
:::::: CC: Dominik Brodowski <linux@dominikbrodowski.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
