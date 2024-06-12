Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0455E905898
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:22:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A09ABEF2;
	Wed, 12 Jun 2024 18:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A09ABEF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209347;
	bh=qUt++NHBE72DcCvYJJXtBbloAck2ow8GLupnZk4I2eU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P3IDXmwBFNOfnZBcUiKbpvqmomvM/mSOq9xynlhqiO3oCCyrZp93crEhvpAaJwGXq
	 Jy2fpxb09vMCRqipDanh+0VoZrgyYCcSNMdpGxnt+29WA7asv0Gic6MiKRBIsPhw9/
	 pijRJM+ccg7Dak0qYUH2PeT0q6IjsY73EvPChjhA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81E99F89757; Wed, 12 Jun 2024 18:16:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2218FF8972C;
	Wed, 12 Jun 2024 18:16:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FA91F808AF; Wed, 12 Jun 2024 18:16:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11E23F806F8
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11E23F806F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kwCEzBZB
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a6f1dc06298so9196966b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208972; x=1718813772;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxtE1VEMG2w+3gwFE4no+YHVTTaRE3n7buFfP0YuBoE=;
        b=kwCEzBZBQqo2T6XwGXWJPucfhClQOQfN+DfXt6AHc2TerKFO+Sgh63kXPOPP/u5MFR
         pbUiiXdByEV9A9AYHu05yMBILgDxpEWTMm0SvKLkRpWTCNH+WfsENref/fX1CBwFKqVA
         6/jBzBCXAHHXkFGSAlHbK4mRqbd189bRuqCcklj58CTicSKQvAZtmi87qXsKO6j06chr
         Sue+FqmWiP1qwEEW3lRcQ/Yr0mfczg0ofk5oxyv3kDZjziuULY2znMuB82edYY+57Pn+
         tZ53nn39jpBjLxERa/3f7BAcwSN2Mp7XYv4ziEgJ7q2NTLShp8k4JKahMhrgVO1b1TBo
         +W+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208972; x=1718813772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxtE1VEMG2w+3gwFE4no+YHVTTaRE3n7buFfP0YuBoE=;
        b=PJlp/ETYYFNXG9U8RPIrnirygXinIAeTOWtawZFeQNiYqvW76SRX6w7kCobbwf+Kuu
         Obj9AenmHe3XgwpycwiWOjgbSjzBbsUZiIgbPsRmad5k8xM5PO8w9CyzPSY7pSkqmU44
         3buEqj0QyeQwf50zMCTn3MIVm5hyHq4vT+oAsDLgF0+aQ4Gbo2Wo3nT/XMW6nbKdli2m
         JYay42ZwVZmuJZsFkSKBr6fKlkvgzDuLlK+yieV5OIC8iCLXlsyBrGzG4enJ+5jA99Ku
         EO+zV7mmizMHHYjvBLlm95KKYdS3t/I5TW+q0Wik3Comn/OqZtVWVL/CNHK8UJSAzU1B
         /epQ==
X-Gm-Message-State: AOJu0YwAafSsFPW+8PFdJU11h79SnUqQGTZ5ZEJIusdlyYvpIL8oWgvs
	ANeoaFjuSqDCSEr5ELkvbry1vgL7WtNjdF+XNErWlfrurmyPQTSzJeEmlan0VyU=
X-Google-Smtp-Source: 
 AGHT+IHPp7Vgza1ymphlJXdfflDu+EZC1XP7FBl9D444bj/tSph5Z6WqGCCucohWZtPiSDGFrcpvAQ==
X-Received: by 2002:a17:906:f24a:b0:a6e:c5b0:b64b with SMTP id
 a640c23a62f3a-a6f47c7d974mr131303566b.16.1718208972037;
        Wed, 12 Jun 2024 09:16:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:16:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:32 +0200
Subject: [PATCH 19/23] ASoC: codecs: wcd938x: Drop unused num_ports field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-19-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=668;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qUt++NHBE72DcCvYJJXtBbloAck2ow8GLupnZk4I2eU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmn6iGzlR3wL8gkCnXRUqlYysc877RLjpSI1
 WJr7805huaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJpwAKCRDBN2bmhouD
 12P2EACZ/GwZF4x9vKr3nIxVzGw0Kj1fWm+rYpeuqN5GEOc2OWr+O4Xoh3v0+Zdl/w+uPBluipg
 aSGtiKgkXXGT+h6LdZfszQY4wmKTntlq14PzkxkXEVIA/dWaLj7dpO4Y1BnxERWXt3oN6PmgQZ3
 quqeh6e51u9NVrHve97PNUJzLCK3pCsvBLHeGplucWOBYHm1AqhuOn6WnD/wUaEWqysEGof2bVE
 eNRvX2L2UbVD5y37u1NIPl7mhLb2EhTSX+ID0VcfOVvQRuEjMJZJ/b6mLPoiaFRL2rbTBCc59fv
 TpkKmnhPYIG2/PesiwaYrpEKZj8+iy6mGOAYlB97Wh/zwvP+OJ+/R+OQp+XJBVKLSf3ABLuCeP7
 fv6utEQcFUXsQfWZA3krAhQROHtiryxKM7mve6xha4y30tTVWqwsTLObbmZkb3DFYiXxbDWHK+E
 98HmpDY4ReYG+NWbkffNEopD331uFBmpVzWiHMRxBeQ4JUZ2Z5cV0DkPkdHPCXHw39pDBiYFMID
 4mwRUl3LgbaOVmoaVYVtwCZtkqQRzKCTfJmZD8Wu0ixe8ZDcDMNc5CRCVr50DhSXIoS07XNTfqJ
 ZMZLaqekXsKc6s9NK/eo1dvoA8pBUPrNqik02lZWbjXAK4um0Z+gJrAvj8L8VxkMWd2/nR3Au2A
 p3Ol0XLuf/qQ1UA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: FJX3IKI25TDNNM42WZ7COO4PPPTYIUB6
X-Message-ID-Hash: FJX3IKI25TDNNM42WZ7COO4PPPTYIUB6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJX3IKI25TDNNM42WZ7COO4PPPTYIUB6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver does not use few 'num_ports' in 'struct wcd938x_sdw_priv'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index 45b7de242209..b2ad98026ae2 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -652,7 +652,6 @@ struct wcd938x_sdw_priv {
 	const struct wcd938x_sdw_ch_info *ch_info;
 	bool port_enable[WCD938X_MAX_SWR_CH_IDS];
 	int active_ports;
-	int num_ports;
 	bool is_tx;
 	struct wcd938x_priv *wcd938x;
 	struct irq_domain *slave_irq;

-- 
2.43.0

