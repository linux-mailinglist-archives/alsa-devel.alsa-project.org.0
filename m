Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F207FE204A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 18:14:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86B901657;
	Wed, 23 Oct 2019 18:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86B901657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571847290;
	bh=zkopfRlqUM4leNnW1hD7vRvCo2n0A5Ujuhuq6Bhrmp8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K4QpgrV1kgdEzth2t+8VAv6LSJplPvyqdW39Vcms/IVB79AIhDhoE985qhdSqZ22+
	 ye3qyQe9YqHt+CLp1dHGl+7mpCTInb3P3SWwgW1J7hS7xhhRZ36NWzYiXWQ5hPsROS
	 e3AT59Ra5BFDyVTNxmnCUTHMTcgq5tsxZzJd0YMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71038F8058C;
	Wed, 23 Oct 2019 18:12:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14FB3F8036F; Wed, 23 Oct 2019 18:12:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7545FF80274
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 18:12:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7545FF80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="gMwNNbwH"
Received: by mail-wm1-x341.google.com with SMTP id q13so11856839wmj.0
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=94Fa0onmL8QGae72SEYXHjiLUCmbUKrPJtMdClFuS2o=;
 b=gMwNNbwHenujY7v/kJuQKntVQAWnsbgfL4M3WoHGC6pm2MKHeb8jdd5TIQPe7JlCEn
 uLskMNAA5vwIZaPVvT+qBK5AsvgbCLhqhL48s/ZapNXG9WwgIE+cc2XRKyithM4kw/jH
 Qruk2iiXGFqF20V1T4d/BOF0PgCnBhF3LJns6TBGWi1xj5grk+i1ooWWkhLoo5/Wz7pe
 3XjE2ouDUWRZA+ta1vLrkivCI2ABovlbJFO1Qv/iAYAmM6JVdwkSIr8EteFdFU85B8Rl
 tpbxiXX4+Z0HHikclQzwKJ6xrA7NEGwogl85KmN9OWjh9q4Yzt2Zrl/LMmNPt7pI1evZ
 NPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=94Fa0onmL8QGae72SEYXHjiLUCmbUKrPJtMdClFuS2o=;
 b=MXvwfIsQjGLfYhj9EK0g6KIZePw80CkIir5NN0Hce4AfgRjwYMI73d9nlhXshZwJIu
 aMixu3EbwU5pTcXTzlkyN3js0sA182hTGDs/W56Yo/FrcuxuMIuuqjE3fp6Mq95EKun8
 Dp/WynhAEzOUBADZe2xTKTHf0MpAwDqYyVwKrxJQ8w24oI0XJceyiTy2G26O0sCC2Wgi
 62rAU+rawEy08mb/FJXVacIuHGM/hxXiOKlHlu7TfsWuYZJ/3DQNBbw2qfkvwPcMpvZD
 rUTOpXDMnL8NrYAvIyjMV4fG9vhpUziurfV9cDEbNNaC0N0Tsrw7wwzhGorM9FaQ0Z5a
 8osw==
X-Gm-Message-State: APjAAAVt/mtX+tISMeShQ4YXvbOWK6P9JtlJu6aoAMnFhaZawhJcOfPF
 iyOZNPZdDujNDHafenVcHlChbA==
X-Google-Smtp-Source: APXvYqzMAmLwNI3p00bA5kimGrraRfnNgjr+Zbn8mCCG731Bi76QA7o5giekrbQp+R2MiBkIwKlWvg==
X-Received: by 2002:a1c:544e:: with SMTP id p14mr621282wmi.17.1571847132157;
 Wed, 23 Oct 2019 09:12:12 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id x7sm30240578wrg.63.2019.10.23.09.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 09:12:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Wed, 23 Oct 2019 18:12:02 +0200
Message-Id: <20191023161203.28955-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023161203.28955-1-jbrunet@baylibre.com>
References: <20191023161203.28955-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: alsa-devel@alsa-project.org, Russell King <rmk+kernel@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 1/2] Revert "ASoC: hdmi-codec: re-introduce
	mutex locking"
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

This reverts commit eb1ecadb7f67dde94ef0efd3ddaed5cb6c9a65ed.

This fixes the following warning reported by lockdep and a potential
issue with hibernation

====================================
WARNING: pulseaudio/1297 still has locks held!
5.3.0+ #1826 Not tainted
------------------------------------
1 lock held by pulseaudio/1297:
 #0: ee815308 (&hcp->lock){....}, at: hdmi_codec_startup+0x20/0x130

stack backtrace:
CPU: 0 PID: 1297 Comm: pulseaudio Not tainted 5.3.0+ #1826
Hardware name: Marvell Dove (Cubox)
[<c0017b4c>] (unwind_backtrace) from [<c0014d10>] (show_stack+0x10/0x14)
[<c0014d10>] (show_stack) from [<c00a2d18>] (futex_wait_queue_me+0x13c/0x19c)
[<c00a2d18>] (futex_wait_queue_me) from [<c00a3630>] (futex_wait+0x184/0x24c)
[<c00a3630>] (futex_wait) from [<c00a5e1c>] (do_futex+0x334/0x598)
[<c00a5e1c>] (do_futex) from [<c00a62e8>] (sys_futex_time32+0x118/0x180)
[<c00a62e8>] (sys_futex_time32) from [<c0009000>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xebd31fa8 to 0xebd31ff0)
1fa0:                   00000000 ffffffff 000c8748 00000189 00000001 00000000
1fc0: 00000000 ffffffff 00000000 000000f0 00000000 00000000 00000000 00056200
1fe0: 000000f0 beac03a8 b6d6c835 b6d6f456

Fixes: eb1ecadb7f67 ("ASoC: hdmi-codec: re-introduce mutex locking")
Reported-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/hdmi-codec.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index b5fd8f08726e..f8b5b960e597 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -274,7 +274,7 @@ struct hdmi_codec_priv {
 	uint8_t eld[MAX_ELD_BYTES];
 	struct snd_pcm_chmap *chmap_info;
 	unsigned int chmap_idx;
-	struct mutex lock;
+	unsigned long busy;
 	struct snd_soc_jack *jack;
 	unsigned int jack_status;
 };
@@ -390,8 +390,8 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
 	int ret = 0;
 
-	ret = mutex_trylock(&hcp->lock);
-	if (!ret) {
+	ret = test_and_set_bit(0, &hcp->busy);
+	if (ret) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
 		return -EINVAL;
 	}
@@ -419,7 +419,7 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 
 err:
 	/* Release the exclusive lock on error */
-	mutex_unlock(&hcp->lock);
+	clear_bit(0, &hcp->busy);
 	return ret;
 }
 
@@ -431,7 +431,7 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	mutex_unlock(&hcp->lock);
+	clear_bit(0, &hcp->busy);
 }
 
 static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
@@ -811,8 +811,6 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hcp->hcd = *hcd;
-	mutex_init(&hcp->lock);
-
 	daidrv = devm_kcalloc(dev, dai_count, sizeof(*daidrv), GFP_KERNEL);
 	if (!daidrv)
 		return -ENOMEM;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
