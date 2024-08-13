Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EB3950668
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 15:26:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBDB22344;
	Tue, 13 Aug 2024 15:26:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBDB22344
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723555582;
	bh=wSmKVeR5KDA8zEAvS740eQFFBkxeMJlrEwsk0nEhwQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NM99Efob5JO3ujdgs5kp4CBdiHruIPAFao1p7Izxh5MxQnwk8Q2R9FvjhnfHRDtWm
	 edjtw7Jr2VuQuSnwwqzEeNzLN41S+CDOZVRq2ZTrMW2CSjqqp2Ncoy1MfiZbosBU15
	 RCG4eo13z+VAF7qdBI2K8Z09OnZo3Gs967Vm3nK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09466F805B1; Tue, 13 Aug 2024 15:25:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66A40F805AD;
	Tue, 13 Aug 2024 15:25:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6827FF80579; Tue, 13 Aug 2024 15:10:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73C3AF80423
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 15:10:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73C3AF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dNoThAsi
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-367ab76d5e1so2486958f8f.3
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Aug 2024 06:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723554610; x=1724159410;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOfeSktxxxx+AVaDkIgX6QSMwS92sXS03dIKp1uUHmM=;
        b=dNoThAsir4ZY60scbrHQb/LhPc6Nl/VsBLH0ebDvIXn+JUA35qVAQUlj7n/rByka0N
         0Cr2rRWLr8RNgF+esPSOcUjz+fepSQKmWsac81StD/iR2ZyfdflgicO4tt6DXCjPXX7Y
         zVuKEKiu1pm1wf1I3JILymIvh9kjDsIVj8SkKYwrdjnqEqu+0ouYIZwlT/ZlXzmusE3v
         YwHKpBT92GjKfhYOMMrqwhWhcTrWTvAX1Aq8XkrMQryvdfnRgDyPX89oxipjuPoH/3jr
         5LHVPScr84M7W5sWZnRpAlSQGfkbZThz3fcdL5i2ScIljkUeKzGX2wEXfVPsOqR0mB+I
         VJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554610; x=1724159410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOfeSktxxxx+AVaDkIgX6QSMwS92sXS03dIKp1uUHmM=;
        b=DR0wJB8/jDSSabbeAmSlsPLLDtyfTvk1CpEBW8az26IplSTVu9rJNMifiZ/X6nNoVe
         nOOj5qw4w/AoUqwt2uI4BcXhjUBaDEG5eKJ+Fo3fIHKjWUlxcJplXz2cKKYL/+tZ2+bw
         xPWXW3WrOhi1RqivpScjfefXbcNWRIYBde+/7Yq/YjBdenHPbz1Wgw3k7Ofw8l0Yczme
         EsorMJn45vfB1AMbLsFZGLyTzfh0c16xPgruXvjb5ovHP8/2K8+TiTEdgWMl1PH4AdMz
         P+kA3BM9fFx7LXf7c2cxPO0HgXHfX2eSx42n/KtqNV7uCkvh3SPIXXQBZRqTGnunAtdW
         BdTQ==
X-Gm-Message-State: AOJu0YxqaNfjOhy5tkE21tsHtupiC+LhOFtA+xcd6NW4BuDYGo1OZpDe
	crBJmPkG4otUUxRKE1MmIkjck+LZOtV3ksXiCU9Dr+eoimWnQUCeB1dIws6xP+c=
X-Google-Smtp-Source: 
 AGHT+IHyNEIn/w+Q3aUBV+ipIP0PES4tddwlwX5duA/1fo0cQCC6TltvLeRJDiS0zTmiMEeDz3hbag==
X-Received: by 2002:a5d:4ecd:0:b0:368:5b0c:7d34 with SMTP id
 ffacd0b85a97d-3716ccf1e7amr2493850f8f.22.1723554609762;
        Tue, 13 Aug 2024 06:10:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4c938280sm10305003f8f.36.2024.08.13.06.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:10:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 13 Aug 2024 15:09:49 +0200
