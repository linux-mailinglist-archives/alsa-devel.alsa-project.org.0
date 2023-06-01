Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C0771A334
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 17:51:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CD7174C;
	Thu,  1 Jun 2023 17:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CD7174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685634667;
	bh=MS1J4ehWOCLzmSrjXlKiT1S5yaDz8aGtvV0RTGAwm9E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cCJh1ppBppsYFILZybhGqX3CsnWESfvLelRlglv9QqDfdBdsUPJBh6zO/yfuDqwuo
	 E0XJR63jqTLQT8UCA773vR/XVhN1c3tkwK5yy7U1W+X8pkWwjC41VcMsl2TDqJ8Jwk
	 6ru10xXQHvxJ7AP3vhNaWtGLbekyucAIPq32Qoi8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 099E3F805E3; Thu,  1 Jun 2023 17:48:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 262D5F805D5;
	Thu,  1 Jun 2023 17:48:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C859AF8057F; Thu,  1 Jun 2023 17:47:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 202EFF8047D
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 17:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 202EFF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=EsFXAe1S
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3515TBh0016524;
	Thu, 1 Jun 2023 10:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=xBEI7VMkGnz5szNyfQI9MoST3Fg6kTwc2vq66TG5hQM=;
 b=EsFXAe1SQyHEtb2Ny9qmMkdrYt3zGqvYJnif+BZ7nBU81oq10bUSb3zUBTW8id80HdIn
 hEMYm7x3c0AQuP2FTdpedgZeMJVLiyeGoM4P3GmsNToSHul4aQegLcVIH1uEU4Hxkm/7
 RQ4WAQQZb5r+FouHsCdQJ2wvBqI0y7WLS5uX7HQvX3r0KIrDTI9GMdsaJFr4wu3Zirw4
 vqoct0F/iFgM9wO46dY3y9/X6fpYHB6GS5wXpMTHYHvXUUpWTN+nXg8eLEbIA6gkmf7d
 HRsfb8tBvTujiXuzSSExygyh3It3ZbOn3hr2k+avCd4MilTVMgHa1Hmb3DN6b8CEQ7dv vw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3que9mxjyq-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 10:47:35 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 1 Jun
 2023 16:47:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 1 Jun 2023 16:47:31 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9DFF211C6;
	Thu,  1 Jun 2023 15:47:31 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <perex@perex.cz>, <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH v4 06/12] ASoC: cs35l56: Move cs_dsp init into shared library
Date: Thu, 1 Jun 2023 16:47:25 +0100
Message-ID: <20230601154731.3210572-7-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230601154731.3210572-1-rf@opensource.cirrus.com>
References: <20230601154731.3210572-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9uJPd6nmiO-JYaOJY7gpb3eov2q_z_Ot
X-Proofpoint-ORIG-GUID: 9uJPd6nmiO-JYaOJY7gpb3eov2q_z_Ot
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VMROFPJDNRQXGZ7ZXOS23ZNJOZLJK3WS
X-Message-ID-Hash: VMROFPJDNRQXGZ7ZXOS23ZNJOZLJK3WS
X-MailFrom: prvs=151698faa0=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMROFPJDNRQXGZ7ZXOS23ZNJOZLJK3WS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move the code that initialized the struct cs_dsp members
into the shared library so that the HDA driver can use it.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 include/sound/cs35l56.h           |  2 +-
 sound/soc/codecs/cs35l56-shared.c | 18 ++++++++++++++++--
 sound/soc/codecs/cs35l56.c        | 11 +----------
 3 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 4a885c2321c1..e97c7ccfc051 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -269,7 +269,6 @@ extern struct regmap_config cs35l56_regmap_i2c;
 extern struct regmap_config cs35l56_regmap_spi;
 extern struct regmap_config cs35l56_regmap_sdw;
 
-extern const struct cs_dsp_region cs35l56_dsp1_regions[CS35L56_NUM_DSP_REGIONS];
 extern const char * const cs35l56_tx_input_texts[CS35L56_NUM_INPUT_SRC];
 extern const unsigned int cs35l56_tx_input_values[CS35L56_NUM_INPUT_SRC];
 
