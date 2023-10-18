Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 005427CDEC8
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 16:14:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B338E0E;
	Wed, 18 Oct 2023 16:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B338E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697638457;
	bh=/w5UhJTlM4f3g0xvKK31B3U73QejfR514S44BgEBF04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tXeIkQRl2nWaAHHgPRarpdua/dtWSRBR7z9qZ1PpG8hyHRcBpwkhRS5ygXh7x1NSU
	 gtpSiEl1j/YoXtbaGxams+Ab+uM4ZtdAbD+o+Jad8aWGJXhmU6usAA3vU3SdVNirNS
	 4qMglG5pwcOXw9bhft8/sc8vkrGnIs6WnWMzgfDs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 232A4F805AD; Wed, 18 Oct 2023 16:12:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DDC3F80558;
	Wed, 18 Oct 2023 16:12:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFC9FF80579; Wed, 18 Oct 2023 16:12:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33146F800C9
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 16:12:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33146F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G5Fg/J5l
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 704CCB82374;
	Wed, 18 Oct 2023 14:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953A4C433C8;
	Wed, 18 Oct 2023 14:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697638331;
	bh=/w5UhJTlM4f3g0xvKK31B3U73QejfR514S44BgEBF04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G5Fg/J5llAHLXg0PoeUbtm3P65rLNOGrgvqeiVf60LhHwLdNoWymM+v0XjKaSTzxg
	 YKovYwhQGxC13A/xUlf/LVOv/UVLFR0WezwFzEuwF4K5aLwnZRY4tIEvQGo+H9U6Z8
	 Ewr2pjXqq7XMOpEoLIUccsb3TOwmaasu4fnUrk4aImMENuN5extY+fPDDxB07gJ8Zn
	 GK29//4M82ONrdOAQkAhR6nmSpX9XDhT5aFOFunobLQiH9Up3Z0jLAsLKT42HWBBL6
	 tNYzv+iuIS15lfFNINAyQjIqLW1vsIj3Ak2JagsnhcHX68kTILApkpVDGZ9eW/kRY2
	 nEyVdb/1388Ig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.5 07/31] ASoC: fsl-asoc-card: use integer type for
 fll_id and pll_id
Date: Wed, 18 Oct 2023 10:11:24 -0400
Message-Id: <20231018141151.1334501-7-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018141151.1334501-1-sashal@kernel.org>
References: <20231018141151.1334501-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.7
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2LVHMBDCTDGGGMAHQDUJMH4PWSGRTRYD
X-Message-ID-Hash: 2LVHMBDCTDGGGMAHQDUJMH4PWSGRTRYD
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2LVHMBDCTDGGGMAHQDUJMH4PWSGRTRYD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shengjiu Wang <shengjiu.wang@nxp.com>

[ Upstream commit 2b21207afd06714986a3d22442ed4860ba4f9ced ]

As the pll_id and pll_id can be zero (WM8960_SYSCLK_AUTO)
with the commit 2bbc2df46e67 ("ASoC: wm8960: Make automatic the
default clocking mode")

Then the machine driver will skip to call set_sysclk() and set_pll()
for codec, when the sysclk rate is different with what wm8960 read
at probe, the output sound frequency is wrong.

So change the fll_id and pll_id initial value, still keep machine
driver's behavior same as before.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://lore.kernel.org/r/1695202992-24864-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl-asoc-card.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 76b5bfc288fde..bab7d34cf585b 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -52,8 +52,8 @@ struct codec_priv {
 	unsigned long mclk_freq;
 	unsigned long free_freq;
 	u32 mclk_id;
-	u32 fll_id;
-	u32 pll_id;
+	int fll_id;
+	int pll_id;
 };
 
 /**
@@ -206,7 +206,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* Specific configuration for PLL */
-	if (codec_priv->pll_id && codec_priv->fll_id) {
+	if (codec_priv->pll_id >= 0 && codec_priv->fll_id >= 0) {
 		if (priv->sample_format == SNDRV_PCM_FORMAT_S24_LE)
 			pll_out = priv->sample_rate * 384;
 		else
@@ -248,7 +248,7 @@ static int fsl_asoc_card_hw_free(struct snd_pcm_substream *substream)
 
 	priv->streams &= ~BIT(substream->stream);
 
-	if (!priv->streams && codec_priv->pll_id && codec_priv->fll_id) {
+	if (!priv->streams && codec_priv->pll_id >= 0 && codec_priv->fll_id >= 0) {
 		/* Force freq to be free_freq to avoid error message in codec */
 		ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
 					     codec_priv->mclk_id,
@@ -621,6 +621,10 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	priv->card.dapm_routes = audio_map;
 	priv->card.num_dapm_routes = ARRAY_SIZE(audio_map);
 	priv->card.driver_name = DRIVER_NAME;
+
+	priv->codec_priv.fll_id = -1;
+	priv->codec_priv.pll_id = -1;
+
 	/* Diversify the card configurations */
 	if (of_device_is_compatible(np, "fsl,imx-audio-cs42888")) {
 		codec_dai_name = "cs42888";
-- 
2.40.1

