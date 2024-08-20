Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13628957CA7
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 07:16:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB3887F4;
	Tue, 20 Aug 2024 07:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB3887F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724130988;
	bh=dkTfgz/3OmASVUiN7dWEiLiAbHDXiVKkTbjFu9zjq6A=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=s4Key2OfNaamTMj1p24jpvqi/aF+XvMG6mOEPhGHeH9hBIP1E2WgQIsJMNp+zb0+X
	 DnFk9wIfZXNOCmj/KoBxRuhI+0IbaelmNW90UwBH1G5cATIIVltVXYwSqnWVw25sJH
	 nH6v0rpSdi0Twp01E/3R2U6QJJo2+VHLUjv04Vis=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC4E2F805B0; Tue, 20 Aug 2024 07:15:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CE01F805AD;
	Tue, 20 Aug 2024 07:15:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3160DF80494; Tue, 20 Aug 2024 07:10:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8941F800F0
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 07:09:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8941F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=hjN1oWKy
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47K59gZA016259;
	Tue, 20 Aug 2024 00:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724130582;
	bh=LCtPqOVcgPSkISBHuH2K1LnzwuFz9/cX7e+TZFckJIo=;
	h=From:To:CC:Subject:Date;
	b=hjN1oWKylzh53EwH6Os8GA30K8lo61xFEhjRPzbNSDmuFG0F6N5I+FCQNga1sRFEj
	 GIw4b2oEWhYHHHWwLqPrwBxPFPWQTwi0f6e53upgAxnb9ftM7TubBGnlYIQdcNl6cT
	 DvegnYxSUvojNzRhBMuID6tjka8vxh8krsr0oPrs=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47K59g83082001
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Aug 2024 00:09:42 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Aug 2024 00:09:41 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Aug 2024 00:09:41 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.14.152])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47K59VGh019390;
	Tue, 20 Aug 2024 00:09:32 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <zhourui@huaqin.com>,
        <alsa-devel@alsa-project.org>, <i-salazar@ti.com>,
        <liam.r.girdwood@intel.com>, <jaden-yue@ti.com>,
        <yung-chuan.liao@linux.intel.com>, <dipa@ti.com>,
 <yuhsuan@google.com>,
        <henry.lo@ti.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <Baojun.Xu@fpt.com>, <judyhsiao@google.com>, <navada@ti.com>,
        <cujomalainey@google.com>, <aanya@ti.com>, <nayeem.mahmud@ti.com>,
        <savyasanchi.shukla@netradyne.com>, <flaviopr@microsoft.com>,
        <jesse-ji@ti.com>, <darren.ye@mediatek.com>, <antheas.dk@gmail.com>,
        <Jerry2.Huang@lcfuturecenter.com>, <jim.shil@goertek.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH] ASoc: tas2781: replace devm_kzalloc and scnprintf with
 devm_kasprintf
Date: Tue, 20 Aug 2024 13:09:24 +0800
Message-ID: <20240820050926.101-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: L5HL367MYSZMQFPPEEVINM753BTHR5SV
X-Message-ID-Hash: L5HL367MYSZMQFPPEEVINM753BTHR5SV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L5HL367MYSZMQFPPEEVINM753BTHR5SV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace devm_kzalloc and scnprintf with devm_kasprintf.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/tas2781-i2c.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9a32e0504857..1451ba0fa5b4 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -346,13 +346,11 @@ static int tasdevice_create_control(struct tasdevice_priv *tas_priv)
 	}
 
 	/* Create a mixer item for selecting the active profile */
-	name = devm_kzalloc(tas_priv->dev, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
-		GFP_KERNEL);
+	name = devm_kasprintf(tas_priv->dev, GFP_KERNEL, "Speaker Profile Id");
 	if (!name) {
 		ret = -ENOMEM;
 		goto out;
 	}
-	scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "Speaker Profile Id");
 	prof_ctrls[mix_index].name = name;
 	prof_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	prof_ctrls[mix_index].info = tasdevice_info_profile;
@@ -441,18 +439,13 @@ static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 		goto out;
 	}
 
-	/* Create a mixer item for selecting the active profile */
-	prog_name = devm_kzalloc(tas_priv->dev,
-		SNDRV_CTL_ELEM_ID_NAME_MAXLEN, GFP_KERNEL);
-	conf_name = devm_kzalloc(tas_priv->dev, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
-		GFP_KERNEL);
-	if (!prog_name || !conf_name) {
+	/* Create mixer items for selecting the active Program and Config */
+	prog_name = devm_kasprintf(tas_priv->dev, GFP_KERNEL,
+		"Speaker Program Id");
+	if (!prog_name) {
 		ret = -ENOMEM;
 		goto out;
 	}
-
-	scnprintf(prog_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
-		"Speaker Program Id");
 	dsp_ctrls[mix_index].name = prog_name;
 	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	dsp_ctrls[mix_index].info = tasdevice_info_programs;
@@ -460,8 +453,12 @@ static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 	dsp_ctrls[mix_index].put = tasdevice_program_put;
 	mix_index++;
 
-	scnprintf(conf_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN,
+	conf_name = devm_kasprintf(tas_priv->dev, GFP_KERNEL,
 		"Speaker Config Id");
+	if (!conf_name) {
+		ret = -ENOMEM;
+		goto out;
+	}
 	dsp_ctrls[mix_index].name = conf_name;
 	dsp_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	dsp_ctrls[mix_index].info = tasdevice_info_configurations;
-- 
2.34.1

