Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AED2093207E
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2024 08:42:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1B99857;
	Tue, 16 Jul 2024 08:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1B99857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721112149;
	bh=SLm0A+C67J+1a0stnpjNftDb7NZpVKYQqx38hlCUxMU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dl7oZ+x5BMeRp2w7TMTKyv0oqjwGhtYuY1yeR/qLHMaEjLObBkKSoRNIVCbrbneF4
	 x4SnKJXODYQJ/1JEZYgQA2OEMX+RKxpUmvBk0W1np1kz4GpVc2Ve549fdcxGRcwS00
	 STd7gpyVyvk5aWLxU0b5s3gerH838Qwfz0YMCcP4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA1A0F80528; Tue, 16 Jul 2024 08:41:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13E9CF80588;
	Tue, 16 Jul 2024 08:41:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0A6EF8026D; Tue, 16 Jul 2024 08:41:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D68F6F8007E
	for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2024 08:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D68F6F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Kz1eXSb+
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46G6fYHd004717;
	Tue, 16 Jul 2024 01:41:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721112094;
	bh=E2SIKmhtinzNu37HFD3FuaXiHlsdUOR1yd/jl8fXQDo=;
	h=From:To:CC:Subject:Date;
	b=Kz1eXSb+7N6DxeaWCRThnY8ND5LIMt9NC+daTF7q7CW2ubUMwXr1nsix4bN5NKqpH
	 nIqd4wr9DfUcN5UTH8KcqoAsR7WtPBfaQao0Miy0TAoiLcwYZdC50FP+bG+OrcVybM
	 MEbsKmcSzXoCpWvlptT8aQlJABip7XJAudsIFekI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46G6fYwI068159
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 01:41:34 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 01:41:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 01:41:33 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.14.243])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46G6fOth072440;
	Tue, 16 Jul 2024 01:41:24 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <13916275206@139.com>, <zhourui@huaqin.com>,
        <alsa-devel@alsa-project.org>, <i-salazar@ti.com>,
        <linux-kernel@vger.kernel.org>, <j-chadha@ti.com>,
        <liam.r.girdwood@intel.com>, <jaden-yue@ti.com>,
        <yung-chuan.liao@linux.intel.com>, <dipa@ti.com>,
 <yuhsuan@google.com>,
        <henry.lo@ti.com>, <tiwai@suse.de>, <baojun.xu@ti.com>,
 <soyer@irl.hu>,
        <Baojun.Xu@fpt.com>, <judyhsiao@google.com>, <navada@ti.com>,
        <cujomalainey@google.com>, <aanya@ti.com>, <nayeem.mahmud@ti.com>,
        <savyasanchi.shukla@netradyne.com>, <flaviopr@microsoft.com>,
        <jesse-ji@ti.com>, <darren.ye@mediatek.com>, <antheas.dk@gmail.com>,
        Shenghao
 Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoc: tas2781: Add TAS2563 into the Header
Date: Tue, 16 Jul 2024 14:41:17 +0800
Message-ID: <20240716064120.158-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Message-ID-Hash: DVEALA4LPXSLW3MDVGPAI2GPQSGPOJFU
X-Message-ID-Hash: DVEALA4LPXSLW3MDVGPAI2GPQSGPOJFU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DVEALA4LPXSLW3MDVGPAI2GPQSGPOJFU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add TAS2563 into the Header in case of misunderstanding and add
channel No information for error debug in tasdevice_dev_read.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - Add TAS2563 into the Header
 - Add channel no into the log in tasdevice_dev_read for error debug
---
 sound/soc/codecs/tas2781-comlib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index 1fbf4560f5cc..58abbc098a91 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// TAS2781 Common functions for HDA and ASoC Audio drivers
+// TAS2563/TAS2781 Common functions for HDA and ASoC Audio drivers
 //
 // Copyright 2023 - 2024 Texas Instruments, Inc.
 //
@@ -64,8 +64,8 @@ static int tasdevice_change_chn_book(struct tasdevice_priv *tas_priv,
 			 */
 			ret = regmap_write(map, TASDEVICE_PAGE_SELECT, 0);
 			if (ret < 0) {
-				dev_err(tas_priv->dev, "%s, E=%d\n",
-					__func__, ret);
+				dev_err(tas_priv->dev, "%s, E=%d channel:%d\n",
+					__func__, ret, chn);
 				goto out;
 			}
 		}
-- 
2.34.1

