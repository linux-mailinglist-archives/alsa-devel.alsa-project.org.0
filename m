Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C72DE836FA2
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 19:19:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB23E85D;
	Mon, 22 Jan 2024 19:19:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB23E85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705947589;
	bh=iEHE7zcoasy6D541jeKFupXFX5j6AhyLZMvQAbjE414=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=up9XM7S8LNY0TmDk9yPxBIfQxS57dt7gbmXDbHuNfD8rQbXJay/8fAwqcgw7ANYEj
	 cTFgKgAL9hDlwugzdTmfR9MrTTPXZ2YJ+j4tUXNO8YtV/7gh10fKd9taG6L5F7nuBJ
	 soafzoLIEIt3vkEOt/rkPSH1po8Zx2xEOTjn+LOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2613F805E7; Mon, 22 Jan 2024 19:18:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBFAEF805E4;
	Mon, 22 Jan 2024 19:18:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E5A9F8025F; Mon, 22 Jan 2024 19:18:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71329F802BE
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 19:18:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71329F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O+dcfJF6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E700FCE2C10;
	Mon, 22 Jan 2024 18:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1602C433C7;
	Mon, 22 Jan 2024 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705947507;
	bh=iEHE7zcoasy6D541jeKFupXFX5j6AhyLZMvQAbjE414=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O+dcfJF6E044EyavOfv1l9nHnpKuMYutU0LqH7U8RTGknusM+yybwHryBMXCCV6E/
	 6xdXL1sM1jWLDi8dwSM2TkJ/23cgWDee+65weSpeDef+3Lw3QGywZuckX7l5pMnBuM
	 e4i8+BZsjataShXzmTwIslxZ30KLNZ2HdE0P5T7EvFYjNK90ueMjsI6Z2QChXLcLG6
	 YpcRJY8b4iadTa0s43m5mQGMfPzIHXiyRJyd313Mzf6V+Kki3hl3wojw5E7ovJhXMI
	 dBYHM6O7chalTSbVnwzzt/1QCH1Cbb4UUyf2pTu7MtM1X9nvIOot94yej8+sk/BUvp
	 q7CAXSS9+tI6A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rRysa-0000000013V-1wQ8;
	Mon, 22 Jan 2024 19:18:40 +0100
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
Subject: [PATCH v5 2/4] ASoC: qcom: sc8280xp: limit speaker volumes
Date: Mon, 22 Jan 2024 19:18:17 +0100
Message-ID: <20240122181819.4038-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122181819.4038-1-johan+linaro@kernel.org>
References: <20240122181819.4038-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XJ2BHC2NBVFP3U2NX2XHB7D73NLNOIH2
X-Message-ID-Hash: XJ2BHC2NBVFP3U2NX2XHB7D73NLNOIH2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XJ2BHC2NBVFP3U2NX2XHB7D73NLNOIH2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The UCM configuration for the Lenovo ThinkPad X13s has up until now
been setting the speaker PA volume to the minimum -3 dB when enabling
the speakers, but this does not prevent the user from increasing the
volume further.

Limit the digital gain and PA volumes to a combined -3 dB in the machine
driver to reduce the risk of speaker damage until we have active speaker
protection in place (or higher safe levels have been established).

Note that the PA volume limit cannot be set lower than 0 dB or
PulseAudio gets confused when the first 16 levels all map to -3 dB.

Also note that this will probably need to be generalised using
machine-specific limits, but a common limit should do for now.

Cc: stable@vger.kernel.org	# 6.5
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/qcom/sc8280xp.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index ed4bb551bfbb..b7fd503a1666 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -32,12 +32,14 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
 		/*
-		 * set limit of 0dB on Digital Volume for Speakers,
-		 * this can prevent damage of speakers to some extent without
-		 * active speaker protection
+		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
+		 * to reduce the risk of speaker damage until we have active
+		 * speaker protection in place.
 		 */
-		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 84);
-		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 84);
+		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81);
+		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81);
+		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 17);
+		snd_soc_limit_volume(card, "SpkrRight PA Volume", 17);
 		break;
 	default:
 		break;
-- 
2.43.0

