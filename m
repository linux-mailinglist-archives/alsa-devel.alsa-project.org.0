Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAFF5B5563
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 09:34:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C853C16DC;
	Mon, 12 Sep 2022 09:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C853C16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662968072;
	bh=US8zGry1EpSMTFvnAwMROBYZNwIK0bqrrhQjSvWmd2o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FsWJbHNXbk/sQdcWate4EJaW05EXzL/LLNDedgBXaWjJKONzT2TxmPhj2pjm+5Wnc
	 YcMVdiCjeNcNsgDKW1w+bFOUqweL+UCOOUdnyfk9HYadn3fy39BCu8bAD+ZsCTtmC1
	 Dk/Q0vuoQytXfCxXAF5W4QIZ8MdF8osYH714cum0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49B83F8030F;
	Mon, 12 Sep 2022 09:33:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00894F80256; Sun, 11 Sep 2022 16:57:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DBBAF8011C
 for <alsa-devel@alsa-project.org>; Sun, 11 Sep 2022 16:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DBBAF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i/f4nXEJ"
Received: by mail-lf1-x12c.google.com with SMTP id bq23so10877394lfb.7
 for <alsa-devel@alsa-project.org>; Sun, 11 Sep 2022 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=eAQ7pZ3gOqppStIbzWQfQ4sG+iuDRIjLuat0vE00Rkw=;
 b=i/f4nXEJosWajMhzlcgxo2AeRYy8/SU8YuJsy/YUexGUSfmdHSfyaXFHg67uwCzsZb
 CR/VJbhPFE3qG02Dz87HQ9kq3KyWDatY6+wb99maWe+95+TNU45rKgTiCOv+VSP/9V1V
 vguqDDgMyaJ1D8i7P6UXyIX41SjYzJx6HmUoG126H/Q+EzuVmAZ7DYCLqVHx3IapunVh
 v1m5TVQdblRjU6beiAIxjsWfs76gCfl3dAqV45FHzMxtddBYYRobhEMYXGHeotwh+sXv
 1Rq2SavvkmaOgsDp+osvWjbzAHvUIG/Vop9j/gtmGReUBz7NqGju/T7zQxZKpe2oyA2a
 xvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=eAQ7pZ3gOqppStIbzWQfQ4sG+iuDRIjLuat0vE00Rkw=;
 b=BUa+OnuNOPzrF1xF1Bg7RULvOuAoyqCtjctr2zAFnMzVedeP+gStaDC2o44d1rb4eY
 Qv2l94sxU3t0Eha1XnSIXbX9we/RHh3EAQWPLRPkfgc0Y4vFRHvYoufO59OANrzGqAm9
 bDLEtAzEcxv5CXYG5e4WMrmIyI2tyHOdFt5WAkLj7aw0aKWlQu4gaGEWrwCJgOMVQqWe
 SCttUXky+Lk44CnIQ13/0nP8Gmt+TzcQWEU9aYnoJUIyTFw6zGT004bf25nTJ1TMAPpE
 P7Qv/WNFwSPS7jCarN6iRR7bFiG0neYkqEUyn7bxBhpt2gAHAPaKdnSI1Pj0ZtdafIP5
 aHZw==
X-Gm-Message-State: ACgBeo0A+CvJsVaQbRBt0I5JxH1H++4PhwMPt3SMVAO0VaIyUSSNjtfQ
 oJe6+fqZQ9wcQoj+pVNu3/8=
X-Google-Smtp-Source: AA6agR4dOV0r3KZlPBj/fj8prupK0Ya8fCrBCJbZOIV671RYwn5zSNIK6JfGj+HSnJYrgcAzn07meQ==
X-Received: by 2002:a05:6512:3090:b0:48b:6e1:1b55 with SMTP id
 z16-20020a056512309000b0048b06e11b55mr8106591lfd.535.1662908248930; 
 Sun, 11 Sep 2022 07:57:28 -0700 (PDT)
Received: from localhost (95-31-185-216.broadband.corbina.ru. [95.31.185.216])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a2e9205000000b0026181f65600sm675817ljg.136.2022.09.11.07.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 07:57:28 -0700 (PDT)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: sunxi: sun4i-codec: silence misleading error in
 probe
Date: Sun, 11 Sep 2022 17:57:11 +0300
Message-Id: <20220911145713.55199-1-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 12 Sep 2022 09:33:31 +0200
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Mikhail Rudenko <mike.rudenko@gmail.com>
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

In the case when a codec device is probed before codec analog
controls, snd_soc_register_card() returns -EPROBE_DEFER, resulting in
a misleading error message

    sun4i-codec 1c22c00.codec: Failed to register our card

even if the device is probed successfully later. Use dev_err_probe()
to demote the above error to a debug message.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 sound/soc/sunxi/sun4i-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 60712f24ade5..01b461c64d68 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1825,7 +1825,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to register our card\n");
+		dev_err_probe(&pdev->dev, ret, "Failed to register our card\n");
 		goto err_assert_reset;
 	}
 
-- 
2.37.3

