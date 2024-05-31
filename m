Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFC68D615B
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 14:09:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7202184D;
	Fri, 31 May 2024 14:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7202184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717157355;
	bh=1k9t6jehRo7chIdZq9uoVU5h/rfm2SsMzqY7xyvvVbc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IJeY/ah9kq64N2EjKCMUjlvmgvEKlYLv9LvbGeYLar0wyf17JlAhO0AZc118sys4v
	 kEheSFtATpbf7F8OMzzguTYuarn6uZOcgVqksyk36qxm7nYOjOWGKFuyA9VNSqPp2J
	 68dFq9/7CtghlsNFlEdwLuSYIjG/Q6jpylCI7aaY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00E7AF8047C; Fri, 31 May 2024 14:08:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C982F80496;
	Fri, 31 May 2024 14:08:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B036F8026D; Fri, 31 May 2024 14:08:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D0A3F800AC
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 14:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D0A3F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=WTtiUWul
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44V9Swja003313;
	Fri, 31 May 2024 07:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=jojeGL9NyCQPAKin
	3J/C+KRxMKRG2M3M0NSuFuoQxSM=; b=WTtiUWul1jMchiPb35GkiMk6reG9QZuI
	48PSnH7FRwqA+ufeElYJFPPyAttpKcGEgJLi7YJy5Sx4Bm3dQCDkHkj6BjxebA23
	LvpHU6rrdtntXesH7YLoxoVTnJaUbPFe7wEfBjz9x7niJc2Yxaq/4p4FHd8Ava3Y
	qsEEuxDnQug6fRSZ7po6MhMwny4XNWqBtHgZET1NUhkjyFoe6Z5qrsjg5/vI4b7J
	xnftqLmiUCfAGXmQ/y//2xgH/MfbVrABHyVn0/7KRU4wrRN+GodFF5/G/yIS6mcJ
	xg0Pnl36qQboKIfahQkTgY4mxr9FDX8H2Sq4MByJg3+sxj+r+1gIMQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ybdcwwr9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 07:08:26 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 13:08:23 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 31 May 2024 13:08:23 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.65.72])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8B538820249;
	Fri, 31 May 2024 12:08:23 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l41: Possible null pointer dereference in
 cs35l41_hda_unbind()
Date: Fri, 31 May 2024 13:08:20 +0100
Message-ID: <20240531120820.35367-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kwle0reXsEGM8-ag8K8DUTPDf-O3TQxB
X-Proofpoint-ORIG-GUID: kwle0reXsEGM8-ag8K8DUTPDf-O3TQxB
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4PD5N7N6Z7JNKMKJOA3Y6W64YQKB7XIE
X-Message-ID-Hash: 4PD5N7N6Z7JNKMKJOA3Y6W64YQKB7XIE
X-MailFrom: prvs=3881dca93d=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4PD5N7N6Z7JNKMKJOA3Y6W64YQKB7XIE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs35l41_hda_unbind() function clears the hda_component entry
matching it's index and then dereferences the codec pointer held in the
first element of the hda_component array, this is an issue when the
device index was 0.

Instead use the codec pointer stashed in the cs35l41_hda structure as it
will still be valid.

Fixes: 7cf5ce66dfda ("ALSA: hda: cs35l41: Add device_link between HDA and cs35l41_hda")
Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 6c49e5c6cd20..d54d4d60b03e 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1495,7 +1495,7 @@ static void cs35l41_hda_unbind(struct device *dev, struct device *master, void *
 	if (comps[cs35l41->index].dev == dev) {
 		memset(&comps[cs35l41->index], 0, sizeof(*comps));
 		sleep_flags = lock_system_sleep();
-		device_link_remove(&comps->codec->core.dev, cs35l41->dev);
+		device_link_remove(&cs35l41->codec->core.dev, cs35l41->dev);
 		unlock_system_sleep(sleep_flags);
 	}
 }
-- 
2.34.1

