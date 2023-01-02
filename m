Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5683F65B15F
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 12:43:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 896DF9484;
	Mon,  2 Jan 2023 12:42:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 896DF9484
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672659812;
	bh=mm2aTrjRt2wES2CUu7FGYcD61/ziCPpEBL+95eHkdtQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rmYPgOXciAXqhlO0E3K9wc3hqf4wzHTmsRc7eKmHglpS3DHaU6RPe+tCgkPv6joN5
	 sxdqmdEPZVVnuq0VkigOKYS60TgjfjF92K36ofca51PpmLGyONfD2KqmvMUiXwBALU
	 adEeINWHmGuoRFET/creazAtJNs2FU4NfHnDwiyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9612FF80542;
	Mon,  2 Jan 2023 12:42:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 832FEF801EB; Mon,  2 Jan 2023 12:42:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 976CEF801EB
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 12:42:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 976CEF801EB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GK4P+qO5
Received: by mail-lf1-x12b.google.com with SMTP id bq39so33459672lfb.0
 for <alsa-devel@alsa-project.org>; Mon, 02 Jan 2023 03:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3ISjc0HqFZLXSFtXhlmeBjb8PLOBicDWq3ocAujh1c=;
 b=GK4P+qO5a7tUHbIu3KBEzJQf+LXCryVD3sQnn0/7NhmYDIr3J7AYo+OB/fW8fZRrBg
 aA7rscY8x7m82EAsVDetQNaiAXOuNr+95LtYickbCC2H/l1964yv+w+s32rhWGfywqcJ
 0vtSPyK9cxBxBJd972wcNTeNZZ11+frK8GIHZ4HgeDMWkyQwLJieUypa9+gXiOLZC2wZ
 Rj4Pdeh8UUaYaF5msURa97gdfPBDbM0VVBi1r1FEydq+7V7Rqrd78iPbDyF+uzDP1mfu
 dvqc7v539aBZBsQxIkEuFKfT+F0WYZdn4VHA7b94NHfrpAuebipeb+h+RwMjqOP6v4Yz
 VJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d3ISjc0HqFZLXSFtXhlmeBjb8PLOBicDWq3ocAujh1c=;
 b=MnHmKx3FFT9RcNeQivoABq3VNwYcdLXX/jfLA7mlAlFcYm6aqkvd1hbAfbYrgxCgO9
 2AMxGeeyrMb+xw5oNWyg4UonKWvWywSctZFBkSAavHHMAGU2+oqO7ny8fomtSL2MdEub
 axM/akflbL5THIuKM0yY7l83M21/ITPojLIw8+TvxxP0/kHLv+Nt/rW1tEoipS/MnoKc
 xM6xeJ6aKOfWPGtfCTamXGLwvvq2WLAaP39k5WGvV/N/sOTFIMiV7ptfpD7pHcS3D0K5
 Bp5B+yTvB8ZpheQAwjXd7cwMLGOSl+nnYzxWa8GlszhNMuI31FDZEhDOVE5KwvbLhR2O
 BhrA==
X-Gm-Message-State: AFqh2kp+OJwkhirnQpJ9hH0ci/619B++yfpZ4B64uC4Dp3Oh2fa8kdPt
 Fn/HOJKEUQWiZtRD4I6XOnBnWQ==
X-Google-Smtp-Source: AMrXdXs9h8TiI5V7XQ5q+QwTxLi/FoTFF6VfTsBp3p4U0gG5FenWvfu1LJLWKzWit66ydiavrRVL5A==
X-Received: by 2002:a05:6512:4005:b0:4b5:9183:5ad0 with SMTP id
 br5-20020a056512400500b004b591835ad0mr14368017lfb.63.1672659719657; 
 Mon, 02 Jan 2023 03:41:59 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c20-20020ac24154000000b0048a8c907fe9sm4356397lfi.167.2023.01.02.03.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:41:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 3/8] ASoC: codecs: wsa881x: Simplify with dev_err_probe
Date: Mon,  2 Jan 2023 12:41:47 +0100
Message-Id: <20230102114152.297305-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230102114152.297305-1-krzysztof.kozlowski@linaro.org>
References: <20230102114152.297305-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Code can be a bit simpler with dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index cd7be55f6a89..6df9c48f42bf 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1119,10 +1119,9 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 
 	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
 						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
-	if (IS_ERR(wsa881x->sd_n)) {
-		dev_err(&pdev->dev, "Shutdown Control GPIO not found\n");
-		return PTR_ERR(wsa881x->sd_n);
-	}
+	if (IS_ERR(wsa881x->sd_n))
+		return dev_err_probe(dev, PTR_ERR(wsa881x->sd_n),
+				     "Shutdown Control GPIO not found\n");
 
 	dev_set_drvdata(dev, wsa881x);
 	wsa881x->slave = pdev;
@@ -1138,10 +1137,8 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	gpiod_direction_output(wsa881x->sd_n, 1);
 
 	wsa881x->regmap = devm_regmap_init_sdw(pdev, &wsa881x_regmap_config);
-	if (IS_ERR(wsa881x->regmap)) {
-		dev_err(&pdev->dev, "regmap_init failed\n");
-		return PTR_ERR(wsa881x->regmap);
-	}
+	if (IS_ERR(wsa881x->regmap))
+		return dev_err_probe(dev, PTR_ERR(wsa881x->regmap), "regmap_init failed\n");
 
 	pm_runtime_set_autosuspend_delay(dev, 3000);
 	pm_runtime_use_autosuspend(dev);
-- 
2.34.1

