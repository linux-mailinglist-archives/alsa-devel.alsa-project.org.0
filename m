Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DAB1664F6
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 18:34:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB36616DC;
	Thu, 20 Feb 2020 18:33:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB36616DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582220058;
	bh=L5kXWJVFZ6ARvut3hfuDo12GVIY+iEUMjAiEDnTCvVw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VezZdAOn0kAujy28G632i67GKaXULwY3PuaeMssRU4rMsG+wcYutVXPytAF+gv2Ox
	 f6bRtJ/hJjzF9qvpTIiSj2bwzLZQbQnT4fkYdGDBbrjIdKIu+K/3TLSeYC8ihtLl0I
	 W076/+uGVybwnAB0U0VDLTwng+dE6w7WcYw9CzmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ABADF8011D;
	Thu, 20 Feb 2020 18:32:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0A5BF80148; Thu, 20 Feb 2020 18:32:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24EFAF8011D
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 18:32:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24EFAF8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ADHGYQIW"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KHWRwi105068;
 Thu, 20 Feb 2020 11:32:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582219947;
 bh=dhjn6HrZucqbcl4Lq63Yj/gDo7CIBIJ4uupV9okY3Aw=;
 h=From:To:CC:Subject:Date;
 b=ADHGYQIW5tDws34/d26bILAyY8TENJTStO6nl87Q/sKvRlGXr5zT5pHgnLgCjD7lf
 u6BLl0re7bEG7B5PUKjg2hgbmn+JEzCNipCsDoROskL4QEDd+8WdX0ELub7lKwNpnX
 e2JdufnkWnoKOOOibyzezLnDSNxCm9AiIANoKbns=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KHWR1k100583;
 Thu, 20 Feb 2020 11:32:27 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 20
 Feb 2020 11:32:26 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 20 Feb 2020 11:32:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KHWQtF119856;
 Thu, 20 Feb 2020 11:32:26 -0600
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH] ASoC: tas2562: Add support for digital volume control
Date: Thu, 20 Feb 2020 11:27:21 -0600
Message-ID: <20200220172721.10547-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
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

Add support for digital volume control.  There is no dedicated register
for volume control but instead there are 4.  The values of the registers
are determined with exponential floating point math.
So a table was created with register values for 2dB step increments
from -110dB to 0dB.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/tas2562.c | 94 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/tas2562.h |  6 ++-
 2 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index b2682c2360b6..e577aa6f304a 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -26,6 +26,24 @@
 #define TAS2562_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |\
 			 SNDRV_PCM_FORMAT_S32_LE)
 
