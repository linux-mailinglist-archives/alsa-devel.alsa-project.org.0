Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1D751B5BF
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 04:19:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB46117A5;
	Thu,  5 May 2022 04:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB46117A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651717163;
	bh=2o7bD63ny//fpzR+aLPUy/dQ15fIybD+DGia53EGgeI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uos+jkPf7c2T+ubVRGqPJwThl5VRCOBKQFNt2fdFV/AUAENmbEe3me+FRkeaI3Mdv
	 MGfILms0btumg/jVCDWlX06eoRbIzUZ3VBTZdnp+YuUaUC+iBrAol+i+fGR/4bG8+k
	 TiwcZeeEAHo54glL+nlRl6NErOaWVSxmWrdiUVzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BA9EF804CF;
	Thu,  5 May 2022 04:18:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68993F804B3; Thu,  5 May 2022 04:18:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE34AF8016B
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 04:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE34AF8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VTMfiv/x"
Received: by mail-pf1-x429.google.com with SMTP id j6so2525031pfe.13
 for <alsa-devel@alsa-project.org>; Wed, 04 May 2022 19:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pIXDVokFolVKrzalTPKUm2CP3QVEc7PDIydFuy2ELrg=;
 b=VTMfiv/xxi6fGdCelW3OOBaUHSCm7CuZK+BQdtEUII66q8gebxTf/i43wtPpxuwg46
 5OXvSyTPQJ4h5XCfeXHkYuEyDfjap7ZqgOq+130hL11jSuDpUzvwjrVjbo/uTaqtGsPe
 msDZ7TOhh6Q62Cl41WK66/t5wy29qmqTdjeeo0wWa9CP411/IOJ8EcHvJgal+ZwepiMK
 4HRNPzZWvsiVxGNUZQsbHKlaiwdWDw7d6hKuwuyNnQ6j8RCQGl7JYJvIbvHdXCSkg+hk
 ARyfUqXY63VnGRzvh4aa/DJntuX5ziUFLzXtAGQOWXALdGZDcweQepSrO1tTJNUvo6W7
 vfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pIXDVokFolVKrzalTPKUm2CP3QVEc7PDIydFuy2ELrg=;
 b=POkmSj0652n6MF3ZhSgD/vZ3SQPgz9fR4Q6Yq2IhNn4w3iDInsxDtWvwprB0e540Qu
 sKVOX76HmLBBjZ3NfCp99d/K+eSzpNn2wssSslcfQ5/kUaCPGnEg21uC2Tl4OIDaA0UA
 64DTt030Iz3fHnFm75g+NMYPrRwcHfRAO+4Q97Zosfm+OHLhTEOUAZWNmwjdkAdvXD/o
 rXCC3N0VRb5/ih5BBwCm7+z9wfQITWHmd8CLIxujy8+HkwPa8K43y21+m8TW/6cTPGOR
 ayDfmbKWctJq8MDtynUmn5V1uJ+UKsxFE0hbYdjt58xE/8KisCFeLXtAoLqbwfPzM1Sb
 7Ixw==
X-Gm-Message-State: AOAM530+vQ3V49scmMnbH6jwioRbfdBIVDj349JQi1WZSNEGaiXXxdx6
 JQsF7cezJmEiau03CozgBMI=
X-Google-Smtp-Source: ABdhPJzWZdSl8kCzaGbBSh6IuuBwK7I7BYee0kVZukFZY0T4WG5+0idnYzYBVwUf4sMRTt4ffT1k1Q==
X-Received: by 2002:a65:6cc9:0:b0:399:26da:29af with SMTP id
 g9-20020a656cc9000000b0039926da29afmr20022746pgw.489.1651717092863; 
 Wed, 04 May 2022 19:18:12 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a17090aab0100b001cd4989fecesm3967290pjq.26.2022.05.04.19.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 19:18:12 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: mediatek: simplify the return expression of
 mtk_dai_pcm_prepare()
Date: Thu,  5 May 2022 02:18:08 +0000
Message-Id: <20220505021808.54337-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
index 151914c873ac..12644ded83d5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
@@ -213,8 +213,6 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
 static int mtk_dai_pcm_prepare(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	int ret;
-
 	dev_dbg(dai->dev, "%s(), id %d, stream %d, widget active p %d, c %d\n",
 		__func__, dai->id, substream->stream,
 		dai->playback_widget->active, dai->capture_widget->active);
@@ -222,11 +220,7 @@ static int mtk_dai_pcm_prepare(struct snd_pcm_substream *substream,
 	if (dai->playback_widget->active || dai->capture_widget->active)
 		return 0;
 
-	ret = mtk_dai_pcm_configure(substream, dai);
-	if (ret)
-		return ret;
-
-	return 0;
+	return mtk_dai_pcm_configure(substream, dai);
 }
 
 static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
-- 
2.25.1


