Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3A170EFB9
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 09:43:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1718E204;
	Wed, 24 May 2023 09:43:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1718E204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684914237;
	bh=JWCo/GiQIjgEd33TLlVz5h/VBvQ/u8Y9VSES2Wef+Cs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fVAD6CpUNARi0k3TiiRrVGK5mdIknEXyVwMP4iVHlAlAgQXH/Gc3Zz/gPk1maPIzF
	 nyLtcPplfQJcG2sdq2AUx57+gRzi29UT54Fq2pYUlsqA/6LHrjHsb/e/uQ8BcKauC5
	 llKEJygqjdua3DaHcYft/BWHiGwP4xqT/4iDjgdE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19EFFF8057B; Wed, 24 May 2023 09:42:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6092DF80553;
	Wed, 24 May 2023 09:42:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD64BF80553; Wed, 24 May 2023 09:42:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2EFCF8016A
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 09:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2EFCF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=guHh2BSY
Received: from localhost (unknown [188.27.34.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2EC2F66059A4;
	Wed, 24 May 2023 08:42:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684914126;
	bh=JWCo/GiQIjgEd33TLlVz5h/VBvQ/u8Y9VSES2Wef+Cs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=guHh2BSYUS5UFvmOnh4vu8yu95UUSTNL+6Y80h+c0yZCnhsjVELoebtXgv1s+kNvU
	 YoAz+N+yTIWAGBVBXWvngfo+VXZUc6meYNielFhHZxlueddOveDw8wI/YzLOpAMXtI
	 z0tNjhsfuSwhGOmos0t5yD/wW5RnwtVfoQhlx5QyzXh0p704epqPb96bfl3nclpZ3m
	 4fipHtiioj1Z5mR16Pn1+akbINwMUwdYoUWg61UPKftKOGV6Ussew+lpNEjgDe8ozs
	 nqNRVN0Tr4Rzi0xt0XjGzcI62ml4VP/8hMp8makZZDi4uAgN0p/eVXP2pt531T7j6T
	 IsnTEQ5tiQTbw==
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
Subject: [PATCH 2/3] ASoC: es8316: Do not set rate constraints for unsupported
 MCLKs
Date: Wed, 24 May 2023 10:41:55 +0300
Message-Id: <20230524074156.147387-3-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524074156.147387-1-cristian.ciocaltea@collabora.com>
References: <20230524074156.147387-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SG2MX4FAQ75E2LXYHQ37PSDBASADJHA7
X-Message-ID-Hash: SG2MX4FAQ75E2LXYHQ37PSDBASADJHA7
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SG2MX4FAQ75E2LXYHQ37PSDBASADJHA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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
 sound/soc/codecs/es8316.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 773c94fd3547..a78c0049a30c 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -386,7 +386,7 @@ static int es8316_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 			es8316->allowed_rates[count++] = freq / ratio;
 	}
 
-	es8316->sysclk_constraints.list = es8316->allowed_rates;
+	es8316->sysclk_constraints.list = count ? es8316->allowed_rates : NULL;
 	es8316->sysclk_constraints.count = count;
 
 	return 0;
-- 
2.40.1

