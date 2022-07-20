Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 973D157AB93
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 03:14:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CC5B16F9;
	Wed, 20 Jul 2022 03:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CC5B16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658279678;
	bh=xwqQwlX7XMzhwZjDOpafQbywxNNxJ+MX2kfIncl+xMY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ePDEG8J+AiM2//nghzu1eU6JM7s9JgPGCSdikSzjSPwn1rbA9RIwuqX4S4FSGfR/M
	 ARiGz+nzNfza7xNq0IaNmljZWSSw++KTZyUsz5yinONmZjbzpmv8N777vhHYNJkjC2
	 JP2iZp56p2dY+TF8kKj+sdDMoprQBCxcShqZvs1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E89EDF80539;
	Wed, 20 Jul 2022 03:13:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 626F1F80224; Wed, 20 Jul 2022 03:13:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A741F80125
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 03:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A741F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ltl4vQgB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD545B81DED;
 Wed, 20 Jul 2022 01:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A60C341CB;
 Wed, 20 Jul 2022 01:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658279577;
 bh=xwqQwlX7XMzhwZjDOpafQbywxNNxJ+MX2kfIncl+xMY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ltl4vQgBScVimj2MklTeZm/s+VJWCew84muFYavF+VLOf1SwEh96WcSxINSIDzFEj
 YtkEsXdobTfm9c0pWMNPjF7oFB2ceuZmhdt1637jPneqQP8/wh4A1Yvf4dGJwIGqU+
 dKw5+JtBI/GD0BFYu53sDBisdmCr6eYWK1nN8xDTdy0L238i5evj/Zht50OTOca8mM
 uey4cTwvpKmtI4aH/g6EV1DsoFbMZThBvYX4YLsg5I1op2X/42AdFZntHohUweRNkd
 m8cuSF9ct7qmATCr+NmQKdLggp4Df6u6dQIDBjDk0K+jS21/qFQa+OJqUwk9rYUSOk
 Q/8m9Y2Y15odA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 37/54] ASoC: tlv320adcx140: Fix tx_mask check
Date: Tue, 19 Jul 2022 21:10:14 -0400
Message-Id: <20220720011031.1023305-37-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011031.1023305-1-sashal@kernel.org>
References: <20220720011031.1023305-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org, steve@sk2.org,
 Sascha Hauer <s.hauer@pengutronix.de>, zheyuma97@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Sascha Hauer <s.hauer@pengutronix.de>

[ Upstream commit 7d90c8e6396ba245da16bedd789df6d669375408 ]

The tx_mask check doesn't reflect what the driver and the chip support.

The check currently checks for exactly two slots being enabled. The
tlv320adcx140 supports anything between one and eight channels, so relax
the check accordingly.

The tlv320adcx140 supports arbitrary tx_mask settings, but the driver
currently only supports adjacent slots beginning with the first slot,
so extend the check to check that the first slot is being used and that
there are no holes in the tx_mask.

Leave a comment to make it's the driver that limits the tx_mask
settings, not the chip itself.

While at it remove the set-but-unused struct adcx140p_priv::tdm_delay
field.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Link: https://lore.kernel.org/r/20220624105716.2579539-1-s.hauer@pengutronix.de
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/tlv320adcx140.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 32b120d624b2..bf18fcfcaeb9 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -33,7 +33,6 @@ struct adcx140_priv {
 	bool micbias_vg;
 
 	unsigned int dai_fmt;
-	unsigned int tdm_delay;
 	unsigned int slot_width;
 };
 
@@ -792,12 +791,13 @@ static int adcx140_set_dai_tdm_slot(struct snd_soc_dai *codec_dai,
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
-	unsigned int lsb;
 
-	/* TDM based on DSP mode requires slots to be adjacent */
-	lsb = __ffs(tx_mask);
-	if ((lsb + 1) != __fls(tx_mask)) {
-		dev_err(component->dev, "Invalid mask, slots must be adjacent\n");
+	/*
+	 * The chip itself supports arbitrary masks, but the driver currently
+	 * only supports adjacent slots beginning at the first slot.
+	 */
+	if (tx_mask != GENMASK(__fls(tx_mask), 0)) {
+		dev_err(component->dev, "Only lower adjacent slots are supported\n");
 		return -EINVAL;
 	}
 
@@ -812,7 +812,6 @@ static int adcx140_set_dai_tdm_slot(struct snd_soc_dai *codec_dai,
 		return -EINVAL;
 	}
 
-	adcx140->tdm_delay = lsb;
 	adcx140->slot_width = slot_width;
 
 	return 0;
-- 
2.35.1

