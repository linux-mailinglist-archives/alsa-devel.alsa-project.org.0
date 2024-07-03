Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F89925FE5
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 14:14:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D29B0847;
	Wed,  3 Jul 2024 14:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D29B0847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720008870;
	bh=C2mr7bEsmKb5ROqOqNDH7IBKsoD0jmhYaojg0nmAdOo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A6rDKzwQm37icgHZz7t1w13IAsvLskRdSmSmKG2hy2XWJXJgeGsZyuROK1zOC9y//
	 OjwnKaT+jKDt1IWB+DMoEaM6hoO0T1EntqF6lsYrbsFE8sVsKdIUAMeqw1mI6H8Yvr
	 tJEZu7M/Y1lyU5k4K9T+um/nnprUlBBV/LLkduh0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91FDEF8025E; Wed,  3 Jul 2024 14:13:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C56CF805A8;
	Wed,  3 Jul 2024 14:13:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B263F8059F; Wed,  3 Jul 2024 14:11:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E0F4F8014C
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 14:11:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E0F4F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tZYdqwwM
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42573d3f7e4so35736235e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008672; x=1720613472;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7ezAWLj7MMf6cupnuxIo+JndCzydckyqulVxplwpWA=;
        b=tZYdqwwMPkwwCymDq664YcFnr9D2QsXYUw/GJ2wK6H8mtJ6uQKrfyxeXFmHGrsO3fQ
         k9syXIhkbXwlXMDBc12Rse0Sc1fMayYLkPg2LQ4e/1gRjbS+SgM5S3ovGlO76jl9HfdV
         FZeId8Ifg3Wi1HUd5ctBrVu4H9K9+32DjuqJL60HmIyEic7H+P/8g3nlkJN48e5hEdyX
         qUWJ3BI4ZeH07JVm/wHctgbFyzsTTe+wGwSkJDoz/qnqntGdpKoVIvIPBWl7pU4si2l1
         7ZxBfAB/+9UYD1PLCoKwgjLycepFdnHSHXKnKza44lTYj1x1Eb8kX2ozDaazYXHYp+WA
         F7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008672; x=1720613472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7ezAWLj7MMf6cupnuxIo+JndCzydckyqulVxplwpWA=;
        b=n7ejSob8s5A2/YhgnxLbNGgUNXfoZqxuF1PYjptLXTqG7UGV5+ZdqgbEqzlcSF+P+7
         717UzWRYfAbGA5EW0O7VN2N6XtPXyx/UWNUwLRqZCRJI1T+CM6ZxwzuQ9kN2jr/2kZ/7
         6Fk7pPt4fuigE9yQw6UfM3JgNa4DjamHyzDI/PagJ8yCIp1uEJ1MbVe+uavV+6/iuMAf
         V5OnKJj3kevXLvNqkI8nExMDNzl3zK9q8iXUbJ+Ro3HcrDRjp8BM07pWVmeFjz2t46FI
         89cRJ+ABBLsxgGMtnEHofw88IftR+tHaFczfWPAHronAq0Q4aU3oHwZXaL5tCvBtHhLP
         7Kuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3e3HC7Gm+7JJqz7uDu0QZCErNPYlQPKEVaLb0Vb/EoRH9nT9VrytbSu2q4rGp1rUkiGncuRBgHz8xRTfC2JY/VWYsMiwq3PbcDgA=
X-Gm-Message-State: AOJu0YxpA1WyLYuUxUmtH4oDwnjGIlUJPLfCW7QNN2c3qhovUeJr4SxW
	VaTH7yqmzPV2CMMhl1Vp9ElFpEH8x2vxyYJV9TV8+aWbim0QtKwED7Qa3R55qOQ=
X-Google-Smtp-Source: 
 AGHT+IHjhpXQtXuOXL2sG7Nz/kypplntZTHCDuejtJNJgkYlN74FsUPBIXDr/hqUtpG9V0bzXDVXnA==
X-Received: by 2002:a05:600c:181b:b0:421:7bed:5274 with SMTP id
 5b1f17b1804b1-4257a02f7f0mr79850405e9.10.1720008672113;
        Wed, 03 Jul 2024 05:11:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:10:56 +0200
Subject: [PATCH 02/11] ASoC: codecs: audio-iio-aux: Simplify
 audio_iio_aux_probe() with cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-2-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
