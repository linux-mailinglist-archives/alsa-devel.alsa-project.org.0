Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBA78765DC
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Mar 2024 15:00:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A11C83E;
	Fri,  8 Mar 2024 15:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A11C83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709906419;
	bh=o8K012Oem4PHVj4ZW/iWzvsRClfJhAeRFi3fTA52p4w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IM7f6OJsBWeCNJq2lSZN/+Pa+MR5W91ZKzXHVHLVfF0NC4iQIgh/t2lBZqmaIaj7h
	 1agjtlxZQpK42QcHAZI9EcxZUxwfu/van7XKOQ5am9SogtkHU1TlGBPSokFtM/LYQ6
	 RByT9PyHAt+fxN9opziBkEFxUJAk3Erzlez+3l1o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2996F805F7; Fri,  8 Mar 2024 14:59:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB19FF805F3;
	Fri,  8 Mar 2024 14:59:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6730FF805A0; Fri,  8 Mar 2024 14:59:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0686F80087
	for <alsa-devel@alsa-project.org>; Fri,  8 Mar 2024 14:59:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0686F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=W5iYzO1D
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4286juhU000826;
	Fri, 8 Mar 2024 07:59:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=rqN71B10n1AW4Euf1b7rwX3hAjupKeEilhu8pUKsMlg=; b=
	W5iYzO1DqWQ9A0ndo4nmPxvgsnKjYdadRJMIEKAb4RSFeebnaW2Ros/IjcFJguqb
	Ufn/iR5bLskfNvECFfNio6kdxAnO3UL7o0MuCbhdMZ1/cKpR/jnuYQFB4HOXH0+G
	zmKYsCWEEI4Kk8Pf0vAA7K6xkGyN6xNwEm9B9gRXjniZSx6CHJnvTZqdPXA8tXTZ
	faysQlEuV9BuSiScS9S95qcx+b51ELHDQokq2cvJ4xTP7dqQmtyaQ65M+hWd3Gl9
	aWPECPiWwNY6ycnqUoEOA4LBCaGbbWRd2Qh3LLLg+cwQ+ykLom/atrKlLbyT1T9C
	rn/khyfZsABrSebn2X+vGA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wpn933f32-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 07:59:03 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 8 Mar 2024
 13:59:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Fri, 8 Mar 2024 13:59:00 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C971B82024D;
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
Subject: [PATCH 2/3] ALSA: hda: cs35l56: Add support for CS35L54 and CS35L57
Date: Fri, 8 Mar 2024 13:58:59 +0000
Message-ID: <20240308135900.603192-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240308135900.603192-1-rf@opensource.cirrus.com>
References: <20240308135900.603192-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6EWp8g6Yp6Keh7-6X84ADc-3WCvnAnYj
X-Proofpoint-ORIG-GUID: 6EWp8g6Yp6Keh7-6X84ADc-3WCvnAnYj
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: NCALNTI2XZDA4LAUYPJAK2WQGRTECTMS
X-Message-ID-Hash: NCALNTI2XZDA4LAUYPJAK2WQGRTECTMS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCALNTI2XZDA4LAUYPJAK2WQGRTECTMS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

Add the HID for the CS35L54 and CS35L57 Boosted Smart Amplifiers. These
have the same control interface as the CS35L56 so are handled by the
cs35l56-hda driver.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c     | 16 ++++++++++------
 sound/pci/hda/cs35l56_hda.h     |  2 +-
 sound/pci/hda/cs35l56_hda_i2c.c |  7 +++++--
 sound/pci/hda/cs35l56_hda_spi.c |  7 +++++--
 4 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 5ad76d6914c3..41974b3897a7 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -459,13 +459,15 @@ static void cs35l56_hda_request_firmware_files(struct cs35l56_hda *cs35l56,
 
 	if (preloaded_fw_ver) {
 		snprintf(base_name, sizeof(base_name),
-			 "cirrus/cs35l56-%02x%s-%06x-dsp1-misc",
+			 "cirrus/cs35l%02x-%02x%s-%06x-dsp1-misc",
+			 cs35l56->base.type,
 			 cs35l56->base.rev,
 			 cs35l56->base.secured ? "-s" : "",
 			 preloaded_fw_ver & 0xffffff);
 	} else {
 		snprintf(base_name, sizeof(base_name),
-			 "cirrus/cs35l56-%02x%s-dsp1-misc",
+			 "cirrus/cs35l%02x-%02x%s-dsp1-misc",
+			 cs35l56->base.type,
 			 cs35l56->base.rev,
 			 cs35l56->base.secured ? "-s" : "");
 	}
@@ -852,9 +854,10 @@ static int cs35l56_hda_system_resume(struct device *dev)
 	return 0;
 }
 
