Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 345493D667F
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 20:08:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B75121832;
	Mon, 26 Jul 2021 20:07:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B75121832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627322928;
	bh=qlFLilphgw4yXT56BX9lzMwRx4wdxYUD2r3PasfzTRE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qGs7ujc9PeHORLtQX3gHmBR4Amk/Yq0sKMB8VPjfuyfsKju6rJYnnpo9n8/gs7iAR
	 vA6qTUkKbuf5qh8dN2QNjpL2FYWWKTrS/s+QLqkWAM5ho+2MvNjjC4H4Qr5h+ZlNbC
	 MSr3zeZGtTg30hb8MOX7jYgrWs8ptqli3V37fZk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBEF1F80551;
	Mon, 26 Jul 2021 20:03:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F11AF8053A; Mon, 26 Jul 2021 20:03:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 975C5F80520
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 20:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 975C5F80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gt8HXBZK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16Q2DYdA012545; 
 Mon, 26 Jul 2021 13:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=FrGl83a9s6FxANcnPVQFiNoOWy5wfmpk2pTp9xtoQtA=;
 b=gt8HXBZKGFPvRyhpHgItp2bhGcgXeJFrVis1QwPiOakLND9k2XlsulcoV4sI/xZOcnng
 wLTr/YGXCUuy0W2nAHo0O/bZ+mUossrWMAl9tfl+sGBkCQoeLpdMs+I+KcV5G0hBSaK3
 L0NVFaCEyQzFYTrN5fe5KD/LZg/vrVG+8Y7yjH+ZItUhBoZoxaWGUfdn5AHD5+oBS4N9
 Xs+ItiUvwtD1i/PC26wDdUCvnLxRUH4ZDSrbZaBqwfwMHzyl92dkmxP2KRjL1klBpRY0
 R0+uydKWQoBD4skqYo+1qBxkmUFP7OZD2QY1c1fKF1x0yo4W3y3KyFirXOpx5FlQHXm6 nA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a17cvhhav-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Jul 2021 13:03:10 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Jul
 2021 18:47:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Jul 2021 18:47:07 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 389C445D;
 Mon, 26 Jul 2021 17:47:07 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 13/27] ALSA: hda/cs8409: Dont disable I2C clock between
 consecutive accesses
Date: Mon, 26 Jul 2021 18:46:26 +0100
Message-ID: <20210726174640.6390-14-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
References: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ovwDrrrKIeAWA2ZMoiKC7T9DC7gymhXe
X-Proofpoint-ORIG-GUID: ovwDrrrKIeAWA2ZMoiKC7T9DC7gymhXe
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260105
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>
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

Only disable I2C clock 25 ms after not being used

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409.c | 42 +++++++++++++++++++++++-------------
 sound/pci/hda/patch_cs8409.h |  4 ++++
 2 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 08205c19698c..335bcdc69106 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -53,6 +53,7 @@ static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
 	if (!spec)
 		return NULL;
 	codec->spec = spec;
+	spec->codec = codec;
 	codec->power_save_node = 1;
 	snd_hda_gen_spec_init(&spec->gen);
 
@@ -72,21 +73,34 @@ static inline void cs8409_vendor_coef_set(struct hda_codec *codec, unsigned int
 	snd_hda_codec_write(codec, CS8409_PIN_VENDOR_WIDGET, 0, AC_VERB_SET_PROC_COEF, coef);
 }
 
-/**
+/*
+ * cs8409_disable_i2c_clock - Worker that disable the I2C Clock after 25ms without use
+ */
+static void cs8409_disable_i2c_clock(struct work_struct *work)
+{
+	struct cs8409_spec *spec = container_of(work, struct cs8409_spec, i2c_clk_work.work);
+
+	cs8409_vendor_coef_set(spec->codec, 0x0,
+			       cs8409_vendor_coef_get(spec->codec, 0x0) & 0xfffffff7);
+	spec->i2c_clck_enabled = 0;
+}
+
+/*
  * cs8409_enable_i2c_clock - Enable I2C clocks
  * @codec: the codec instance
- * @enable: Enable or disable I2C clocks
- *
  * Enable or Disable I2C clocks.
  */
-static void cs8409_enable_i2c_clock(struct hda_codec *codec, unsigned int enable)
+static void cs8409_enable_i2c_clock(struct hda_codec *codec)
 {
-	unsigned int retval;
-	unsigned int newval;
+	struct cs8409_spec *spec = codec->spec;
+
+	cancel_delayed_work_sync(&spec->i2c_clk_work);
 
-	retval = cs8409_vendor_coef_get(codec, 0x0);
-	newval = (enable) ? (retval | 0x8) : (retval & 0xfffffff7);
-	cs8409_vendor_coef_set(codec, 0x0, newval);
+	if (!spec->i2c_clck_enabled) {
+		cs8409_vendor_coef_set(codec, 0x0, cs8409_vendor_coef_get(codec, 0x0) | 0x8);
+		spec->i2c_clck_enabled = 1;
+	}
+	queue_delayed_work(system_power_efficient_wq, &spec->i2c_clk_work, msecs_to_jiffies(25));
 }
 
 /**
@@ -134,7 +148,7 @@ static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, un
 	if (spec->cs42l42_suspended)
 		return -EPERM;
 
-	cs8409_enable_i2c_clock(codec, 1);
+	cs8409_enable_i2c_clock(codec);
 	cs8409_vendor_coef_set(codec, CS8409_I2C_ADDR, i2c_address);
 
 	if (paged) {
@@ -157,8 +171,6 @@ static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, un
 	/* Register in bits 15-8 and the data in 7-0 */
 	read_data = cs8409_vendor_coef_get(codec, CS8409_I2C_QREAD);
 
-	cs8409_enable_i2c_clock(codec, 0);
-
 	return read_data & 0x0ff;
 }
 
@@ -182,7 +194,7 @@ static int cs8409_i2c_write(struct hda_codec *codec, unsigned int i2c_address, u
 	if (spec->cs42l42_suspended)
 		return -EPERM;
 
-	cs8409_enable_i2c_clock(codec, 1);
+	cs8409_enable_i2c_clock(codec);
 	cs8409_vendor_coef_set(codec, CS8409_I2C_ADDR, i2c_address);
 
 	if (paged) {
@@ -203,8 +215,6 @@ static int cs8409_i2c_write(struct hda_codec *codec, unsigned int i2c_address, u
 		return -EIO;
 	}
 
-	cs8409_enable_i2c_clock(codec, 0);
-
 	return 0;
 }
 
@@ -705,6 +715,8 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		spec->cs42l42_mic_jack_in = 0;
 		spec->cs42l42_suspended = 1;
 
+		INIT_DELAYED_WORK(&spec->i2c_clk_work, cs8409_disable_i2c_clock);
+
 		/* Basic initial sequence for specific hw configuration */
 		snd_hda_sequence_write(codec, cs8409_cs42l42_init_verbs);
 
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

