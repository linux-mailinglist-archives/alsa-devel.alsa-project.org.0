Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B9D716C0B
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 20:13:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A126982A;
	Tue, 30 May 2023 20:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A126982A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685470437;
	bh=sMhuZ+7skk9Nz8F8CqkKKe/JQIPAguLL7MXGBbO2Dt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TwkB5E92Mp3QBtHyElGY2ObvaIcyy2gYZ1KEU35sDhO8stVd7gLr2pXogERnQi2Po
	 ozwVOv+M74VUg6f13JbkqTtpKXAfleC8k2Dy3pWGTfKNx+xnvzxkxxfWLHhP2ojRdf
	 TnI420L0wmvlPvxVL4l6BxI8h9DkZrYuWrnEOuhI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75255F80580; Tue, 30 May 2023 20:12:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00CE5F80580;
	Tue, 30 May 2023 20:12:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A07B0F80553; Tue, 30 May 2023 20:12:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B23FF800DF
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 20:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B23FF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=jSeuSeX3
Received: from localhost (unknown [188.27.34.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 312836605840;
	Tue, 30 May 2023 19:11:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685470310;
	bh=sMhuZ+7skk9Nz8F8CqkKKe/JQIPAguLL7MXGBbO2Dt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jSeuSeX3vb9uNFXqB5SBwWMN/i7ouAXBywLxiMCsC7i+7SUEN9TsHC+eJ331EeZ6p
	 FQc2qNLPcePsPRIsRr7JxQ2KhT7Zo7xILISvaPxW2pkuA8kkEsUfHgrRk6DfmX6W8K
	 xlwJwrNcAujY06uE1+n2TrzSyFs95Cz6kXxkGlfxLFW1BrFxGV1yLonTBQIHR5lAfh
	 Nk1+djddCn+ffS8paqMobLyhoGEohaOYxQ/IQC7ZK++2BlVtcKopJDS3eHDItAaUwU
	 8NCXUzcM81o5Z18Z938O0rIAZJWIHrYLmEn6Qy7ZkgrnHwHJYhp6UKBMY//7wR3Tvt
	 Dm5BhJH4Sa8Zg==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhu Ning <zhuning0077@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	David Yang <yangxiaohua@everest-semi.com>,
	Daniel Drake <drake@endlessm.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	kernel@collabora.com
Subject: [PATCH v2 2/3] ASoC: es8316: Do not set rate constraints for
 unsupported MCLKs
Date: Tue, 30 May 2023 21:11:39 +0300
Message-Id: <20230530181140.483936-3-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530181140.483936-1-cristian.ciocaltea@collabora.com>
References: <20230530181140.483936-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6XJ5L7MALWARNVQEJYTWFPTBBESWB747
X-Message-ID-Hash: 6XJ5L7MALWARNVQEJYTWFPTBBESWB747
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When using the codec through the generic audio graph card, there are at
least two calls of es8316_set_dai_sysclk(), with the effect of limiting
the allowed sample rates according to the MCLK/LRCK ratios supported by
the codec:

1. During audio card setup, to set the initial MCLK - see
   asoc_simple_init_dai().

2. Before opening a stream, to update MCLK, according to the stream
   sample rate and the multiplication factor - see
   asoc_simple_hw_params().

In some cases the initial MCLK might be set to a frequency that doesn't
match any of the supported ratios, e.g. 12287999 instead of 12288000,
which is only 1 Hz below the supported clock, as that is what the
hardware reports. This creates an empty list of rate constraints, which
is further passed to snd_pcm_hw_constraint_list() via
es8316_pcm_startup(), and causes the following error on the very first
access of the sound card:

  $ speaker-test -D hw:Analog,0 -F S16_LE -c 2 -t wav
  Broken configuration for playback: no configurations available: Invalid argument
  Setting of hwparams failed: Invalid argument

Note that all subsequent retries succeed thanks to the updated MCLK set
at point 2 above, which uses a computed frequency value instead of a
reading from the hardware registers. Normally this would have mitigated
the issue, but es8316_pcm_startup() executes before the 2nd call to
es8316_set_dai_sysclk(), hence it cannot make use of the updated
constraints.

Since es8316_pcm_hw_params() performs anyway a final validation of MCLK
against the stream sample rate and the supported MCLK/LRCK ratios, fix
the issue by ensuring that sysclk_constraints list is only set when at
least one supported sample rate is autodetected by the codec.

Fixes: b8b88b70875a ("ASoC: add es8316 codec driver")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/codecs/es8316.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 8f0625b45b7c..069f1ce1cd50 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -369,13 +369,11 @@ static int es8316_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	int count = 0;
 
 	es8316->sysclk = freq;
+	es8316->sysclk_constraints.list = NULL;
+	es8316->sysclk_constraints.count = 0;
 
-	if (freq == 0) {
-		es8316->sysclk_constraints.list = NULL;
-		es8316->sysclk_constraints.count = 0;
-
+	if (freq == 0)
 		return 0;
-	}
 
 	ret = clk_set_rate(es8316->mclk, freq);
 	if (ret)
@@ -391,8 +389,10 @@ static int es8316_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 			es8316->allowed_rates[count++] = freq / ratio;
 	}
 
-	es8316->sysclk_constraints.list = es8316->allowed_rates;
-	es8316->sysclk_constraints.count = count;
+	if (count) {
+		es8316->sysclk_constraints.list = es8316->allowed_rates;
+		es8316->sysclk_constraints.count = count;
+	}
 
 	return 0;
 }
-- 
2.40.1

