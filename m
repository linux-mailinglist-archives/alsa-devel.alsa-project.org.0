Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E6DAC237C
	for <lists+alsa-devel@lfdr.de>; Fri, 23 May 2025 15:12:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C6160195;
	Fri, 23 May 2025 15:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C6160195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748005931;
	bh=VYoT670TJsnVTvEQzUtCn0lO/9G1UORjQ8W6EV8wX/o=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jlemy5syRCbFSCaX7kizS4snTIr6SNi6nhIruEP1VHiUQUxtCK7rDNRwyTIFpaD+i
	 C3GIXkuR4GDj8yoXxnSgSqvgxXWE/TO7/mZc9TRQz3JNcJBCkYuVYd0kISmmZ+zkk3
	 Z7G/U9JsfIt4bfljZGL3PjPwIWeKs+JgFy9eIzCI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75CBEF800C1; Fri, 23 May 2025 15:11:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67A02F805B4;
	Fri, 23 May 2025 15:11:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0F15F8057E; Fri, 23 May 2025 15:11:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A8FCF80508
	for <alsa-devel@alsa-project.org>; Fri, 23 May 2025 15:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A8FCF80508
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=kfgOkFTc
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54NDBKfJ2112995;
	Fri, 23 May 2025 08:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748005880;
	bh=LkQkT+4I/VfRBh8xB9FA+9eo6P9+4MLSefFU2BeWUAE=;
	h=From:To:CC:Subject:Date;
	b=kfgOkFTcbwu8vwfpIH+fpH2XxFS78kOPgz7SdsVn8mUDRAV5/6igD2nzw5eBkFmq8
	 BynCIDsEBgd1ehgwxc/Laaoi2QeoVwbBESNKLKm8ZGFgOJnA3DyPGBxbZA7q80iE+9
	 EZJmpYV2/68EQOUJlWPun97uL63X9yHT/qoFXe8U=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54NDBKIY3834736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 08:11:20 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 08:11:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 08:11:19 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.60])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54NDBFQv1251237;
	Fri, 23 May 2025 08:11:16 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <13916275206@139.com>, <13564923607@139.com>,
        <alsa-devel@alsa-project.org>, <baojun.xu@ti.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Drop the unnecessary symbol imply
Date: Fri, 23 May 2025 21:11:11 +0800
Message-ID: <20250523131111.1884-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: B4U3DQ7JIDZFECNFOTMZVC6XO3F42KL4
X-Message-ID-Hash: B4U3DQ7JIDZFECNFOTMZVC6XO3F42KL4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4U3DQ7JIDZFECNFOTMZVC6XO3F42KL4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The unnecessary symbols for imply are SND_SOC_TAS2781_COMLIB,
SND_SOC_TAS2781_COMLIB_I2C, and SND_SOC_TAS2781_FMWLIB. They all used for
library compiling. All the symbols in the imply are used for codec driver
compiling.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 8fe795504dbb..0e70064bc90c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -262,9 +262,6 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_TAS2764
 	imply SND_SOC_TAS2770
 	imply SND_SOC_TAS2780
-	imply SND_SOC_TAS2781_COMLIB
-	imply SND_SOC_TAS2781_COMLIB_I2C
-	imply SND_SOC_TAS2781_FMWLIB
 	imply SND_SOC_TAS2781_I2C
 	imply SND_SOC_TAS5086
 	imply SND_SOC_TAS571X
-- 
2.43.0

