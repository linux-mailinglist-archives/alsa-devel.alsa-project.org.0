Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F30D63E983B
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 21:03:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FDB11872;
	Wed, 11 Aug 2021 21:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FDB11872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628708596;
	bh=wcb17KNVYIM/NAAk2xFtTWxQMdmPa0NLkSjAJst2Idk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F7iRJicXrpy5TOfY6ZwY33UQ5YXiLEclwMzMXs6+TtsScZg5ovqVp+f4JcDzPItap
	 TN0wIeS5PWZLGHfx6/U9pLuSu7Zym8YHSvJjgJkjAN1qPifDpJmOJi0raCVL1w3KmZ
	 /jAt9qq9bcRddeosT7Gv2dfRZMbReOr32mIqifT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F307F8053D;
	Wed, 11 Aug 2021 20:58:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 177B5F80527; Wed, 11 Aug 2021 20:57:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 669F9F804DA
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 20:57:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 669F9F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="DSN9yseq"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17BIq9wo001296; 
 Wed, 11 Aug 2021 13:57:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=C3LanROgP7DV8xXuCBSy1VyvB0V2vV33uZgKAVTlD1g=;
 b=DSN9yseqfYyNg2XP/LtLIad12UYIavRoHmlB/cFB+iyj6IlMem2fP8aMk/N9Idd+0wGf
 ZovJMT4TpbhiKbK0kkZ8aYFpOZQKHeJj5PO69d4rNWLY20zcXzfiWLDzqgtTchz2McIW
 zTwJlunKTduWYI9MUM5bXrRjP1FKgfs7Zqwlpo0fbz5f7ualVpedu2RjXmkt/onmeevO
 immoYx21CZVN/Lm4XkYUby2/iotjUoAb5scG5y0mR2Qv2cZrqRfPrVDyCoZyz8mhqOa9
 7AsUBhmvCJV18QmzY/CtdIMlscxIVmTN58iE6YUScrvl8v1qS7Hn3rFQaCjVS4OJXdMc yw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3acgjkra4r-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Aug 2021 13:57:33 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 11 Aug
 2021 19:57:29 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Wed, 11 Aug 2021 19:57:29 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.180])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 17AC445D;
 Wed, 11 Aug 2021 18:57:29 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 13/27] ALSA: hda/cs8409: Dont disable I2C clock between
 consecutive accesses
Date: Wed, 11 Aug 2021 19:56:40 +0100
Message-ID: <20210811185654.6837-14-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
References: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Jei69dVovdmdcIcLWKky4aliSBlHKJRM
X-Proofpoint-ORIG-GUID: Jei69dVovdmdcIcLWKky4aliSBlHKJRM
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 impostorscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110130
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>
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

From: Lucas Tanure <tanureal@opensource.cirrus.com>

Only disable I2C clock 25 ms after not being used.

The current implementation enables and disables the I2C clock for each
I2C transaction. Each enable/disable call requires two verb transactions.
This means each I2C transaction requires a total of four verb transactions
to enable and disable the clock.
However, if there are multiple consecutive I2C transactions, it is not
necessary to enable and disable the clock each time, instead it is more
efficient to enable the clock for the first transaction, and disable it
after the final transaction, which would improve performance.
This is achieved by using a timeout which disables the clock if no request
to enable the clock has occurred for 25 ms.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---

Changes in v2:
- Improved delayed work start/cancel implementation, and re-worked commit message
 adding more explanation why this was required. 

Changes in v3:
- Cancel the disable timer, but do not wait for any running disable functions to finish.
 If the disable timer runs out before cancel, the delayed work thread will be blocked,
 waiting for the mutex to become unlocked. This mutex will be locked for the duration of
 any i2c transaction, so the disable function will run to completion immediately
 afterwards in the scenario. The next enable call will re-enable the clock, regardless.

Changes in v4:
- Cancel delayed work and disable i2c clocks in suspend/free.

 sound/pci/hda/patch_cs8409.c | 88 ++++++++++++++++++++++++++++--------
 sound/pci/hda/patch_cs8409.h |  4 ++
 2 files changed, 74 insertions(+), 18 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 08205c19698c..420f3a612fc4 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -45,6 +45,8 @@ static int cs8409_parse_auto_config(struct hda_codec *codec)
 	return 0;
 }
 
