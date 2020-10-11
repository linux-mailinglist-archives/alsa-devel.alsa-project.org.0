Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C72F528AA5C
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Oct 2020 22:27:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56BCA166E;
	Sun, 11 Oct 2020 22:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56BCA166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602448020;
	bh=VbaJ/GhQ+7eiMd2/GZRdXWjlLv07LNVYOadz4G8eKEc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IP9hfaQW9EXui70eW1B0jR5Y40G4TZCDsBDE3SRZS4l6ThH0Id2KlTPm11ow/hHYQ
	 Mby7pEuXHuY/848CoKKx8bRU72kw0yptG38nT5lpDWBLoI7BfqO8FiZ6V7jeN8LbwX
	 DUN9+IAQZMewDCkHxh9rD1IW7djWRqg7RqorZmZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BB60F802A1;
	Sun, 11 Oct 2020 22:23:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B60BBF8028E; Sun, 11 Oct 2020 22:22:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 984B4F80260
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 22:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 984B4F80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IyS1xQwe"
Received: by mail-qv1-xf41.google.com with SMTP id t6so3383497qvz.4
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 13:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6foTdNByYaza+7IioC5Au+dQ6O1jD1KqRZFfbjoYWg=;
 b=IyS1xQweqtX7I7JqvRg2RP8mWx2QwzjtmI9o5PT8TY3EyXm5m+AhdZV8JyiEnRfj+C
 SQXu8zpe8zE/rjyALoawdUk2XiW070CIgVf+rojhN9sq2vbPHwPwMCFDfTkKrZxPf0pf
 FHnN2JVCP3rlT1ZSFjUgDXHZ3kGk7ZfgI9J70NuBV+R7H6orPbErWEGODJFUbdqnPWN5
 FjFKLBsRvYbECj/5LjRVLy/7pPAi+nB0Vu1e40h9dBoc/bSke8FSLbbyQuNH3EY5vNJB
 9EQjj1Tu24/533R2j0HvHo3yRw8Qka3QAM7j0MbMhWPN+8UwdZkezRz1CzXOPYBAVUva
 n5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6foTdNByYaza+7IioC5Au+dQ6O1jD1KqRZFfbjoYWg=;
 b=e5BIP15E2ynXdUuWExU7KSVcEhvg2WEg1hiXXskFWeSqbXP4ItcE4kbG5qfZAljzmq
 0SKzEwWCmSHZNK8iF65UZbRbREGuGAi2Uz22L5WbnCloS8WZvmVdDa4AMvASQqt7f5/H
 GRACPRXop+qujGm3sbKy2F1YvY0Dizk9zSgFNAva9SEShr+GVVC/ck53hPy/Az9QQMU5
 mPk//3MYY9nGAiTvzxF+dE2O4J9otnMOQJNgVBW7/pq8CX0G/mIP+v9RAuLIm1JK3cuf
 lvhaF3xlc7sv9gFGrtiIMtByAHrUuQ+KahzQ4bIRZj9Maf5xb82sczsz5KLP5DMA3Iui
 3x1Q==
X-Gm-Message-State: AOAM53312RqHdoHl19lrGtnD8pT7lsJYgSRuzcfjc27fDR2oo9Vs5IRa
 d9Seubez2fKxV1BZZx5uxgM=
X-Google-Smtp-Source: ABdhPJx+NO8hs3nQcTr1w1RkQ757q0aA38ZZh4DW7nzWF80tK2zH2HXQsw2IZdsZOYXzR6xqYtxNig==
X-Received: by 2002:a05:6214:153:: with SMTP id
 x19mr3061824qvs.50.1602447766535; 
 Sun, 11 Oct 2020 13:22:46 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id c72sm2987778qkg.56.2020.10.11.13.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 13:22:45 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v7 05/14] ASoc: sun4i-i2s: Add 20 and 24 bit support
Date: Sun, 11 Oct 2020 22:22:15 +0200
Message-Id: <20201011202224.47544-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201011202224.47544-1-peron.clem@gmail.com>
References: <20201011202224.47544-1-peron.clem@gmail.com>
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
index 0b242f4615fe..d5eba58ff207 100644
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

