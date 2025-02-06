Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED91A2A89F
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2025 13:39:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37AA4601D8;
	Thu,  6 Feb 2025 13:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37AA4601D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738845595;
	bh=y/VChkXKo2AVVmQcMqmnuKl7kmi2p/NjxmU1O3KbYYQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GG/nyEMBr2bznVsJpBkwunrfnkTxSzaRaOiOFlq5iEC4QQVUhDvR3l0jAewDEcDq0
	 zfud5pJmXL8Ja495THjC2nJR0hQ0nrxFQyaPXcg3RzyCk/kNEYyqdhYVQReRCXBR+Y
	 L9d2VfkazQkSXkHtZRvDkZPuWYndX9Dw8df4fWok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B6FBF805B4; Thu,  6 Feb 2025 13:39:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB0B0F805B2;
	Thu,  6 Feb 2025 13:39:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FF6DF802DB; Thu,  6 Feb 2025 13:38:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D12AF800B8
	for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2025 13:38:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D12AF800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ltY5t8zf
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516CcGmO3624839
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 6 Feb 2025 06:38:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738845496;
	bh=7D9FKEDznd7f+Epx704xdkPd40fhvWOyaoMXQeqhZTw=;
	h=From:To:CC:Subject:Date;
	b=ltY5t8zf3dsAvmbbcQBlC+yDvcUYTAwlpVSc/eFXNPW4Jfc+0BvkTEaPLmuvJypnw
	 ViWguyTNrF14/IK6Dp3EQV31Z51yRtZmkcGmVBjWoEu4lEjdaqzMJ9tdgcj6iCA33a
	 n93uIy2d2ocPJ66G+KCy8hCRVkBISGmAKDWjjKnk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516CcGEu099981;
	Thu, 6 Feb 2025 06:38:16 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 06:38:16 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 06:38:16 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.127])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516CcCqR069337;
	Thu, 6 Feb 2025 06:38:13 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
        <13564923607@139.com>, <alsa-devel@alsa-project.org>, <tiwai@suse.de>,
        <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: drop a redundant code
Date: Thu, 6 Feb 2025 20:38:08 +0800
Message-ID: <20250206123808.1590-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: XPP4SZBHM4JCYHSEGMUOF7VJKBQ3AKP4
X-Message-ID-Hash: XPP4SZBHM4JCYHSEGMUOF7VJKBQ3AKP4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XPP4SZBHM4JCYHSEGMUOF7VJKBQ3AKP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Report from internal ticket, priv->cali_data.data devm_kzalloc twice,
drop the first one, it is the unnecessary one.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - update the year from 2024 to 2025.
 - drop a redundant code.
---
 sound/soc/codecs/tas2781-i2c.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index a730ab6ad4e3..90c5b2e74d12 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -2,7 +2,7 @@
 //
 // ALSA SoC Texas Instruments TAS2563/TAS2781 Audio Smart Amplifier
 //
-// Copyright (C) 2022 - 2024 Texas Instruments Incorporated
+// Copyright (C) 2022 - 2025 Texas Instruments Incorporated
 // https://www.ti.com
 //
 // The TAS2563/TAS2781 driver implements a flexible and configurable
@@ -1260,8 +1260,6 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 		(cali_data->cali_dat_sz_per_dev + 1) + 1 + 15 + 1;
 	priv->cali_data.total_sz = priv->ndev *
 		(cali_data->cali_dat_sz_per_dev + 1);
-	priv->cali_data.data = devm_kzalloc(priv->dev,
-		ext_cali_data->max, GFP_KERNEL);
 	cali_ctrls[i].name = cali_name;
 	cali_ctrls[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	cali_ctrls[i].info = snd_soc_bytes_info_ext;
-- 
2.34.1

