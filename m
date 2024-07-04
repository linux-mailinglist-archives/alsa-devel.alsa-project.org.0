Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A301092735F
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 11:51:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8793814F2;
	Thu,  4 Jul 2024 11:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8793814F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720086664;
	bh=QxQNqLTC12MaEVjwd0QIaSY9EeFZoQqrCki2kjSPV/s=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EqeEUmSgk3JU8foryzOJI5UVd7HExhHTCANT0IOPOhNxdNW1shO4DqoAaEDnlz2Ez
	 vJpmJpW2xKd9rKBwXcUSUmJYbNo3GvzS2NhtoCk4XUP+MLTIUmcLS5Yv4U2gFP1Uga
	 LIBhR72PCBaTChXuyN3/FvfxXIB7EVkpc4wf/7Jo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BDB1F80508; Thu,  4 Jul 2024 11:50:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEC8EF80508;
	Thu,  4 Jul 2024 11:50:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B914F8025E; Thu,  4 Jul 2024 11:50:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9473F800F8
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 11:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9473F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=NaWgb15k
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4649nswH060439;
	Thu, 4 Jul 2024 04:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720086594;
	bh=gNiuFM2KRf2/p1H+gvNt7VvnOF689BgzEw+5U/k5iHE=;
	h=From:To:CC:Subject:Date;
	b=NaWgb15kMPRjzuo9LnkzOHBazmDBJ9hvKeCL9/snefz9/JxuoL9uk/RytiCX3Ejrl
	 gaRUeKG60Q2fqkx+tXXci6Yb0qbsgYKG6QJnH3t1lOzb+h+f8UQy7qyiAV1+U7/ec1
	 hKToS+vmi48qRz86Lr4vnShiZSRorqTXNwpDy4K4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4649nsiE049308
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Jul 2024 04:49:54 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 4
 Jul 2024 04:49:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 4 Jul 2024 04:49:54 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.14.205])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4649nhgm052134;
	Thu, 4 Jul 2024 04:49:44 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <zhourui@huaqin.com>,
        <alsa-devel@alsa-project.org>, <i-salazar@ti.com>,
        <linux-kernel@vger.kernel.org>, <j-chadha@ti.com>,
        <liam.r.girdwood@intel.com>, <jaden-yue@ti.com>,
        <yung-chuan.liao@linux.intel.com>, <dipa@ti.com>,
 <yuhsuan@google.com>,
        <henry.lo@ti.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
 <soyer@irl.hu>,
        <Baojun.Xu@fpt.com>, <judyhsiao@google.com>, <navada@ti.com>,
        <cujomalainey@google.com>, <aanya@ti.com>, <nayeem.mahmud@ti.com>,
        <savyasanchi.shukla@netradyne.com>, <flaviopr@microsoft.com>,
        <jesse-ji@ti.com>, <darren.ye@mediatek.com>,
        Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v1] ASoc: tas2781: Set "Speaker Force Firmware Load" as the
 common kcontrol for both tas27871 and tas2563
Date: Thu, 4 Jul 2024 17:49:37 +0800
Message-ID: <20240704094939.1824-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: Y4WSMSIB4ZLRTPH7B5ZPZJOOCTQ26ONN
X-Message-ID-Hash: Y4WSMSIB4ZLRTPH7B5ZPZJOOCTQ26ONN
X-MailFrom: shenghao-ding@ti.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4WSMSIB4ZLRTPH7B5ZPZJOOCTQ26ONN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set "Speaker Force Firmware Load" as the common kcontrol
for both tas27871 and tas2563 and move it into newly-created
tasdevice_snd_controls, and keep the digital gain and analog
gain in tas2781_snd_controls.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Rename driver_name from tas2781-codec to tasdev-codec, request from
   some tas2563 users since the driver supports both tas2563 and tas2781,
   the drvier name seemed unfair to tas2563.
 - Set "Speaker Force Firmware Load" as the common kcontrol for both
   tas27871 and tas2563 and move it into newly-created
   tasdevice_snd_controls.
---
 sound/soc/codecs/tas2781-i2c.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index e0e630f66101..b412f8f2e5d5 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -104,7 +104,7 @@ static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
 	return tasdevice_amp_putvol(tas_priv, ucontrol, mc);
 }
 
-static int tas2781_force_fwload_get(struct snd_kcontrol *kcontrol,
+static int tasdev_force_fwload_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
@@ -119,7 +119,7 @@ static int tas2781_force_fwload_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
+static int tasdev_force_fwload_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
@@ -140,6 +140,11 @@ static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
+static const struct snd_kcontrol_new tasdevice_snd_controls[] = {
+	SOC_SINGLE_BOOL_EXT("Speaker Force Firmware Load", 0,
+		tasdev_force_fwload_get, tasdev_force_fwload_put),
+};
+
 static const struct snd_kcontrol_new tas2781_snd_controls[] = {
 	SOC_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain", TAS2781_AMP_LEVEL,
 		1, 0, 20, 0, tas2781_amp_getvol,
@@ -147,8 +152,6 @@ static const struct snd_kcontrol_new tas2781_snd_controls[] = {
 	SOC_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain", TAS2781_DVC_LVL,
 		0, 0, 200, 1, tas2781_digital_getvol,
 		tas2781_digital_putvol, dvc_tlv),
-	SOC_SINGLE_BOOL_EXT("Speaker Force Firmware Load", 0,
-		tas2781_force_fwload_get, tas2781_force_fwload_put),
 };
 
 static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
@@ -590,6 +593,18 @@ static struct snd_soc_dai_driver tasdevice_dai_driver[] = {
 static int tasdevice_codec_probe(struct snd_soc_component *codec)
 {
 	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+	int rc;
+
+	if (tas_priv->chip_id == TAS2781) {
+		rc = snd_soc_add_component_controls(codec,
+			tas2781_snd_controls,
+			ARRAY_SIZE(tas2781_snd_controls));
+		if (rc < 0) {
+			dev_err(tas_priv->dev, "%s: Add control err rc = %d",
+				__func__, rc);
+			return rc;
+		}
+	}
 
 	tas_priv->name_prefix = codec->name_prefix;
 	return tascodec_init(tas_priv, codec, THIS_MODULE, tasdevice_fw_ready);
@@ -617,8 +632,8 @@ static const struct snd_soc_component_driver
 	soc_codec_driver_tasdevice = {
 	.probe			= tasdevice_codec_probe,
 	.remove			= tasdevice_codec_remove,
-	.controls		= tas2781_snd_controls,
-	.num_controls		= ARRAY_SIZE(tas2781_snd_controls),
+	.controls		= tasdevice_snd_controls,
+	.num_controls		= ARRAY_SIZE(tasdevice_snd_controls),
 	.dapm_widgets		= tasdevice_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(tasdevice_dapm_widgets),
 	.dapm_routes		= tasdevice_audio_map,
@@ -759,7 +774,7 @@ MODULE_DEVICE_TABLE(acpi, tasdevice_acpi_match);
 
 static struct i2c_driver tasdevice_i2c_driver = {
 	.driver = {
-		.name = "tas2781-codec",
+		.name = "tasdev-codec",
 		.of_match_table = of_match_ptr(tasdevice_of_match),
 #ifdef CONFIG_ACPI
 		.acpi_match_table = ACPI_PTR(tasdevice_acpi_match),
-- 
2.34.1

