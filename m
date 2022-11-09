Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D696562304E
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 17:39:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EC9A857;
	Wed,  9 Nov 2022 17:38:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EC9A857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668011961;
	bh=+MgHs09xFxgpXLycPzYaOLaxk5KKaivHh5r7ScGpHCs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uil+5tZfHIGQqn2NOWLcdiroaq9BIumacXWrfV2/jc/sRZn4+RyyRuQ0QW1uc/iwj
	 GadaFnefTgilnedY7gdmp7Wy7ut3QeZS4AUYdlUp5A7TyywzZkXb3KhTEf66jQ5KVl
	 9EImQsIG4tq7hQJxxrcdMTd5nXOwTVMzTTUQ4R08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EFDFF80121;
	Wed,  9 Nov 2022 17:38:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53ED3F804FE; Wed,  9 Nov 2022 17:38:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04C7BF8023B
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 17:38:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04C7BF8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZvmKRSgp"
Received: by mail-lf1-x132.google.com with SMTP id g12so26525623lfh.3
 for <alsa-devel@alsa-project.org>; Wed, 09 Nov 2022 08:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bpXTzzsTu20XPUGJ5DoFqQgTxzAySWmD/o0USIl4Q7c=;
 b=ZvmKRSgpm7xR3LbQLB9UZw/n530C2QqBOI/9v6N5LETt1ngFIBejP+mEzFJPgBhQaG
 paQ8cqq3p5gMPdWmRllFXhEjVe6pmT1cZZU7jMZIjJdgUEiHIMbzkJp6JbC0tOuZkQAN
 JQpvhqxk+L2rx2r3HKE4sI9tT2earIcgutXI02JEuXkpVDsoiAV5hr/odCSKuD5HYCsX
 EzYlHM9zUsx94X1xcMtDjkCcZCh+Ejn3AKVmnQiddR17VniiqLnnT9LJJKrT7ndsvIHV
 jt21gUslJDNK3+L5Vrzcf7HpqJJboiJ4GW7cDZxQM1TG7YNFFpqXFgFftVxZsCM6KNGi
 mYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bpXTzzsTu20XPUGJ5DoFqQgTxzAySWmD/o0USIl4Q7c=;
 b=8PbGQrNd78ymVYm2U48M58v7OIEsnPlGdY7HROd11FZAEO5+J8IqQxCN9UbOAgA1yo
 h/l3nsNHA/AdCUwhES5TdMn4YjuNHSVakpD7d1e8p+Lyh/pSVO5YKDcuOH64XTPyjxaX
 usTc9lFnkVynM8oYVDHK4DrpZXpNV9G/kfccRVtNDIx3VZzbss46FB5jo8x1vvfiQmVa
 Y+8WeOVpTVPgTTBJmmb3wfJ49eT90hdwD6fZjQ3OEXrj5GZ+owKOIF3REVxpKDWgmxFf
 FQRtEF+/BZ0iNDlFJgRffm3C/6KuDM61PS0jMoE84L0PxlR8Qi3Ge+NHY7j0m/+nAL2k
 c5tQ==
X-Gm-Message-State: ACrzQf1wrhTMOPTtJR6a3Z5vyBst4nLUEtcqO1HXnOokEGjc4ekPSagu
 bzXvQEJubHOd6b0NO9/OgAWyKw==
X-Google-Smtp-Source: AMsMyM6lHI/BAB50y66c2DoUESOnTYahQFR5Sdkpi9AvD4quy2aQ56rWRYyg2G/0LB1fmfNmQXTI/g==
X-Received: by 2002:a05:6512:3086:b0:4a2:406d:47b8 with SMTP id
 z6-20020a056512308600b004a2406d47b8mr638107lfd.249.1668011883221; 
 Wed, 09 Nov 2022 08:38:03 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a056512074f00b0049476667228sm2309168lfs.65.2022.11.09.08.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:38:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: codecs: wsa883x: Shutdown on error path
Date: Wed,  9 Nov 2022 17:37:58 +0100
Message-Id: <20221109163759.1158837-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

If probe fails, toggle shutdown via GPIO to save power and reverse
probe actions.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 77a7dd3cf495..4ad8b875eb8f 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1415,6 +1415,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 
 	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
 	if (IS_ERR(wsa883x->regmap)) {
+		gpiod_direction_output(wsa883x->sd_n, 1);
 		dev_err(&pdev->dev, "regmap_init failed\n");
 		ret = PTR_ERR(wsa883x->regmap);
 		goto err;
-- 
2.34.1

