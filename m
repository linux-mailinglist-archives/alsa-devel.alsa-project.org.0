Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FF583AEE6
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 17:58:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13CBF84A;
	Wed, 24 Jan 2024 17:57:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13CBF84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706115483;
	bh=wxtf97Sxw5G039m04Tp+rFCFkJ640+gy+kvY5O170Mc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o5SwcKPqcxriLruxkvRmn67SACzMRn+YP6vPLWS6y/ZgPad29ZWWJGmeV4qVKKIXd
	 sSoMbDPl/dnxCbYyY3RclNSrr7eSyrqdsL05FcjlVPz2gY8oEFJzz2ugW40FKkdVou
	 h3VmfKGTf8tG/JTvZhpEwlkSzZvL1St73SOWpqZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B112EF80638; Wed, 24 Jan 2024 17:56:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3958F80610;
	Wed, 24 Jan 2024 17:56:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF5BFF805A9; Wed, 24 Jan 2024 17:56:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40834F802E8
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 17:56:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40834F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=MQpST+QA
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O6Pu38003749;
	Wed, 24 Jan 2024 10:56:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=ZzQMAAWOXu0vUBEJnnr8IfbgwcLjZg00jUj7hF5DxuM=; b=
	MQpST+QAGvydOF5NrLlR3DclXvnt0CDt4qvzDoAJj0UiI5AGk6q7ShhqRypA3CtV
	uxwocwWTAnM2ZkR70r6O5r2i8tq6jpCPopAEmxCL766R6jZ8nitFvqxLB8how/6r
	huI6USEX7na9f38ewMFj/1oDzCJ/VmTiBhsPdwWLXc4jjl4TkB8gCdsPxizupfP9
	kI0R7llHoO0gr7OSitLd7rwNmCzmGePLh89vEoGmW6+OTs55V9BTJNNo1xcpNvve
	cN0NcHdk1AL74/q5bikMCe+r+RY6YJBWeFSbsOpwpoadfTkLEUNrukgPgFmHl19I
	5+gZ+uuvZIthL4PYIzFgkA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhh44r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 10:56:02 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 16:55:59 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 16:55:59 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1532382024B;
	Wed, 24 Jan 2024 16:55:59 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH 6/7] ASoC: cs42l43: Refactor to use for_each_set_bit
Date: Wed, 24 Jan 2024 16:55:57 +0000
Message-ID: <20240124165558.1876407-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TTkhn6GQgW9qAi99FLDbHR2rRIJAhX2S
X-Proofpoint-GUID: TTkhn6GQgW9qAi99FLDbHR2rRIJAhX2S
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7EDNLWKFUTNPUG3HTY3MHKHWRKD4URDB
X-Message-ID-Hash: 7EDNLWKFUTNPUG3HTY3MHKHWRKD4URDB
X-MailFrom: prvs=8753590469=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7EDNLWKFUTNPUG3HTY3MHKHWRKD4URDB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor the code in cs42l43_mask_to_slots to use for_each_set_bit.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 1852cb072bd0e..05ca20d4fd622 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -6,10 +6,12 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 
 #include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
+#include <linux/find.h>
 #include <linux/gcd.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
@@ -547,23 +549,22 @@ static int cs42l43_asp_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-static void cs42l43_mask_to_slots(struct cs42l43_codec *priv, unsigned int mask, int *slots)
+static void cs42l43_mask_to_slots(struct cs42l43_codec *priv,
+				  unsigned long mask, int *slots)
 {
-	int i;
+	int i = 0;
+	int slot;
 
-	for (i = 0; i < CS42L43_ASP_MAX_CHANNELS; ++i) {
-		int slot = ffs(mask) - 1;
-
-		if (slot < 0)
+	for_each_set_bit(slot, &mask, sizeof(mask) * BITS_PER_BYTE) {
+		if (i == CS42L43_ASP_MAX_CHANNELS) {
+			dev_warn(priv->dev, "Too many channels in TDM mask: %lx\n",
+				 mask);
 			return;
+		}
 
-		slots[i] = slot;
-
-		mask &= ~(1 << slot);
+		slots[i++] = slot;
 	}
 
-	if (mask)
-		dev_warn(priv->dev, "Too many channels in TDM mask\n");
 }
 
 static int cs42l43_asp_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
-- 
2.30.2

