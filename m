Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C8652DBDD
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 19:51:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A01317B2;
	Thu, 19 May 2022 19:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A01317B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652982684;
	bh=W5ZZApHPY/cFKEWKzjy7TQwhRLsGe+fK8D43CTsy6G0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jm7CJUD4mUg6n/gI6Fc6veqoFvmoEJE2ZZiv/4/Op/8h1qa7HWJlZKe+BdCWwZ/cU
	 GzzfAJIJsaJfEqzP+UWEJx+KNsthpnAXw1y2gEzxYa8xYJUHTpfB2kpf3KRZ3BYHnn
	 xSUqdw4PXENAv+CHuG3J1nPS0PAjege1wOQLmWhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAEA8F80520;
	Thu, 19 May 2022 19:48:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0018AF8053C; Thu, 19 May 2022 19:48:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C736F8047B
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 19:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C736F8047B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="f7wmEyK1"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J5MiMt023727;
 Thu, 19 May 2022 12:47:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=tpyrRQDCE+mCubpIJjzgOXShj8ICnUR2kNBsPdlkh9g=;
 b=f7wmEyK1gseQJF+LurFBB1pvRkVdZW2/43J8eMdUuQ7xwEA7H9GtisvqZ8Lw+vcFdTZ9
 aDVIVFuQLIMZ2Rd/JM2kQv1GUtwk07iwu4d597EcST8mWPrWpxlwha1doDwv5pViTZVP
 PH/gJZKE1zcVTjzVlhF/mbK2v/8KW2p4DeXKpTzasXUtcqCllLImAD54lveIfYp9guZC
 4Jj/vNvKh/QDQtJdA9XSrCVz26/OV9tVeiYNtv4+tzAWxacdxXgvUHkHtzk4E8Z3XGA5
 dp0oZW6orSrDtHeEBYVsEabeyOVDJ9YhKixwxH5HPWG6x3n9NEHrItdfrTB5sTsIg1mQ kA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37tee-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 12:47:55 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 18:47:53 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 18:47:53 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.59])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A8B7D458;
 Thu, 19 May 2022 17:47:52 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v3 08/17] ALSA: hda: cs35l41: Support Speaker ID for laptops
Date: Thu, 19 May 2022 18:47:40 +0100
Message-ID: <20220519174749.15459-9-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519174749.15459-1-vitalyr@opensource.cirrus.com>
References: <20220519174749.15459-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: HM1IE4WE4WkK2qcX-NEhLXqosmY9pyTY
X-Proofpoint-ORIG-GUID: HM1IE4WE4WkK2qcX-NEhLXqosmY9pyTY
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

Some Laptops use a number of gpios to define which vendor is
used for a particular laptop.
Different coefficient files are used for different vendors.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes since v2:
 - No change
 
 sound/pci/hda/cs35l41_hda.c | 174 ++++++++++++++++++++++++++++++++++--
 sound/pci/hda/cs35l41_hda.h |   1 +
 2 files changed, 166 insertions(+), 9 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 0957b4984143..1d62a41fbc75 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -86,13 +86,19 @@ static const struct cs_dsp_client_ops client_ops = {
 static int cs35l41_request_firmware_file(struct cs35l41_hda *cs35l41,
 					 const struct firmware **firmware, char **filename,
 					 const char *dir, const char *ssid, const char *amp_name,
-					 const char *filetype)
+					 int spkid, const char *filetype)
 {
 	const char * const dsp_name = cs35l41->cs_dsp.name;
 	char *s, c;
 	int ret = 0;
 
-	if (ssid && amp_name)
+	if (spkid > -1 && ssid && amp_name)
+		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s-spkid%d-%s.%s", dir, CS35L41_PART,
+				      dsp_name, "spk-prot", ssid, spkid, amp_name, filetype);
+	else if (spkid > -1 && ssid)
+		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s-spkid%d.%s", dir, CS35L41_PART,
+				      dsp_name, "spk-prot", ssid, spkid, filetype);
+	else if (ssid && amp_name)
 		*filename = kasprintf(GFP_KERNEL, "%s%s-%s-%s-%s-%s.%s", dir, CS35L41_PART,
 				      dsp_name, "spk-prot", ssid, amp_name,
 				      filetype);
@@ -130,6 +136,93 @@ static int cs35l41_request_firmware_file(struct cs35l41_hda *cs35l41,
 	return ret;
 }
 
