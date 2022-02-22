Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 721754C0576
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 00:43:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1541818DA;
	Wed, 23 Feb 2022 00:43:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1541818DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645573437;
	bh=QbRs3di/FkyL2pw02uj/oYyr+jPs92Uy8K2Sk02jeL4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=STtKB+4L5GwXAsNqnayx7cJmlaUL7xyZrEfDDq6WF6rDtfQYIWbDnfQtU0Tb4WTFt
	 5QIQ3LGaWJ3OUPMJaIemmh2cfE+yjiku6X9pi68ChPtbHfoJRTkan9vZXBeCmq+mDB
	 uCXgQituwGuwFMKXvjVoJ7U4Dj+PyS0mfNypkEO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B401F80538;
	Wed, 23 Feb 2022 00:40:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36E0BF80519; Wed, 23 Feb 2022 00:40:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20F1BF80519
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 00:40:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20F1BF80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P3uy3Vr3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8D271B81D5F;
 Tue, 22 Feb 2022 23:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29017C340F5;
 Tue, 22 Feb 2022 23:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645573241;
 bh=QbRs3di/FkyL2pw02uj/oYyr+jPs92Uy8K2Sk02jeL4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P3uy3Vr3fgMklxwluEzySWCGIHUqjLYqiRH6K/eKCR4vguYESMoF4TmA+dkPP2K1d
 ziPFOEnZLWL8eB5ZnS8VZkqLd145velFYf8eLyKBD83iA8ymdNFUQa3jy3EhGr2lx9
 4oOLvXJ2SKC5XtBbejZLoLYp/cL/bGACOkIJK+NHXvkv9AgzazCARu6Zp82BXGNTEH
 dcI+9jQ4IL6e96WsPH3CzQXwGwlcnDBgmOPk03yFHmDGYbCU6TPJOmF6NrD7zRGtKU
 1xVjRaMCq42Sjx3wUhYaCdcuHzHCA/R2kNTSNa5rG+6bfign0HgF+0c5fqdj0SGZ+c
 xkmLRHqZyDoAQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 07/10] ASoC: max9867: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 23:40:23 +0000
Message-Id: <20220222234026.712070-7-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222234026.712070-1-broonie@kernel.org>
References: <20220222234026.712070-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754; h=from:subject;
 bh=QbRs3di/FkyL2pw02uj/oYyr+jPs92Uy8K2Sk02jeL4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFXQqQdkllOk96fYB1cR3bGOky2MxO5CCJYDmVcMz
 dOr7h0SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhV0KgAKCRAk1otyXVSH0GJWB/
 0cuE/+ZkbKqxLoF4cBYOYE70r2vqINe0Rk+LOnrWM/mvHYyu3PerYboSut6ycb4zXH2uvjo4/14od/
 WRM0nDd6CS87Bkqgssoj/wTlUAMHRZyABQE82OqKXk9+ynD2nGMS/PrUcS+co9ijlznOUm0+3azTUN
 ukwW9vkCIC+X1ZXkAe/E75iHtfU42yzXb9sHLleBDZJu2y7IOy5pajIHJBHEbgodpLhjGX5I3Fby68
 ZpdJpf9BIBvsa2CJxBphy8BY6OQGo5a/uef16BFGojyHKrZxG0zOriUBRvu84sHZh+MfIsGRy0cmE2
 3lcoaCWLD3/sC40UsMA2wwpEDub70i
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Peter Rosin <peda@axentia.se>
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

As part of moving to remove the old style defines for the bus clocks update
the max9867 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max9867.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 09b2d730e9fd..c2b1151c75cc 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -19,7 +19,7 @@ struct max9867_priv {
 	struct regmap *regmap;
 	const struct snd_pcm_hw_constraint_list *constraints;
 	unsigned int sysclk, pclk;
-	bool master, dsp_a;
+	bool provider, dsp_a;
 	unsigned int adc_dac_active;
 };
 
@@ -335,7 +335,7 @@ static int max9867_dai_hw_params(struct snd_pcm_substream *substream,
 		MAX9867_NI_HIGH_MASK, (0xFF00 & ni) >> 8);
 	regmap_update_bits(max9867->regmap, MAX9867_AUDIOCLKLOW,
 		MAX9867_NI_LOW_MASK, 0x00FF & ni);
-	if (max9867->master) {
+	if (max9867->provider) {
 		if (max9867->dsp_a) {
 			value = MAX9867_IFC1B_48X;
 		} else {
@@ -442,14 +442,14 @@ static int max9867_dai_set_fmt(struct snd_soc_dai *codec_dai,
 	struct max9867_priv *max9867 = snd_soc_component_get_drvdata(component);
 	u8 iface1A, iface1B;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-		max9867->master = true;
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+		max9867->provider = true;
 		iface1A = MAX9867_MASTER;
 		iface1B = MAX9867_IFC1B_48X;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
-		max9867->master = false;
+	case SND_SOC_DAIFMT_CBC_CFC:
+		max9867->provider = false;
 		iface1A = iface1B = 0;
 		break;
 	default:
-- 
2.30.2