+static void cs8409_disable_i2c_clock_worker(struct work_struct *work);
+
 static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
 {
 	struct cs8409_spec *spec;
@@ -53,7 +55,9 @@ static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
 	if (!spec)
 		return NULL;
 	codec->spec = spec;
+	spec->codec = codec;
 	codec->power_save_node = 1;
+	INIT_DELAYED_WORK(&spec->i2c_clk_work, cs8409_disable_i2c_clock_worker);
 	snd_hda_gen_spec_init(&spec->gen);
 
 	return spec;
@@ -72,21 +76,58 @@ static inline void cs8409_vendor_coef_set(struct hda_codec *codec, unsigned int
 	snd_hda_codec_write(codec, CS8409_PIN_VENDOR_WIDGET, 0, AC_VERB_SET_PROC_COEF, coef);
 }
 
-/**
+/*
+ * cs8409_enable_i2c_clock - Disable I2C clocks
+ * @codec: the codec instance
+ * Disable I2C clocks.
+ * This must be called when the i2c mutex is unlocked.
+ */
+static void cs8409_disable_i2c_clock(struct hda_codec *codec)
+{
+	struct cs8409_spec *spec = codec->spec;
+
+	mutex_lock(&spec->cs8409_i2c_mux);
+	if (spec->i2c_clck_enabled) {
+		cs8409_vendor_coef_set(spec->codec, 0x0,
+			       cs8409_vendor_coef_get(spec->codec, 0x0) & 0xfffffff7);
+		spec->i2c_clck_enabled = 0;
+	}
+	mutex_unlock(&spec->cs8409_i2c_mux);
+}
+
+/*
+ * cs8409_disable_i2c_clock_worker - Worker that disable the I2C Clock after 25ms without use
+ */
+static void cs8409_disable_i2c_clock_worker(struct work_struct *work)
+{
+	struct cs8409_spec *spec = container_of(work, struct cs8409_spec, i2c_clk_work.work);
+
+	cs8409_disable_i2c_clock(spec->codec);
+}
+
+/*
  * cs8409_enable_i2c_clock - Enable I2C clocks
  * @codec: the codec instance
- * @enable: Enable or disable I2C clocks
- *
- * Enable or Disable I2C clocks.
+ * Enable I2C clocks.
+ * This must be called when the i2c mutex is locked.
  */
-static void cs8409_enable_i2c_clock(struct hda_codec *codec, unsigned int enable)
+static void cs8409_enable_i2c_clock(struct hda_codec *codec)
 {
-	unsigned int retval;
-	unsigned int newval;
+	struct cs8409_spec *spec = codec->spec;
 
-	retval = cs8409_vendor_coef_get(codec, 0x0);
-	newval = (enable) ? (retval | 0x8) : (retval & 0xfffffff7);
-	cs8409_vendor_coef_set(codec, 0x0, newval);
+	/* Cancel the disable timer, but do not wait for any running disable functions to finish.
+	 * If the disable timer runs out before cancel, the delayed work thread will be blocked,
+	 * waiting for the mutex to become unlocked. This mutex will be locked for the duration of
+	 * any i2c transaction, so the disable function will run to completion immediately
+	 * afterwards in the scenario. The next enable call will re-enable the clock, regardless.
+	 */
+	cancel_delayed_work(&spec->i2c_clk_work);
+
+	if (!spec->i2c_clck_enabled) {
+		cs8409_vendor_coef_set(codec, 0x0, cs8409_vendor_coef_get(codec, 0x0) | 0x8);
+		spec->i2c_clck_enabled = 1;
+	}
+	queue_delayed_work(system_power_efficient_wq, &spec->i2c_clk_work, msecs_to_jiffies(25));
 }
 
 /**
@@ -134,7 +175,7 @@ static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, un
 	if (spec->cs42l42_suspended)
 		return -EPERM;
 
-	cs8409_enable_i2c_clock(codec, 1);
+	cs8409_enable_i2c_clock(codec);
 	cs8409_vendor_coef_set(codec, CS8409_I2C_ADDR, i2c_address);
 
 	if (paged) {
@@ -157,8 +198,6 @@ static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, un
 	/* Register in bits 15-8 and the data in 7-0 */
 	read_data = cs8409_vendor_coef_get(codec, CS8409_I2C_QREAD);
 
-	cs8409_enable_i2c_clock(codec, 0);
-
 	return read_data & 0x0ff;
 }
 
