Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9493661E4B1
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Nov 2022 18:14:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B7271675;
	Sun,  6 Nov 2022 18:13:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B7271675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667754865;
	bh=cteLXXsF83r2USnyf9k+VB4O36var5zXb0jrtcODRiw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mW3JQLFfuEo7cjrDbvBD8S5QP/t1Wyh0Hg+WWaALXn2DwOTsPDB0QZBNxEy6g195l
	 F+6ggTRegQIon4ogDk/2kap3IZZcibfrN6Ff6O8o6/cQtlN6utkpXAhqg14P4kEsqb
	 SCUYj9Lz5j/wGLHY3qhWjDRO8mabfWIE4S0wps+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78383F8060D;
	Sun,  6 Nov 2022 18:06:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 691ACF8061C; Sun,  6 Nov 2022 18:06:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32813F80602
 for <alsa-devel@alsa-project.org>; Sun,  6 Nov 2022 18:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32813F80602
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Xpy9XulI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0C6260CE8;
 Sun,  6 Nov 2022 17:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C140C43470;
 Sun,  6 Nov 2022 17:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667754379;
 bh=cteLXXsF83r2USnyf9k+VB4O36var5zXb0jrtcODRiw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xpy9XulIx5OWBKSxT4Ok9F46SoOzgDCqyQ9+lMhlQhuTc6D2ob187R7kfcqllYlom
 K5RIIMAmdV01VqMfT05cT9g0WDT2Up8pX19WeivPbdO1Jy4fmK8OGZPVvcekQiWfgd
 1jB6WXKGyEsodVK/aMZ1prfREivJNrGSl7F0qWyjG+QVBd/Zt7cjqbzGM0MPoqPZWo
 Rrubnn5fUxn/kHp2lgXap/gemprwJrakNYCKGBnRYm2JtATNYa5qFTJeVHYUHl5se5
 6VudWK5mLNXLhsvTRcAWW2CzTgp/j19ir8Wp01PzLbN1GdinYHj9bYWF5c1VND5ldG
 us4p/0L3Zl7tw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 10/16] ASoC: codecs: jz4725b: fix capture
 selector naming
Date: Sun,  6 Nov 2022 12:05:47 -0500
Message-Id: <20221106170555.1580584-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170555.1580584-1-sashal@kernel.org>
References: <20221106170555.1580584-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, lgirdwood@gmail.com, paul@crapouillou.net,
 Siarhei Volkau <lis8215@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mips@vger.kernel.org
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

From: Siarhei Volkau <lis8215@gmail.com>

[ Upstream commit 80852f8268769715db335a22305e81a0c4a38a84 ]

At the moment Capture source selector appears on Playback
tab in the alsamixer and has a senseless name.

Let's fix that.

Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
Link: https://lore.kernel.org/r/20221016132648.3011729-5-lis8215@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/jz4725b.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 9dc8d76bf104..ab744e375367 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -183,7 +183,7 @@ static SOC_VALUE_ENUM_SINGLE_DECL(jz4725b_codec_adc_src_enum,
 				  jz4725b_codec_adc_src_texts,
 				  jz4725b_codec_adc_src_values);
 static const struct snd_kcontrol_new jz4725b_codec_adc_src_ctrl =
-			SOC_DAPM_ENUM("Route", jz4725b_codec_adc_src_enum);
+	SOC_DAPM_ENUM("ADC Source Capture Route", jz4725b_codec_adc_src_enum);
 
 static const struct snd_kcontrol_new jz4725b_codec_mixer_controls[] = {
 	SOC_DAPM_SINGLE("Line In Bypass", JZ4725B_CODEC_REG_CR1,
@@ -228,7 +228,7 @@ static const struct snd_soc_dapm_widget jz4725b_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_ADC("ADC", "Capture",
 			 JZ4725B_CODEC_REG_PMR1, REG_PMR1_SB_ADC_OFFSET, 1),
 
-	SND_SOC_DAPM_MUX("ADC Source", SND_SOC_NOPM, 0, 0,
+	SND_SOC_DAPM_MUX("ADC Source Capture Route", SND_SOC_NOPM, 0, 0,
 			 &jz4725b_codec_adc_src_ctrl),
 
 	/* Mixer */
@@ -287,11 +287,11 @@ static const struct snd_soc_dapm_route jz4725b_codec_dapm_routes[] = {
 	{"Mixer", NULL, "DAC to Mixer"},
 
 	{"Mixer to ADC", NULL, "Mixer"},
-	{"ADC Source", "Mixer", "Mixer to ADC"},
-	{"ADC Source", "Line In", "Line In"},
-	{"ADC Source", "Mic 1", "Mic 1"},
-	{"ADC Source", "Mic 2", "Mic 2"},
-	{"ADC", NULL, "ADC Source"},
+	{"ADC Source Capture Route", "Mixer", "Mixer to ADC"},
+	{"ADC Sourc Capture Routee", "Line In", "Line In"},
+	{"ADC Source Capture Route", "Mic 1", "Mic 1"},
+	{"ADC Source Capture Route", "Mic 2", "Mic 2"},
+	{"ADC", NULL, "ADC Source Capture Route"},
 
 	{"Out Stage", NULL, "Mixer"},
 	{"HP Out", NULL, "Out Stage"},
-- 
2.35.1