+static int cs35l41_request_firmware_files_spkid(struct cs35l41_hda *cs35l41,
+						const struct firmware **wmfw_firmware,
+						char **wmfw_filename,
+						const struct firmware **coeff_firmware,
+						char **coeff_filename)
+{
+	int ret;
+
+	/* try cirrus/part-dspN-fwtype-sub<-spkidN><-ampname>.wmfw */
+	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
+					    CS35L41_FIRMWARE_ROOT,
+					    cs35l41->acpi_subsystem_id, cs35l41->amp_name,
+					    cs35l41->speaker_id, "wmfw");
+	if (!ret) {
+		/* try cirrus/part-dspN-fwtype-sub<-spkidN><-ampname>.bin */
+		cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
+					      CS35L41_FIRMWARE_ROOT,
+					      cs35l41->acpi_subsystem_id, cs35l41->amp_name,
+					      cs35l41->speaker_id, "bin");
+		return 0;
+	}
+
+	/* try cirrus/part-dspN-fwtype-sub<-ampname>.wmfw */
+	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
+					    CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
+					    cs35l41->amp_name, -1, "wmfw");
+	if (!ret) {
+		/* try cirrus/part-dspN-fwtype-sub<-spkidN><-ampname>.bin */
+		cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
+					      CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
+					      cs35l41->amp_name, cs35l41->speaker_id, "bin");
+		return 0;
+	}
+
+	/* try cirrus/part-dspN-fwtype-sub<-spkidN>.wmfw */
+	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
+					    CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
+					    NULL, cs35l41->speaker_id, "wmfw");
+	if (!ret) {
+		/* try cirrus/part-dspN-fwtype-sub<-spkidN><-ampname>.bin */
+		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
+						    CS35L41_FIRMWARE_ROOT,
+						    cs35l41->acpi_subsystem_id,
+						    cs35l41->amp_name, cs35l41->speaker_id, "bin");
+		if (ret)
+			/* try cirrus/part-dspN-fwtype-sub<-spkidN>.bin */
+			cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
+						CS35L41_FIRMWARE_ROOT,
+						cs35l41->acpi_subsystem_id,
+						NULL, cs35l41->speaker_id, "bin");
+		return 0;
+	}
+
+	/* try cirrus/part-dspN-fwtype-sub.wmfw */
+	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
+					    CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
+					    NULL, -1, "wmfw");
+	if (!ret) {
+		/* try cirrus/part-dspN-fwtype-sub<-spkidN><-ampname>.bin */
+		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
+						    CS35L41_FIRMWARE_ROOT,
+						    cs35l41->acpi_subsystem_id,
+						    cs35l41->amp_name, cs35l41->speaker_id, "bin");
+		if (ret)
+			/* try cirrus/part-dspN-fwtype-sub<-spkidN>.bin */
+			cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
+						      CS35L41_FIRMWARE_ROOT,
+						      cs35l41->acpi_subsystem_id,
+						      NULL, cs35l41->speaker_id, "bin");
+		return 0;
+	}
+
+	/* fallback try cirrus/part-dspN-fwtype.wmfw */
+	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
+					    CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "wmfw");
+	if (!ret) {
+		/* fallback try cirrus/part-dspN-fwtype.bin */
+		cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
+					      CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "bin");
+		return 0;
+	}
+
+	dev_warn(cs35l41->dev, "Failed to request firmware\n");
+
+	return ret;
+}
+
 static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 					  const struct firmware **wmfw_firmware,
 					  char **wmfw_filename,
@@ -138,43 +231,48 @@ static int cs35l41_request_firmware_files(struct cs35l41_hda *cs35l41,
 {
 	int ret;
 
+	if (cs35l41->speaker_id > -1)
+		return cs35l41_request_firmware_files_spkid(cs35l41, wmfw_firmware, wmfw_filename,
+							    coeff_firmware, coeff_filename);
+
 	/* try cirrus/part-dspN-fwtype-sub<-ampname>.wmfw */
 	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
 					    CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
-					    cs35l41->amp_name, "wmfw");
+					    cs35l41->amp_name, -1, "wmfw");
 	if (!ret) {
 		/* try cirrus/part-dspN-fwtype-sub<-ampname>.bin */
 		cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
 					      CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
-					      cs35l41->amp_name, "bin");
+					      cs35l41->amp_name, -1, "bin");
 		return 0;
 	}
 
 	/* try cirrus/part-dspN-fwtype-sub.wmfw */
 	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
 					    CS35L41_FIRMWARE_ROOT, cs35l41->acpi_subsystem_id,
-					    NULL, "wmfw");
+					    NULL, -1, "wmfw");
 	if (!ret) {
 		/* try cirrus/part-dspN-fwtype-sub<-ampname>.bin */
 		ret = cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
 						    CS35L41_FIRMWARE_ROOT,
 						    cs35l41->acpi_subsystem_id,
-						    cs35l41->amp_name, "bin");
+						    cs35l41->amp_name, -1, "bin");
 		if (ret)
 			/* try cirrus/part-dspN-fwtype-sub.bin */
 			cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
 						      CS35L41_FIRMWARE_ROOT,
