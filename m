Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15739B21ABF
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Aug 2025 04:26:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12ADE60218;
	Tue, 12 Aug 2025 04:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12ADE60218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754965584;
	bh=JnX7v/Gp+gnaB7U2gkvF91bxFsfKeg03xA5Q8qIGeWw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gY5q8yL7toS0Sk6RdZ9WleuJ/6ukiMacPHgtpXe7t67f+J2v+iWP5KCZdd9ck6FI/
	 UXIB62gfU1bdldA8W45MEKwgYJe2F6NOEBWH9ZaPRjo+dioTB2j7p5w9TTT256K7uy
	 RRm5H0TlTZWa7xOZeV45rbVO2C8YnZTpIS6AqsdQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F261F805D3; Tue, 12 Aug 2025 04:25:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D9B6F805BE;
	Tue, 12 Aug 2025 04:25:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EA27F8042F; Tue, 12 Aug 2025 04:25:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5EBCEF8021D
	for <alsa-devel@alsa-project.org>; Tue, 12 Aug 2025 04:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EBCEF8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Q1q2Yw/u
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57C2OGi91741399;
	Mon, 11 Aug 2025 21:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754965456;
	bh=y2+XRvpUJF7U0oOqq/78i+ZbTpAbuYrUPGRdZ9+Z7sQ=;
	h=From:To:CC:Subject:Date;
	b=Q1q2Yw/u+DhYwMakzz5U117mCuQr6fJR6L+mAs+Ge1gcEPTYNpGeNN5Zm9ESc/mR9
	 TOxtQOvu520Yd8cVR0y9sBtrlau95G5CVlHG8/HFsoGaUn0TCwbfIhLRoMGWWmgC7n
	 9O8fJGD6VYZ4iDV9BaDfUIMvokPNjeHVojUXt+xI=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57C2OGHH4161373
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 11 Aug 2025 21:24:16 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 11
 Aug 2025 21:24:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 11 Aug 2025 21:24:15 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.79])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57C2OBaL4126719;
	Mon, 11 Aug 2025 21:24:12 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <13916275206@139.com>, <13564923607@139.com>,
        <alsa-devel@alsa-project.org>, <baojun.xu@ti.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [RESEND PATCH v1] ASoC: tas2781: Add keyword "init" in profile
 section
Date: Tue, 12 Aug 2025 10:24:08 +0800
Message-ID: <20250812022408.490-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: WI4DK2D44MQOIGWZA7FA4UBK3IRAQDSY
X-Message-ID-Hash: WI4DK2D44MQOIGWZA7FA4UBK3IRAQDSY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WI4DK2D44MQOIGWZA7FA4UBK3IRAQDSY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since version 0x105, the keyword 'init' was introduced into the profile,
which is used for chip initialization, particularly to store common
settings for other non-initialization profiles.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 include/sound/tas2781-dsp.h       |  8 ++++++++
 sound/soc/codecs/tas2781-fmwlib.c | 12 ++++++++++++
 sound/soc/codecs/tas2781-i2c.c    |  6 ++++++
 3 files changed, 26 insertions(+)

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index c3a9efa73d5d..a21f34c0266e 100644
--- a/include/sound/tas2781-dsp.h
+++ b/include/sound/tas2781-dsp.h
@@ -198,6 +198,14 @@ struct tasdevice_rca {
 	int ncfgs;
 	struct tasdevice_config_info **cfg_info;
 	int profile_cfg_id;
+	/*
+	 * Since version 0x105, the keyword 'init' was introduced into the
+	 * profile, which is used for chip initialization, particularly to
+	 * store common settings for other non-initialization profiles.
+	 * if (init_profile_id < 0)
+	 *         No init profile inside the RCA firmware.
+	 */
+	int init_profile_id;
 };
 
 void tasdevice_select_cfg_blk(void *context, int conf_no,
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index c9c1e608ddb7..8baf56237624 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -180,6 +180,16 @@ static struct tasdevice_config_info *tasdevice_add_config(
 			dev_err(tas_priv->dev, "add conf: Out of boundary\n");
 			goto out;
 		}
+		/* If in the RCA bin file are several profiles with the
+		 * keyword "init", init_profile_id only store the last
+		 * init profile id.
+		 */
+		if (strnstr(&config_data[config_offset], "init", 64)) {
+			tas_priv->rcabin.init_profile_id =
+				tas_priv->rcabin.ncfgs - 1;
+			dev_dbg(tas_priv->dev, "%s: init profile id = %d\n",
+				__func__, tas_priv->rcabin.init_profile_id);
+		}
 		config_offset += 64;
 	}
 
@@ -283,6 +293,8 @@ int tasdevice_rca_parser(void *context, const struct firmware *fmw)
 	int i;
 
 	rca = &(tas_priv->rcabin);
+	/* Initialize to none */
+	rca->init_profile_id = -1;
 	fw_hdr = &(rca->fw_hdr);
 	if (!fmw || !fmw->data) {
 		dev_err(tas_priv->dev, "Failed to read %s\n",
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9f4d965a1335..f8faeffd983d 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1641,6 +1641,12 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 	tasdevice_prmg_load(tas_priv, 0);
 	tas_priv->cur_prog = 0;
 
+	/* Init common setting for different audio profiles */
+	if (tas_priv->rcabin.init_profile_id >= 0)
+		tasdevice_select_cfg_blk(tas_priv,
+			tas_priv->rcabin.init_profile_id,
+			TASDEVICE_BIN_BLK_PRE_POWER_UP);
+
 #ifdef CONFIG_SND_SOC_TAS2781_ACOUST_I2C
 	if (tas_priv->name_prefix)
 		acoustic_debugfs_node = devm_kasprintf(tas_priv->dev,
-- 
2.43.0

