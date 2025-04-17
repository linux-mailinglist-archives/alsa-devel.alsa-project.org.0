Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBE5A919AA
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Apr 2025 12:48:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D1F57041C;
	Thu, 17 Apr 2025 12:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D1F57041C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744886924;
	bh=vLzLoWGb5ItlhBxPwS30+3Maev9Mx2guHi612ITtqHg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Jo5c9AUiwyy+i6bAwBY5I7VeGyv/776RS5dc3o5yJYXKQMEAbcMAaFrLz7rSeTMBH
	 lt7mCVCkevI9reGLrgRq6vdYcVxetx3TBvDfqtVJWoJAybd69eRY01Gyhj1whBl94Y
	 0K9RjO7iHxyXywjqA/X9NYRajfghH+W5wFPkN6DQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DF9CF805CA; Thu, 17 Apr 2025 12:48:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 762BAF805C7;
	Thu, 17 Apr 2025 12:48:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C130F8052D; Thu, 17 Apr 2025 12:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F0F7F80073
	for <alsa-devel@alsa-project.org>; Thu, 17 Apr 2025 12:48:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F0F7F80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=P01gOvxx
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HAm49F3059273
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 05:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744886885;
	bh=mMqPPZs8kODyupYU7rqjdj+jv6Q/aOV5lBmqVigBuNo=;
	h=From:To:CC:Subject:Date;
	b=P01gOvxxxY9e8Y3LI7hHXMNQdcdxeHNEXbeg14kFcvB67CHXPFEeE10L9ix1qJHww
	 WV+CWo9Kq1xUNnZ7n2OEOX6O6/Vo1kU9igmLUooXZzMvAM5TyEZ36rVfsz5h7hZWYe
	 7gH9QpNCsM2nSz3VnVXBvRvOadL5nxJqkpovbl9A=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HAm4fK127991
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 05:48:04 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 05:48:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 05:48:04 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.131])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HAm1f3048916;
	Thu, 17 Apr 2025 05:48:01 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <13916275206@139.com>, <13564923607@139.com>,
        <alsa-devel@alsa-project.org>, <baojun.xu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Add "Acoustic Tuning" kcontrol for acoustic
 application
Date: Thu, 17 Apr 2025 18:47:53 +0800
Message-ID: <20250417104753.1471-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: FQXSMPYQA2D6GO2N52SOCAU6F6D2S243
X-Message-ID-Hash: FQXSMPYQA2D6GO2N52SOCAU6F6D2S243
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQXSMPYQA2D6GO2N52SOCAU6F6D2S243/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

"Acoustic Tuning" kcontrol is a bridge to the acoustic tuning application
tool which can tune the chips' acoustic effect.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 include/sound/tas2781.h        |  13 ++++
 sound/soc/codecs/tas2781-i2c.c | 138 ++++++++++++++++++++++++++++++++-
 2 files changed, 149 insertions(+), 2 deletions(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index eff011444cc8..a9c236ab8cba 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -32,6 +32,8 @@
 	SNDRV_PCM_FMTBIT_S24_LE | \
 	SNDRV_PCM_FMTBIT_S32_LE)
 
+#define TASDEV_DATA_PAYLOAD_SIZE	128
+
 /* PAGE Control Register (available in page0 of each book) */
 #define TASDEVICE_PAGE_SELECT		0x00
 #define TASDEVICE_BOOKCTL_PAGE		0x00
@@ -159,10 +161,21 @@ struct calidata {
 	unsigned int cali_dat_sz_per_dev;
 };
 
