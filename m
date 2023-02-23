Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9AA6A0420
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Feb 2023 09:47:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BDF086E;
	Thu, 23 Feb 2023 09:46:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BDF086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677142049;
	bh=QE7F/onyjKYUPvtkvg2U39BtyxJXdvTS4fCO6hEXZIY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HTT/J4EwlIvsR/hcanBGB1vwJ8iHhej/7qrILG+yoBYS29hQ+G5BpwyA/7U1PocBF
	 +W5g1fHRUiJADZrj6vDW9f7qo+6XU8D6NtMVuIHsctml0a4Cyg0qfty1ICm5vmRN72
	 RhZhvRg35rEcGLbCKKjfoEv8BwqO21emdeEg1vwI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80120F80496;
	Thu, 23 Feb 2023 09:45:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C583F8047C; Thu, 23 Feb 2023 09:43:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01C78F800B6
	for <alsa-devel@alsa-project.org>; Thu, 23 Feb 2023 09:43:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01C78F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=C7MvA1tR
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 39B4B66021F7;
	Thu, 23 Feb 2023 08:43:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677141808;
	bh=QE7F/onyjKYUPvtkvg2U39BtyxJXdvTS4fCO6hEXZIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C7MvA1tRyPux1+w5Wovt7K2nawhdfLMInpMsJgE8DZrwcOw6Qs2D+xZrzVyz6QuEk
	 XWQJRV/HkYg9lQm4jChIJ+50v3GUp7Y2dxOW9BzABuHikCMHWuPYbW8BgcShp2Ov74
	 AsqBWH+uLEMCB2A8vRwhqgA2yBcOdEgfSwQjDWHCWkFOj63P8YWz2pVUcBM8ZRizG5
	 f4WBUHHEHM2AQJYKLnZD7VftOVHCmPBCJEdcEzZoywwZOOzoWMfRuzAj2cMCPtZ9kq
	 WBWH0u/Abkh/GOq0kWT0xsVMbJIvGaVOQdrhveK4iVglWyVvEnrE2YGRr6iz5a4I+m
	 8+phGRPsiR9fg==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v7 2/4] ASoC: cs35l41: Refactor error release code
Date: Thu, 23 Feb 2023 08:43:22 +0000
Message-Id: <20230223084324.9076-3-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223084324.9076-1-lucas.tanure@collabora.com>
References: <20230223084324.9076-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U6AUL2PBBZCNRFYCPWIIX2WEUQAV62KI
X-Message-ID-Hash: U6AUL2PBBZCNRFYCPWIIX2WEUQAV62KI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U6AUL2PBBZCNRFYCPWIIX2WEUQAV62KI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add cs35l41_error_release function to handle error release sequences.

Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 64 ++++++++++----------------------------
 1 file changed, 16 insertions(+), 48 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index f2b5032daa6a..c006364e5335 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -369,6 +369,16 @@ static void cs35l41_boost_enable(struct cs35l41_private *cs35l41, unsigned int e
 	}
 }
 
