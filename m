Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E517799CE7
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Sep 2023 09:29:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D36D846;
	Sun, 10 Sep 2023 09:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D36D846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694330991;
	bh=vpUIEXnw7djMmoM/CzCcdXdeHJ2kD9Y1S8JbDCJO9Jc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OLlFScikWqD0bxzOyKBkh1QLvsZtN+eiVdiejRWH06BCIDr8ixPZnR90iWkoooceD
	 VKJfuwmuZ2Hm1ciAU+2xCd6N/ma9thaw3f4i5YsfZqfzHBKXcigc4MxFvyoqU5nFQD
	 kueIAjlAFsAUZu8dGQHGZ14fw8x+5OaLnGkOmmc0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCCDFF80246; Sun, 10 Sep 2023 09:28:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16CD3F80246;
	Sun, 10 Sep 2023 09:28:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72188F80425; Sun, 10 Sep 2023 09:27:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FFBBF801F5
	for <alsa-devel@alsa-project.org>; Sun, 10 Sep 2023 09:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FFBBF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=yZKEupIk
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38A7RGoY124287;
	Sun, 10 Sep 2023 02:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694330836;
	bh=cuEQ4MnBvMHeuWnFcZZThMScU6eHr7VCSZ2kRdLbUCU=;
	h=From:To:CC:Subject:Date;
	b=yZKEupIkqUpo76Tx14Ikdm2O/0wWfoUJ2JM8BTa+hyqq924pSO7jlJOtlaDRaeDT9
	 t9PyIicAcRM73JpbW0R+3/O5P9hLj2AkkdIsznu9SbFveXK87u5GBoeuZa5o6ciOpl
	 ARPuULmEjE1KbETPucxPngBucYntbY42c6HF7AHw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38A7RGJa068077
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 10 Sep 2023 02:27:16 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 10
 Sep 2023 02:27:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 10 Sep 2023 02:27:16 -0500
