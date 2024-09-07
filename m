Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C51B696FEAB
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Sep 2024 02:16:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CF9FE0D;
	Sat,  7 Sep 2024 02:16:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CF9FE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725668219;
	bh=3LM7lqmBSDbAIAQi8kMslMjBq7ogMGHxbVQTT3fRnk0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DKCmwURc9iibH1hyfczu16H2iOzvQwehKjo1eiqnnZlIBYMHuRymZ25gtlMxJ+N7V
	 5g9IR0kWnWeQrWolbBEOm4KDKjzc50Z+Ei6qrmr5HX9bLGjdJCiuI07pHv+T6FYtB6
	 QxRLSJfO9jP544b2iQnVb//jgPNV29dKs4EG8Sm4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38A66F805DF; Sat,  7 Sep 2024 02:16:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAD41F805DA;
	Sat,  7 Sep 2024 02:16:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06922F805C0; Sat,  7 Sep 2024 02:16:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFA69F805AD
	for <alsa-devel@alsa-project.org>; Sat,  7 Sep 2024 02:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFA69F805AD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=nTmKdqwt
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4870GBTw025999;
	Fri, 6 Sep 2024 19:16:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725668171;
	bh=vDNxv+yAUvs4Nf/6jWImHGLVpKISqITx4mVOgDvsXmg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nTmKdqwtKpmMEJH28psN0O92yo0MJzDbAkOvJ7zzVUrMJhEHFe+QCyI8Z/f4iWP4H
	 33HOigHkfAVgSfKrm2nOcxNlXwQ7LSzPl87vOGUwK6PzjdWja3+74KdCupAXg5OqXj
	 61yFYTf2dsG41ZNePI0hcUT5KuKkjmiDb89HEyN4=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4870GBuO057381;
	Fri, 6 Sep 2024 19:16:11 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Sep 2024 19:16:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Sep 2024 19:16:10 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.161])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4870FkoY017869;
	Fri, 6 Sep 2024 19:16:00 -0500
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
        <jeep.wang@goertek.com>, <will-wang@ti.com>,
        Shenghao
 Ding <shenghao-ding@ti.com>
Subject: [PATCH] ASoc: tas2781: Remove unnecessary line feed and space
Date: Sat, 7 Sep 2024 08:15:37 +0800
Message-ID: <20240907001540.944-2-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20240907001540.944-1-shenghao-ding@ti.com>
References: <20240907001540.944-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: IED4TUXVLRIQ3BT2NX4OHZK3DMU54CR4
X-Message-ID-Hash: IED4TUXVLRIQ3BT2NX4OHZK3DMU54CR4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IED4TUXVLRIQ3BT2NX4OHZK3DMU54CR4/>
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