-static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int id)
+static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 {
 	u32 values[HDA_MAX_COMPONENTS];
+	char hid_string[8];
 	struct acpi_device *adev;
 	const char *property, *sub;
 	size_t nval;
@@ -865,7 +868,8 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int id)
 	 * the serial-multi-instantiate driver, so lookup the node by HID
 	 */
 	if (!ACPI_COMPANION(cs35l56->base.dev)) {
-		adev = acpi_dev_get_first_match_dev("CSC3556", NULL, -1);
+		snprintf(hid_string, sizeof(hid_string), "CSC%04X", hid);
+		adev = acpi_dev_get_first_match_dev(hid_string, NULL, -1);
 		if (!adev) {
 			dev_err(cs35l56->base.dev, "Failed to find an ACPI device for %s\n",
 				dev_name(cs35l56->base.dev));
@@ -953,14 +957,14 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int id)
 	return ret;
 }
 
-int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int id)
+int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int hid, int id)
 {
 	int ret;
 
 	mutex_init(&cs35l56->base.irq_lock);
 	dev_set_drvdata(cs35l56->base.dev, cs35l56);
 
-	ret = cs35l56_hda_read_acpi(cs35l56, id);
+	ret = cs35l56_hda_read_acpi(cs35l56, hid, id);
 	if (ret)
 		goto err;
 
diff --git a/sound/pci/hda/cs35l56_hda.h b/sound/pci/hda/cs35l56_hda.h
index 6e5bc5397db5..464e4aa63cd1 100644
--- a/sound/pci/hda/cs35l56_hda.h
+++ b/sound/pci/hda/cs35l56_hda.h
@@ -42,7 +42,7 @@ struct cs35l56_hda {
 
 extern const struct dev_pm_ops cs35l56_hda_pm_ops;
 
-int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int id);
+int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int hid, int id);
 void cs35l56_hda_remove(struct device *dev);
 
 #endif /*__CS35L56_HDA_H__*/
diff --git a/sound/pci/hda/cs35l56_hda_i2c.c b/sound/pci/hda/cs35l56_hda_i2c.c
index a9ef6d86de83..13beee807308 100644
--- a/sound/pci/hda/cs35l56_hda_i2c.c
+++ b/sound/pci/hda/cs35l56_hda_i2c.c
@@ -13,6 +13,7 @@
 
 static int cs35l56_hda_i2c_probe(struct i2c_client *clt)
 {
+	const struct i2c_device_id *id = i2c_client_get_device_id(clt);
 	struct cs35l56_hda *cs35l56;
 	int ret;
 
@@ -33,7 +34,7 @@ static int cs35l56_hda_i2c_probe(struct i2c_client *clt)
 		return ret;
 	}
 
-	ret = cs35l56_hda_common_probe(cs35l56, clt->addr);
+	ret = cs35l56_hda_common_probe(cs35l56, id->driver_data, clt->addr);
 	if (ret)
 		return ret;
 	ret = cs35l56_irq_request(&cs35l56->base, clt->irq);
@@ -49,7 +50,9 @@ static void cs35l56_hda_i2c_remove(struct i2c_client *clt)
 }
 
 static const struct i2c_device_id cs35l56_hda_i2c_id[] = {
-	{ "cs35l56-hda", 0 },
+	{ "cs35l54-hda", 0x3554 },
+	{ "cs35l56-hda", 0x3556 },
+	{ "cs35l57-hda", 0x3557 },
 	{}
 };
 
diff --git a/sound/pci/hda/cs35l56_hda_spi.c b/sound/pci/hda/cs35l56_hda_spi.c
index 080426de9083..a3b2fa76663d 100644
--- a/sound/pci/hda/cs35l56_hda_spi.c
+++ b/sound/pci/hda/cs35l56_hda_spi.c
@@ -13,6 +13,7 @@
 
 static int cs35l56_hda_spi_probe(struct spi_device *spi)
 {
+	const struct spi_device_id *id = spi_get_device_id(spi);
 	struct cs35l56_hda *cs35l56;
 	int ret;
 
@@ -33,7 +34,7 @@ static int cs35l56_hda_spi_probe(struct spi_device *spi)
 		return ret;
 	}
 
-	ret = cs35l56_hda_common_probe(cs35l56, spi_get_chipselect(spi, 0));
+	ret = cs35l56_hda_common_probe(cs35l56, id->driver_data, spi_get_chipselect(spi, 0));
 	if (ret)
 		return ret;
 	ret = cs35l56_irq_request(&cs35l56->base, spi->irq);
@@ -49,7 +50,9 @@ static void cs35l56_hda_spi_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id cs35l56_hda_spi_id[] = {
-	{ "cs35l56-hda", 0 },
+	{ "cs35l54-hda", 0x3554 },
+	{ "cs35l56-hda", 0x3556 },
+	{ "cs35l57-hda", 0x3557 },
 	{}
 };
 
-- 
2.30.2

