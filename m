Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AA0AD1730
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jun 2025 04:52:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9899B601FC;
	Mon,  9 Jun 2025 04:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9899B601FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749437537;
	bh=VYoT670TJsnVTvEQzUtCn0lO/9G1UORjQ8W6EV8wX/o=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=X0M1YQwYEE0XdPtaYSRdYDprrXJaZlXSTSQMv8OOvvByftlyJ57TGDzvUUcoqli7O
	 aX8nmakSdy/435LFFYH0GV3n50wgzAyQ4t1dHaQeOVxYVw8Plywqh/iQcP1Uw8nJRS
	 j3Xf3qLpo13PpLYc2KOnDDf2m5RanQLMzTlPvTVM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C235F805C8; Mon,  9 Jun 2025 04:51:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3025F805C2;
	Mon,  9 Jun 2025 04:51:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86BF0F8049C; Mon,  9 Jun 2025 04:51:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0135F801F7
	for <alsa-devel@alsa-project.org>; Mon,  9 Jun 2025 04:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0135F801F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=e40sBcvc
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5592pRC9670443;
	Sun, 8 Jun 2025 21:51:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749437487;
	bh=LkQkT+4I/VfRBh8xB9FA+9eo6P9+4MLSefFU2BeWUAE=;
	h=From:To:CC:Subject:Date;
	b=e40sBcvc+2kynMNSUuR+FObaBEbwIBwMk35xOJbWSZy7bHfNEpQv5iHzR+rQQ+55j
	 Q3/i6Bkj1g9EZl+wlEUHnhZJvMarQ9qcrrwOxfg8j1xyd4ys9WmACUY2OcNn5fzsci
	 BF9Z/TaRpYwiv5Sh/ZJPnvdS6e4+fhGAO7okpkaQ=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5592pRIv3935103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 8 Jun 2025 21:51:27 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 8
 Jun 2025 21:51:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 8 Jun 2025 21:51:26 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.14.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5592pNTk550549;
	Sun, 8 Jun 2025 21:51:24 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <13916275206@139.com>, <13564923607@139.com>,
        <alsa-devel@alsa-project.org>, <baojun.xu@ti.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [RESEND PATCH v1] ASoC: tas2781: Drop the unnecessary symbol imply
Date: Mon, 9 Jun 2025 10:51:20 +0800
Message-ID: <20250609025120.782-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: 7UUFQOUUISZEEW6XPDONGDDQPFKP5F5T
X-Message-ID-Hash: 7UUFQOUUISZEEW6XPDONGDDQPFKP5F5T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7UUFQOUUISZEEW6XPDONGDDQPFKP5F5T/>
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