+
+static void cs35l41_error_release(struct cs35l41_private *cs35l41, unsigned int irq_err_bit,
+				  unsigned int rel_err_bit)
+{
+	regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1, irq_err_bit);
+	regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
+	regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, rel_err_bit, rel_err_bit);
+	regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, rel_err_bit, 0);
+}
+
 static irqreturn_t cs35l41_irq(int irq, void *data)
 {
 	struct cs35l41_private *cs35l41 = data;
@@ -405,54 +415,26 @@ static irqreturn_t cs35l41_irq(int irq, void *data)
 	 */
 	if (status[0] & CS35L41_AMP_SHORT_ERR) {
 		dev_crit_ratelimited(cs35l41->dev, "Amp short error\n");
-		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
-			     CS35L41_AMP_SHORT_ERR);
-		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
-				   CS35L41_AMP_SHORT_ERR_RLS,
-				   CS35L41_AMP_SHORT_ERR_RLS);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
-				   CS35L41_AMP_SHORT_ERR_RLS, 0);
+		cs35l41_error_release(cs35l41, CS35L41_AMP_SHORT_ERR, CS35L41_AMP_SHORT_ERR_RLS);
 		ret = IRQ_HANDLED;
 	}
 
 	if (status[0] & CS35L41_TEMP_WARN) {
 		dev_crit_ratelimited(cs35l41->dev, "Over temperature warning\n");
-		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
-			     CS35L41_TEMP_WARN);
-		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
-				   CS35L41_TEMP_WARN_ERR_RLS,
-				   CS35L41_TEMP_WARN_ERR_RLS);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
-				   CS35L41_TEMP_WARN_ERR_RLS, 0);
+		cs35l41_error_release(cs35l41, CS35L41_TEMP_WARN, CS35L41_TEMP_WARN_ERR_RLS);
 		ret = IRQ_HANDLED;
 	}
 
 	if (status[0] & CS35L41_TEMP_ERR) {
 		dev_crit_ratelimited(cs35l41->dev, "Over temperature error\n");
-		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
-			     CS35L41_TEMP_ERR);
-		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
-				   CS35L41_TEMP_ERR_RLS,
-				   CS35L41_TEMP_ERR_RLS);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
-				   CS35L41_TEMP_ERR_RLS, 0);
+		cs35l41_error_release(cs35l41, CS35L41_TEMP_ERR, CS35L41_TEMP_ERR_RLS);
 		ret = IRQ_HANDLED;
 	}
 
 	if (status[0] & CS35L41_BST_OVP_ERR) {
 		dev_crit_ratelimited(cs35l41->dev, "VBST Over Voltage error\n");
 		cs35l41_boost_enable(cs35l41, 0);
-		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
-			     CS35L41_BST_OVP_ERR);
-		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
-				   CS35L41_BST_OVP_ERR_RLS,
-				   CS35L41_BST_OVP_ERR_RLS);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
-				   CS35L41_BST_OVP_ERR_RLS, 0);
+		cs35l41_error_release(cs35l41, CS35L41_BST_OVP_ERR, CS35L41_BST_OVP_ERR_RLS);
 		cs35l41_boost_enable(cs35l41, 1);
 		ret = IRQ_HANDLED;
 	}
@@ -460,14 +442,7 @@ static irqreturn_t cs35l41_irq(int irq, void *data)
 	if (status[0] & CS35L41_BST_DCM_UVP_ERR) {
 		dev_crit_ratelimited(cs35l41->dev, "DCM VBST Under Voltage Error\n");
 		cs35l41_boost_enable(cs35l41, 0);
-		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
-			     CS35L41_BST_DCM_UVP_ERR);
-		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
-				   CS35L41_BST_UVP_ERR_RLS,
-				   CS35L41_BST_UVP_ERR_RLS);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
-				   CS35L41_BST_UVP_ERR_RLS, 0);
+		cs35l41_error_release(cs35l41, CS35L41_BST_DCM_UVP_ERR, CS35L41_BST_UVP_ERR_RLS);
 		cs35l41_boost_enable(cs35l41, 1);
 		ret = IRQ_HANDLED;
 	}
@@ -475,14 +450,7 @@ static irqreturn_t cs35l41_irq(int irq, void *data)
 	if (status[0] & CS35L41_BST_SHORT_ERR) {
 		dev_crit_ratelimited(cs35l41->dev, "LBST error: powering off!\n");
 		cs35l41_boost_enable(cs35l41, 0);
-		regmap_write(cs35l41->regmap, CS35L41_IRQ1_STATUS1,
-			     CS35L41_BST_SHORT_ERR);
-		regmap_write(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN, 0);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
-				   CS35L41_BST_SHORT_ERR_RLS,
-				   CS35L41_BST_SHORT_ERR_RLS);
-		regmap_update_bits(cs35l41->regmap, CS35L41_PROTECT_REL_ERR_IGN,
-				   CS35L41_BST_SHORT_ERR_RLS, 0);
+		cs35l41_error_release(cs35l41, CS35L41_BST_SHORT_ERR, CS35L41_BST_SHORT_ERR_RLS);
 		cs35l41_boost_enable(cs35l41, 1);
 		ret = IRQ_HANDLED;
 	}
-- 
2.39.2

