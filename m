Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDAC68E46D
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:32:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCF62FA;
	Wed,  8 Feb 2023 00:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCF62FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675812748;
	bh=nxo4Zb66w1eIe+mN83K0Syc5b5UVVfS5ABRQkEweHz8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WjaFmNcHYAzmIHn/gkxU1+8E+ZsJCH8+7zXQ1CjW7wMPyLbAhPRi8c+NVNz88ltoI
	 VvXjgE99PDJy9rXynVF0pAhQPK1AsFcNOGRERh93bEaK9XuVq7d56F8vmqrwdmNEj7
	 0swHezu6VRGyr9qBCW1ZjtQIxsA7QYneqmN7sr2M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F17DBF804CC;
	Wed,  8 Feb 2023 00:31:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40F01F8051D; Wed,  8 Feb 2023 00:31:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 364B2F800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:31:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 364B2F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=f1uZqHAQ
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C07416602085;
	Tue,  7 Feb 2023 16:25:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675787138;
	bh=nxo4Zb66w1eIe+mN83K0Syc5b5UVVfS5ABRQkEweHz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f1uZqHAQDZ6HvpfmznRbNNNS1FU65E9RkCWtZ4EpRhnegYVCdPeKhzN9maLNO1k5a
	 baTvuCkJOpfo46Vo9yyXsSGMj/+sAStR8m60V2auTkKxwnAisF2GXbAVlvA0HFyJUN
	 MMR1NLlYKIHVcU5kcL9MK84j4v8aRWdjtabH5iJFlGul+g5pNOF6RDHvEufjvK8vdM
	 bGa0h+8L0qeTSzgCiZaybtOrk2/RQIwll0jRQbeiAu3LwvbgEvrJ+7BQma5Qvh9iHF
	 kR4q2JEw0e//CpVCb7RpB64dXddsJAgHXINhrQkaTw9PxMDlX/iqkH7BEiWGWvA3RR
	 c7eoiNhPgI8Ow==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/5] ASoC: cs35l41: Only disable internal boost
Date: Tue,  7 Feb 2023 16:25:22 +0000
Message-Id: <20230207162526.1024286-2-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207162526.1024286-1-lucas.tanure@collabora.com>
References: <20230207162526.1024286-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U2FPPG2FJIVEVEOMO5KJPTTTHOGTFHTU
X-Message-ID-Hash: U2FPPG2FJIVEVEOMO5KJPTTTHOGTFHTU
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Lucas Tanure <lucas.tanure@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U2FPPG2FJIVEVEOMO5KJPTTTHOGTFHTU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In error situations, only the internal boost case
should be disabled and re-enabled.
Also, for other boost cases re-enabling the boost
to the default internal boost config is incorrect.

Fixes: 6450ef559056 ("ASoC: cs35l41: CS35L41 Boosted Smart Amplifier")
Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
---
 sound/soc/codecs/cs35l41.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index c223d83e02cf..f2b5032daa6a 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -356,6 +356,19 @@ static const struct snd_kcontrol_new cs35l41_aud_controls[] = {
 	WM_ADSP_FW_CONTROL("DSP1", 0),
 };
 
+static void cs35l41_boost_enable(struct cs35l41_private *cs35l41, unsigned int enable)
+{
+	switch (cs35l41->hw_cfg.bst_type) {
+	case CS35L41_INT_BOOST:
+		enable = enable ? CS35L41_BST_EN_DEFAULT : CS35L41_BST_DIS_FET_OFF;
+		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2, CS35L41_BST_EN_MASK,
+				enable << CS35L41_BST_EN_SHIFT);
+		break;
+	default:
+		break;
+	}
+}
+
 static irqreturn_t cs35l41_irq(int irq, void *data)
 {
 	struct cs35l41_private *cs35l41 = data;
@@ -431,8 +444,7 @@ static irqreturn_t cs35l41_irq(int irq, void *data)
 
 	if (status[0] & CS35L41_BST_OVP_ERR) {
 		dev_crit_ratelimited(cs35l41->dev, "VBST Over Voltage error\n");
-		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
-				   CS35L41_BST_EN_MASK, 0);
+		cs35l41_boost_enable(cs35l41, 0);
 		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
 			     CS35L41_BST_OVP_ERR);
 		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
@@ -441,16 +453,13 @@ static irqreturn_t cs35l41_irq(int irq, void *data)
 				   CS35L41_BST_OVP_ERR_RLS);
 		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
 				   CS35L41_BST_OVP_ERR_RLS, 0);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
-				   CS35L41_BST_EN_MASK,
-				   CS35L41_BST_EN_DEFAULT << CS35L41_BST_EN_SHIFT);
+		cs35l41_boost_enable(cs35l41, 1);
 		ret = IRQ_HANDLED;
 	}
 
 	if (status[0] & CS35L41_BST_DCM_UVP_ERR) {
 		dev_crit_ratelimited(cs35l41->dev, "DCM VBST Under Voltage Error\n");
-		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
-				   CS35L41_BST_EN_MASK, 0);
+		cs35l41_boost_enable(cs35l41, 0);
 		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
 			     CS35L41_BST_DCM_UVP_ERR);
 		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
@@ -459,16 +468,13 @@ static irqreturn_t cs35l41_irq(int irq, void *data)
 				   CS35L41_BST_UVP_ERR_RLS);
 		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
 				   CS35L41_BST_UVP_ERR_RLS, 0);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
-				   CS35L41_BST_EN_MASK,
-				   CS35L41_BST_EN_DEFAULT << CS35L41_BST_EN_SHIFT);
+		cs35l41_boost_enable(cs35l41, 1);
 		ret = IRQ_HANDLED;
 	}
 
 	if (status[0] & CS35L41_BST_SHORT_ERR) {
 		dev_crit_ratelimited(cs35l41->dev, "LBST error: powering off!\n");
-		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
-				   CS35L41_BST_EN_MASK, 0);
+		cs35l41_boost_enable(cs35l41, 0);
 		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
 			     CS35L41_BST_SHORT_ERR);
 		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
@@ -477,9 +483,7 @@ static irqreturn_t cs35l41_irq(int irq, void *data)
 				   CS35L41_BST_SHORT_ERR_RLS);
 		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
 				   CS35L41_BST_SHORT_ERR_RLS, 0);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL2,
-				   CS35L41_BST_EN_MASK,
-				   CS35L41_BST_EN_DEFAULT << CS35L41_BST_EN_SHIFT);
+		cs35l41_boost_enable(cs35l41, 1);
 		ret = IRQ_HANDLED;
 	}
 
-- 
2.39.1

