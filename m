Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A811E5B14C0
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 08:37:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4981A16B9;
	Thu,  8 Sep 2022 08:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4981A16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662619039;
	bh=fQYUkAxXY71C935nLCXmBtUClWnIjPfNIksuukkp5SE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QgAJZS7FbRTs3iL5H3Zy7/U+C3vFOWvF37c9PQCLFkkJsqGME+tWmK5jczB6ZjcaO
	 0ax0hRIajbRuyD849PlXcc8RhCPISUv0D2kQyBKQaosMC3aBZ/RMeGPCNpBbim+4i8
	 y6HtVOOCyYn3h2keuZ7WskAnewkaU3AA5nILA8fo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8546F80551;
	Thu,  8 Sep 2022 08:35:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3662F8053A; Thu,  8 Sep 2022 08:35:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85EC4F803DC
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 08:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85EC4F803DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xLNd7PAO"
Received: by mail-wm1-x333.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso952468wmc.0
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 23:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=xh82u4mQI0vpD+SPbAbOTF4IJW7gl/lNmljBUcHdhrA=;
 b=xLNd7PAOu8tw22FWlOq7W1CbMzEwFQTlM/Y6iTUXUA1f0f+6q+p+EXeWc2ovc3pjJm
 krGpZ47MTG/bc3AfpbPK8Mo72JYFtgm190uLTM3hm0+miLzqQnnf1UAYe35IvfW2x3mM
 4+LeyZyjj/aM7ICocdv29ZJ+ngiWmEk0EFAvEFOWR7JXfZJkQIUC2Qt6E7M1Dw6PC0Jm
 ddGV9d/TYt2gevjRddtHflLilayIC4CWDGYLBIyOMM8z/9NfWdr2tXfYDo6Ujm93Al5l
 G3nztXGSD1GHDUObY9LJoqFL1B4zxfDMS/HI84U+yL21sVpW7/USDJg0aew5jqhRV/Vh
 1uYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xh82u4mQI0vpD+SPbAbOTF4IJW7gl/lNmljBUcHdhrA=;
 b=MTrhn2CEDP0JKC6ZWq9hE4edNmn4mdTwO76TBqJWc3ZX2/wcFL/bOfFbRqH/8+U8SP
 PnBqUQqRqzfh6LtATb63cFZxiGyn38zbDRmcxrzKdS3EuPtu24PBc1qXtHex0QHS+BWh
 /KedHELC9OyIYPFhfcm2Gsc8Vwy+pkUUrKf1VYHTmee3YPeIz78uXi10op/YYxfWCoj7
 MaznXU46RqSiYz0SuPjE79rwQjEGCVbOZtF6yltuzOhlcWz1d+KGZISODu4EF3DB4rnI
 5lf4tQR0Cz30oKiysN2QD6M8el+aGug+M5zclI7LVYbHfjE3V2/A9hu4u6rDctJE59p8
 92yg==
X-Gm-Message-State: ACgBeo17+9TC4S+lNnxUkPC3qwJL791/hDa257g4eT2bDCNk45n0j89q
 CKuceAho3rYaqMtVZZORgwyp2A==
X-Google-Smtp-Source: AA6agR6IMmOXsPMzfpADNeN9ao+vWfmfFcp4o0e+Qsx7ABFiigv2viqQnbR6ecjvNDayeYCAzK3SIg==
X-Received: by 2002:a05:600c:310b:b0:3a6:8970:27fc with SMTP id
 g11-20020a05600c310b00b003a6897027fcmr1079891wmo.98.1662618892783; 
 Wed, 07 Sep 2022 23:34:52 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c4f4300b003a2e92edeccsm1549598wmq.46.2022.09.07.23.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 23:34:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 1/4] ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead of
 EXPORT_SYMBOL
Date: Thu,  8 Sep 2022 07:34:45 +0100
Message-Id: <20220908063448.27102-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220908063448.27102-1-srinivas.kandagatla@linaro.org>
References: <20220908063448.27102-1-srinivas.kandagatla@linaro.org>
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

qcom_snd_parse_of depends on ASoC EXPORT_SYMBOL_GPL functions,
so make qcom_snd_parse_of and EXPORT_SYMBOL_GPL.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index c407684ce1a2..e53ad84f8ff5 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -175,6 +175,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	of_node_put(np);
 	return ret;
 }
-EXPORT_SYMBOL(qcom_snd_parse_of);
+EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 
 MODULE_LICENSE("GPL v2");
-- 
2.21.0