@@ -283,6 +282,7 @@ irqreturn_t cs35l56_irq(int irq, void *data);
 int cs35l56_is_fw_reload_needed(struct cs35l56_base *cs35l56_base);
 int cs35l56_runtime_suspend_common(struct cs35l56_base *cs35l56_base);
 int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_soundwire);
+void cs35l56_init_cs_dsp(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_dsp);
 int cs35l56_get_bclk_freq_id(unsigned int freq);
 void cs35l56_fill_supply_names(struct regulator_bulk_data *data);
 
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 194fa08e1cc2..82e5edef1b3f 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -526,14 +526,28 @@ int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_sou
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_runtime_resume_common, SND_SOC_CS35L56_SHARED);
 
-const struct cs_dsp_region cs35l56_dsp1_regions[] = {
+static const struct cs_dsp_region cs35l56_dsp1_regions[] = {
 	{ .type = WMFW_HALO_PM_PACKED,	.base = CS35L56_DSP1_PMEM_0 },
 	{ .type = WMFW_HALO_XM_PACKED,	.base = CS35L56_DSP1_XMEM_PACKED_0 },
 	{ .type = WMFW_HALO_YM_PACKED,	.base = CS35L56_DSP1_YMEM_PACKED_0 },
 	{ .type = WMFW_ADSP2_XM,	.base = CS35L56_DSP1_XMEM_UNPACKED24_0 },
 	{ .type = WMFW_ADSP2_YM,	.base = CS35L56_DSP1_YMEM_UNPACKED24_0 },
 };
-EXPORT_SYMBOL_NS_GPL(cs35l56_dsp1_regions, SND_SOC_CS35L56_SHARED);
+
+void cs35l56_init_cs_dsp(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_dsp)
+{
+	cs_dsp->num = 1;
+	cs_dsp->type = WMFW_HALO;
+	cs_dsp->rev = 0;
+	cs_dsp->dev = cs35l56_base->dev;
+	cs_dsp->regmap = cs35l56_base->regmap;
+	cs_dsp->base = CS35L56_DSP1_CORE_BASE;
+	cs_dsp->base_sysinfo = CS35L56_DSP1_SYS_INFO_ID;
+	cs_dsp->mem = cs35l56_dsp1_regions;
+	cs_dsp->num_mems = ARRAY_SIZE(cs35l56_dsp1_regions);
+	cs_dsp->no_core_startstop = true;
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_init_cs_dsp, SND_SOC_CS35L56_SHARED);
 
 static const u32 cs35l56_bclk_valid_for_pll_freq_table[] = {
 	[0x0C] = 128000,
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 69df3f5f257f..b8a4cec98371 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1016,18 +1016,9 @@ static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
 	INIT_WORK(&cs35l56->dsp_work, cs35l56_dsp_work);
 
 	dsp = &cs35l56->dsp;
+	cs35l56_init_cs_dsp(&cs35l56->base, &dsp->cs_dsp);
 	dsp->part = "cs35l56";
-	dsp->cs_dsp.num = 1;
-	dsp->cs_dsp.type = WMFW_HALO;
-	dsp->cs_dsp.rev = 0;
 	dsp->fw = 12;
-	dsp->cs_dsp.dev = cs35l56->base.dev;
-	dsp->cs_dsp.regmap = cs35l56->base.regmap;
-	dsp->cs_dsp.base = CS35L56_DSP1_CORE_BASE;
-	dsp->cs_dsp.base_sysinfo = CS35L56_DSP1_SYS_INFO_ID;
-	dsp->cs_dsp.mem = cs35l56_dsp1_regions;
-	dsp->cs_dsp.num_mems = ARRAY_SIZE(cs35l56_dsp1_regions);
-	dsp->cs_dsp.no_core_startstop = true;
 	dsp->wmfw_optional = true;
 
 	dev_dbg(cs35l56->base.dev, "DSP system name: '%s'\n", dsp->system_name);
-- 
2.30.2

