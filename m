Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0E29FD19C
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2024 08:50:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14170602CC;
	Fri, 27 Dec 2024 08:50:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14170602CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735285815;
	bh=KjYYrDzXPLcY6sTyxevyPU0hEbvNV97FIQyNEgKwJmY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dXTprQb3p+hFJD5qUW3botRxkunne6D5zwIgfTvbQs4RcN2Gfj2frGZ9wIVBefhko
	 AaiTkmcWJVa0Hx2uaX5vdQpFQZ6ai4Fj9tam0bWeLynvlACf11RgC+fuUdhJaf11Ld
	 DRoWCGKR/oGB3+T86vBr03loTjnX7U+NFZ3pWI9E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFDC3F805B0; Fri, 27 Dec 2024 08:49:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D89AF80238;
	Fri, 27 Dec 2024 08:49:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50C9BF8042F; Fri, 27 Dec 2024 08:49:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAC59F800B5
	for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2024 08:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAC59F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=dcYzbCtJ
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BR7nI2f1072127
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Dec 2024 01:49:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735285758;
	bh=hEr3u3pcZhBawamlERCMQoChafyHsYvP8FE1Gfl+ldA=;
	h=From:To:CC:Subject:Date;
	b=dcYzbCtJsrIyOgs6LN948lujahldqiQnxgry7ahEn/GpEjhjCv/6tmcN51sr5CpZ2
	 3wkAlArkJ/Y8AaQfS1R7cGqvVhtszHTYsWlyCvEWsKX0rWNcCNLkT1IQIyN04lLZvx
	 Oc4/2pCmyPQn5NiC3WDGEgGKkHbdrtt2biREQI54=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BR7nIaP011899
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Dec 2024 01:49:18 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Dec 2024 01:49:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Dec 2024 01:49:18 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.124])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BR7nDVd005164;
	Fri, 27 Dec 2024 01:49:14 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <tiwai@suse.de>, <baojun.xu@ti.com>,
        <Baojun.Xu@fpt.com>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Fix occasional calibration failture
Date: Fri, 27 Dec 2024 15:49:09 +0800
Message-ID: <20241227074909.1974-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: 5D24UIV7XXOOAKC62FQ4CXJYREDFLCH3
X-Message-ID-Hash: 5D24UIV7XXOOAKC62FQ4CXJYREDFLCH3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5D24UIV7XXOOAKC62FQ4CXJYREDFLCH3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The root cause is that TAS2781 internal register is not unlocked
before writing data into TAS2781_PRM_TEST_57_REG.

Fixes: 49e2e353fb0d ("ASoC: tas2781: Add Calibration Kcontrols for Chromebook")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/tas2781-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index fb8cd2284fe8..728bf78ae71f 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -78,7 +78,7 @@ static const struct bulk_reg_val tas2781_cali_start_reg[] = {
 	X2781_CL_STT_VAL(TAS2781_PRM_INT_MASK_REG, 0xfe, false),
 	X2781_CL_STT_VAL(TAS2781_PRM_CLK_CFG_REG, 0xdd, false),
 	X2781_CL_STT_VAL(TAS2781_PRM_RSVD_REG, 0x20, false),
-	X2781_CL_STT_VAL(TAS2781_PRM_TEST_57_REG, 0x14, false),
+	X2781_CL_STT_VAL(TAS2781_PRM_TEST_57_REG, 0x14, true),
 	X2781_CL_STT_VAL(TAS2781_PRM_TEST_62_REG, 0x45, true),
 	X2781_CL_STT_VAL(TAS2781_PRM_PVDD_UVLO_REG, 0x03, false),
 	X2781_CL_STT_VAL(TAS2781_PRM_CHNL_0_REG, 0xa8, false),
-- 
2.34.1

