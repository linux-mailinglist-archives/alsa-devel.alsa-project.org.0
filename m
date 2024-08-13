Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C3A95066F
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 15:27:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A7B923E3;
	Tue, 13 Aug 2024 15:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A7B923E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723555640;
	bh=BwejMU6ZUIgz8lGX+Skc7VtQTPN1+y9vWUPFbkYCZ50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZXN8TyyovticL1JHAfqdOoGly2pUdvbWcNJiIw0p2A2zQginDRV3yafEsG5LfKxYn
	 zOLvD4PUfNchyhUnKs9ykf7Gk1c0spzYUE+00vWo6ncPXqDJ3vrcdS5F8z55I9TmPW
	 G3tbUsTl6xPZnL8+llOEjYFHjPr19iNPeenge7vE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4556AF80631; Tue, 13 Aug 2024 15:26:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73883F80649;
	Tue, 13 Aug 2024 15:26:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7178BF800B0; Tue, 13 Aug 2024 15:12:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12EAAF800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 15:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12EAAF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=H0XlXtE2
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-367ab76d5e1so2486879f8f.3
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Aug 2024 06:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723554602; x=1724159402;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYV2yBaiU1eNGbD5nUDJdPAfLsrnpN3FqBevnmPD6R8=;
        b=H0XlXtE2AbXMslP5aT7BEB5p2QaXHnhSRCd4VAKnPILO5CEPfSUcp7FKHDF01oNxc1
         I6GoujLunyywHxLu4Twiz/w7DgUq3vP4kc8LDKyBbVQIJ120cZEnc9iHhzPiYvl+D2J6
         kCUppOTZ+VgaIXW+IJtRWQBwvEWkKo7Eirq9GvemZu4bO6jPPqHrzn6rbXX16U2CphpV
         HNDwYbRTOj7RssELvMGVbLb+ooZH3dpGNvUbHZxzYqfzzQoEWes1MTRe9O6EcgKGV1Is
         DApdx8Kss+vv6r2q2Ym8dTevpZXfccE0tNxYrxKkFZxRlYuZcRsVP9ELnezWUmVT9Wx1
         sC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554602; x=1724159402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYV2yBaiU1eNGbD5nUDJdPAfLsrnpN3FqBevnmPD6R8=;
        b=TNiKFE/K36wiMkUgi2Z55khKOFtnQzpvSZKXWOWmYwBE7K0rVpUYTHaVZkOdm3yK29
         ZrdtowpU/YM61YhrRpQV12/RZyoYGc0RvKbpkhR0QjxAzShiJNW1JmJHtLKdk9iE+weB
         st9PYekn8ISccjYq/MEaxxpfkcRG4dgSLsfkuowtdZmpNvWhn31RcFr4stP/lkOAs9yB
         le/I7K4H4yi5uuk2T2aVQI+1mXUYeyCnHJ0Si1STr3KQpwAhGgksBfdZaaWcfqTGdT0h
         TvpxcBfqjxue3Jy9nrxLnX5TdFn18lTMHqzyeTSoRE6/vC8Z8vMu0gOBFXlh8+s/Qpw4
         I+jw==
X-Gm-Message-State: AOJu0Yy9n+XOYfHg+QvuupGKdPcw+S42AQyZDS5XFofTBi8CM0nQ//RE
	UODl6eLKU/m5yCUhxe53m7AVYMx5Y8PKk52DCJQ1EYeTUeqaEKu1pW6SM7dYU+o=
X-Google-Smtp-Source: 
 AGHT+IHEtXM/0I0GAyREg5EKER0DYF7+YSxuj3da4+f2SEaAk7GsANHFPwX5vhUb957YGIRTjSasUA==
X-Received: by 2002:a5d:6dca:0:b0:367:8aa2:d41f with SMTP id
 ffacd0b85a97d-3716cd32235mr2372644f8f.51.1723554602500;
        Tue, 13 Aug 2024 06:10:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4c938280sm10305003f8f.36.2024.08.13.06.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:10:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 13 Aug 2024 15:09:47 +0200
Subject: [PATCH 1/6] soc: qcom: apr: simplify with scoped for each OF child
 loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-1-cfb67323a95c@linaro.org>
References: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
In-Reply-To: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BwejMU6ZUIgz8lGX+Skc7VtQTPN1+y9vWUPFbkYCZ50=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmu1sf7WFjqKtqbnO/o4IKv/eNdOe1rxw8n+MXW
 V6xxEWEnqOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrtbHwAKCRDBN2bmhouD
 11T1EACOn5uWT6CrmTfB2xyhTbC2MNwPQUICTvz64hAaEmeUl7lnqitjw4SEnJYJ7g5AMu7kt/e
 cNiVSP7xKl/6h5qbl0u1wdaQNPlhQ4ateDxP+X5SQBN5kSsuWcOzAENTBZupjo1cFhOYOa9X77A
 +8DMfXJZznJcMzWfKHVN/spGMyvGablCdileKkoJGtjYmhmWThN7D9z42+QB0du2e921go9fMzp
 Io/wsmtWzimOd4E08/JFiVoK9jeoKATne2GYbJTvyvSn/XKAt662X8UFSm9Q1Elna9HyeVZLk82
 TN9LoFNn1K/XG0+08mhyxuNTMFc+B2/8zt34OWIR0VOFSunlh4PIZzgP0WA+ChjHNc3gLSH7lGH
 O+pxC3ks4aUqOdmvt26XBse1wvzcLh6gx4vR0YJA/8oDETijzhBqtuvZqElb/GINXmYhLorCCQS
 4VySRPgKG2obt6y9zPps6U2ex5Z/5TrFFbmJSCM6fKZ631hyVczy76QG6nGkx7VtV3fZhbDe7/s
 Y8dEc5TCSMJd4W1DgezIzxeDiN8mF87zTJ0oj5uD6B0DIueTahdu2JlTCCxqow2FJim11nGrHS0
 rUmI4XjaXCPdZ4buW/dGENZF93AyP0GtONfuKIKUcMnCSNpB1IdvcAzQyfjBLEVTLfWO2sIJrps
 8S+vyqL5BNINP2w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 4WYXGYX3RWYE3EG7EO4OMVESHQGCW6KN
X-Message-ID-Hash: 4WYXGYX3RWYE3EG7EO4OMVESHQGCW6KN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4WYXGYX3RWYE3EG7EO4OMVESHQGCW6KN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/apr.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 4fbff3a890e2..a956c407ce03 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -485,11 +485,10 @@ static int of_apr_add_pd_lookups(struct device *dev)
 {
 	const char *service_name, *service_path;
 	struct packet_router *apr = dev_get_drvdata(dev);
-	struct device_node *node;
 	struct pdr_service *pds;
 	int ret;
 
-	for_each_child_of_node(dev->of_node, node) {
+	for_each_child_of_node_scoped(dev->of_node, node) {
 		ret = of_property_read_string_index(node, "qcom,protection-domain",
 						    0, &service_name);
 		if (ret < 0)
@@ -499,14 +498,12 @@ static int of_apr_add_pd_lookups(struct device *dev)
 						    1, &service_path);
 		if (ret < 0) {
 			dev_err(dev, "pdr service path missing: %d\n", ret);
-			of_node_put(node);
 			return ret;
 		}
 
 		pds = pdr_add_lookup(apr->pdr, service_name, service_path);
 		if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
 			dev_err(dev, "pdr add lookup failed: %ld\n", PTR_ERR(pds));
-			of_node_put(node);
 			return PTR_ERR(pds);
 		}
 	}

-- 
2.43.0

