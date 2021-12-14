Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90179473A9E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:13:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 076D71AA2;
	Tue, 14 Dec 2021 03:12:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 076D71AA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639447991;
	bh=hiLr12UPHj78i6gg0eB+iLRynMyyunmvERJdlqbH44g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uh/1Qw2Nxyeg2ffZdCGtcRDjcudquQlVL8DfxuFwAEJNNXabKsD2+3EHzyfdBNLJU
	 6IKvcBdpfrjZ2SEG9tY9vd5QfWPRnpaOnQZCtk/PHKdlS92MEFOW1TTNtB0JxdKXp4
	 PvIgvg7DNNjh9CLVCVV88EIJRM2NQnJ2lUgBJ3y0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1512DF80549;
	Tue, 14 Dec 2021 03:09:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B01FF80536; Tue, 14 Dec 2021 03:09:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6B5AF8051D
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6B5AF8051D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mk55fFzb"
Received: by mail-pg1-x534.google.com with SMTP id y9so2955000pgj.5
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4KYEUeghlc9KEDx6ZlVKM3Lnv7AnN9ZYnSgIj6VNOz8=;
 b=mk55fFzbWVt9mp+fbqMx8waC8txprqF6q23d3C/frj02AF90B4XvbKVIHOc3ZQzUf0
 Ius6jxLIAmvNkC0TvKkxbHMdb7SX1L0MzD2FbtskOOYzGokWATi8B28uJOBncCxCAG6j
 QZhhJo/6CTbNC3hninu4Q1giVcpWVXcDh79VdA5aE0/NIp2xWCJcdJDm43VsqvRP7s0A
 gKCxRrsXGaQ2o9Ajd3ZMvzP7O2In66BEAVrJctwO3kkQdQq00rsmm5NI2LvlEt4xjeWx
 nVxUBPfawP45NzgAJHKUCNz2OIMEqaM38IbjtbDeZZr2g1Ffltxg+89m3ZN4QbSeC22q
 mEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4KYEUeghlc9KEDx6ZlVKM3Lnv7AnN9ZYnSgIj6VNOz8=;
 b=qkZK4quoyVWetO1uemFXtTQC93ru4LriQpid8vMLkzD6thliUtu0LG945hjgMXASty
 3ai02fJCL6jdt8NBhEqnuJNrUX0jz+E+nj1eMcR51Io1UagM3XzifeUpgStwhcWJ/QNV
 81Ifj9TfQfKxVfvveLQec2VUaN7yEUHrYFKc51ijNeNwX4fzsEX6OxQ1DT0i4REUK8++
 P3NVwJTEiveOvwk+fsTOLtefwQR04RabztpmmGiER9D/dlwAMZjfIfqum8WDwfMUcGrx
 fUkjhKQT35UQXAkxcciAqqkp+Mpz4k6gKxO5kCR7MT6XzB2oNgqzh7dTXszbuT6tstUx
 be3Q==
X-Gm-Message-State: AOAM532S5FfukWfV20+ihXTW58gkG03XOJ+sjJY7U331oolc58tWpJ6y
 oEoDmibGKssfDtYBobjj8JU=
X-Google-Smtp-Source: ABdhPJzrt+ZnYE5YajfbmhAPBkBFh5yC6fKdmjbg8nDgqiL7+j2IshKwABGMCj6TfYEdstHdk+o2fg==
X-Received: by 2002:a65:6819:: with SMTP id l25mr1739290pgt.506.1639447772501; 
 Mon, 13 Dec 2021 18:09:32 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:32 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 07/22] ASoC: codecs: simple-amplifier: Use dev_err_probe()
 helper
Date: Tue, 14 Dec 2021 11:08:28 +0900
Message-Id: <20211214020843.2225831-8-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
References: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Use the dev_err_probe() helper, instead of open-coding the same
operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/simple-amplifier.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index b30fc1f894e1..d306c585b52b 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -69,7 +69,6 @@ static int simple_amp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct simple_amp *priv;
-	int err;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (priv == NULL)
@@ -78,12 +77,9 @@ static int simple_amp_probe(struct platform_device *pdev)
 
 	priv->gpiod_enable = devm_gpiod_get_optional(dev, "enable",
 						     GPIOD_OUT_LOW);
-	if (IS_ERR(priv->gpiod_enable)) {
-		err = PTR_ERR(priv->gpiod_enable);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get 'enable' gpio: %d", err);
-		return err;
-	}
+	if (IS_ERR(priv->gpiod_enable))
+		return dev_err_probe(dev, PTR_ERR(priv->gpiod_enable),
+				     "Failed to get 'enable' gpio");
 
 	return devm_snd_soc_register_component(dev,
 					       &simple_amp_component_driver,
-- 
2.25.1

