Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1CA797963
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 19:12:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5753DF1;
	Thu,  7 Sep 2023 19:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5753DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694106748;
	bh=nGFk3rS7fAIR3MaWNggHlTaneMQ+Lj8aBg1pPKOxNfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qu/i9nYm43pFjnhvxiGj17pDkNwdwqog5rwJWH5TsWBDYvnDa7UQ9xOsNc395mygB
	 pwWZKTyhrNS/6Zqm9XWGs4Oui+EgGodUC52bE7BNY6AuBtnA43bZo3fpLEsh1kuGIe
	 0N63OfJ9o6kYZatUnA+QhMaPq1TVLWnbxOp2OFOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23C42F8059F; Thu,  7 Sep 2023 19:10:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 926C6F80587;
	Thu,  7 Sep 2023 19:10:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA61AF8055A; Thu,  7 Sep 2023 19:10:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30976F800AA
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 19:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30976F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=HLHsLVsm
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7E20866072EC;
	Thu,  7 Sep 2023 18:10:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694106623;
	bh=nGFk3rS7fAIR3MaWNggHlTaneMQ+Lj8aBg1pPKOxNfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HLHsLVsm2dcn3Uh9I48y2sx9s/qYXpkeDS4LMk1GUi7t5VjLRz64zwSawOKioJSM4
	 JSd6v36tBAwHgHZBnsU9+FhB+Oq3MNuJcYoyu79o3nqmCH3brC43y7k2PYCLu49A+Z
	 xwIURVgTW9ES3X7rjEVkg+bbegxCICVAHWRKpSF0NQ6sVluQYoB/LejpHHoOZotSYa
	 FtvsbWzB7DYvJVfcInVd1pGyL78TbU4jJfJbVAFDc2WzqDEpnESJY0sxsYa/c8sxbz
	 zZUjQA/555dkelWJjVmK14tte6x5M8iTidVPzwWVYgEZ7ptxLj1/NCzKbiN/Y03+lV
	 Wx9r0gwYd0oNg==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 03/11] ASoC: cs35l41: Initialize completion object before
 requesting IRQ
Date: Thu,  7 Sep 2023 20:10:02 +0300
Message-ID: <20230907171010.1447274-4-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
References: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L7J7WD6H2374OKKY43HPAVANHLYTL3T5
X-Message-ID-Hash: L7J7WD6H2374OKKY43HPAVANHLYTL3T5
X-MailFrom: cristian.ciocaltea@collabora.com
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7J7WD6H2374OKKY43HPAVANHLYTL3T5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Technically, an interrupt handler can be called before probe() finishes
its execution, hence ensure the pll_lock completion object is always
initialized before being accessed in cs35l41_irq().

Fixes: f5030564938b ("ALSA: cs35l41: Add shared boost feature")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 722b69a6de26..fe5376b3e01b 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1273,6 +1273,8 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 		regmap_update_bits(cs35l41->regmap, CS35L41_IRQ1_MASK3, CS35L41_INT3_PLL_LOCK_MASK,
 				   0 << CS35L41_INT3_PLL_LOCK_SHIFT);
 
+	init_completion(&cs35l41->pll_lock);
+
 	ret = devm_request_threaded_irq(cs35l41->dev, cs35l41->irq, NULL, cs35l41_irq,
 					IRQF_ONESHOT | IRQF_SHARED | irq_pol,
 					"cs35l41", cs35l41);
@@ -1295,8 +1297,6 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 	if (ret < 0)
 		goto err;
 
-	init_completion(&cs35l41->pll_lock);
-
 	pm_runtime_set_autosuspend_delay(cs35l41->dev, 3000);
 	pm_runtime_use_autosuspend(cs35l41->dev);
 	pm_runtime_mark_last_busy(cs35l41->dev);
-- 
2.41.0