Received: from LT5CG31242FY.dhcp.ti.com (ileaxei01-snat.itg.ti.com
 [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38A7R9Rt002459;
	Sun, 10 Sep 2023 02:27:10 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <robh+dt@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <lgirdwood@gmail.com>, <perex@perex.cz>,
        <pierre-louis.bossart@linux.intel.com>, <kevin-lu@ti.com>,
        <13916275206@139.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <mengdong.lin@intel.com>, <baojun.xu@ti.com>,
        <thomas.gfeller@q-drop.com>, <peeyush@ti.com>, <navada@ti.com>,
        <broonie@kernel.org>, <gentuser@gmail.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Support ACPI_ID both TXNW2781 and
 TIAS2781
Date: Sun, 10 Sep 2023 15:27:03 +0800
Message-ID: <20230910072704.1359-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: KPA7YEHKCHGM6ZYT5PWTUMEB4AZY6YSG
X-Message-ID-Hash: KPA7YEHKCHGM6ZYT5PWTUMEB4AZY6YSG
X-MailFrom: shenghao-ding@ti.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KPA7YEHKCHGM6ZYT5PWTUMEB4AZY6YSG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Support ACPI_ID both TXNW2781 and TIAS2781, TXNW2781 is the only one legal
ACPI ID, TIAS2781 is the widely-used ACPI ID named by our customers, so
far it is not registered. We have discussed this with them, they requested
TIAS2781 must be supported for the laptops already released to market,
their new laptops will switch to TXNW2781.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
Changes in v1:
 - Add TXNW2781 into tas2781_acpi_hda_match and move it to the top
 - Redefine tas2781_generic_fixup, remove hid param
 - TIAS2781 has been used by our customers, see following dstd.dsl. We
    have discussed this with them, they requested TIAS2781 must be
    supported for the laptops already released to market, their new
    laptops will switch to TXNW2781
   Name (_HID, "TIAS2781")  // _HID: Hardware ID
   Name (_UID, Zero)  // _UID: Unique ID
   Method (_SUB, 0, NotSerialized)  // _SUB: Subsystem ID
   {
       If ((SPID == Zero))
       {
          Return ("17AA3886")
       }

       If ((SPID == One))
       {
           Return ("17AA3884")
       }
   }
 - Add TXNW2781 support in comp_match_tas2781_dev_name
---
 sound/pci/hda/patch_realtek.c   | 36 ++++++++++++++++++---------------
 sound/pci/hda/tas2781_hda_i2c.c | 33 ++++++++++++++++++------------
 2 files changed, 40 insertions(+), 29 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index b7e78bfcff..6dae58a8ef 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6770,24 +6770,35 @@ static int comp_match_cs35l41_dev_name(struct device *dev, void *data)
 	return !strcmp(d + n, tmp);
 }
 
+/* TIAS2781 is the unofficial ACPI id, but widely used in current devices.
+ * TXNW2781 is the official ACPI id, and will be used in the new devices.
+ * Check TIAS2781 or TXNW2781
+ */
 static int comp_match_tas2781_dev_name(struct device *dev,
 	void *data)
 {
-	struct scodec_dev_name *p = data;
+	const char c[][10] = { "TXNW2781", "TIAS2781" };
 	const char *d = dev_name(dev);
-	int n = strlen(p->bus);
+	const char *bus = data;
+	int n = strlen(bus), i;
 	char tmp[32];
 
 	/* check the bus name */
-	if (strncmp(d, p->bus, n))
+	if (strncmp(d, bus, n))
 		return 0;
 	/* skip the bus number */
 	if (isdigit(d[n]))
 		n++;
-	/* the rest must be exact matching */
-	snprintf(tmp, sizeof(tmp), "-%s:00", p->hid);
 
-	return !strcmp(d + n, tmp);
+	for (i = 0; i < ARRAY_SIZE(c); i++) {
+		/* the rest must be exact matching */
+		snprintf(tmp, sizeof(tmp), "-%s:00", c[i]);
+
+		if (!strcmp(d + n, tmp))
+			return 1;
+	}
+
+	return 0;
 }
 
 static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char *bus,
@@ -6824,24 +6835,17 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 }
 
 static void tas2781_generic_fixup(struct hda_codec *cdc, int action,
-	const char *bus, const char *hid)
+	const char *bus)
 {
 	struct device *dev = hda_codec_dev(cdc);
 	struct alc_spec *spec = cdc->spec;
-	struct scodec_dev_name *rec;
 	int ret;
 
 	switch (action) {
 	case HDA_FIXUP_ACT_PRE_PROBE:
-		rec = devm_kmalloc(dev, sizeof(*rec), GFP_KERNEL);
-		if (!rec)
-			return;
-		rec->bus = bus;
-		rec->hid = hid;
-		rec->index = 0;
 		spec->comps[0].codec = cdc;
 		component_match_add(dev, &spec->match,
-			comp_match_tas2781_dev_name, rec);
+			comp_match_tas2781_dev_name, (void *)bus);
 		ret = component_master_add_with_match(dev, &comp_master_ops,
 			spec->match);
 		if (ret)
@@ -6888,7 +6892,7 @@ static void alc287_fixup_legion_16ithg6_speakers(struct hda_codec *cdc, const st
 static void tas2781_fixup_i2c(struct hda_codec *cdc,
 	const struct hda_fixup *fix, int action)
 {
-	 tas2781_generic_fixup(cdc, action, "i2c", "TIAS2781");
+	 tas2781_generic_fixup(cdc, action, "i2c");
 }
 
 /* for alc295_fixup_hp_top_speakers */
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index fb80280293..8493952305 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -65,6 +65,16 @@ enum calib_data {
 	CALIB_MAX
 };
 
+/* TIAS2781 is the unofficial ACPI id, but widely used in current devices.
+ * TXNW2781 is the official ACPI id, and will be used in the new devices.
+ */
+static const struct acpi_device_id tas2781_acpi_hda_match[] = {
+	{"TIAS2781", 0 },
+	{"TXNW2781", 1 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, tas2781_acpi_hda_match);
+
 static int tas2781_get_i2c_res(struct acpi_resource *ares, void *data)
 {
 	struct tasdevice_priv *tas_priv = data;
@@ -644,20 +654,23 @@ static void tas2781_hda_remove(struct device *dev)
 static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 {
 	struct tasdevice_priv *tas_priv;
-	const char *device_name;
-	int ret;
+	int ret, i;
 
-	if (strstr(dev_name(&clt->dev), "TIAS2781"))
-		device_name = "TIAS2781";
-	else
-		return -ENODEV;
+	/* Check TIAS2781 or TXNW2781 */
+	for (i = 0; i < ARRAY_SIZE(tas2781_acpi_hda_match); i++)
+		if (strstr(dev_name(&clt->dev), tas2781_acpi_hda_match[i].id))
+			break;
+
+	if (i == ARRAY_SIZE(tas2781_acpi_hda_match))
+		return dev_err_probe(tas_priv->dev, -ENODEV,
+			"Device not available\n");
 
 	tas_priv = tasdevice_kzalloc(clt);
 	if (!tas_priv)
 		return -ENOMEM;
 
 	tas_priv->irq_info.irq = clt->irq;
-	ret = tas2781_read_acpi(tas_priv, device_name);
+	ret = tas2781_read_acpi(tas_priv, tas2781_acpi_hda_match[i].id);
 	if (ret)
 		return dev_err_probe(tas_priv->dev, ret,
 			"Platform not supported\n");
@@ -822,12 +835,6 @@ static const struct i2c_device_id tas2781_hda_i2c_id[] = {
 	{}
 };
 
-static const struct acpi_device_id tas2781_acpi_hda_match[] = {
-	{"TIAS2781", 0 },
-	{}
-};
-MODULE_DEVICE_TABLE(acpi, tas2781_acpi_hda_match);
-
 static struct i2c_driver tas2781_hda_i2c_driver = {
 	.driver = {
 		.name		= "tas2781-hda",
-- 
2.34.1