-						      cs35l41->acpi_subsystem_id, NULL, "bin");
+						      cs35l41->acpi_subsystem_id,
+						      NULL, -1, "bin");
 		return 0;
 	}
 
 	/* fallback try cirrus/part-dspN-fwtype.wmfw */
 	ret = cs35l41_request_firmware_file(cs35l41, wmfw_firmware, wmfw_filename,
-					    CS35L41_FIRMWARE_ROOT, NULL, NULL, "wmfw");
+					    CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "wmfw");
 	if (!ret) {
 		/* fallback try cirrus/part-dspN-fwtype.bin */
 		cs35l41_request_firmware_file(cs35l41, coeff_firmware, coeff_filename,
-					      CS35L41_FIRMWARE_ROOT, NULL, NULL, "bin");
+					      CS35L41_FIRMWARE_ROOT, NULL, NULL, -1, "bin");
 		return 0;
 	}
 
@@ -602,6 +700,61 @@ static int cs35l41_get_acpi_sub_string(struct device *dev, struct acpi_device *a
 	return ret;
 }
 
+static int cs35l41_get_speaker_id(struct device *dev, int amp_index,
+				  int num_amps, int fixed_gpio_id)
+{
+	struct gpio_desc *speaker_id_desc;
+	int speaker_id = -ENODEV;
+
+	if (fixed_gpio_id >= 0) {
+		dev_dbg(dev, "Found Fixed Speaker ID GPIO (index = %d)\n", fixed_gpio_id);
+		speaker_id_desc = gpiod_get_index(dev, NULL, fixed_gpio_id, GPIOD_IN);
+		if (IS_ERR(speaker_id_desc)) {
+			speaker_id = PTR_ERR(speaker_id_desc);
+			return speaker_id;
+		}
+		speaker_id = gpiod_get_value_cansleep(speaker_id_desc);
+		gpiod_put(speaker_id_desc);
+		dev_dbg(dev, "Speaker ID = %d\n", speaker_id);
+	} else {
+		int base_index;
+		int gpios_per_amp;
+		int count;
+		int tmp;
+		int i;
+
+		count = gpiod_count(dev, "spk-id");
+		if (count > 0) {
+			speaker_id = 0;
+			gpios_per_amp = count / num_amps;
+			base_index = gpios_per_amp * amp_index;
+
+			if (count % num_amps)
+				return -EINVAL;
+
+			dev_dbg(dev, "Found %d Speaker ID GPIOs per Amp\n", gpios_per_amp);
+
+			for (i = 0; i < gpios_per_amp; i++) {
+				speaker_id_desc = gpiod_get_index(dev, "spk-id", i + base_index,
+								  GPIOD_IN);
+				if (IS_ERR(speaker_id_desc)) {
+					speaker_id = PTR_ERR(speaker_id_desc);
+					break;
+				}
+				tmp = gpiod_get_value_cansleep(speaker_id_desc);
+				gpiod_put(speaker_id_desc);
+				if (tmp < 0) {
+					speaker_id = tmp;
+					break;
+				}
+				speaker_id |= tmp << i;
+			}
+			dev_dbg(dev, "Speaker ID = %d\n", speaker_id);
+		}
+	}
+	return speaker_id;
+}
+
 static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, int id)
 {
 	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
@@ -707,6 +860,8 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	else
 		hw_cfg->bst_cap = -1;
 
+	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, cs35l41->index, nval, -1);
+
 	if (hw_cfg->bst_ind > 0 || hw_cfg->bst_cap > 0 || hw_cfg->bst_ipk > 0)
 		hw_cfg->bst_type = CS35L41_INT_BOOST;
 	else
@@ -740,6 +895,7 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	cs35l41->channel_index = 0;
 	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
 	cs35l41->hw_cfg.bst_type = CS35L41_EXT_BOOST_NO_VSPK_SWITCH;
+	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, 0, 0, 2);
 	hw_cfg->gpio2.func = CS35L41_GPIO2_INT_OPEN_DRAIN;
 	hw_cfg->gpio2.valid = true;
 	cs35l41->hw_cfg.valid = true;
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
index b8352088a5cb..717b30a2e33b 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -43,6 +43,7 @@ struct cs35l41_hda {
 	unsigned volatile long irq_errors;
 	const char *amp_name;
 	const char *acpi_subsystem_id;
+	int speaker_id;
 	struct regmap_irq_chip_data *irq_data;
 	bool firmware_running;
 	bool halo_initialized;
-- 
2.34.1

