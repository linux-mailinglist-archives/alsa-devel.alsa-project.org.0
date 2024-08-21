Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA0C95AF59
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 09:32:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4D8383E;
	Thu, 22 Aug 2024 09:32:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4D8383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724311972;
	bh=Ad5taQnaxXCn0Fcymptyag1gQ3UI8NWbmdclq+fU0dk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cr9Hsu3ikpHVx8frttNoNphVUAnl1LO5kxDBtJ5i2jw2F2hsv740xFg6vMIYyXQfF
	 Y9xeII5G8vRri3tr7DhzVl9YSOuS+f9Ujzk4BCRhxanpdqjkFQPAbNHe2BKqKKhCgY
	 F31GgLM7q39aAy0k1TSAB2iqsSqeWLkQf9I1r7Ts=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68E31F805E3; Thu, 22 Aug 2024 09:31:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BEDDF80601;
	Thu, 22 Aug 2024 09:31:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3966F80517; Wed, 21 Aug 2024 09:00:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B563DF8016E
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 09:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B563DF8016E
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Wpcg11ZGPz1S8PG;
	Wed, 21 Aug 2024 15:00:45 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id E38C21A0190;
	Wed, 21 Aug 2024 15:00:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 Aug
 2024 15:00:47 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <peter.ujfalusi@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH -next 5/5] sound/soc: fix macro definition on
 STM_SAI_HAS_EXT_SYNC
Date: Wed, 21 Aug 2024 15:08:15 +0800
Message-ID: <20240821070815.2326534-6-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821070815.2326534-1-lihongbo22@huawei.com>
References: <20240821070815.2326534-1-lihongbo22@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-MailFrom: lihongbo22@huawei.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CI4YQE4W6AHIHJSLGT4PJESEQXFNNG5H
X-Message-ID-Hash: CI4YQE4W6AHIHJSLGT4PJESEQXFNNG5H
X-Mailman-Approved-At: Thu, 22 Aug 2024 07:28:28 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CI4YQE4W6AHIHJSLGT4PJESEQXFNNG5H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The macro STM_SAI_HAS_EXT_SYNC accepts a parameter x, but
it was not used, rather the variable sai was directly used,
which may be a local variable inside a function that calls
the macros.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 sound/soc/stm/stm32_sai_sub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index ad2492efb1cd..40efd2854e87 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -53,7 +53,7 @@
 #define STM_SAI_PROTOCOL_IS_SPDIF(ip)	((ip)->spdif)
 #define STM_SAI_HAS_SPDIF(x)	((x)->pdata->conf.has_spdif_pdm)
 #define STM_SAI_HAS_PDM(x)	((x)->pdata->conf.has_spdif_pdm)
-#define STM_SAI_HAS_EXT_SYNC(x) (!STM_SAI_IS_F4(sai->pdata))
+#define STM_SAI_HAS_EXT_SYNC(x) (!STM_SAI_IS_F4((x)->pdata))
 
 #define SAI_IEC60958_BLOCK_FRAMES	192
 #define SAI_IEC60958_STATUS_BYTES	24
-- 
2.34.1

