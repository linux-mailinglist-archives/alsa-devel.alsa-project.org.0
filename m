Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EBF29C74D
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 19:36:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8602816C1;
	Tue, 27 Oct 2020 19:35:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8602816C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603823772;
	bh=fY1QD1eNAdFnUAu5zm1Qiepufw1KwvTEMUud5+9KZYY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oQE/sp9YDNOySWcRNsUUcbxtRsxZp3OServiM2LIR2W2I+bf4BgcRM7A64F4Bibg/
	 lxdQ1l8Of8YdAqoHIWSCy+q/SVynVdU8z5nGqHI54WQz+n6kqPrkpnnQWGODTKmiIO
	 yIhoIX9x/0v/S3zYICzENvWshlkE9jrvs9mD7HDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7825FF804F2;
	Tue, 27 Oct 2020 19:32:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03629F804E2; Tue, 27 Oct 2020 19:32:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AF39F800FF
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 19:32:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AF39F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hZqDATcv"
Received: by mail-wm1-x343.google.com with SMTP id l8so797063wmg.3
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 11:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bUF5LSgnsfdi9Dmz32t5Nlmik5QNgZUZsDGC5+lF6a4=;
 b=hZqDATcv7sSLnWgYfAMp+DE8B3SYkc7T1qPxhtHamQ8G9lmchPk2WzxorNxeTFrJWd
 5uTBtwsOaTvNyQ6H/UDRhnF2uVgsRX2zywHbu9x2yodGCI6OKL80PBolnrHeKFI1SOqi
 TGVVCyPJxqU6+7lnohzcVFnrUkWGtpPQ0vEXUxGVKxn3T8TOTORluO1rcmkO2bovYqbT
 0VJ8i3cdlPDd5TfiNW71oWgaXMXWrZMyTi0muxL1XywTxNOIv0MRcwLNMROJjuhI/+zt
 tcDtM6ijantgPtcIIgzWuac7mgj30zYs6eXj3sHdzo1Jvm1rjKrjbJUX1zbeme8MHnKa
 uwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bUF5LSgnsfdi9Dmz32t5Nlmik5QNgZUZsDGC5+lF6a4=;
 b=mxYTKDXssMEYedQwAOFji1DPpQwhwjGwaUjGjqSG4yoEmHyFNic2Lgs6OCqbmSqIaH
 BBmSBcheux0UNk4JbdUxmXc5GDI3VnrrKFkOkhDtyiN6e7V/KuHrR4SxXotMPEaEA4tX
 qHqFVZfnJoJI8HAbydpyDYGOPHYmxcxw7DlAMsb+V2F/ZBMh4hULrrXMQ4ozRWqZOc7o
 XSfei6bzsf3lmlidArPp20YlyxaE3ErDcC6kXwZ56I2msclTRnimUDQffBoYC+vpLS+Z
 PMQ5P7roFULde6gSrcAYLsqPHlgeY59xOzCC7+SpodI3ts/CBIjQFTKz/Q/Lzbs63L53
 6BJQ==
X-Gm-Message-State: AOAM530GmKJCd6Ehg/STnCEdnYGOGtsDNfMqly6x7fjfp3x8/ODOVzdo
 2MaQ09hQfyh+Lsy85x7HGZQ=
X-Google-Smtp-Source: ABdhPJxjwsMwLtBKVCXnxljYQoMq6SnwnRLll3li843xrx/nJ4SWKVIUQOMkaz8TmPSCbRJjnMpaiA==
X-Received: by 2002:a05:600c:cb:: with SMTP id
 u11mr3924703wmm.112.1603823517828; 
 Tue, 27 Oct 2020 11:31:57 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id m9sm2864148wmc.31.2020.10.27.11.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 11:31:57 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v9 05/14] ASoc: sun4i-i2s: Add 20 and 24 bit support
Date: Tue, 27 Oct 2020 19:31:40 +0100
Message-Id: <20201027183149.145165-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027183149.145165-1-peron.clem@gmail.com>
References: <20201027183149.145165-1-peron.clem@gmail.com>
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
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 9f9d3e7baad0..39b56d0de1fd 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -600,6 +600,9 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	case 16:
 		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 		break;
+	case 32:
+		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
 	default:
 		dev_err(dai->dev, "Unsupported physical sample width: %d\n",
 			params_physical_width(params));
@@ -1081,6 +1084,10 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE)
+
 static struct snd_soc_dai_driver sun4i_i2s_dai = {
 	.probe = sun4i_i2s_dai_probe,
 	.capture = {
@@ -1088,14 +1095,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
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

