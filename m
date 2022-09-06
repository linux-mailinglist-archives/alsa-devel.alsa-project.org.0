Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD1B5AF1C6
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 19:06:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 206751660;
	Tue,  6 Sep 2022 19:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 206751660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483965;
	bh=U4NL/iO9U0kvr9zv5pZWFwcUP/2g+sSFSzn1hvPysR8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BgB9XT8HDk9Czj2q6fSkG+TzknRSGemeXpnwWw/na/DZve0SkNZ+MqzRPx8iIkX5W
	 T8VenRx9jayQLSdB5EWx4eL/JC4ODIcCsuUQeod+LFRapeWa6vJ8sWDUjPaE7vtf+l
	 pYBUnFj61z69TQCi/4icn0w646Ews8LX2BYF+dVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2F7FF8057F;
	Tue,  6 Sep 2022 19:02:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFF4DF80538; Tue,  6 Sep 2022 19:02:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A83AF80538
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 19:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A83AF80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="k8U1G9bR"
Received: by mail-wr1-x42b.google.com with SMTP id e13so16429921wrm.1
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 10:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wHzaLeNQVCSBpl0uliw1oI1t3Vv7waInVuSDN9rCrD4=;
 b=k8U1G9bRxyqpso63N2PFNnVmHY6LUWgCTgQrkSyvHLGHl1JmRKJA/N+k+rYUtOB8FA
 4EUUHoJ4qLupudKinKgBMzDjyDPCxT64rOhsoZPhY7HRQYjVX6M5xbYKne7p5bPwzc1a
 eOADvQJ5J4nPk7YuwFbV6BLG61EqZpoxVkkSGlkaQiPcLC6H0s7B6o66qxEjQxGRxVz0
 3KWryMtXUVDYZEv3zeMOMa+2T6mFHg4uWw35hlS1WgTXc2l1PpR7Oi5M3T7GpoTelycg
 xw7onG3TVNnbKLzZYdbgPay5T8/tNwBEouWDB18+RqDAC1b0fU3jJa0zL0rxvEczAfbv
 unMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wHzaLeNQVCSBpl0uliw1oI1t3Vv7waInVuSDN9rCrD4=;
 b=hdaU+uMWrbEXcm9XaVAjik7fEgh/q5MwcY6RF6jCnw301M1KEmnmPO14zTYaIN7pTq
 +SkbB+BmMVxvuLBskqNmRxdBGIeguZ5rrosQKHRAPnp/zP8u/442muMFTD2EXafU/MG5
 7Ezt24O86U5owJDaHXDgsu2+pYCaXXGeKpcxIkMKICen7nzSWpiflJfXRMC9HXkY9uyu
 ertUaDLi0ZCLTugAPRi9H5Lsc+Olz2eQTU1UjYScXE/iDzfxMZh9eX0Nx8/sB4WpvoJ8
 56Sm5FlnzI1wiBXi7E0+EnLxh3N1Unq/YPSdZSV6iz79A2EPjGyUZMh++xjG2d6DjDV0
 IN9g==
X-Gm-Message-State: ACgBeo2dxIQGBbb2bjVC1KbOn02eFyT08ESTz1ichKmzu0BT5/cqU2zr
 9DwjBV3PhYIB5hQ93EDwQCY93g==
X-Google-Smtp-Source: AA6agR4A0j1MQqOx9dgt2eesqRX/FLXrcfb71oW2fg138hd0nsF9LAMVvtyPJ40JMHKVpgs4f4W7xw==
X-Received: by 2002:a5d:6b8a:0:b0:228:d6f5:f83a with SMTP id
 n10-20020a5d6b8a000000b00228d6f5f83amr2850621wrx.381.1662483737282; 
 Tue, 06 Sep 2022 10:02:17 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:02:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 10/12] ASoC: codecs: rx-macro: add support for sm8450 and
 sc8280xp
Date: Tue,  6 Sep 2022 18:01:10 +0100
Message-Id: <20220906170112.1984-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
References: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

Add compatible for sm8450 and sc8280xp.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 338e3f0cad12..a9ef9d5ffcc5 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3654,6 +3654,8 @@ static int rx_macro_remove(struct platform_device *pdev)
 static const struct of_device_id rx_macro_dt_match[] = {
 	{ .compatible = "qcom,sc7280-lpass-rx-macro" },
 	{ .compatible = "qcom,sm8250-lpass-rx-macro" },
+	{ .compatible = "qcom,sm8450-lpass-rx-macro" },
+	{ .compatible = "qcom,sc8280xp-lpass-rx-macro" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
-- 
2.21.0

