Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C6395287E
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 06:24:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FE5722A7;
	Thu, 15 Aug 2024 06:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FE5722A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723695897;
	bh=3LM7lqmBSDbAIAQi8kMslMjBq7ogMGHxbVQTT3fRnk0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Wph2zdPtFeSfOV5/GlQaJWBRBx632ceSRsB+E7OF9ryvlQLTDR7SLw4IHAUv0yk90
	 gTOzq2WMiIdm+Os5MCmks2wRommrZIXtP4iWmxakO5hcplD7hlDUAS21qH9wKaFQ94
	 BXD01yvM8g0uNazi+Lr+VRhRAyHXub1keJ0Y635k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1AD1F805D7; Thu, 15 Aug 2024 06:24:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95517F805C0;
	Thu, 15 Aug 2024 06:24:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8BD2F80423; Thu, 15 Aug 2024 06:22:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AD6BF800BF
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 06:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AD6BF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=xBC8tea8
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47F4Lu3U122878;
	Wed, 14 Aug 2024 23:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723695716;
	bh=vDNxv+yAUvs4Nf/6jWImHGLVpKISqITx4mVOgDvsXmg=;
	h=From:To:CC:Subject:Date;
	b=xBC8tea8wtu6P6I1bZg18EVhnu2N7z8xUelxTc61TAk3CJvpi/eaJ2WwxS2dE3y0b
	 HPfG5H1/PMr8JWDe4xTSy+gKb8zshL80tK5ZSWJgYodERx6ybpGHMWF15VuToE0FGZ
	 sYr1SJEX03lWdEaERdtbYEQ0Liyawg/btvCYWwTQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47F4Lu2e117270
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Aug 2024 23:21:56 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Aug 2024 23:21:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Aug 2024 23:21:56 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.249.36.5])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47F4Lio4104431;
	Wed, 14 Aug 2024 23:21:44 -0500
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
        <Baojun.Xu@fpt.com>, <j-chadha@ti.com>, <judyhsiao@google.com>,
        <navada@ti.com>, <cujomalainey@google.com>, <aanya@ti.com>,
        <nayeem.mahmud@ti.com>, <savyasanchi.shukla@netradyne.com>,
        <flaviopr@microsoft.com>, <jesse-ji@ti.com>, <darren.ye@mediatek.com>,
        <antheas.dk@gmail.com>, <Jerry2.Huang@lcfuturecenter.com>,
        <jim.shil@goertek.com>, Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH] ASoc: tas2781: Remove unnecessary line feed and space
Date: Thu, 15 Aug 2024 12:21:35 +0800
Message-ID: <20240815042138.1997-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: K27W5RJSANUCESBJL5XSAQCIOQ2ITRD6
X-Message-ID-Hash: K27W5RJSANUCESBJL5XSAQCIOQ2ITRD6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K27W5RJSANUCESBJL5XSAQCIOQ2ITRD6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove unnecessary line feed for tasdevice_dsp_create_ctrls,
and remove two unnecessary spaces in tas2563_digital_gain_get
and tas2563_digital_gain_put.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/tas2781-i2c.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 8c9efd9183ff..9a32e0504857 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -157,7 +157,7 @@ static int tas2563_digital_gain_get(
 
 	mutex_lock(&tas_dev->codec_lock);
 	/* Read the primary device */
-	ret =  tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
+	ret = tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
 	if (ret) {
 		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
 		goto out;
@@ -203,7 +203,7 @@ static int tas2563_digital_gain_put(
 	vol = clamp(vol, 0, max);
 	mutex_lock(&tas_dev->codec_lock);
 	/* Read the primary device */
-	ret =  tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
+	ret = tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
 	if (ret) {
 		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
 		rc = -1;
@@ -423,8 +423,7 @@ static int tasdevice_configuration_put(
 	return ret;
 }
 
-static int tasdevice_dsp_create_ctrls(
-	struct tasdevice_priv *tas_priv)
+static int tasdevice_dsp_create_ctrls(struct tasdevice_priv *tas_priv)
 {
 	struct snd_kcontrol_new *dsp_ctrls;
 	char *prog_name, *conf_name;
-- 
2.34.1

