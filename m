Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FE180B31C
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Dec 2023 09:16:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9EBF83A;
	Sat,  9 Dec 2023 09:16:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9EBF83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702109815;
	bh=HZwYV9UkT6RCYotMs+p2kQCCkZr1et9ucpa6CxHGI9M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uiw9yq4wVWsY6nPsxLiR71YGVth4Wbfhdla2xggBXCimFYTUbXWCAHtLUd6t0i7EI
	 iaDy2TsHbfKHKJo3WJb8oV9M0uEfAe8ggUyguGuNM32Qcmeb5+C/DiFBe6DrGSxBJL
	 LjLBYS848JR1H3uyuM/j1az66K5s3HbBXCWU0WiI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 629FAF805AA; Sat,  9 Dec 2023 09:16:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D4EDF8057B;
	Sat,  9 Dec 2023 09:16:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3B85F8025F; Sat,  9 Dec 2023 09:08:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD245F800D2
	for <alsa-devel@alsa-project.org>; Sat,  9 Dec 2023 09:08:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD245F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=rH0+qt0M
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B987vPK031288;
	Sat, 9 Dec 2023 02:07:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702109277;
	bh=S53+t2ZMBhz3JwJ5YrVSIeTq3esCnFxAEKW5KaIaz0A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rH0+qt0MR0lsKU8BVLb1cIkC05D6L/gAcOlXA/iHB0h4/7ojV7PgXdckMg9K2/A6F
	 +gdzkR8eU8K+rhkPr7YHbYysfH18nAz4SBmyMOM2mSo55CSGHyROW63LUlKvYrUjR/
	 gXcUIYkPBKJHC4csV4lJEs0vul6dCxLJh1+PxsnU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B987vuT018993
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 9 Dec 2023 02:07:57 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 9
 Dec 2023 02:07:57 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 9 Dec 2023 02:07:57 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.163.83])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B987lHE122124;
	Sat, 9 Dec 2023 02:07:53 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <liam.r.girdwood@intel.com>,
        <soyer@irl.hu>, <tiwai@suse.de>, Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v1 2/3] ASoC: tas2781: Add tas2563 into driver
Date: Sat, 9 Dec 2023 16:07:41 +0800
Message-ID: <20231209080742.1290-2-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20231209080742.1290-1-shenghao-ding@ti.com>
References: <20231209080742.1290-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: AVVASMM3RYSEFTEBOG6LYQVL5MHV5GZN
X-Message-ID-Hash: AVVASMM3RYSEFTEBOG6LYQVL5MHV5GZN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVVASMM3RYSEFTEBOG6LYQVL5MHV5GZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Support tas2563.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/tas2781-i2c.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 55cd5e3c23a5..c6afc87f2c69 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -5,9 +5,9 @@
 // Copyright (C) 2022 - 2023 Texas Instruments Incorporated
 // https://www.ti.com
 //
-// The TAS2781 driver implements a flexible and configurable
+// The TAS2781/TAS2563 driver implements a flexible and configurable
 // algo coefficient setting for one, two, or even multiple
-// TAS2781 chips.
+// TAS2781/TAS2563 chips.
 //
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 // Author: Kevin Lu <kevin-lu@ti.com>
@@ -33,6 +33,7 @@
 
 static const struct i2c_device_id tasdevice_id[] = {
 	{ "tas2781", TAS2781 },
+	{ "tas2563", TAS2563 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tasdevice_id);
@@ -40,6 +41,7 @@ MODULE_DEVICE_TABLE(i2c, tasdevice_id);
 #ifdef CONFIG_OF
 static const struct of_device_id tasdevice_of_match[] = {
 	{ .compatible = "ti,tas2781" },
+	{ .compatible = "ti,tas2563" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tasdevice_of_match);
-- 
2.34.1

