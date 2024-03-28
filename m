Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D6F8765DF
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 15:00:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBB8E82B;
	Fri,  8 Mar 2024 15:00:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBB8E82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709906433;
	bh=U+fOKz7TGiR4Thd1clYqsJhaN+IEdPVYdQnzJseP65U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TrOBKYMxzsv4pChMCbDoN6HDyjRTjPId9zdAFYmWU+ZnnxHs87svkikmVRejJyXLU
	 lk6WJe9+jJNiakONveDeKQQvsq5tKypG/ufM9tmrHHBuG1wZ5FgTy1wuXxibN+9/Je
	 9cJPSUGyJAQLmaDu0+jmZh+wLiQIbmWMa2BmT92g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37F9CF8060E; Fri,  8 Mar 2024 14:59:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A835FF80608;
	Fri,  8 Mar 2024 14:59:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2979F805DA; Fri,  8 Mar 2024 14:59:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAEB3F802E8
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 14:59:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAEB3F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=oyp/I4ea
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4286otF1031190;
	Fri, 8 Mar 2024 07:59:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=WTB9XN6od6vwedl7aoFuFijIIazO2klf7gPonNGoWoU=; b=
	oyp/I4eaTw+Lseg0iL78DGaDvUnLwT/U+6qZOMEafmSHnHdSTw5GDnAeSX0zBVUh
	8hcq7gGya7SyADgp7+elFra1urabn1lIYCOetw86zmSvWbzjuC+NKJUgxjvmv5BT
	Qn6AHtX9VkjcYCCUhOdUBKvRE5jnkSi3GNEgNr6MF20Sf5KJl1tn4n9q+hWpJH1f
	lX9nLmnS3kBZOb9JfX12xelmRjWa79uQqRE4g5hllDOJsLe5DIl4cohuoaAKfod5
	LUuDCkLg72OuAt2hWH3/OwqXHdQX0cB+vFL3aBHh3toWRyGXQ8j7p0C1Z2cCjdiN
	FWg/2pM1bsPJkTYR6ryOkw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wm2d2q9b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 07:59:03 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 8 Mar 2024
 13:59:00 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Fri, 8 Mar 2024 13:59:00 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id BB4A982024B;
	Fri,  8 Mar 2024 13:59:00 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <hdegoede@redhat.com>,
        <lenb@kernel.org>, <rafael@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <platform-driver-x86@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 1/3] ASoC: cs35l56: Add support for CS35L54 and CS35L57
Date: Fri, 8 Mar 2024 13:58:58 +0000
Message-ID: <20240308135900.603192-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240308135900.603192-1-rf@opensource.cirrus.com>
References: <20240308135900.603192-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: s1KbksDwxCrFPUx1zRvNEGFuo0ihwG1n
X-Proofpoint-GUID: s1KbksDwxCrFPUx1zRvNEGFuo0ihwG1n
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: AWR2UQDWJAXL2H37QL32ISHOLUFUVC44
X-Message-ID-Hash: AWR2UQDWJAXL2H37QL32ISHOLUFUVC44
X-MailFrom: prvs=07979bcd0a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AWR2UQDWJAXL2H37QL32ISHOLUFUVC44/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

The CS35L54 and CS35L57 are Boosted Smart Amplifiers. The CS35L54 has
I2C/SPI control and I2S/TDM audio. The CS35L57 also has SoundWire
control and audio.

