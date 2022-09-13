Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1615B7CAE
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 23:24:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0879817B2;
	Tue, 13 Sep 2022 23:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0879817B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663104248;
	bh=lKF1jCOzRtAkO9GC+HUc5mXA2fizB9VVIZs5GM8JdbM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vmR4l8cZPlgSTaFGS9s6hw0RNbV4g6V0yzrBxx2Zfn4u4eiUWC3ht5HPfFeIKJtmY
	 nK57uCHpF+p7JY7sAmNeQrW9InEgrqxPla9Io3VO5KrAippQVpA0hnHeefZFJseAoF
	 +D4lGG18bZ2HBAfZStw1P0mn8K7oRhvn6x0Qfa9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F1CF80269;
	Tue, 13 Sep 2022 23:23:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2543F80224; Tue, 13 Sep 2022 23:23:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 409AAF800FE
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 23:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 409AAF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Qik0HCAE"
Received: by mail-lf1-x130.google.com with SMTP id a3so10123926lfk.9
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 14:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=IcnIgmMTd0DbyquQgMbmNfx9FsBF4BI9rV5mzK+kC9s=;
 b=Qik0HCAE4mWGdPhhl3Z4XxHZp2Fsh0qBqor3gfQ7RHj1oA6dc1TrGetu03nykh1gIs
 w+ofH7Fq69SEMBdJ6Ch4oIylIIktjNbYHlz/yjxBxzoJ4pRA+e6nMmQ4GUXJUYgi7fdO
 ZUY3CacnUYhm1obecq1Z183lWv5T5Jw0YJnsIXaiSMe7zocNkqyvQzKrIM4M7d88m2HQ
 IfJM1vEV597EU42uX81zY0iOXdGc5+/VGJG/4bp5uVAFNB1s5HEJw0Q0DB/s4FOosgez
 t5RMwiGNUr3quyrVSVMEYmfX6VB1rt+KlxCbBwURFi/6i0gclZ8xRNSu6UiGPjteEK2U
 6pPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IcnIgmMTd0DbyquQgMbmNfx9FsBF4BI9rV5mzK+kC9s=;
 b=k+gjHGLaMrxUdxSbD55eilR/ZkxNLrY0lib92BiC0OZ+u+v4mKIS2+91eNhIoA1k2p
 ocgoGZJ2PzRotXjk6eHrv4Oe+3yvxpioeJhy9fBMf5dmabVOMJ2rGqlXIUsXFpuhs+ig
 hdQuDTFR+2nrp2UOZ7evRCiPcSQSv5zfnXevBzoXsqyaU89j/nHxaSwwJ2XMiAls8VXI
 5yfcVlI7x4BSw2jQebw50cUlrhjYWaORjPO/GPPhF268aib9sLZP2jVGxzMBOGPShe+/
 4QnHFJAtmjC8L9d9ChCKsA9gNS3HLLIW41jen7UwEcrUfI9ee5oNwz6iyVj9YkXnz46O
 W+UQ==
X-Gm-Message-State: ACgBeo3Ss7WtWv/SnOA9JEeXT989DOSAcZ6FKTxJ3v+jQ/uuvoDMTHhg
 VLrQYkXSfOXXXMtoJq68zTg=
X-Google-Smtp-Source: AA6agR7lqpwxdnlrp1g555khCJ+9y1Mn78ZuFzcawcY9GJzf7Jw2t+odgShu0RDTZclAju9cgeR/kw==
X-Received: by 2002:a19:e00d:0:b0:492:e5a5:588b with SMTP id
 x13-20020a19e00d000000b00492e5a5588bmr10452415lfg.243.1663104182075; 
 Tue, 13 Sep 2022 14:23:02 -0700 (PDT)
Received: from localhost (95-31-185-216.broadband.corbina.ru. [95.31.185.216])
 by smtp.gmail.com with ESMTPSA id
 s28-20020a195e1c000000b004979da67114sm1964736lfb.255.2022.09.13.14.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 14:23:01 -0700 (PDT)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Li Chen <lchen@ambarella.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/2] ASoC: sunxi: sun4i-codec: silence misleading error in
 probe
Date: Wed, 14 Sep 2022 00:22:54 +0300
Message-Id: <20220913212256.151799-1-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <YyCqC2EypxnoJFk7@sirena.org.uk>
References: <YyCqC2EypxnoJFk7@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
changes in v2:
- rebase against current tree
- add Jernej's Acked-by

 sound/soc/sunxi/sun4i-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 830beb38bf15..3a7075d03c23 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1804,7 +1804,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)

 	ret = snd_soc_register_card(card);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to register our card\n");
+		dev_err_probe(&pdev->dev, ret, "Failed to register our card\n");
 		goto err_assert_reset;
 	}

--
2.37.3
