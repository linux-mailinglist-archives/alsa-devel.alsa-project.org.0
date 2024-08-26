Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611F96098C
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2024 14:05:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B55FFE97;
	Tue, 27 Aug 2024 14:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B55FFE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724760337;
	bh=C42m+jPwh32KPCsnO0oyfF4dYvxrQhak5pCgtDH4W8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UzuztUIs46vMZNp1gAJwuGhUH30LLMKRLJarbjynGNP6uy72YwY3VhZE9u9Xx0C51
	 h1oRVWfbvsZhndmkwTlBLn6ThI1xodrlgOumEDZgpCxT8/4TRSA6WxOyl+j3z0RmKj
	 8t5L+tcFNGmTMXd88QEa0YuTRm9MKI/jKA2phRyE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32640F80685; Tue, 27 Aug 2024 14:04:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1C24F8067C;
	Tue, 27 Aug 2024 14:04:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C882EF80494; Mon, 26 Aug 2024 15:52:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net
 [IPv6:2a02:6b8:c41:1300:1:45:d181:d103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEDFCF8025E
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 15:49:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEDFCF8025E
Received: from mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c42:24a4:0:640:473f:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id A329760024;
	Mon, 26 Aug 2024 16:49:40 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id UnTqJJ0oEKo0-cU9hcZFx;
	Mon, 26 Aug 2024 16:49:39 +0300
X-Yandex-Fwd: 1
Authentication-Results: 
 mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net; dkim=pass
From: Jens Reidel <adrian@travitia.xyz>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	Jens Reidel <adrian@travitia.xyz>
Subject: [PATCH 1/1] ASoC: qcom: sm8250: enable primary mi2s
Date: Mon, 26 Aug 2024 15:49:20 +0200
Message-ID: <20240826134920.55148-2-adrian@travitia.xyz>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240826134920.55148-1-adrian@travitia.xyz>
References: <20240826134920.55148-1-adrian@travitia.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: adrian@travitia.xyz
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5DJTJZFLQ5BXAFM4RLGTD554VQZ7HOG7
X-Message-ID-Hash: 5DJTJZFLQ5BXAFM4RLGTD554VQZ7HOG7
X-Mailman-Approved-At: Tue, 27 Aug 2024 12:02:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5DJTJZFLQ5BXAFM4RLGTD554VQZ7HOG7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When using primary mi2s on sm8250-compatible SoCs, the correct clock
needs to get enabled to be able to use the mi2s interface.

Signed-off-by: Jens Reidel <adrian@travitia.xyz>
---
 sound/soc/qcom/sm8250.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a15dafb99b33..274bab28209a 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -55,6 +55,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	case TERTIARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		snd_soc_dai_set_sysclk(cpu_dai,
-- 
2.46.0