Subject: [PATCH 3/6] soc: qcom: ice: use scoped device node handling to
 simplify error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-3-cfb67323a95c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2089;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wSmKVeR5KDA8zEAvS740eQFFBkxeMJlrEwsk0nEhwQs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmu1sh5LeIoKQcZBpw8Q0T7w56JOH+NskEVH9ts
 H6E4FxaqEOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrtbIQAKCRDBN2bmhouD
 1+kuD/9Z/MncfojAYUJXJABsySNZGoAFTsvI5oTL/7lPqEhOofrokAIH8o9kLEi5k/uJ+XHxaeD
 HavJlDNe+CbSNA5hAFM9FDUqqK6X5JeYzasWTGirc6EwmKdPm285CAd2bXU5xOzsyWVYExOl3Y+
 nwf/ombpgpleqhr6pcLkryzJ3yo4qQDokdW8Rdq03PWVRDPwyyrRKfBaOs5evJWJBITJMkE5JAe
 okxPARs5T0b9/lB61sg6aamuwLZ7f1o/MTUjf7ErpLEQQPQ3wnEr5B17HvMMhU97azGI7lVQ4DU
 63f2I1gQyoiuQKOBisboJdn8Xx/9OGnpWxMwV3Ud28WlErdlklA9Iag0PG082BUr3kTl4y8qZBl
 3gEfXyA87EsahI8JkQ8NrTdxtHfQq4+d+8QBNm5vb8gb3n584yqeqWwtSRdoTSHFfONvXWKv4ef
 RgpkDi6VWMqi2Bf6Y3F2FSxKvAyeFRwSFXwwwHuBDZUSvJzaOOeuryL6JyFA+LT26GsThf1UlHc
 B4voocpWUdw3QQ5DK4EnL2bdUlgq2X4m6rJbb6O2MzTuH2p3CrgSpNQfGgrQhk7PtYwD51T3Nzi
 fYmX6sCsEXg7kJErv6O4RS8B/zcsv382ZGl5XFV1KDD2ASKX5t+f1WT5sgJywP3EHQ4iX94pp9W
 fGM/J+iufuJEQcw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: T73HIVBANOHYCTFWJFX4CO7LX26JPP7T
X-Message-ID-Hash: T73HIVBANOHYCTFWJFX4CO7LX26JPP7T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T73HIVBANOHYCTFWJFX4CO7LX26JPP7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/ice.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index fbab7fe5c652..50be7a9274a1 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
@@ -265,7 +266,6 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct qcom_ice *ice;
-	struct device_node *node;
 	struct resource *res;
 	void __iomem *base;
 
@@ -292,15 +292,15 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
 	 * (legacy DT binding), then it must at least provide a phandle
 	 * to the ICE devicetree node, otherwise ICE is not supported.
 	 */
-	node = of_parse_phandle(dev->of_node, "qcom,ice", 0);
+	struct device_node *node __free(device_node) = of_parse_phandle(dev->of_node,
+									"qcom,ice", 0);
 	if (!node)
 		return NULL;
 
 	pdev = of_find_device_by_node(node);
 	if (!pdev) {
 		dev_err(dev, "Cannot find device node %s\n", node->name);
-		ice = ERR_PTR(-EPROBE_DEFER);
-		goto out;
+		return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	ice = platform_get_drvdata(pdev);
@@ -308,8 +308,7 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
 		dev_err(dev, "Cannot get ice instance from %s\n",
 			dev_name(&pdev->dev));
 		platform_device_put(pdev);
-		ice = ERR_PTR(-EPROBE_DEFER);
-		goto out;
+		return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	ice->link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
@@ -321,9 +320,6 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
 		ice = ERR_PTR(-EINVAL);
 	}
 
-out:
-	of_node_put(node);
-
 	return ice;
 }
 EXPORT_SYMBOL_GPL(of_qcom_ice_get);

-- 
2.43.0

