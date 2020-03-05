Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7975917A847
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 15:56:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20874167D;
	Thu,  5 Mar 2020 15:55:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20874167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583420179;
	bh=vzjQE/SZOddHc4hn1BPoNfC7fivkCLGOybmnb17MOg4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DltNIUrCjdqwntB+g1tQSVKwVR8hlSKbmH8Aa6xGb8HYAxsTaDyIQ2HUz2CaEDuN2
	 xr3rihhLrotMCayrr74NCPSW9diNuD0YqI+MZtEx8zneFHXNovx056qtWSiN14egcj
	 Vx1KfA4MJci8XHkiePCZOBI1osrdv9ojISaH5FMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF5F6F8028F;
	Thu,  5 Mar 2020 15:53:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D28F4F80266; Thu,  5 Mar 2020 15:53:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53446F8025F
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 15:53:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53446F8025F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 06:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="352372584"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2020 06:53:37 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ASoC: Intel: Skylake: Remove superfluous chip
 initialization
Date: Thu,  5 Mar 2020 15:53:08 +0100
Message-Id: <20200305145314.32579-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200305145314.32579-1-cezary.rojewski@intel.com>
References: <20200305145314.32579-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, vkoul@kernel.org, broonie@kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Skylake driver does the controller init operation twice:
- first during probe (only to stop it just before scheduling probe_work)
- and during said probe_work where the actual correct sequence is
executed

To properly complete boot sequence when iDisp codec is present, bus
initialization has to be called only after _i915_init() finishes.
With additional _reset_list preceding _i915_init(), iDisp codec never
gets the chance to enumerate on the link. Remove the superfluous
initialization to address the issue.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index f755ca2484cf..d66231525356 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -803,6 +803,9 @@ static void skl_probe_work(struct work_struct *work)
 			return;
 	}
 
+	skl_init_pci(skl);
+	skl_dum_set(bus);
+
 	err = skl_init_chip(bus, true);
 	if (err < 0) {
 		dev_err(bus->dev, "Init chip failed with err: %d\n", err);
@@ -918,8 +921,6 @@ static int skl_first_init(struct hdac_bus *bus)
 		return -ENXIO;
 	}
 
-	snd_hdac_bus_reset_link(bus, true);
-
 	snd_hdac_bus_parse_capabilities(bus);
 
 	/* check if PPCAP exists */
@@ -967,11 +968,7 @@ static int skl_first_init(struct hdac_bus *bus)
 	if (err < 0)
 		return err;
 
-	/* initialize chip */
-	skl_init_pci(skl);
-	skl_dum_set(bus);
-
-	return skl_init_chip(bus, true);
+	return 0;
 }
 
 static int skl_probe(struct pci_dev *pci,
@@ -1064,8 +1061,6 @@ static int skl_probe(struct pci_dev *pci,
 	if (bus->mlcap)
 		snd_hdac_ext_bus_get_ml_capabilities(bus);
 
-	snd_hdac_bus_stop_chip(bus);
-
 	/* create device for soc dmic */
 	err = skl_dmic_device_register(skl);
 	if (err < 0) {
-- 
2.17.1

