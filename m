Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DAA4AD3D6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 09:44:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8396177E;
	Tue,  8 Feb 2022 09:43:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8396177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644309860;
	bh=d47q9OeNENJ3M7TkHjgzlTEZMDeqeOoOJ/Y0bzXL9d8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mqL1zRJI61m2UneiIiwp1FdS9THGvUiBh1/7SoPLVGTw9LChfj49E/aFbYSevNXpd
	 xUaufzcPs878ejvduNwb4OLkk7inFW70bZ4BjhC+qrH/yyz5dOPl5QoodBfKIwF+Jr
	 ExubgicKds7fRkKuTPfGiW1+zqIfukaURntzwIm8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15CE6F80517;
	Tue,  8 Feb 2022 09:42:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9905EF80518; Tue,  8 Feb 2022 09:42:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32F49F800EB
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 09:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32F49F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cogentembedded-com.20210112.gappssmtp.com
 header.i=@cogentembedded-com.20210112.gappssmtp.com header.b="SfuD4cs0"
Received: by mail-lf1-x131.google.com with SMTP id m18so3493646lfq.4
 for <alsa-devel@alsa-project.org>; Tue, 08 Feb 2022 00:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zAs8Yatfb5icRPps4ZaWoN14zXIRZ/fIsgdyAPNGOb4=;
 b=SfuD4cs0uNn4xZ7k3QGNDYawj1deQWy1OQ/+n1lA0GxfdK0Q1uRJB2bg5CtViFAkJ8
 icuGxWaJ7CaR8hyZy2JGgU5BKVeUCabeHxN5mCuHSf/f1xHANr+o3XzwBDHbIM6I7EsT
 UXq6UNMwG5wreMRA8Tj9Bw5jvP4y6S0y09CDEpfXbPEuzmFvyC/Fm0h/aGMj+67HhD2g
 vhEjZv2aihkNPwK5knvQFdxoxIGS1LUVQKkxiWULZ8qkIj9//0gyXkpSp6BBpyKTkbOS
 rUuO1rSwTm5r/vnk4Bh4fROhGrycSBPystmyVqUeFfLrszN7qcp2BoDdv6kks9ApsWAd
 mhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zAs8Yatfb5icRPps4ZaWoN14zXIRZ/fIsgdyAPNGOb4=;
 b=EbtZIKnkuZV5ITDwEyts+QIDJMboDoiA9CNrJWv7UMSb4evFLznked2fqpic8EA29+
 NVlSgqub+0228WiGxamJwHWS2Qdz7XikLcnn0XHGZjxEiK840gWpYEGvpgaDhof7QWEt
 LQSXGQFqjST/q0K8vH61bBu4G/1IUPnXNNDRiQhVqrhmwkRk8+G3YEGRjHeMTXla7Bt+
 07aX7wNKtLGsVb8VDDxaJ+acpMzNDP4ZEei0NF8inavkq5oYY2dJxfieRLC7rNswmO8i
 s7fQYjjSBUiMmEMgRPGK7RFqBKoMEBMjxHmZv4oGC4GzsqtR/XCC0GpvOWi7q2ywFuNd
 L8vQ==
X-Gm-Message-State: AOAM5310AOaxS84nKO2/j1xnpqmA9bx2+o97xbM8pRZffHokwdwbGeai
 3pb6evH7fIL7d1b9uy6GxF/OHg==
X-Google-Smtp-Source: ABdhPJyScCD/zHSIZnBLnovm2lIeHylddool/rNUHBAjMxezHHhiSO5YvqwnGzUQRB10qdhFJgQPnA==
X-Received: by 2002:ac2:560a:: with SMTP id v10mr2359890lfd.260.1644309761652; 
 Tue, 08 Feb 2022 00:42:41 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id o12sm1830361lfu.96.2022.02.08.00.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 00:42:41 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/4] ASoC: pcm3168a: cleanup unintuitive mask usage
Date: Tue,  8 Feb 2022 11:42:17 +0300
Message-Id: <20220208084220.1289836-2-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220208084220.1289836-1-nikita.yoush@cogentembedded.com>
References: <20220208084220.1289836-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

When checking if the requested parameters are supported, the driver uses
PCM3168A_FMT_DSP_MASK to check for PCM3168A_FMT_DSP_* values.

However, formally not only PCM3168A_FMT_DSP_* values match that
condition, PCM3168A_FMT_I2S_TDM and PCM3168A_FMT_LEFT_J_TDM also do.

The check still gives correct result because those extra values can't
be in 'fmt' at the check location. Still, to make the code less cryptic,
better to compare 'fmt' with PCM3168A_FMT_DSP_* values explicitly.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 sound/soc/codecs/pcm3168a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index fdf92c8b28e1..987c5845f769 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -33,7 +33,6 @@
 #define PCM3168A_FMT_DSP_B		0x5
 #define PCM3168A_FMT_I2S_TDM		0x6
 #define PCM3168A_FMT_LEFT_J_TDM		0x7
-#define PCM3168A_FMT_DSP_MASK		0x4
 
 #define PCM3168A_NUM_SUPPLIES 6
 static const char *const pcm3168a_supply_names[PCM3168A_NUM_SUPPLIES] = {
@@ -511,7 +510,8 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 		fmt = PCM3168A_FMT_RIGHT_J_16;
 		break;
 	case 24:
-		if (master_mode || (fmt & PCM3168A_FMT_DSP_MASK)) {
+		if (master_mode || (fmt == PCM3168A_FMT_DSP_A) ||
+				   (fmt == PCM3168A_FMT_DSP_B)) {
 			dev_err(component->dev, "24-bit slots not supported in master mode, or slave mode using DSP\n");
 			return -EINVAL;
 		}
-- 
2.30.2

