Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCEF8301E7
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jan 2024 10:08:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6503220E;
	Wed, 17 Jan 2024 10:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6503220E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705482525;
	bh=ubf+Lb9lWCl+Bw/cYPU6tgtajk7KlSOrM82ga/TBaGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oO9TjqafwpxwdI7vbDfRCUA5qkmMxojIFHCVLxUQnHDOiSjZ10LQ0s4N913bMnqsy
	 TkhNkDXqKrk9KTvkWb3/ykklJpW5jhwYOP+hqUCFEFNXr4ckyZBlPngdG4I6XJGljw
	 /hlI6ja3Z0edMHeYM21bWvRWaDKIxOfJdw2/DHJw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99EDFF805EC; Wed, 17 Jan 2024 10:07:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D45E9F805F1;
	Wed, 17 Jan 2024 10:07:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5917F802BE; Wed, 17 Jan 2024 10:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 485A3F8003A
	for <alsa-devel@alsa-project.org>; Wed, 17 Jan 2024 10:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 485A3F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ul+i8Cpz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2111B61569;
	Wed, 17 Jan 2024 09:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79CFBC433F1;
	Wed, 17 Jan 2024 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705482224;
	bh=ubf+Lb9lWCl+Bw/cYPU6tgtajk7KlSOrM82ga/TBaGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ul+i8CpzEGX31XDcKOWiMUk/Mx/cPUlWS3k1ZWXNcmO+13+g+43kk7k7zsDou3Jqx
	 2HCVy13ILqrFrpytfP7xQS4Q+s8uzGzVqomaFETJqYRFKTjMvHusVASImqm9CWLX1N
	 HehEQcPMuOqpl8a/ZtW8lbbHdsU/PTb7d1fzDWjHi1fcOqHQlAJLy7IY1eHnJEGtKc
	 uoQ9nmJxOhlhDfMz1RZZ6inqcS/ExtArgXGmWGG5CEgzHiKxkVos9PSHsNPOYpFjOR
	 CzOuBnP7tlysEahDt+IyNQsbzoAVuEK1jjTUo31B9chHBTTutQzmXUQdXj7Gf0Tigb
	 MMXYGK3cBqq+g==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rQ1pt-00086U-03;
	Wed, 17 Jan 2024 10:03:49 +0100
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
Subject: [PATCH v2 1/3] ASoC: qcom: sc8280xp: limit speaker volumes
Date: Wed, 17 Jan 2024 10:03:29 +0100
Message-ID: <20240117090331.31111-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240117090331.31111-1-johan+linaro@kernel.org>
References: <20240117090331.31111-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4X4SMPEQ4UQFRIP7TI7ECTOSE7KS43ON
X-Message-ID-Hash: 4X4SMPEQ4UQFRIP7TI7ECTOSE7KS43ON
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4X4SMPEQ4UQFRIP7TI7ECTOSE7KS43ON/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The current UCM configuration sets the speaker PA volume to 15 dB when
enabling the speakers but this does not prevent the user from increasing
the volume further.

Limit the PA volume to 15 dB in the machine driver to reduce the risk of
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
index ed4bb551bfbb..aa43903421f5 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -32,12 +32,14 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
 		/*
-		 * set limit of 0dB on Digital Volume for Speakers,
-		 * this can prevent damage of speakers to some extent without
-		 * active speaker protection
+		 * Set limit of 0 dB on Digital Volume and 15 dB on PA Volume
+		 * to reduce the risk of speaker damage until we have active
+		 * speaker protection in place.
 		 */
 		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 84);
 		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 84);
+		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 12);
+		snd_soc_limit_volume(card, "SpkrRight PA Volume", 12);
 		break;
 	default:
 		break;
-- 
2.41.0

