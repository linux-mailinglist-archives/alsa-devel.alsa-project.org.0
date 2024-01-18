Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EB5831E0D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 18:00:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 695221F5;
	Thu, 18 Jan 2024 18:00:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 695221F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705597220;
	bh=VB3r36g1TRzb+ZnbcM0huvM7RrOa7bcVG6ouX9BQqJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hZQ10KCDiYQTZ8uTzG7iJyLreYlyWeeMCp3ndqjn9qLV2bhz5ykkg4lvNHTxyUc1c
	 +2mG0J3Ih/cz8O9c6EyHOJGkATavJQilxqpcfGBSaJ6yHYBVpV2qZxQwDdO4APZcYM
	 dhSu7JcjgWm+PruHnNN5Q5+orATPeylXYwYQSUGc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ED84F80676; Thu, 18 Jan 2024 17:58:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16238F80674;
	Thu, 18 Jan 2024 17:58:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3A39F805C8; Thu, 18 Jan 2024 17:58:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 047EAF801F5
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 17:58:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 047EAF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CaopBlRH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B02EE6172D;
	Thu, 18 Jan 2024 16:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FDEC43390;
	Thu, 18 Jan 2024 16:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705597105;
	bh=VB3r36g1TRzb+ZnbcM0huvM7RrOa7bcVG6ouX9BQqJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CaopBlRHiCrC8zCeZp67HFQyNRiRgFzPECgJWdw8s18TdyRTNbsl2RO/26CPvhC8Q
	 1f+ALwq2Z5yJg79gFKKhAF4BBYC1Ef9RLD7NKPWKHpYJTXo4p3EhwKyV2xgWjS4a/S
	 5sscBlUUHPo/9iPuR2X0ehW7E10ESQuI9EbakUQ0ip2bY0GJeDcPbzfz2QS5K064HB
	 rM8O6/SiwgTwLXvzMXt/hYsb09g+mBcvYw1n1txszMEx2I+0Gq0uuxmvmqgx9n1pdm
	 BZm6SJ80h27wmzK6OHXn43VIZkQLcUXAKn14gFpUSTwBIAbShIe/skwOxSBufY8r7u
	 NtSEMTQS7lapQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rQVir-0003Z2-2R;
	Thu, 18 Jan 2024 17:58:33 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 3/5] ASoC: qcom: sc8280xp: limit speaker volumes
Date: Thu, 18 Jan 2024 17:58:09 +0100
Message-ID: <20240118165811.13672-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240118165811.13672-1-johan+linaro@kernel.org>
References: <20240118165811.13672-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G7BTUXNKNYHK4MQ7XJQPYIKDENI43LYR
X-Message-ID-Hash: G7BTUXNKNYHK4MQ7XJQPYIKDENI43LYR
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G7BTUXNKNYHK4MQ7XJQPYIKDENI43LYR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The UCM configuration for the Lenovo ThinkPad X13s has up until now
been setting the speaker PA volume to -3 dB when enabling the speakers,
but this does not prevent the user from increasing the volume further.

Limit the PA volume to -3 dB in the machine driver to reduce the risk of
speaker damage until we have active speaker protection in place.

Note that this will probably need to be generalised using
machine-specific limits, but a common limit should do for now.

Cc: stable@vger.kernel.org	# 6.5
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/qcom/sc8280xp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index ed4bb551bfbb..a19bfa354af8 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -32,12 +32,14 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
 		/*
-		 * set limit of 0dB on Digital Volume for Speakers,
-		 * this can prevent damage of speakers to some extent without
-		 * active speaker protection
+		 * Set limit of 0 dB on Digital Volume and -3 dB on PA Volume
+		 * to reduce the risk of speaker damage until we have active
+		 * speaker protection in place.
 		 */
 		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 84);
 		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 84);
+		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 1);
+		snd_soc_limit_volume(card, "SpkrRight PA Volume", 1);
 		break;
 	default:
 		break;
-- 
2.41.0