+struct acoustic_data {
+	unsigned char len;
+	unsigned char id;
+	unsigned char addr;
+	unsigned char book;
+	unsigned char page;
+	unsigned char reg;
+	unsigned char data[TASDEV_DATA_PAYLOAD_SIZE];
+};
+
 struct tasdevice_priv {
 	struct tasdevice tasdevice[TASDEVICE_MAX_CHANNELS];
 	struct tasdevice_rca rcabin;
 	struct calidata cali_data;
+	struct acoustic_data acou_data;
 	struct tasdevice_fw *fmw;
 	struct gpio_desc *speaker_id;
 	struct gpio_desc *reset;
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index b950914b7d48..0d52cfc12743 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -328,6 +328,24 @@ static int tasdev_cali_data_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int tasdev_acoustic_data_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *dst = ucontrol->value.bytes.data;
+	struct acoustic_data *p = &priv->acou_data;
+
+	if (p->id == 'r' && p->len <= bytes_ext->max)
+		memcpy(dst, p, p->len);
+	else
+		dev_err(priv->dev, "Not ready for get.\n");
+
+	return 0;
+}
+
 static int calib_data_get(struct tasdevice_priv *tas_priv, int reg,
 	unsigned char *dst)
 {
@@ -700,6 +718,84 @@ static int tasdev_tf_data_get(struct snd_kcontrol *kcontrol,
 	return calib_data_get(tas_priv, reg, &dst[1]);
 }
 
+static int tasdev_acoustic_data_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned char *src = ucontrol->value.bytes.data;
+	int j, len, ret, value, reg;
+	unsigned short chn;
+
+	if (src[0] > bytes_ext->max) {
+		dev_err(priv->dev, "pkg len(%u) is larger than max(%d).\n",
+			src[0], bytes_ext->max);
+		return 0;
+	}
+
+	switch (src[1]) {
+	case 'r':
+		/* length of data to read */
+		len = src[6];
+		break;
+	case 'w':
+		/* Skip 6 bytes for package type and register address */
+		len = src[0] - 6;
+		break;
+	default:
+		dev_err(priv->dev, "%s Wrong code %02x.\n", __func__, src[1]);
+		return 0;
+	}
+
+	if (len < 1) {
+		dev_err(priv->dev, "pkg fmt invalid %02x.\n", len);
+		return 0;
+	}
+
+	for (j = 0; j < priv->ndev; j++)
+		if (src[2] == priv->tasdevice[j].dev_addr) {
+			chn = j;
+			break;
+		}
+	if (j >= priv->ndev) {
+		dev_err(priv->dev, "no such device 0x%02x.\n", src[2]);
+		return 0;
+	}
+
+	reg = TASDEVICE_REG(src[3], src[4], src[5]);
+
+	guard(mutex)(&priv->codec_lock);
+
+	if (src[1] == 'w') {
+		if (len > 1)
+			ret = tasdevice_dev_bulk_write(priv, chn, reg,
+				 &src[6], len);
+		else
+			ret = tasdevice_dev_write(priv, chn, reg, src[6]);
+	} else {
+		struct acoustic_data *p = &priv->acou_data;
+
+		memcpy(p, src, 6);
+		if (len > 1) {
+			ret = tasdevice_dev_bulk_read(priv, chn, reg,
+				p->data, len);
+		} else {
+			ret = tasdevice_dev_read(priv, chn, reg, &value);
+			p->data[0] = value;
+		}
+		p->len = len + 6;
+	}
+
+	if (ret) {
+		dev_err(priv->dev, "i2c communication error.\n");
+		return 0;
+	}
+
+	return 1;
+}
+
 static int tasdev_re_data_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
@@ -1043,10 +1139,11 @@ static int tasdevice_get_chip_id(struct snd_kcontrol *kcontrol,
 static int tasdevice_create_control(struct tasdevice_priv *tas_priv)
 {
 	struct snd_kcontrol_new *prof_ctrls;
-	int nr_controls = 1;
+	struct soc_bytes_ext *ext_acoustic;
+	char *acoustic_name, *name;
+	int nr_controls = 2;
 	int mix_index = 0;
 	int ret;
-	char *name;
 
 	prof_ctrls = devm_kcalloc(tas_priv->dev, nr_controls,
 		sizeof(prof_ctrls[0]), GFP_KERNEL);
@@ -1068,6 +1165,43 @@ static int tasdevice_create_control(struct tasdevice_priv *tas_priv)
 	prof_ctrls[mix_index].put = tasdevice_set_profile_id;
 	mix_index++;
 
+	ext_acoustic = devm_kzalloc(tas_priv->dev, sizeof(*ext_acoustic),
+				 GFP_KERNEL);
+	if (!ext_acoustic)
+		return -ENOMEM;
+
+	/*
+	 * This kcontrol is a bridge to the acoustic tuning application
+	 * tool which can tune the chips' acoustic effect.
+	 */
+	acoustic_name = devm_kstrdup(tas_priv->dev, "Acoustic Tuning",
+		GFP_KERNEL);
+	if (!acoustic_name)
+		return -ENOMEM;
+	/*
+	 * package structure for PPC3 communications:
+	 *	Pkg len (1 byte)
+	 *	Pkg id (1 byte, 'r' or 'w')
+	 *	Dev id (1 byte, i2c address)
+	 *	Book id (1 byte)
+	 *	Page id (1 byte)
+	 *	Reg id (1 byte)
+	 *	switch (pkg id) {
+	 *	case 'w':
+	 *		1 byte, length of data to read
+	 *	case 'r':
+	 *		data payload (1~128 bytes)
+	 *	}
+	 */
+	ext_acoustic->max = sizeof(tas_priv->acou_data);
+	prof_ctrls[mix_index].name = acoustic_name;
+	prof_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	prof_ctrls[mix_index].info = snd_soc_bytes_info_ext;
+	prof_ctrls[mix_index].put = tasdev_acoustic_data_put;
+	prof_ctrls[mix_index].get = tasdev_acoustic_data_get;
+	prof_ctrls[mix_index].private_value = (unsigned long)ext_acoustic;
+	mix_index++;
+
 	ret = snd_soc_add_component_controls(tas_priv->codec,
 		prof_ctrls, nr_controls < mix_index ? nr_controls : mix_index);
 
-- 
2.34.1

