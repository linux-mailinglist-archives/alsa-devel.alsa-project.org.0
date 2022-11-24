Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B09C2637736
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 12:09:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07BF916F2;
	Thu, 24 Nov 2022 12:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07BF916F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669288158;
	bh=RWAR2HylQ2BCBfG37hDs29RNtuUQrm045q1vXOG5X3A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=knNN4rRVe9yGQ08+oAUHFca/CFxd272upUEWlVOg+JvAADWW6I/WrxvU3kUfLx+Ch
	 llpRChqT0++yErKMhMEcBH7gr5HTdGQ+pom6y5PkB5uakSAjEbf8mqMMfB1GsJP4ia
	 Yc+sxXDv2fxmru7wp0J7xAIY2ZYtZRGZ5AgbWxpI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9521CF80558;
	Thu, 24 Nov 2022 12:07:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4289DF80115; Thu, 24 Nov 2022 12:07:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8E83F80115
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 12:07:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8E83F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="SnhuQO3k"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AO7sBmi004512; Thu, 24 Nov 2022 05:07:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=kAWyD4t79JScrfLhlg0LvTwcZmRjr4XLSE8rVzGWack=;
 b=SnhuQO3kbJuNFkEmJ2w/AHUarhGw7GZ17HnXzmZGE5f7o/Fa6xXix4sMUvsQoexlDJDd
 R0B7OoUH06AszUtehK1BPrL7p0uyM8hXvzFkjDe5fqYJxD2izFVYlu6EGfVdqUSl5vlP
 bws08DQLkLIeq4kUZRGbDzQ36h9EtQO2NPEUt6aFDpSNfIROHJnnM5rLysr25V+rnh1f
 l5vA6fOHv8508M2/+pvbhz+rRvrTCKNxhNiszc5/axU9DbnPWEpF1oWwhsdDetT8tna4
 kzMmpEPNBZWa5zyRtXEsYx3K/Z8MJf9ZL/XC2cwfUjL/Md3K32/Mbpy8AlR8wzePEPHp yA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6x2dt-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Nov 2022 05:07:25 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 24 Nov
 2022 05:07:22 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Thu, 24 Nov 2022 05:07:22 -0600
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C18E12BA;
 Thu, 24 Nov 2022 11:07:22 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Hans
 de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 2/2] ALSA: hda: cs35l41: Use ACPI_COMPANION to read acpi
 properties
Date: Thu, 24 Nov 2022 11:07:18 +0000
Message-ID: <20221124110718.3925934-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124110718.3925934-1-sbinding@opensource.cirrus.com>
References: <20221124110718.3925934-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qxXytgOVlUR2TlqVvoRRvDLJn6DnpzSU
X-Proofpoint-GUID: qxXytgOVlUR2TlqVvoRRvDLJn6DnpzSU
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Stefan Binding <sbinding@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
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

Currently the driver finds the acpi_device used to read certain
properties using the HID, however, this is not necessary, as the
acpi_device can be obtained from the device itself.

