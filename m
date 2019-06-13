Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A66DB44BB5
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:07:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33D2A1849;
	Thu, 13 Jun 2019 21:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33D2A1849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560452867;
	bh=XXttEgxU+Ksv2daDpZ100nWz0rieGs9y1/jBr4bGU6I=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l2U1oBY9Jz1afxtMMF2kMzpouORCGnSjrIdoKdd2m1pojTzES3c8f47S9x7ontGT6
	 hDpx6FqmhGNp5GHxnMOaVBycbPocFeawN/a2+wGgDgqLcu82K5acKBmQW6VeHVmNh6
	 EA2Jlit6l52jyt946yBHjt1kw7Lc28x/WTtrBYr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50366F89732;
	Thu, 13 Jun 2019 21:05:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDDFDF80791; Thu, 13 Jun 2019 21:05:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56B16F80791
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56B16F80791
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 12:05:25 -0700
X-ExtLoop1: 1
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jun 2019 12:05:23 -0700
From: cezary.rojewski@intel.com
To: alsa-devel@alsa-project.org
Date: Thu, 13 Jun 2019 21:04:30 +0200
Message-Id: <20190613190436.20156-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613190436.20156-1-cezary.rojewski@intel.com>
References: <20190613190436.20156-1-cezary.rojewski@intel.com>
Cc: Leoni Prodduvaka <leoni.prodduvaka@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, broonie@kernel.org, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 1/7] ASoC: Intel: Skylake: Fix incorrect
	capture position reporting
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Cezary Rojewski <cezary.rojewski@intel.com>

HW recommends to set DUM bit on device power up, so that DPIB write
request occurs every frame regardless of whether DPIB has changed or
not. This addresses incorrect position reporting for capture streams.

Signed-off-by: Leoni Prodduvaka <leoni.prodduvaka@intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl.c | 21 +++++++++++++++++++++
 sound/soc/intel/skylake/skl.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index f864f7b3df3a..7174b5da4099 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -192,6 +192,25 @@ void skl_update_d0i3c(struct device *dev, bool enable)
 			snd_hdac_chip_readb(bus, VS_D0I3C));
 }
 
+/**
+ * skl_dum_set - set DUM bit in EM2 register
+ * @bus: HD-audio core bus
+ *
+ * Addresses incorrect position reporting for capture streams.
+ * Used on device power up.
+ */
+static void skl_dum_set(struct hdac_bus *bus)
+{
+	/* For the DUM bit to be set, CRST needs to be out of reset state */
+	if (!(snd_hdac_chip_readb(bus, GCTL) & AZX_GCTL_RESET)) {
+		skl_enable_miscbdcge(bus->dev, false);
+		snd_hdac_bus_exit_link_reset(bus);
+		skl_enable_miscbdcge(bus->dev, true);
+	}
+
+	snd_hdac_chip_updatel(bus, VS_EM2, AZX_VS_EM2_DUM, AZX_VS_EM2_DUM);
+}
+
 /* called from IRQ */
 static void skl_stream_update(struct hdac_bus *bus, struct hdac_stream *hstr)
 {
@@ -299,6 +318,7 @@ static int _skl_resume(struct hdac_bus *bus)
 	struct skl *skl = bus_to_skl(bus);
 
 	skl_init_pci(skl);
+	skl_dum_set(bus);
 	skl_init_chip(bus, true);
 
 	return skl_resume_dsp(skl);
@@ -956,6 +976,7 @@ static int skl_first_init(struct hdac_bus *bus)
 
 	/* initialize chip */
 	skl_init_pci(skl);
+	skl_dum_set(bus);
 
 	return skl_init_chip(bus, true);
 }
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 85f8bb6687dc..b92a7f8fe675 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -46,6 +46,7 @@
 #define DMA_TRANSMITION_START	2
 #define DMA_TRANSMITION_STOP	3
 
+#define AZX_VS_EM2_DUM			BIT(23)
 #define AZX_REG_VS_EM2_L1SEN		BIT(13)
 
 struct skl_dsp_resource {
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
