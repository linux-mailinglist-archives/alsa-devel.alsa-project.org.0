Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5149272120
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:30:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E58916E4;
	Mon, 21 Sep 2020 12:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E58916E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684213;
	bh=c0Jmkle34lcelvv1AxYeXtRnxz1TEmNAwZTA+1Ou7jA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ACHiKtSxlDCDSyFFcpZYwG3GrVnLAkDpgTC3nDj4+yJ+/gZp/Elg+okrETLABPA+N
	 eBwzZuaHhrvP4qYSI9Z9mvMCRJZE2kVcteXVEQo0sIhztZvNvLoXzdjilJAEqb9khm
	 md7AO8SiuIezesE2nd+bzwstDI97EBzE/bWbYljc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04FFAF802F7;
	Mon, 21 Sep 2020 12:28:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15479F802DF; Mon, 21 Sep 2020 12:27:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5565F80171
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5565F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mzu+l6L7"
Received: by mail-wm1-x341.google.com with SMTP id z9so12039883wmk.1
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JlxXAFB85DXviVVzU9snS3b51VMvFbEM+bK6288hNSg=;
 b=mzu+l6L70rHWw0alVLJS5Xuc5z3XOKT9BcnycIXjFHNqrl4CM9G5faKlLdvqc71WwL
 d4rScfG8Izjpemku5/Hf/d2ewvtMS0d3bNP9BJ8ZLj0yryjreBacKfctPMrWABZUDN87
 22foMN7nBJy/5zPjEQaqzxB97NviGimJp0WsOb0qx/K+cw7OS/Mk4UHfIo5e4sfvhJh5
 v9CrMxXA1xc2tQ06PaeuCoU+Iy98t0lptrj64j+76hxZdHF62my761mgrAfu26c6EL5y
 gx6eGgmDbMjWUCoFN3WDIKG9JfItCszqLMsauUlgUuNTSwGvNxrnuNhlpCqvol+eUQCO
 c8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JlxXAFB85DXviVVzU9snS3b51VMvFbEM+bK6288hNSg=;
 b=SnNd53oNE0A7O/9eZjDUUN20a/1paHjl6H6BWRMsCZ8O4qE0a8ml1GSZy4KC5YoxRw
 U3TBcQNcAIeW3+jn1yJ2Qo3osB9SrJLcHzenp4aoLXPyEI4su+bNN5ERE3uOGRVt3/nA
 sQAUa8EIqU5EHaWFTHEndYpDyoQ52l7pN/ssX4O6rzxk/E+eR1v/QatxwA4y1q+0+JgZ
 ZLjNdElBeNPVUEzUo0YV4J7Z1eLYv7aVwsAjCIsl8P5uG+U4uhUZMVUtoHvsjrCsp9VS
 gbwEvOoP9WHKNSj4VCPiY2b6cg6M6MTPYnUcs2f+JXLaSMwmvk4AZg+Xi83sg6asxToY
 J/5Q==
X-Gm-Message-State: AOAM530KqSN9a1ixD43TG+/k/aHMAk/WPDSSdtHqCRFbeCQftX2q0CbT
 KvbN7XtINAW2ncoJvOClY/M=
X-Google-Smtp-Source: ABdhPJy+o10p7bdBaRs62LuKVHz3cb/5w4lrcjRBwwPC64AOJbj/lNF89WZZ4kbdQLrmaqQ8JKCEpA==
X-Received: by 2002:a05:600c:ce:: with SMTP id
 u14mr30536852wmm.137.1600684063220; 
 Mon, 21 Sep 2020 03:27:43 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:42 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 06/22] ASoc: sun4i-i2s: Add 20 and 24 bit support
Date: Mon, 21 Sep 2020 12:27:15 +0200
Message-Id: <20200921102731.747736-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921102731.747736-1-peron.clem@gmail.com>
References: <20200921102731.747736-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Marcus Cooper <codekipper@gmail.com>

Extend the functionality of the driver to include support of 20 and
24 bits per sample.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index b31454eee43c..60b2fec1bbe9 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -590,6 +590,9 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	case 16:
 		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 		break;
+	case 32:
+		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
 	default:
 		dev_err(dai->dev, "Unsupported physical sample width: %d\n",
 			params_physical_width(params));
@@ -1071,6 +1074,10 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE)
+
 static struct snd_soc_dai_driver sun4i_i2s_dai = {
 	.probe = sun4i_i2s_dai_probe,
 	.capture = {
@@ -1078,14 +1085,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
 		.channels_min = 1,
 		.channels_max = 8,
 		.rates = SNDRV_PCM_RATE_8000_192000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SUN4I_FORMATS,
 	},
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 1,
 		.channels_max = 8,
 		.rates = SNDRV_PCM_RATE_8000_192000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SUN4I_FORMATS,
 	},
 	.ops = &sun4i_i2s_dai_ops,
 	.symmetric_rates = 1,
-- 
2.25.1

