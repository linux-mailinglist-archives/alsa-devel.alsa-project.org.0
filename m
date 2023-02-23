Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 725F86A041C
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Feb 2023 09:46:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D91184A;
	Thu, 23 Feb 2023 09:45:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D91184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677141998;
	bh=/uNR33hg52LzVuUvSmkhH9OvcQocTCaa2wVQkfF34SA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mpalfJoqHe1zkPIEBtjjJ5zcFlhvpNyp9VZ47v8o3CKNcxkCt9bKcert0ItDve8be
	 UlgFdQttyiM5BuhWV6GYAc3d9QB5atDm7KaQt/ghTH9RuDr9I5Y/j0MNEEIFZvOll1
	 Y7WDraiyaMkNKV/qNpyxysTzwv7iAsGDsVlRtkV0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0799DF800B6;
	Thu, 23 Feb 2023 09:45:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 334DBF80496; Thu, 23 Feb 2023 09:43:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70AA8F80083
	for <alsa-devel@alsa-project.org>; Thu, 23 Feb 2023 09:43:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70AA8F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=haILa11/
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DAF7066021F3;
	Thu, 23 Feb 2023 08:43:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677141808;
	bh=/uNR33hg52LzVuUvSmkhH9OvcQocTCaa2wVQkfF34SA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=haILa11/Ji8arpyQTrl1BTGvWW7hjKqmDOhmqtf+gWedVTCsiHpuVW5G1e6jznPqZ
	 tJnldFT/jnzowm5VcF8lANgRZQ7yWLSOl5St2uANLlgtqMkHuEraDTF9fQqP5T6TzU
	 8RhUNRpB/wguooXs83xewn1giVuR+kYJLi/Pjy02Z5Tg9OM2fPH8pM2vG2bBrPkyqY
	 DHQvDKO39YjKhyAFULmCLwyWy1EDruThKjcFJfP2Q9rrHQuQSMJM0YY3sJNJ6JPFSq
	 SVzqMSvDJXi6IF3zdlMlqYAVX/VrMBtaCxwuQ0+E3tpfw3hQoviGAmvMcl5yptHDCZ
	 sIZVcaznORwhw==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v7 1/4] ASoC: cs35l41: Only disable internal boost
Date: Thu, 23 Feb 2023 08:43:21 +0000
Message-Id: <20230223084324.9076-2-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223084324.9076-1-lucas.tanure@collabora.com>
References: <20230223084324.9076-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7MSIFVE35HECOIQJQXLVRIUIJZVTK2RP
X-Message-ID-Hash: 7MSIFVE35HECOIQJQXLVRIUIJZVTK2RP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7MSIFVE35HECOIQJQXLVRIUIJZVTK2RP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In error situations, only the internal boost case should be disabled and
re-enabled.
Also, for other boost cases re-enabling the boost to the default internal
boost config is incorrect.

Fixes: 6450ef559056 ("ASoC: cs35l41: CS35L41 Boosted Smart Amplifier")
Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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
2.39.2

