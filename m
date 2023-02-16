Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B19C8699169
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 11:35:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97158DF1;
	Thu, 16 Feb 2023 11:34:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97158DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676543718;
	bh=6uIzQS1xNpwxFvvbM87RxfIH+mS9cj2FTgkkgyvBiJ8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QQhBpwtxhGmXEcVp7RAyNzDdtk4yYKvCLdqWMdUs/WQ0lz3HGMYMi9Mlb5JRiQaW5
	 sxyf1luvnQqiD6bWeN3bwzMHfqR/sRMUe63JzFiBrv+ZYXkqS2/fMTODxyeFR4ChkO
	 San9kr1hIRK6FKmyO8RwZWuMygteU17m3T5HH4/o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4ABEF800B6;
	Thu, 16 Feb 2023 11:33:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5778F80526; Thu, 16 Feb 2023 11:33:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E1D3F800B6
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 11:33:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E1D3F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Jfy5Zjg4
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9200A66021AF;
	Thu, 16 Feb 2023 10:33:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676543597;
	bh=6uIzQS1xNpwxFvvbM87RxfIH+mS9cj2FTgkkgyvBiJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jfy5Zjg42QUQbjlpPFqsj32bfBR1nwlLfP3OxihOfpeNgUSyx186woidwN9TRk1Jt
	 1z0TrhI8jnhmtlYuJ913exsgOjC2c1ik11WB1uRI4PLO22eVk+OHTJ30oRoTh4IXF2
	 /5Z71cebK9+VVfQI7iAWzabFk75/LTGIL597kc0Us9cDHKXdW94aA1dr133CbV97nS
	 SsJGD01zI5W0ToYZuJh3bXZJAVW2dliw7bpbQnMtSGIOL9VDRQ7X62Ocqref+BSird
	 REzeuEla/j87JHBgPtiFoLsuFkr1HaVs385Yh2QOK7/qXZ12sC6XZhCDE+XcJhhE2l
	 ItLfeK6ghdq0g==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 6/9] ASoC: amd: vangogh: Check Bit Clock rate before
 snd_soc_dai_set_pll
Date: Thu, 16 Feb 2023 10:32:57 +0000
Message-Id: <20230216103300.360016-7-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230216103300.360016-1-lucas.tanure@collabora.com>
References: <20230216103300.360016-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DXAFXOTLOTUOBQ2Q6AOO23SPOL5HMUK5
X-Message-ID-Hash: DXAFXOTLOTUOBQ2Q6AOO23SPOL5HMUK5
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <lucas.tanure@collabora.com>, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DXAFXOTLOTUOBQ2Q6AOO23SPOL5HMUK5/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Check bit clock is valid before setting it with snd_soc_dai_set_pll

Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
---
 sound/soc/amd/vangogh/acp5x-mach.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index e7a7558f70ae..7072352389ab 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -115,13 +115,19 @@ static int acp5x_nau8821_hw_params(struct snd_pcm_substream *sub, struct snd_pcm
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(sub);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *dai = snd_soc_card_get_codec_dai(card, ACP5X_NUVOTON_CODEC_DAI);
-	int ret;
+	int ret, bclk;
 
 	ret = snd_soc_dai_set_sysclk(dai, NAU8821_CLK_FLL_BLK, 0, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		dev_err(card->dev, "can't set FS clock %d\n", ret);
-	ret = snd_soc_dai_set_pll(dai, 0, 0, snd_soc_params_to_bclk(params),
-				  params_rate(params) * 256);
+
+	bclk = snd_soc_params_to_bclk(params);
+	if (bclk < 0) {
+		dev_err(dai->dev, "Fail to get BCLK rate: %d\n", bclk);
+		return bclk;
+	}
+
+	ret = snd_soc_dai_set_pll(dai, 0, 0, bclk, params_rate(params) * 256);
 	if (ret < 0)
 		dev_err(card->dev, "can't set FLL: %d\n", ret);
 
-- 
2.39.2