@@ -182,7 +221,7 @@ static int cs8409_i2c_write(struct hda_codec *codec, unsigned int i2c_address, u
 	if (spec->cs42l42_suspended)
 		return -EPERM;
 
-	cs8409_enable_i2c_clock(codec, 1);
+	cs8409_enable_i2c_clock(codec);
 	cs8409_vendor_coef_set(codec, CS8409_I2C_ADDR, i2c_address);
 
 	if (paged) {
@@ -203,8 +242,6 @@ static int cs8409_i2c_write(struct hda_codec *codec, unsigned int i2c_address, u
 		return -EIO;
 	}
 
-	cs8409_enable_i2c_clock(codec, 0);
-
 	return 0;
 }
 
@@ -545,12 +582,27 @@ static int cs8409_suspend(struct hda_codec *codec)
 	/* Assert CS42L42 RTS# line */
 	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, 0);
 
+	/* Cancel i2c clock disable timer, and disable clock if left enabled */
+	cancel_delayed_work_sync(&spec->i2c_clk_work);
+	cs8409_disable_i2c_clock(codec);
+
 	snd_hda_shutup_pins(codec);
 
 	return 0;
 }
 #endif
 
+static void cs8409_free(struct hda_codec *codec)
+{
+	struct cs8409_spec *spec = codec->spec;
+
+	/* Cancel i2c clock disable timer, and disable clock if left enabled */
+	cancel_delayed_work_sync(&spec->i2c_clk_work);
+	cs8409_disable_i2c_clock(codec);
+
+	snd_hda_gen_free(codec);
+}
+
 /* Vendor specific HW configuration
  * PLL, ASP, I2C, SPI, GPIOs, DMIC etc...
  */
@@ -633,7 +685,7 @@ static const struct hda_codec_ops cs8409_cs42l42_patch_ops = {
 	.build_controls = cs8409_build_controls,
 	.build_pcms = snd_hda_gen_build_pcms,
 	.init = cs8409_cs42l42_init,
-	.free = snd_hda_gen_free,
+	.free = cs8409_free,
 	.unsol_event = cs8409_jack_unsol_event,
 #ifdef CONFIG_PM
 	.suspend = cs8409_suspend,
@@ -785,7 +837,7 @@ static int patch_cs8409(struct hda_codec *codec)
 
 	err = cs8409_parse_auto_config(codec);
 	if (err < 0) {
-		snd_hda_gen_free(codec);
+		cs8409_free(codec);
 		return err;
 	}
 
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index bf0e8a4cc4cc..542582c213d2 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -11,6 +11,7 @@
 
 #include <linux/pci.h>
 #include <sound/tlv.h>
+#include <linux/workqueue.h>
 #include <sound/hda_codec.h>
 #include "hda_local.h"
 #include "hda_auto_parser.h"
@@ -267,6 +268,7 @@ struct cs8409_cir_param {
 
 struct cs8409_spec {
 	struct hda_gen_spec gen;
+	struct hda_codec *codec;
 
 	unsigned int gpio_mask;
 	unsigned int gpio_dir;
@@ -278,6 +280,8 @@ struct cs8409_spec {
 	s8 vol[CS42L42_VOLUMES];
 
 	struct mutex cs8409_i2c_mux;
+	unsigned int i2c_clck_enabled;
+	struct delayed_work i2c_clk_work;
 
 	/* verb exec op override */
 	int (*exec_verb)(struct hdac_device *dev, unsigned int cmd, unsigned int flags,
-- 
2.25.1

