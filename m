Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CCA4F0929
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Apr 2022 13:54:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DAD317CF;
	Sun,  3 Apr 2022 13:53:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DAD317CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648986843;
	bh=4VzAfZDC0ofALBTowMNImjIi200C7b217ZkVwVf5aeI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TF08aWJIa5XPgRrvoC9Tl5RifEdUMQjGln/OyA8A7MQQPxmUBIIr2l2dqW5fhV4Kd
	 i4BPOY4n7VivKaDFdUCKNHVTtkSa3V/pl41iyPhtE7ED0d5IGXysO4agZqwRTTFS+s
	 NhpyUgZO0qGhbkmAkg2HdNKORvS0apjSqiZYrPUA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBA8AF8028B;
	Sun,  3 Apr 2022 13:52:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 551C2F80248; Sun,  3 Apr 2022 13:52:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11E5FF80100
 for <alsa-devel@alsa-project.org>; Sun,  3 Apr 2022 13:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11E5FF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ee9rnOJh"
Received: by mail-pf1-x436.google.com with SMTP id x16so1122250pfa.10
 for <alsa-devel@alsa-project.org>; Sun, 03 Apr 2022 04:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=sR5C+V0BrLQBvN4cusDa5moM4/Z0FLGEO0DiyFna108=;
 b=Ee9rnOJhOBjbwfUSmVUZIZfOs5YVvsbxIvZdyUKIdR3l3FHoadRLpLaEPPQikn9aGS
 QAVB3GDAeU4bYDihcUQh3U619pl56DdpqOWgDKWnxJU5BOpBIq0Hn9NZH25OEpJ+kEIA
 jjbpr/qAV+Vhxb3Uy/IdWyuLyevXlGQsMkRGYeBtsu8lHcVvjN2gEX/iFunRkImPZ7xq
 GVB6Eng8EqQ1jI2R0JG9S3JZVhj09A8EXXVQKTNaCtDMfPvzThbv9syAWoQhO7/FtgHt
 BS3WKNZQRTt5hmf1tjc2Pipfx90evF7PZbrW9dIvxCizxDTkM2SBB1tomOQ+j88E7w6G
 Jn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sR5C+V0BrLQBvN4cusDa5moM4/Z0FLGEO0DiyFna108=;
 b=zBnLeKCfoCm7f07sEnkkNx/17DZnuAN4oEZBWRehGgq/A05IKM+Vidxw4SifM/L38V
 4xK36DqKg6J7SA+HChRkHduOPdGVWCdOGeKLA+dJBmEMLO3NFIX71otyVsJ34BEjqwqt
 3ZuvecB9YuPpzGty2jqi9xQiC5kitXc+CTFv6Ry9WQSm+5Tbb0RvC1MuPT7is6FxOlLE
 7Nsuz/fp+uPMrNf3dB2ybTWjvhxuKIIyQhz9baYILH9Vm2hPAyZQXOesoTy8tTvat9D6
 OTDxXfsMXm6U+8vwm9njVRIQtdwP2lpEDu1CEwVSfE+LGBjq6MSetVg6fP+3Cswr+ljF
 B/aQ==
X-Gm-Message-State: AOAM531hShFG1Vu7x+VYvuNHD/ReQsRxweoD/h/MO5kF83jLN1hz1IBd
 4lnrGeuQi6IIPapj9fuG5NA=
X-Google-Smtp-Source: ABdhPJxJpvKl7ZEMtIJIZuVzN0aHjDDFf0Pkq8k5nYH6/FmT/Hogjjvq7L3y8TNkvFQMZ69xqIWeAw==
X-Received: by 2002:a62:cd83:0:b0:4fa:7410:6d86 with SMTP id
 o125-20020a62cd83000000b004fa74106d86mr53480921pfg.52.1648986765232; 
 Sun, 03 Apr 2022 04:52:45 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 u18-20020a056a00125200b004fb112ee9b7sm8031095pfi.75.2022.04.03.04.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 04:52:44 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: msm8916-wcd-digital: Check failure for
 devm_snd_soc_register_component
Date: Sun,  3 Apr 2022 11:52:39 +0000
Message-Id: <20220403115239.30140-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linmq006@gmail.com
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

devm_snd_soc_register_component() may fails, we should check the error
and do the corresponding error handling.

Fixes: 150db8c5afa1 ("ASoC: codecs: Add msm8916-wcd digital codec")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-digital.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
index 9ad7fc0baf07..20a07c92b2fc 100644
--- a/sound/soc/codecs/msm8916-wcd-digital.c
+++ b/sound/soc/codecs/msm8916-wcd-digital.c
@@ -1206,9 +1206,16 @@ static int msm8916_wcd_digital_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, priv);
 
-	return devm_snd_soc_register_component(dev, &msm8916_wcd_digital,
+	ret = devm_snd_soc_register_component(dev, &msm8916_wcd_digital,
 				      msm8916_wcd_digital_dai,
 				      ARRAY_SIZE(msm8916_wcd_digital_dai));
+	if (ret)
+		goto err_mclk;
+
+	return 0;
+
+err_mclk:
+	clk_disable_unprepare(priv->mclk);
 err_clk:
 	clk_disable_unprepare(priv->ahbclk);
 	return ret;
-- 
2.17.1

