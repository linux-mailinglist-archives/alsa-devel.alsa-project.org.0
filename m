Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F869ECB35
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:30:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9EC72394;
	Wed, 11 Dec 2024 12:30:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9EC72394
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916632;
	bh=ujffKmfqqDwP9nSS/Rh8QsJL6MbeKN+Qqc+lwPTDO6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K9v5gl13e/HOuHnpDXYUu+rhfcHvQoCJ7pzeK448iAkAskvX+87q3IzSDCN5I8VDc
	 Rz+s4RFF3w/AL8R+ETWIcVI5vOyhCcLBScxkMpcDqZ8rpp7iFyxEgTMPpVvwmy3p9e
	 fNx2BbuTBxk62cwbjWRkILrSDsPKR/WUan8Dq7DE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 847E3F805C2; Wed, 11 Dec 2024 12:27:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94ABAF8077D;
	Wed, 11 Dec 2024 12:27:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A446CF80482; Tue, 10 Dec 2024 18:11:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D749F800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D749F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=CBSQ41s6
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6274015so5213988a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850626; x=1734455426;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nt6/CuLO4TNfbHvjGkE7QWPE5biRbMT4tQY2cpGkikU=;
        b=CBSQ41s6sWDj5JD/qiExx6QsMh8qV6W+7ODhdvJ2hUbJaMGTO80wrc+elKtTU+18OQ
         buJxvJxykLb4n2wuRGMDLQzQmPPxs9pQ+EDCJTpT2KOpM7lt5pzsHYOg+7n7qgoltyJL
         sEEwoyb8HSxGidH4mQuo3wSr38dRnIiVWxozepmowCmxFsP0SK8rSlrAhjz4ndViaJe6
         sn3hrcktcY7ynOo7dlR360xEoroRVcKoTok65YAWGwOJIf+Jfj3LHsYL777/ltKUuZau
         ZEKKdFeIt1GaSYbontRsgUqy191PjMbD/Mg7L/dcN0jjCWKd8BeSb7Qq96G1horJvRbl
         LmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850626; x=1734455426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nt6/CuLO4TNfbHvjGkE7QWPE5biRbMT4tQY2cpGkikU=;
        b=lZsFB3G1s0N+NhoK1GNJrZ9o0BfaiKsdH0uxWE7AtrfH6TrTG+m7O7jUyE+vv4rWtH
         dO1SXYQaX16qfDDd3yGbV50u4IciuJRcSY0SxdmQGnUatkaW0guCZsWFxYX+Nne+DqAp
         FLfIO5g7uiq704RLv0/PIi71lBKMUMGwzZMCx25au/I8N/VvhZKeD4HnO5SS31KoPMh/
         eU0lBhZ0WZOo75+tDK70o8+EKhXgCrAxW3bEwhQyOoo1Wthye5j4F7ihKd0TARuXo/mz
         N8/b24LEBn34LJzAjpk16FGvXcntAbnZmVdcc4af4UkvjjypAE2QEi4Rf/KTE8XmohwO
         wMrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW904uY0SmTLB7q8r1Yb/kCniLJYK1VTZBa4YoHK8X8SHMo2z4LSgCu0vGkKaQhZW+Z1KnLz4p5g92T@alsa-project.org
X-Gm-Message-State: AOJu0Yyi+WHDGJXSHrtzdqr6cXGhX3u3M5cbh6d1oEDdSAM2ZCDPmwIf
	9ic2VsUeDt/Acd7dTtlxz++pllHni9fFpUhXasSldVRoJA2fMa/OlAKweO3oi8E=
X-Gm-Gg: ASbGnctnqJblv1OZRf/fs2JiqktCKxani7ukou7MhtEw7/7roKaXa5aEJxG0wPHedsZ
	8yJA/gFjnwspetHeexLdFBOqZbaC+Qx/f7pUdsEVYuvGSbiHBnlqr3tfffY3AbpPJrbayi4qxFx
	uf/Mj1tp8ffdVLyb4R1K0+8FNpTTdxK89SvGVW4q1eUEyBAoGaC+XgihnQajPTdM1KieED2CobC
	F3NyXCo0PQ26HxRregZTCRnbTf1Hw9XSJifp8xJCmrOry4srcFIEQM1fNrxGudEiKNXjiBg71ND
	xzsnNBj6
X-Google-Smtp-Source: 
 AGHT+IFnf0CQr0jkK6OJUnuRd7yMlMyY8yimkX0n0o6RyaHOTAp9AyL9lRgA8mS0FG7jjIMo1TvGpQ==
X-Received: by 2002:a05:6402:2813:b0:5d3:d4cf:feb5 with SMTP id
 4fb4d7f45d1cf-5d3d4d00325mr14392707a12.29.1733850625802;
        Tue, 10 Dec 2024 09:10:25 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:25 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 09/24] ASoC: renesas: rz-ssi: Remove the first argument of
 rz_ssi_stream_is_play()
Date: Tue, 10 Dec 2024 19:09:38 +0200
Message-Id: <20241210170953.2936724-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3CL5UYT2U22QSWQXIM27NELQS4AG4YZX
X-Message-ID-Hash: 3CL5UYT2U22QSWQXIM27NELQS4AG4YZX
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:09 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CL5UYT2U22QSWQXIM27NELQS4AG4YZX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The first argument of the rz_ssi_stream_is_play() is not used. Remove it.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- fixed typos in patch title and description
- collected tags

 sound/soc/renesas/rz-ssi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index e2e172d8e9db..1a98f6b3e6a7 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -162,8 +162,7 @@ static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,
 	writel(val, (priv->base + reg));
 }
 
-static inline bool rz_ssi_stream_is_play(struct rz_ssi_priv *ssi,
-					 struct snd_pcm_substream *substream)
+static inline bool rz_ssi_stream_is_play(struct snd_pcm_substream *substream)
 {
 	return substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 }
@@ -337,7 +336,7 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 
 static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
-	bool is_play = rz_ssi_stream_is_play(ssi, strm->substream);
+	bool is_play = rz_ssi_stream_is_play(strm->substream);
 	bool is_full_duplex;
 	u32 ssicr, ssifcr;
 
@@ -674,7 +673,7 @@ static int rz_ssi_dma_transfer(struct rz_ssi_priv *ssi,
 		 */
 		return 0;
 
-	dir = rz_ssi_stream_is_play(ssi, substream) ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
+	dir = rz_ssi_stream_is_play(substream) ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
 
 	/* Always transfer 1 period */
 	amount = runtime->period_size;
@@ -800,7 +799,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (ssi->dma_rt) {
 			bool is_playback;
 
-			is_playback = rz_ssi_stream_is_play(ssi, substream);
+			is_playback = rz_ssi_stream_is_play(substream);
 			ret = rz_ssi_dma_slave_config(ssi, ssi->playback.dma_ch,
 						      is_playback);
 			/* Fallback to pio */
-- 
2.39.2

