Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE182824BC
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Oct 2020 16:25:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51F2B1A93;
	Sat,  3 Oct 2020 16:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51F2B1A93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601735104;
	bh=Hlfa9S6eQmRYxDqBRwaloqWEWh+EWywYM4Kj1TO6Wbw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oDUmsd7Xb7bom3GxBoKkgImThDw1LG6N8DWoRaatz/l4JIThJW9J0H7y2IGezIlha
	 RCre4MFE1cb7vtM3KW2shGF9ZaxZCmjbWiJiztVGJm6dStiY2JVltoJ5ke9NGHGlnE
	 OyVsEgzGiRjKYaXccJO7bMzkg55PICi+i9ALEQcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 338B3F80303;
	Sat,  3 Oct 2020 16:20:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A23FCF802FE; Sat,  3 Oct 2020 16:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08999F802DC
 for <alsa-devel@alsa-project.org>; Sat,  3 Oct 2020 16:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08999F802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kMAqJeFU"
Received: by mail-wr1-x441.google.com with SMTP id z1so4854032wrt.3
 for <alsa-devel@alsa-project.org>; Sat, 03 Oct 2020 07:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c3QS3j+CeqKrt27pTi8NL7yFtwOG0PZkLe82cU+0pxA=;
 b=kMAqJeFUdJ0bC8iwfYBMz7Yvlg882gYnH+oOugICVuxhuJhRGCEC9We1CMO04vqn9W
 cNFBbl5DDkx9EXhfpdJufMQVmwehk/QBSSyZ0mssQ/1hNNyiMVAwjvhXX86wV0tItZ2/
 fBicXWVALqgSLDAboeHCE/nrQ55coP8oTIAigInk331ndEUzyhmui3QKK/2dSL8HJI66
 TqolQqQUk1pTXmwqYM7ITtfaO/oGFj4aqTN5dNyJg4kwsa548z+hxHUsZ2MUpGNJ8Eg+
 N8Y+KGddoq7qLfhQbkJdhOIqv44qz5VLVoHrAGn8xUWOa0faLMpK4RquykDRe4fL3w3L
 yfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c3QS3j+CeqKrt27pTi8NL7yFtwOG0PZkLe82cU+0pxA=;
 b=G1Sl+6wxd6BmMCG0OUddtOSF/xyBF1AnSHmDNhA99IUJzZzuzCIANGXU9EM6N2V7rC
 JXRm9AdmChVlQ9YePx673kqoMQR11qZCKP9SveLRSxGnD62laSfqfUpUhh5GhHCe+4kR
 eNF/Vc/6HT4HtepwRU8AOTKXlBvnWBUNf02lPVG4LdTQ2/GB65IarjmZRUwUWXjhOmLq
 sh3JehHSJWUQewYXkScWJlQhFWzOk8KMPnU/pnIuy3Dyalegu25WN724FFp0hkYaa+x5
 EG12HPqS7HfJhuBUeeLtplmZnBS91guZ8iSjlEQNCjitdi3Oh1VWY1TE/BxZiSC3/XUC
 JhgA==
X-Gm-Message-State: AOAM5339sQqvoP01uw5e/tb0TqmaLshUxu1BZn/u+Ij6hXPzqCVfWrED
 0z1OkP+OmcCeFeBcOEH3aGc=
X-Google-Smtp-Source: ABdhPJwKkHNl8pWb6gTzIH1iTPyzjAW/z57oJrJ3Kbl5rA5SmPgDK5L4bHXq7zHEgvEvGOKi4oM19w==
X-Received: by 2002:a5d:6547:: with SMTP id z7mr8402679wrv.322.1601734805100; 
 Sat, 03 Oct 2020 07:20:05 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id d18sm5417473wrm.10.2020.10.03.07.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 07:20:04 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v6 05/14] ASoc: sun4i-i2s: Add 20 and 24 bit support
Date: Sat,  3 Oct 2020 16:19:41 +0200
Message-Id: <20201003141950.455829-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201003141950.455829-1-peron.clem@gmail.com>
References: <20201003141950.455829-1-peron.clem@gmail.com>
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
index 73103673643a..ba7514849b73 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -592,6 +592,9 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	case 16:
 		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 		break;
+	case 32:
+		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
 	default:
 		dev_err(dai->dev, "Unsupported physical sample width: %d\n",
 			params_physical_width(params));
@@ -1073,6 +1076,10 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE)
+
 static struct snd_soc_dai_driver sun4i_i2s_dai = {
 	.probe = sun4i_i2s_dai_probe,
 	.capture = {
@@ -1080,14 +1087,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
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

