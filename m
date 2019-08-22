Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A17319901D
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 12:01:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A74EB168B;
	Thu, 22 Aug 2019 12:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A74EB168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566468114;
	bh=Nj7jWW3oXLPejL1Yctu23pycu6edYbf9mBzmh3S5uNc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dm2t/MdoQRIUEze7ZPuleX1Fyv4KqSoSLWU+RTUsn8bLDy/nwYTE9rEj2ROJCYR7r
	 MwSsxm+9zne9ytpR+chkk/vYlP2+V9E96ExtktKrSlEZcQEnZ8eWyk/T24boqodjAG
	 laCINZW8HyvbGiEqQ8eaPfq+9wajZsbKkuE+GNZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F118DF805FD;
	Thu, 22 Aug 2019 11:58:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52D97F80529; Thu, 22 Aug 2019 11:57:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53E35F8036E
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 11:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53E35F8036E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZLicH0OV"
Received: by mail-wm1-x343.google.com with SMTP id p74so4978230wme.4
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 02:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VR0Zo2f2LdCFMXPsnJEJq1uzw3++zs+EK/TmF24Zk8U=;
 b=ZLicH0OVCDzwVWhCLhka6L6kttl49SH+prKuYjagxN7kq1n1T3Z4NJUEBiDUB8J/W9
 C02+TSE7jcGLseF16/U7Eex53jFAzc0NXIGEe4YL8Rlhi1ULSJ5SoujcSB2y6COp7GI3
 6aet3GSxhuQxqyS6RlnCI/mwU0aglT+LqRCsOXfy9NsYl6jYLjcjTOAgP9mT9/V/D7/0
 uTw00t8G/TL911SQB9cLayd1WfnzQ7earGqZLu+5/tm42r219H7s1CurqP12c1vorOgJ
 caQbmfo2k5cr2A1rFoCHr91UoriaATMIk8nOHvbtsLRTFlLbm8W1PaXoFGGwr6kcHiVR
 3aKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VR0Zo2f2LdCFMXPsnJEJq1uzw3++zs+EK/TmF24Zk8U=;
 b=s1YkZm9wGRJJ9awiZ3sfp+0yfn9FP4QpyF4QxAzdVykmIYZDy4Ybo9HHZO4ozSJXdN
 OStbZsfBJ8mbuebzXebOX138eerTMmwW66pmV9UWSASe7E/NVMzOBYyJ7pyJI0iwIBxM
 Mrs/nKk+AyrbTIpXFivGj9tYZ0p/Tg1W0CBZJ4FHHc5+hSX/6CNZhk+x0S9Yzc0U74Fg
 NMgVqxYzihfUtutHGiCAXyqr/x16zZe3tENW1T5Nx8ca1pp2O753CdGWqPDxHozEDiaA
 Ve97VnbLAUHn7ZvfX+XEIG1F88Fs3qDT7JEYkRDTi42r5wEeGq6pAzNXqaqryRp/lirc
 aIPw==
X-Gm-Message-State: APjAAAVwnnXhoj2Ws3b3pqAqJlKXyO5bMxy3iGxeH0oZ4h4OKw73WQYJ
 f7xGza7GWzdHl9Oo7Cin/+Ftdw==
X-Google-Smtp-Source: APXvYqxeC7PmjNh3A9bR7xWK9OwPh/lSdL8HYSddkfR3Lrm/ispW2G8paCYcovsDSmi6UIpWWXGfpQ==
X-Received: by 2002:a7b:cf09:: with SMTP id l9mr5202229wmg.20.1566467853328;
 Thu, 22 Aug 2019 02:57:33 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id t24sm3298909wmj.14.2019.08.22.02.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 02:57:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Thu, 22 Aug 2019 10:56:53 +0100
Message-Id: <20190822095653.7200-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822095653.7200-1-srinivas.kandagatla@linaro.org>
References: <20190822095653.7200-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, plai@codeaurora.org
Subject: [alsa-devel] [PATCH v2 4/4] ASoC: qdsp6: q6asm-dai: fix max rates
	on q6asm dais
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Q6ASM dais support max rate up to 384KHz, update this.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 548eb4fa2da6..5eaeadec8492 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -80,9 +80,9 @@ static struct snd_pcm_hardware q6asm_dai_hardware_capture = {
 				SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME),
 	.formats =              (SNDRV_PCM_FMTBIT_S16_LE |
 				SNDRV_PCM_FMTBIT_S24_LE),
-	.rates =                SNDRV_PCM_RATE_8000_48000,
+	.rates =                SNDRV_PCM_RATE_8000_384000,
 	.rate_min =             8000,
-	.rate_max =             48000,
+	.rate_max =             384000,
 	.channels_min =         1,
 	.channels_max =         4,
 	.buffer_bytes_max =     CAPTURE_MAX_NUM_PERIODS *
@@ -102,9 +102,9 @@ static struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 				SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME),
 	.formats =              (SNDRV_PCM_FMTBIT_S16_LE |
 				SNDRV_PCM_FMTBIT_S24_LE),
-	.rates =                SNDRV_PCM_RATE_8000_192000,
+	.rates =                SNDRV_PCM_RATE_8000_384000,
 	.rate_min =             8000,
-	.rate_max =             192000,
+	.rate_max =             384000,
 	.channels_min =         1,
 	.channels_max =         8,
 	.buffer_bytes_max =     (PLAYBACK_MAX_NUM_PERIODS *
@@ -119,25 +119,25 @@ static struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 #define Q6ASM_FEDAI_DRIVER(num) { \
 		.playback = {						\
 			.stream_name = "MultiMedia"#num" Playback",	\
-			.rates = (SNDRV_PCM_RATE_8000_192000|		\
+			.rates = (SNDRV_PCM_RATE_8000_384000|		\
 					SNDRV_PCM_RATE_KNOT),		\
 			.formats = (SNDRV_PCM_FMTBIT_S16_LE |		\
 					SNDRV_PCM_FMTBIT_S24_LE),	\
 			.channels_min = 1,				\
 			.channels_max = 8,				\
 			.rate_min =     8000,				\
-			.rate_max =	192000,				\
+			.rate_max =	384000,				\
 		},							\
 		.capture = {						\
 			.stream_name = "MultiMedia"#num" Capture",	\
-			.rates = (SNDRV_PCM_RATE_8000_48000|		\
+			.rates = (SNDRV_PCM_RATE_8000_384000|		\
 					SNDRV_PCM_RATE_KNOT),		\
 			.formats = (SNDRV_PCM_FMTBIT_S16_LE |		\
 				    SNDRV_PCM_FMTBIT_S24_LE),		\
 			.channels_min = 1,				\
 			.channels_max = 4,				\
 			.rate_min =     8000,				\
-			.rate_max =	48000,				\
+			.rate_max =	384000,				\
 		},							\
 		.name = "MultiMedia"#num,				\
 		.id = MSM_FRONTEND_DAI_MULTIMEDIA##num,			\
@@ -146,7 +146,7 @@ static struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 /* Conventional and unconventional sample rate supported */
 static unsigned int supported_sample_rates[] = {
 	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000,
-	88200, 96000, 176400, 192000
+	88200, 96000, 176400, 192000, 352800, 384000
 };
 
 static struct snd_pcm_hw_constraint_list constraints_sample_rates = {
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
