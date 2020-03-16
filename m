Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 135BD186A86
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 13:04:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B7FF18C4;
	Mon, 16 Mar 2020 13:04:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B7FF18C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584360297;
	bh=zoxbKSLJJ+C/k/VnJ/1OgYCw+Yg7z8Fus+k5WEDAWCU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EklCFNmvMPNGxFmOsykYcpFOlnc1zOOnGoLKiYdiWj1gvRoDbkxiw2MC3gJ37X5W3
	 qx9OmQAORtR672xYLJwpjKMhdh5cfZbQSwSvhR1yUgmFElk6ce21tzfgiO7GXF8Nii
	 nO2vre0nmYsYJz7VEXDE0+RDfsdAhH7GNJhmgnPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42FC2F80058;
	Mon, 16 Mar 2020 13:03:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB117F8015B; Mon, 16 Mar 2020 13:03:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D75C0F800CD
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 13:03:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D75C0F800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="snHMyK9Q"
Received: by mail-wm1-x343.google.com with SMTP id 25so17351434wmk.3
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 05:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=onXCuvN65PHjTE+0EfUmxT7L78srpirmS0ZiKqVYQ5U=;
 b=snHMyK9QEfcSuHHR9QLQWzaJpBO8Rr88B+jvXfHnzTR66EkQ2Pej0NSRiDsZb/Kndi
 eRC96yDvyz66+9L+bqOnyTpqxw0nZHEsDJSLzrfJTYRj99844KDtM6f/V5G8BjjpFX02
 ViNGXCXE9Yi6DwDXHEIvD892kbPDVUXPHc22fF5WdaiHvXbZJIp/1U30fvlX6TTn+hwD
 Sd37LHjtS/diPIgHWzgE0Xzt+W7GQERZSOLv0WH24LjTSEortFghhHg/zrLKvYkAIlAa
 lGqgD/wmS1rJu5o5Mvazf8BDZeBxje6om2OkmTjsEpwDTDkVBeoIpBg8OY2L+H/JupAU
 rD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=onXCuvN65PHjTE+0EfUmxT7L78srpirmS0ZiKqVYQ5U=;
 b=FLPrcc1a2WaIOgEsI33i6jEeAVVzyNsNJSCi+MAStEtWW9tN39y5OeQvS3rcZm5qFs
 JnHzCpAFXCpQRHm9NfcKZW8cEpPcqaKEacUu6aEQphjUULoi3oagXyKXSboSjLTNGVpU
 NTj9RtOs0wqDHjOwEAVeyK4vnWmcEFuvuFypFVYuAqcOOmqMNaVCd5qoEvYlKqHyPEGH
 Qk9UlQ4lVVBBWWuBp3H/1cP5YMxhKxjamibOzlmDV/auavmjMxDniVU80/mYyl2RDBPo
 GoOkvYjkfYWX4w7Aw0eKePSjhPv2+MeaNUP7Af4NFVliQGOPxrB4ai2/psX5h+x1ZaBa
 6VhA==
X-Gm-Message-State: ANhLgQ0MXJmwVY1H7qGMK1DPSM5LGh30H4D05CZqKEpfqWUWTNMcihe5
 4R361qTKMoRFt9anR+H4zvfCaw==
X-Google-Smtp-Source: ADFU+vt5Dj2XldoYXwor9TGrDgmRHbP3oq0TBe8+yx22nJQkaLn1TP77bmBQAmSJ4rPh1mZmJ6grvA==
X-Received: by 2002:a1c:e109:: with SMTP id y9mr26799734wmg.62.1584360186500; 
 Mon, 16 Mar 2020 05:03:06 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id p10sm93395549wrx.81.2020.03.16.05.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 05:03:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: codecs: wsa881x: request gpio direction before setting
Date: Mon, 16 Mar 2020 12:03:03 +0000
Message-Id: <20200316120303.3780-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, lgirdwood@gmail.com
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

Make sure that power down gpio direction is set to ouput
before even setting it.

Fixes: a0aab9e1404a ("ASoC: codecs: add wsa881x amplifier support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 35b44b297f9e..1810e0775efe 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1154,7 +1154,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	wsa881x->sconfig.type = SDW_STREAM_PDM;
 	pdev->prop.sink_ports = GENMASK(WSA881X_MAX_SWR_PORTS, 0);
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
-	gpiod_set_value(wsa881x->sd_n, 1);
+	gpiod_direction_output(wsa881x->sd_n, 1);
 
 	wsa881x->regmap = devm_regmap_init_sdw(pdev, &wsa881x_regmap_config);
 	if (IS_ERR(wsa881x->regmap)) {
-- 
2.21.0

