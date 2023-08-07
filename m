Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E3B772759
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 16:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5DA4827;
	Mon,  7 Aug 2023 16:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5DA4827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691417806;
	bh=cVEwHQYr8fZfhOS/DoPtmillTn+DY0uBvkZq9fouiDM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kjr+tO3ecusGqTyvgv71TdQUBf5HGFpHjRXawyvMXtRCMpsNvowv2dsknMko64z1G
	 oqS/iFJQziE8vLZPsjmE/8LIiJvToAeVwLMXzkHZqejG8ZfU02GtdmdeysvLllAeOU
	 8Pq7Wn7tku2Z0Oh/bOEbj+P1C6nGpwb9rLsnyvRk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9C38F8016A; Mon,  7 Aug 2023 16:15:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F89EF8016B;
	Mon,  7 Aug 2023 16:15:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96E06F8016D; Mon,  7 Aug 2023 16:15:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7B13F80087
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 16:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7B13F80087
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RKJGp0B1vzfbnw;
	Mon,  7 Aug 2023 22:14:26 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 7 Aug
 2023 22:15:35 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <yuehaibing@huawei.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] ALSA: info: Remove unused function declarations
Date: Mon, 7 Aug 2023 22:15:13 +0800
Message-ID: <20230807141513.31440-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
Message-ID-Hash: AYANS2N3XXVLAHSSRKQDYE6CDHGHQALF
X-Message-ID-Hash: AYANS2N3XXVLAHSSRKQDYE6CDHGHQALF
X-MailFrom: yuehaibing@huawei.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These declarations is never used since beginning of git history.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 include/sound/info.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/sound/info.h b/include/sound/info.h
index 7c13bf52cc81..adbc506860d6 100644
--- a/include/sound/info.h
+++ b/include/sound/info.h
@@ -118,8 +118,6 @@ struct snd_info_entry *snd_info_create_card_entry(struct snd_card *card,
 					     const char *name,
 					     struct snd_info_entry *parent);
 void snd_info_free_entry(struct snd_info_entry *entry);
-int snd_info_store_text(struct snd_info_entry *entry);
-int snd_info_restore_text(struct snd_info_entry *entry);
 
 int snd_info_card_create(struct snd_card *card);
 int snd_info_card_register(struct snd_card *card);
-- 
2.34.1

