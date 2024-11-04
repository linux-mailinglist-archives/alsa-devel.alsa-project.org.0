Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAD79BBD3C
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2024 19:24:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03767950;
	Mon,  4 Nov 2024 19:24:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03767950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730744657;
	bh=A6hzEqWTeqonjW95K+t1XJXYA78y9lt27DRYr168Gsw=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aMx6UFFGE5rfD8iwdCPwpCajoKyxHNn246HVEUAJFRLrGs44UxB3V1TFhRW6ak9Tz
	 YUXm+1W7VJ2XRkUBVlbfzaRtQ6HFWj53bzIt4vgvz6L/3Rw4yC0ICJlpn88gKnLcO8
	 lAcRCYFzbrZhAapUM7s39/RQd+oo6BDz+jk7pvuk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC020F805B6; Mon,  4 Nov 2024 19:23:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17536F805A1;
	Mon,  4 Nov 2024 19:23:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CF86F8026A; Mon,  4 Nov 2024 19:23:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5917FF8013D
	for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2024 19:23:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5917FF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Fg/fgtl3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730744617; x=1762280617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A6hzEqWTeqonjW95K+t1XJXYA78y9lt27DRYr168Gsw=;
  b=Fg/fgtl3pfjbZPiY8eMqZ6DOojtvB5yIGmshrKif0HksR79u5aWFaF9d
   t/OMQaiQ+TAOCGSwLbvjqdClAQCAZrXGDTuPCgrYTQsTmoVhtfm0dzhRn
   kXEa786gnwdp56fHgnHj1SSE+TTru7/vqjPcfF2cbdFPP5oYIlKfjyKq/
   J5BDieNEYMoyYkoVPViJGWQ+/gUO9gecoaWqdSlQVJD4i3Ib/ka0qBYlK
   h7Whu79afZePzzat8quU4JbFzTcV0uVM52hgtg72/Phxknw0Ic1LO0DjV
   SwylmYXoPXpkFggpOoodPSSC56bbgiv1kq6T4GWjRq30QowT/ZiLaj7GI
   Q==;
X-CSE-ConnectionGUID: gIFTXxwgRM+i1AgpV+wV8A==
X-CSE-MsgGUID: eM2yMgACQXWMFVv1xHliew==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29882643"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800";
   d="scan'208";a="29882643"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 10:23:31 -0800
X-CSE-ConnectionGUID: 5pAznSnLQWC2y05RIQo8wg==
X-CSE-MsgGUID: XTMTUZxYRemJ14qtEF5kvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800";
   d="scan'208";a="83671566"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Nov 2024 10:23:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t81jb-000l7B-1P;
	Mon, 04 Nov 2024 18:23:27 +0000
Date: Tue, 5 Nov 2024 02:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 8/9] sound/pci/hda/hda_intel.c:1035:26:
 warning: variable 'bus' set but not used
Message-ID: <202411050247.3esQz7Am-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: SK63HJ45R3VENRPT7CXVN2QOISTFX3PE
X-Message-ID-Hash: SK63HJ45R3VENRPT7CXVN2QOISTFX3PE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SK63HJ45R3VENRPT7CXVN2QOISTFX3PE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   149cb7d9537e241b43056fb4133f56832ac51b7a
commit: cac99f73f0752e1c83674e12fb2c605dca9ce474 [8/9] ALSA: hda: intel: Don't free interrupt when suspending
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241105/202411050247.3esQz7Am-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050247.3esQz7Am-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050247.3esQz7Am-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/hda/hda_intel.c: In function 'azx_suspend':
>> sound/pci/hda/hda_intel.c:1035:26: warning: variable 'bus' set but not used [-Wunused-but-set-variable]
    1035 |         struct hdac_bus *bus;
         |                          ^~~


vim +/bus +1035 sound/pci/hda/hda_intel.c

f5dac54d9d9382 Kai-Heng Feng  2020-10-27  1030  
3baffc4a84d759 Takashi Iwai   2018-12-07  1031  static int azx_suspend(struct device *dev)
3baffc4a84d759 Takashi Iwai   2018-12-07  1032  {
3baffc4a84d759 Takashi Iwai   2018-12-07  1033  	struct snd_card *card = dev_get_drvdata(dev);
3baffc4a84d759 Takashi Iwai   2018-12-07  1034  	struct azx *chip;
3baffc4a84d759 Takashi Iwai   2018-12-07 @1035  	struct hdac_bus *bus;
3baffc4a84d759 Takashi Iwai   2018-12-07  1036  
3baffc4a84d759 Takashi Iwai   2018-12-07  1037  	if (!azx_is_pm_ready(card))
c5c215232dfb71 Takashi Iwai   2012-12-04  1038  		return 0;
c5c215232dfb71 Takashi Iwai   2012-12-04  1039  
3baffc4a84d759 Takashi Iwai   2018-12-07  1040  	chip = card->private_data;
a41d122449bea3 Takashi Iwai   2015-04-14  1041  	bus = azx_bus(chip);
472e18f63c425d Imre Deak      2021-06-23  1042  	azx_shutdown_chip(chip);
785d8c4be82b45 Libin Yang     2015-05-12  1043  
785d8c4be82b45 Libin Yang     2015-05-12  1044  	trace_azx_suspend(chip);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1045  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1046  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1047  

:::::: The code at line 1035 was first introduced by commit
:::::: 3baffc4a84d759ba54c461e8e4583bd8890c749a ALSA: hda/intel: Refactoring PM code

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
