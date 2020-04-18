Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3131AEF98
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 16:44:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 490681678;
	Sat, 18 Apr 2020 16:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 490681678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587221082;
	bh=FlI8B8hggmmi2uoYkHcbJ/OnSrRyC3E+sUdTA8Tj2EU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cfa6eqWsYBG2hfdmmZgaadSPXW51acqAPODPs9Ng8cp1nv0+VjctUS4S2ljlsE9Xf
	 DBu8M3oHuhwVM4lccn9IS1AImYVFPfDU+Q7E1Bl8zo5SHnc5Z+fR+TT99bWhSpWLIF
	 Sv6RkM02WuAwPpy3sIsxi2Ywqa3lM+l37IvVtvb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C560F802C3;
	Sat, 18 Apr 2020 16:39:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB4F3F80248; Sat, 18 Apr 2020 16:39:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77246F80248
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 16:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77246F80248
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kREQt1nA"
Received: by mail-wm1-x342.google.com with SMTP id g12so6020091wmh.3
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 07:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L754Km9Q9zep0jG23tHJM73Id+x+F/JcQ+J50WzXMn4=;
 b=kREQt1nAybMu/RdjR4TjKfiubqKWPftllECuR+Dq868v3it3j6lBhGfD3ltmcz/tMe
 YVOoHhyYMc4HCAawB2HNkZ8UfFeJwTPmM1e4k6Y5e9YRtUrWNjsQKj8X65eV60mY0o7W
 uNHDRjNH7xhbH23YmtoivilQKTAn+kzKMZiYs10gWCL0Fet+ufmuM8GIbwoh6gkfAM59
 6yoS6GEkIhgKay0ZvVl31wHQXmi1rE3E4aCqI/JXYUvQadeoka0jqsxj9NhCYfF3WubF
 FKpX4yWgiuJdAey9SnQvH4dZzJG4/H7NGfTp7D0R0KWjOq5OH+ZalOI6s56kTfPEpgSf
 AIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L754Km9Q9zep0jG23tHJM73Id+x+F/JcQ+J50WzXMn4=;
 b=iDKmxIRvZEItai8sPcm8c9Pg9aM08Fj19FRB8LLsKu0ipocMkN4OS7QT9avBKUBldp
 /1eLmIj6FO+n1ZCiBooGtoXi3CtamTuQWlXmX7UAkU3YO9wByuvNimYZnO/h8+nI5kaQ
 psHSMttRTWPLC6/YWxs74hCoNEfwLdj1nertPlkgdG/oqD2dSmfR0Yzwr2xlChz/0fO3
 EgD0OVSpaLyL+EXPOfLdzXSmeqx1P1mEWIaUUorzTPrwaaLWsPMtiRYC6/jXLAHuchiB
 nV18BQgwFhTcRQAmVK9nI9UVlcyIDDVfyinrAkoMeeBl+mjQ76XrcGaG178z/naqc+OE
 yU/Q==
X-Gm-Message-State: AGi0PuaKrjm3Zw9EyFZhRdQe5xDWcqZ37DebyzUK2XHzd2AQl5MhMywb
 tt6YvEblFzp2M6ZOwvYVFKQ=
X-Google-Smtp-Source: APiQypK70GbL5q6azow7ysviNaikQgOhrMij9w0SifS3JCnc2xPjm/sbDQKKkLmsCfYiJhtPXSVfgg==
X-Received: by 2002:a1c:964a:: with SMTP id y71mr6116731wmd.89.1587220772297; 
 Sat, 18 Apr 2020 07:39:32 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:4e7:1fdd:b7c2:b3ab])
 by smtp.gmail.com with ESMTPSA id
 s9sm25375322wrg.27.2020.04.18.07.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 07:39:31 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 5/7] ASoc: sun4i-i2s: Add 20 and 24 bit support
Date: Sat, 18 Apr 2020 16:39:21 +0200
Message-Id: <20200418143923.19608-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418143923.19608-1-peron.clem@gmail.com>
References: <20200418143923.19608-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
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
---
 sound/soc/sunxi/sun4i-i2s.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index e5f00be8cdcf..a0090b5ced83 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -571,6 +571,9 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	case 16:
 		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 		break;
+	case 32:
+		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
 	default:
 		dev_err(dai->dev, "Unsupported physical sample width: %d\n",
 			params_physical_width(params));
@@ -1057,6 +1060,10 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE)
+
 static struct snd_soc_dai_driver sun4i_i2s_dai = {
 	.probe = sun4i_i2s_dai_probe,
 	.capture = {
@@ -1064,14 +1071,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
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
2.20.1

