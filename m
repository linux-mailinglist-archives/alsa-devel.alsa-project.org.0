Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A97B267C72A
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 10:27:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E37C1DF7;
	Thu, 26 Jan 2023 10:26:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E37C1DF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674725266;
	bh=Mi9Xs8lXkuyKzP8S2V6KFQSz3JclzUkGqU+9kRnAFpU=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IndI8icgs9EFOuRUwVXvlG70lKH/9M8+VJTB1UPHgHXsDECUBP3XEtKYVIDe6ZJ9F
	 f1v7guLItlE5J9Q62+jR+YE1GOQityDQk+9UWPlj3k21l52Pd0qMuQ/ohYLRWj/AW0
	 hKyUDdi0caa3axNhgLbE0OiNSvPhpMeBCschyl9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A72F8016E;
	Thu, 26 Jan 2023 10:26:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0C5EF8027D; Thu, 26 Jan 2023 10:26:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4D62F80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 10:26:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4D62F80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nyvmsai7
Received: by mail-wm1-x332.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so704155wmc.1
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 01:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1lidck4lW/zmw+foGw+y/7lttrAnguvFB5SfFlQVGE4=;
 b=nyvmsai7ZWt+8fiqIQJmJU1b5/dbt1jtvHROKxY7qs4cBunuCgFYWBS3vYtLuCEMAD
 PUtk9CgscbpUf5aVFQZ5LMQmlm5dx6m6vT9bSPEtqbRezF7snejuuAlHTvaYea4c5XvO
 EdCf+/jnIiAMhxfBHTW4qHsg/9IrLG/ewT9OboFuQVc4SK0bV/ApuUap2xiYIYpQ1uOx
 UOMR1OnbIwxxSpoB1YpkkRpDIbepNTX9bZiWWIH/UDKiyiNLbGD5Fmd9qnbnVo4fWZ/N
 cJTtarAbeTrKwcXJRTT5Pb41K5kSpL3pbKn/FipP4I7xSa2PJCuYmxDt6ltApD6EaQxj
 kV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1lidck4lW/zmw+foGw+y/7lttrAnguvFB5SfFlQVGE4=;
 b=jN6qOJg6uwhk8oBtI1GNHPT1GWzpeBioOkraSsDzr0gL7zRhVzsHS3MLYm0cOQkOVM
 XtYU7LHYy3coHfOxcvbEKs8RnkGWLUOmXfsVx1rV1aUz/Iy5jduVaQXKWaC50gWyam0H
 FcUEZkE4yk/hfXt6LR+HO2pRoinpvMAFnOi8HEtf9Bg061/y6cVlMLmeJ/+gMDDjIpYZ
 xIBxL35DQYw23meNbkhJeiAFWTBY1voR/BTcb/OFBsh6z+bPi4GzSvXnZnlsZygBMyMi
 d1NV9X135/i0hhBdZkJAougdtW7VVGJhA0FU+eD6fJuCey4Cj5mL+HknWUp7QyKFspiL
 vZtQ==
X-Gm-Message-State: AFqh2kr90AlRJMRqhaUVu65xg3kEpJtJqQL0X8ddFspnkjIGbB7Dsk36
 cI0E/ytaC2E18LZADx+NU1k=
X-Google-Smtp-Source: AMrXdXvBqRioyyA4099IubEJx8GR5Jtpr3rsCZ5m5Oyz8/c3oySRDIwRWgrlRYHiUeSXqbL2NsTbFA==
X-Received: by 2002:a05:600c:4f86:b0:3db:66e:cfdd with SMTP id
 n6-20020a05600c4f8600b003db066ecfddmr32709189wmq.9.1674725200604; 
 Thu, 26 Jan 2023 01:26:40 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 i21-20020a05600c071500b003db1ca20170sm896026wmn.37.2023.01.26.01.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 01:26:40 -0800 (PST)
Date: Thu, 26 Jan 2023 12:26:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8188: remove some dead code
Message-ID: <Y9JHSwcfdNcfMjjt@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Yang Li <yang.lee@linux.alibaba.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

We know that "irq < 0", so delete the unnecessary check.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 57a31330e5f4..e8e84de86542 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3220,8 +3220,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id < 0 ? irq_id : -ENXIO,
-				     "no irq found");
+		return dev_err_probe(dev, irq_id, "no irq found");
 
 	ret = devm_request_irq(dev, irq_id, mt8188_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-- 
2.35.1

