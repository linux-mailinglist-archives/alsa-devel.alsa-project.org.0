Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C17875451
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 17:38:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 487443E7;
	Thu,  7 Mar 2024 17:38:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 487443E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709829509;
	bh=mDh+JZ3LDF/K67NUz+jUaNK4jTIkQl0icjPjmPpIjY0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=scLk509QTqBXGgr+jkqg7VOuP2oN80CidqcuCgrOILRo9mZOUD9PeNy9R0GIEjab0
	 X0VJtTXPCFwo0oPrll9mKzXwf/ZSn4wHvMgfjxriKlG/QCio2xPV2woBpa9Yl2KiM2
	 W3YKfrn557g9vqgQKEb931rb+bWgYRP6orWaj2H0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 641DDF80088; Thu,  7 Mar 2024 17:37:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB530F80589;
	Thu,  7 Mar 2024 17:37:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 139D6F8024E; Thu,  7 Mar 2024 17:37:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F187F80088
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 17:37:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F187F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=igFhZrNu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709829466; x=1741365466;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mDh+JZ3LDF/K67NUz+jUaNK4jTIkQl0icjPjmPpIjY0=;
  b=igFhZrNuYoT4O8VACwDCyUa7O40D3rWhk2n2GQFWp0ZFYO7ZavYDgfvT
   YqVprQxAPagyHP65oTbA4TkbTrEx64l5hofSysikRtBFQvhcPE/ftf40K
   Mdb3ZMJOrRL1+EWh5tlxlk4vNuk+RtArfkXQm3aPv09Hhx6aPqfVxTeIE
   i5AErdHZ3tt9XhFcQ/nMoAJKkyGRdTWqY5DydbOprGhvTJXMZkNWO+Fna
   NWf7G/AHQw2vWnOFWxG97v427N3CQ57BVWEojOB2T0Gxse6rgVP/gQmDY
   rkMmX4ENMOk5zYeei9Ffm6HdnsKDArAYWzUFi9IvxOTGbcNNBBZWEPzW8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15940825"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000";
   d="scan'208";a="15940825"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 08:37:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="937046389"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000";
   d="scan'208";a="937046389"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2024 08:37:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B77293C0; Thu,  7 Mar 2024 18:37:36 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 1/1] ASoC: Intel: catpt: Carefully use PCI bitwise
 constants
Date: Thu,  7 Mar 2024 18:37:34 +0200
Message-ID: <20240307163734.3852754-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CLHKMCYHU4ISGNT2B6L3HECLBV4FJ4B5
X-Message-ID-Hash: CLHKMCYHU4ISGNT2B6L3HECLBV4FJ4B5
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLHKMCYHU4ISGNT2B6L3HECLBV4FJ4B5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PM constants for PCI devices are defined with bitwise annotation.
When used as is, sparse complains about that:

  .../catpt/dsp.c:390:9: warning: restricted pci_power_t degrades to integer
  .../catpt/dsp.c:414:9: warning: restricted pci_power_t degrades to integer

Force them to be u32 in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/intel/catpt/dsp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
index 346bec000306..5454c6d9ab5b 100644
--- a/sound/soc/intel/catpt/dsp.c
+++ b/sound/soc/intel/catpt/dsp.c
@@ -387,7 +387,7 @@ int catpt_dsp_power_down(struct catpt_dev *cdev)
 	mask = cdev->spec->d3srampgd_bit | cdev->spec->d3pgd_bit;
 	catpt_updatel_pci(cdev, VDRTCTL0, mask, cdev->spec->d3pgd_bit);
 
-	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, PCI_D3hot);
+	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D3hot);
 	/* give hw time to drop off */
 	udelay(50);
 
@@ -411,7 +411,7 @@ int catpt_dsp_power_up(struct catpt_dev *cdev)
 	val = mask & (~CATPT_VDRTCTL2_DTCGE);
 	catpt_updatel_pci(cdev, VDRTCTL2, mask, val);
 
-	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, PCI_D0);
+	catpt_updatel_pci(cdev, PMCS, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D0);
 
 	/* SRAM power gating none */
 	mask = cdev->spec->d3srampgd_bit | cdev->spec->d3pgd_bit;
-- 
2.43.0.rc1.1.gbec44491f096