With the ACPI_COMPANION correctly set, we can also simplify how
we obtain the reset gpio.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 50 ++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 29 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index e5f0549bf06d..50cbbcce4946 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1214,16 +1214,15 @@ static int cs35l41_get_speaker_id(struct device *dev, int amp_index,
  * And devm functions expect that the device requesting the resource has the correct
  * fwnode.
  */
-static int cs35l41_no_acpi_dsd(struct cs35l41_hda *cs35l41, struct device *physdev, int id,
-			       const char *hid)
+static int cs35l41_no_acpi_dsd(struct cs35l41_hda *cs35l41, int id, const char *hid)
 {
 	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
 
 	/* check I2C address to assign the index */
 	cs35l41->index = id == 0x40 ? 0 : 1;
 	cs35l41->channel_index = 0;
-	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
-	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, 0, 0, 2);
+	cs35l41->reset_gpio = gpiod_get_index(cs35l41->dev, NULL, 0, GPIOD_OUT_HIGH);
+	cs35l41->speaker_id = cs35l41_get_speaker_id(cs35l41->dev, 0, 0, 2);
 	hw_cfg->spk_pos = cs35l41->index;
 	hw_cfg->gpio2.func = CS35L41_INTERRUPT;
 	hw_cfg->gpio2.valid = true;
@@ -1255,39 +1254,36 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
 	u32 values[HDA_MAX_COMPONENTS];
 	struct acpi_device *adev;
-	struct device *physdev;
+
 	const char *sub;
 	char *property;
 	size_t nval;
 	int i, ret;
 
-	adev = acpi_dev_get_first_match_dev(hid, NULL, -1);
+	adev = ACPI_COMPANION(cs35l41->dev);
 	if (!adev) {
-		dev_err(cs35l41->dev, "Failed to find an ACPI device for %s\n", hid);
+		dev_err(cs35l41->dev, "Failed to find an ACPI device for %s\n",
+			dev_name(cs35l41->dev));
 		return -ENODEV;
 	}
 
-	physdev = get_device(acpi_get_first_physical_node(adev));
-	acpi_dev_put(adev);
-
-	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
+	sub = acpi_get_subsystem_id(ACPI_HANDLE(cs35l41->dev));
 	if (IS_ERR(sub))
 		sub = NULL;
 	cs35l41->acpi_subsystem_id = sub;
 
 	property = "cirrus,dev-index";
-	ret = device_property_count_u32(physdev, property);
-	if (ret <= 0) {
-		ret = cs35l41_no_acpi_dsd(cs35l41, physdev, id, hid);
-		goto err_put_physdev;
-	}
+	ret = device_property_count_u32(cs35l41->dev, property);
+	if (ret <= 0)
+		return cs35l41_no_acpi_dsd(cs35l41, id, hid);
+
 	if (ret > ARRAY_SIZE(values)) {
 		ret = -EINVAL;
 		goto err;
 	}
 	nval = ret;
 
-	ret = device_property_read_u32_array(physdev, property, values, nval);
+	ret = device_property_read_u32_array(cs35l41->dev, property, values, nval);
 	if (ret)
 		goto err;
 
@@ -1307,11 +1303,10 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	/* To use the same release code for all laptop variants we can't use devm_ version of
 	 * gpiod_get here, as CLSA010* don't have a fully functional bios with an _DSD node
 	 */
-	cs35l41->reset_gpio = fwnode_gpiod_get_index(acpi_fwnode_handle(adev), "reset", cs35l41->index,
-						     GPIOD_OUT_LOW, "cs35l41-reset");
+	cs35l41->reset_gpio = gpiod_get_index(cs35l41->dev, "reset", cs35l41->index, GPIOD_OUT_LOW);
 
 	property = "cirrus,speaker-position";
-	ret = device_property_read_u32_array(physdev, property, values, nval);
+	ret = device_property_read_u32_array(cs35l41->dev, property, values, nval);
 	if (ret)
 		goto err;
 	hw_cfg->spk_pos = values[cs35l41->index];
@@ -1322,41 +1317,41 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 			cs35l41->channel_index++;
 
 	property = "cirrus,gpio1-func";
-	ret = device_property_read_u32_array(physdev, property, values, nval);
+	ret = device_property_read_u32_array(cs35l41->dev, property, values, nval);
 	if (ret)
 		goto err;
 	hw_cfg->gpio1.func = values[cs35l41->index];
 	hw_cfg->gpio1.valid = true;
 
 	property = "cirrus,gpio2-func";
-	ret = device_property_read_u32_array(physdev, property, values, nval);
+	ret = device_property_read_u32_array(cs35l41->dev, property, values, nval);
 	if (ret)
 		goto err;
 	hw_cfg->gpio2.func = values[cs35l41->index];
 	hw_cfg->gpio2.valid = true;
 
 	property = "cirrus,boost-peak-milliamp";
-	ret = device_property_read_u32_array(physdev, property, values, nval);
+	ret = device_property_read_u32_array(cs35l41->dev, property, values, nval);
 	if (ret == 0)
 		hw_cfg->bst_ipk = values[cs35l41->index];
 	else
 		hw_cfg->bst_ipk = -1;
 
 	property = "cirrus,boost-ind-nanohenry";
-	ret = device_property_read_u32_array(physdev, property, values, nval);
+	ret = device_property_read_u32_array(cs35l41->dev, property, values, nval);
 	if (ret == 0)
 		hw_cfg->bst_ind = values[cs35l41->index];
 	else
 		hw_cfg->bst_ind = -1;
 
 	property = "cirrus,boost-cap-microfarad";
-	ret = device_property_read_u32_array(physdev, property, values, nval);
+	ret = device_property_read_u32_array(cs35l41->dev, property, values, nval);
 	if (ret == 0)
 		hw_cfg->bst_cap = values[cs35l41->index];
 	else
 		hw_cfg->bst_cap = -1;
 
-	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, cs35l41->index, nval, -1);
+	cs35l41->speaker_id = cs35l41_get_speaker_id(cs35l41->dev, cs35l41->index, nval, -1);
 
 	if (hw_cfg->bst_ind > 0 || hw_cfg->bst_cap > 0 || hw_cfg->bst_ipk > 0)
 		hw_cfg->bst_type = CS35L41_INT_BOOST;
@@ -1364,14 +1359,11 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 		hw_cfg->bst_type = CS35L41_EXT_BOOST;
 
 	hw_cfg->valid = true;
-	put_device(physdev);
 
 	return 0;
 
 err:
 	dev_err(cs35l41->dev, "Failed property %s: %d\n", property, ret);
-err_put_physdev:
-	put_device(physdev);
 
 	return ret;
 }
-- 
2.34.1