In-Reply-To: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3506;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=C2mr7bEsmKb5ROqOqNDH7IBKsoD0jmhYaojg0nmAdOo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/S1XP/zEy17um3RkbB+7GXXnM0KA43l8+pw
 GB5H7vS1OCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/0gAKCRDBN2bmhouD
 15/ED/4tY2cdMjmCzBV33UogE0kN1pHip/43JaL23ZH7qMeMHA3I3HXhF7aKMqK7J2sC0UIzYGz
 3UF5+KEbKvi9RXaKQmvPhEEboYiZWEeayVfsviuXZz8nxxyJd+9az94jDrtbZTcz+A/y7RrQpIV
 0RRIbNATso7rZk4UUuVrjIKKlRO2N78g4xrJRvaTmsEUB88uJGF3kZAQOniUdfxXOUpn8eCwLQM
 ED/8KZPkZCnzSghFw8NgYfG8qG7VzAVWfp+IDWZPwF875VBep7TgSR8l8oxFvSjhtzykewNxMXH
 170X/msAVpt0RDwMRwNiSYjecVw4pCmF6nG1b7jzaUQ8bf9tJpqzHD+Xzilpx5y/CFIgz6Qvv2Y
 2ykvK6o4boLyK+rgP+KAr+/jnfAfLT5yIGFu6ufyNL2JkaWnwvo9B6Rh5T3Ccts3uOvJyWNCXG2
 Fm0n1cnNo3w4Y1sYeSqq1znPn7s5a25nX9fFp+9pCwLPFei70SRPfU5+jB3fbDlGcqm/vITVx2f
 raw0aCQ2q6xyCFwKg/H2Ib62EqpEAKnUuC99UxwTH+ud5nYPnxN+pqS55kZPvGDzyWZuEty8kK8
 reZVthBBte8bn0XyuOOkBiJ7vd9IvPpbOFsJpx34YEEruH6wFTVCkUf3D3WRfx28Zg5ccZcC5nh
 2dZFA30ZhxUEPwg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: TJQSTRS2UY7X5EGCXPNTJ3MHYRSAQDRF
X-Message-ID-Hash: TJQSTRS2UY7X5EGCXPNTJ3MHYRSAQDRF
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TJQSTRS2UY7X5EGCXPNTJ3MHYRSAQDRF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h in audio_iio_aux_probe() to
reduce error handling (less error paths) and make the code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/audio-iio-aux.c | 47 +++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 29 deletions(-)

diff --git a/sound/soc/codecs/audio-iio-aux.c b/sound/soc/codecs/audio-iio-aux.c
index 3969ee45f41e..588e48044c13 100644
--- a/sound/soc/codecs/audio-iio-aux.c
+++ b/sound/soc/codecs/audio-iio-aux.c
@@ -230,8 +230,6 @@ static int audio_iio_aux_probe(struct platform_device *pdev)
 	struct audio_iio_aux_chan *iio_aux_chan;
 	struct device *dev = &pdev->dev;
 	struct audio_iio_aux *iio_aux;
-	const char **names;
-	u32 *invert_ranges;
 	int count;
 	int ret;
 	int i;
@@ -248,22 +246,22 @@ static int audio_iio_aux_probe(struct platform_device *pdev)
 
 	iio_aux->num_chans = count;
 
-	names = kcalloc(iio_aux->num_chans, sizeof(*names), GFP_KERNEL);
+	const char **names __free(kfree) = kcalloc(iio_aux->num_chans,
+						   sizeof(*names),
+						   GFP_KERNEL);
 	if (!names)
 		return -ENOMEM;
 
-	invert_ranges = kcalloc(iio_aux->num_chans, sizeof(*invert_ranges), GFP_KERNEL);
-	if (!invert_ranges) {
-		ret = -ENOMEM;
-		goto out_free_names;
-	}
+	u32 *invert_ranges __free(kfree) = kcalloc(iio_aux->num_chans,
+						   sizeof(*invert_ranges),
+						   GFP_KERNEL);
+	if (!invert_ranges)
+		return -ENOMEM;
 
 	ret = device_property_read_string_array(dev, "io-channel-names",
 						names, iio_aux->num_chans);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "failed to read io-channel-names\n");
-		goto out_free_invert_ranges;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to read io-channel-names\n");
 
 	/*
 	 * snd-control-invert-range is optional and can contain fewer items
@@ -274,10 +272,8 @@ static int audio_iio_aux_probe(struct platform_device *pdev)
 		count = min_t(unsigned int, count, iio_aux->num_chans);
 		ret = device_property_read_u32_array(dev, "snd-control-invert-range",
 						     invert_ranges, count);
-		if (ret < 0) {
-			dev_err_probe(dev, ret, "failed to read snd-control-invert-range\n");
-			goto out_free_invert_ranges;
-		}
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "failed to read snd-control-invert-range\n");
 	}
 
 	for (i = 0; i < iio_aux->num_chans; i++) {
@@ -286,23 +282,16 @@ static int audio_iio_aux_probe(struct platform_device *pdev)
 		iio_aux_chan->is_invert_range = invert_ranges[i];
 
 		iio_aux_chan->iio_chan = devm_iio_channel_get(dev, iio_aux_chan->name);
-		if (IS_ERR(iio_aux_chan->iio_chan)) {
-			ret = PTR_ERR(iio_aux_chan->iio_chan);
-			dev_err_probe(dev, ret, "get IIO channel '%s' failed\n",
-				      iio_aux_chan->name);
-			goto out_free_invert_ranges;
-		}
+		if (IS_ERR(iio_aux_chan->iio_chan))
+			return dev_err_probe(dev, PTR_ERR(iio_aux_chan->iio_chan),
+					     "get IIO channel '%s' failed\n",
+					     iio_aux_chan->name);
 	}
 
 	platform_set_drvdata(pdev, iio_aux);
 
-	ret = devm_snd_soc_register_component(dev, &audio_iio_aux_component_driver,
-					      NULL, 0);
-out_free_invert_ranges:
-	kfree(invert_ranges);
-out_free_names:
-	kfree(names);
-	return ret;
+	return devm_snd_soc_register_component(dev, &audio_iio_aux_component_driver,
+					       NULL, 0);
 }
 
 static const struct of_device_id audio_iio_aux_ids[] = {

-- 
2.43.0