The hardware differences between L54, L56 and L57 do not affect the
driver control interface so they can all be handled by the same driver.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  1 +
 sound/soc/codecs/cs35l56-sdw.c    |  3 ++-
 sound/soc/codecs/cs35l56-shared.c |  8 ++++++--
 sound/soc/codecs/cs35l56.c        | 14 +++++++++++++-
 4 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 4014ed7097b3..e0629699b563 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -261,6 +261,7 @@ struct cs35l56_base {
 	struct regmap *regmap;
 	int irq;
 	struct mutex irq_lock;
+	u8 type;
 	u8 rev;
 	bool init_done;
 	bool fw_patched;
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index eaa4c706f3a2..14a5f86019aa 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -386,7 +386,7 @@ static int cs35l56_sdw_bus_config(struct sdw_slave *peripheral,
 	dev_dbg(cs35l56->base.dev, "%s: sclk=%u c=%u r=%u\n",
 		__func__, sclk, params->col, params->row);
 
-	if (cs35l56->base.rev < 0xb0)
+	if ((cs35l56->base.type == 0x56) && (cs35l56->base.rev < 0xb0))
 		return cs35l56_a1_kick_divider(cs35l56, peripheral);
 
 	return 0;
@@ -563,6 +563,7 @@ static const struct dev_pm_ops cs35l56_sdw_pm = {
 
 static const struct sdw_device_id cs35l56_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x3556, 0),
+	SDW_SLAVE_ENTRY(0x01FA, 0x3557, 0),
 	{},
 };
 MODULE_DEVICE_TABLE(sdw, cs35l56_sdw_id);
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index f3670bf85a95..08cac58e3ab2 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -776,13 +776,17 @@ int cs35l56_hw_init(struct cs35l56_base *cs35l56_base)
 	devid &= CS35L56_DEVID_MASK;
 
 	switch (devid) {
+	case 0x35A54:
 	case 0x35A56:
+	case 0x35A57:
 		break;
 	default:
 		dev_err(cs35l56_base->dev, "Unknown device %x\n", devid);
 		return ret;
 	}
 
+	cs35l56_base->type = devid & 0xFF;
+
 	ret = regmap_read(cs35l56_base->regmap, CS35L56_DSP_RESTRICT_STS1, &secured);
 	if (ret) {
 		dev_err(cs35l56_base->dev, "Get Secure status failed\n");
@@ -803,8 +807,8 @@ int cs35l56_hw_init(struct cs35l56_base *cs35l56_base)
 	if (ret)
 		return ret;
 
-	dev_info(cs35l56_base->dev, "Cirrus Logic CS35L56%s Rev %02X OTP%d fw:%d.%d.%d (patched=%u)\n",
-		 cs35l56_base->secured ? "s" : "", cs35l56_base->rev, otpid,
+	dev_info(cs35l56_base->dev, "Cirrus Logic CS35L%02X%s Rev %02X OTP%d fw:%d.%d.%d (patched=%u)\n",
+		 cs35l56_base->type, cs35l56_base->secured ? "s" : "", cs35l56_base->rev, otpid,
 		 fw_ver >> 16, (fw_ver >> 8) & 0xff, fw_ver & 0xff, !fw_missing);
 
 	/* Wake source and *_BLOCKED interrupts default to unmasked, so mask them */
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 8a0ca0812772..8d2f021fb362 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1004,6 +1004,10 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
 		return -ENODEV;
 	}
 
+	cs35l56->dsp.part = kasprintf(GFP_KERNEL, "cs35l%02x", cs35l56->base.type);
+	if (!cs35l56->dsp.part)
+		return -ENOMEM;
+
 	cs35l56->component = component;
 	wm_adsp2_component_probe(&cs35l56->dsp, component);
 
@@ -1034,6 +1038,9 @@ static void cs35l56_component_remove(struct snd_soc_component *component)
 
 	wm_adsp2_component_remove(&cs35l56->dsp, component);
 
+	kfree(cs35l56->dsp.part);
+	cs35l56->dsp.part = NULL;
+
 	kfree(cs35l56->dsp.fwf_name);
 	cs35l56->dsp.fwf_name = NULL;
 
@@ -1253,7 +1260,12 @@ static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
 
 	dsp = &cs35l56->dsp;
 	cs35l56_init_cs_dsp(&cs35l56->base, &dsp->cs_dsp);
-	dsp->part = "cs35l56";
+
+	/*
+	 * dsp->part is filled in later as it is based on the DEVID. In a
+	 * SoundWire system that cannot be read until enumeration has occurred
+	 * and the device has attached.
+	 */
 	dsp->fw = 12;
 	dsp->wmfw_optional = true;
 
-- 
2.30.2

