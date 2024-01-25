Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C738683BEE2
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 11:33:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 489AAB65;
	Thu, 25 Jan 2024 11:32:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 489AAB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706178786;
	bh=DnL8qyxPAZZwTMxHIG2MKKM+ChzHTpH10rW3atpweQM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yuolv28YXn1mbB8CPj721oWtb6Z3XluPBdLtrQlgaJWDRv4deYt6eW8Qb/g+EtiNj
	 mGY9YAuJO7FsYsMMcrHg3ZoULB94cPaFVhDQ78oxzug3wvYb+FLpJs60AMHCy/4F02
	 MnuZBujY2Pnh0tBFPj/P4zze00q8gZ9arYI+R8mA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0780FF8060B; Thu, 25 Jan 2024 11:31:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A49BF80615;
	Thu, 25 Jan 2024 11:31:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93535F80587; Thu, 25 Jan 2024 11:31:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 879AEF8025F
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 11:31:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 879AEF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SPf5uprr
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40P6oFQ5010841;
	Thu, 25 Jan 2024 04:31:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=2nE2uB7fXFPU8yKpy9Qhz0K5Jd5tNvY/0Pf9AeiGvv0=; b=
	SPf5uprrX9nVIEjL0+VWYcIqrr9qnucaQgRXdcKHS0hXAwwIsVXmsST9X4w7CLiv
	Gmnsx3k0U1AdaOgCmgZfEmzgJN2c8N6McHgh0pvjLUpNnB2EzEdxdhK9wtO0i486
	1Zlm8ijy1d3Zjz9AsOkPdSxE/MvmawDTWC69Di8nBODScS7qOm/LbXJjTOoODgg4
	9wjZq9Usp/4YEkog3hgMRhxtkhkFNT6DvDYRMZdwb7Sy97M6qUJDlWa1Ute0GCjO
	OTfgeIsc4eN19qsdRiUFEQjg2q37XMncakVIETQD6GJuR+ZgzDlG+8EFM3Xt4bfA
	38t2oGQisz6uf2YxIIVF2w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj3jp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:31:20 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:31:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:31:17 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9D61E82024B;
	Thu, 25 Jan 2024 10:31:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH v2 6/7] ASoC: cs42l43: Refactor to use for_each_set_bit()
Date: Thu, 25 Jan 2024 10:31:16 +0000
Message-ID: <20240125103117.2622095-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -pT4GVl0oVzOXTT5zO8ymtKoZoS1uS-W
X-Proofpoint-GUID: -pT4GVl0oVzOXTT5zO8ymtKoZoS1uS-W
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZMISGFN7NRI6B23GCJ3IVLXUYLPA6FDN
X-Message-ID-Hash: ZMISGFN7NRI6B23GCJ3IVLXUYLPA6FDN
X-MailFrom: prvs=8754d201d6=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZMISGFN7NRI6B23GCJ3IVLXUYLPA6FDN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor the code in cs42l43_mask_to_slots() to use for_each_set_bit().

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Added () after funcs in commit message
 - Use BITS_PER_TYPE
 - Pass size into cs42l43_mask_to_slots()

Thanks,
Charles

 sound/soc/codecs/cs42l43.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 1852cb072bd0e..23e9557494afa 100644
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
+static void cs42l43_mask_to_slots(struct cs42l43_codec *priv, unsigned long mask,
+				  int *slots, unsigned int nslots)
 {
-	int i;
+	int i = 0;
+	int slot;
 
-	for (i = 0; i < CS42L43_ASP_MAX_CHANNELS; ++i) {
-		int slot = ffs(mask) - 1;
-
-		if (slot < 0)
+	for_each_set_bit(slot, &mask, BITS_PER_TYPE(mask)) {
+		if (i == nslots) {
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
@@ -580,8 +581,10 @@ static int cs42l43_asp_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mas
 		rx_mask = CS42L43_DEFAULT_SLOTS;
 	}
 
-	cs42l43_mask_to_slots(priv, tx_mask, priv->tx_slots);
-	cs42l43_mask_to_slots(priv, rx_mask, priv->rx_slots);
+	cs42l43_mask_to_slots(priv, tx_mask, priv->tx_slots,
+			      ARRAY_SIZE(priv->tx_slots));
+	cs42l43_mask_to_slots(priv, rx_mask, priv->rx_slots,
+			      ARRAY_SIZE(priv->rx_slots));
 
 	return 0;
 }
@@ -2098,8 +2101,10 @@ static int cs42l43_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, cs42l43->regmap);
 
-	cs42l43_mask_to_slots(priv, CS42L43_DEFAULT_SLOTS, priv->tx_slots);
-	cs42l43_mask_to_slots(priv, CS42L43_DEFAULT_SLOTS, priv->rx_slots);
+	cs42l43_mask_to_slots(priv, CS42L43_DEFAULT_SLOTS, priv->tx_slots,
+			      ARRAY_SIZE(priv->tx_slots));
+	cs42l43_mask_to_slots(priv, CS42L43_DEFAULT_SLOTS, priv->rx_slots,
+			      ARRAY_SIZE(priv->rx_slots));
 
 	priv->component = component;
 	priv->constraint = cs42l43_constraint;
-- 
2.30.2