+/* DVC equation involves floating point math
+ * round(10^(volume in dB/20)*2^30)
+ * so create a lookup table for 2dB step
+ */
+static const unsigned int float_vol_db_lookup[] = {
+0x00000d43, 0x000010b2, 0x00001505, 0x00001a67, 0x00002151,
+0x000029f1, 0x000034cd, 0x00004279, 0x000053af, 0x0000695b,
+0x0000695b, 0x0000a6fa, 0x0000d236, 0x000108a4, 0x00014d2a,
+0x0001a36e, 0x00021008, 0x000298c0, 0x000344df, 0x00041d8f,
+0x00052e5a, 0x000685c8, 0x00083621, 0x000a566d, 0x000d03a7,
+0x0010624d, 0x0014a050, 0x0019f786, 0x0020b0bc, 0x0029279d,
+0x0033cf8d, 0x004139d3, 0x00521d50, 0x00676044, 0x0082248a,
+0x00a3d70a, 0x00ce4328, 0x0103ab3d, 0x0146e75d, 0x019b8c27,
+0x02061b89, 0x028c423f, 0x03352529, 0x0409c2b0, 0x05156d68,
+0x080e9f96, 0x0a24b062, 0x0cc509ab, 0x10137987, 0x143d1362,
+0x197a967f, 0x2013739e, 0x28619ae9, 0x32d64617, 0x40000000
+};
+
 struct tas2562_data {
 	struct snd_soc_component *component;
 	struct gpio_desc *sdz_gpio;
@@ -34,6 +52,7 @@ struct tas2562_data {
 	struct i2c_client *client;
 	int v_sense_slot;
 	int i_sense_slot;
+	int volume_lvl;
 };
 
 static int tas2562_set_bias_level(struct snd_soc_component *component,
@@ -334,6 +353,22 @@ static int tas2562_codec_probe(struct snd_soc_component *component)
 	if (ret < 0)
 		return ret;
 
+	/* Set the Digital volume to -110dB */
+	ret = snd_soc_component_write(component, TAS2562_DVC_CFG4, 0x00);
+	if (ret)
+		return ret;
+	ret = snd_soc_component_write(component, TAS2562_DVC_CFG3, 0x00);
+	if (ret)
+		return ret;
+	ret = snd_soc_component_write(component, TAS2562_DVC_CFG2, 0x0d);
+	if (ret)
+		return ret;
+	ret = snd_soc_component_write(component, TAS2562_DVC_CFG1, 0x43);
+	if (ret)
+		return ret;
+
+	tas2562->volume_lvl = 0;
+
 	return 0;
 }
 
@@ -414,6 +449,50 @@ static int tas2562_dac_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int tas2562_volume_control_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = tas2562->volume_lvl;
+	return 0;
+}
+
+static int tas2562_volume_control_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
+	int ret;
+	u32 reg_val;
+
+	reg_val = float_vol_db_lookup[ucontrol->value.integer.value[0]/2];
+	ret = snd_soc_component_write(component, TAS2562_DVC_CFG4,
+				      (reg_val & 0xff));
+	if (ret)
+		return ret;
+	ret = snd_soc_component_write(component, TAS2562_DVC_CFG3,
+				      ((reg_val >> 8) & 0xff));
+	if (ret)
+		return ret;
+	ret = snd_soc_component_write(component, TAS2562_DVC_CFG2,
+				      ((reg_val >> 16) & 0xff));
+	if (ret)
+		return ret;
+	ret = snd_soc_component_write(component, TAS2562_DVC_CFG1,
+				      ((reg_val >> 24) & 0xff));
+	if (ret)
+		return ret;
+
+	tas2562->volume_lvl = ucontrol->value.integer.value[0];
+
+	return ret;
+}
+
+/* Digital Volume Control. From 0 dB to -110 dB in 1 dB steps */
+static const DECLARE_TLV_DB_SCALE(dvc_tlv, -11000, 100, 0);
+
 static DECLARE_TLV_DB_SCALE(tas2562_dac_tlv, 850, 50, 0);
 
 static const struct snd_kcontrol_new isense_switch =
@@ -427,6 +506,17 @@ static const struct snd_kcontrol_new vsense_switch =
 static const struct snd_kcontrol_new tas2562_snd_controls[] = {
 	SOC_SINGLE_TLV("Amp Gain Volume", TAS2562_PB_CFG1, 0, 0x1c, 0,
 		       tas2562_dac_tlv),
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = "Digital Volume Control",
+		.index = 0,
+		.tlv.p = dvc_tlv,
+		.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.info = snd_soc_info_volsw,
+		.get = tas2562_volume_control_get,
+		.put = tas2562_volume_control_put,
+		.private_value = SOC_SINGLE_VALUE(TAS2562_DVC_CFG1, 0, 110, 0, 0) ,
+	},
 };
 
 static const struct snd_soc_dapm_widget tas2562_dapm_widgets[] = {
@@ -517,6 +607,10 @@ static const struct reg_default tas2562_reg_defaults[] = {
 	{ TAS2562_PB_CFG1, 0x20 },
 	{ TAS2562_TDM_CFG0, 0x09 },
 	{ TAS2562_TDM_CFG1, 0x02 },
+	{ TAS2562_DVC_CFG1, 0x40 },
+	{ TAS2562_DVC_CFG2, 0x40 },
+	{ TAS2562_DVC_CFG3, 0x00 },
+	{ TAS2562_DVC_CFG4, 0x00 },
 };
 
 static const struct regmap_config tas2562_regmap_config = {
diff --git a/sound/soc/codecs/tas2562.h b/sound/soc/codecs/tas2562.h
index 6f55ebcf19ea..28e75fc431d0 100644
--- a/sound/soc/codecs/tas2562.h
+++ b/sound/soc/codecs/tas2562.h
@@ -35,8 +35,10 @@
 #define TAS2562_REV_ID		TAS2562_REG(0, 0x7d)
 
 /* Page 2 */
-#define TAS2562_DVC_CFG1	TAS2562_REG(2, 0x01)
-#define TAS2562_DVC_CFG2	TAS2562_REG(2, 0x02)
+#define TAS2562_DVC_CFG1	TAS2562_REG(2, 0x0c)
+#define TAS2562_DVC_CFG2	TAS2562_REG(2, 0x0d)
+#define TAS2562_DVC_CFG3	TAS2562_REG(2, 0x0e)
+#define TAS2562_DVC_CFG4	TAS2562_REG(2, 0x0f)
 
 #define TAS2562_RESET	BIT(0)
 
-- 
2.25.0

