Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C77950672
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 15:27:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1199D23D5;
	Tue, 13 Aug 2024 15:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1199D23D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723555649;
	bh=2cwE07vpiCyGBrhyTLV34EZJb7Hk/Mu8zBy8VUuQNto=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nVsXL+VqqOYcedP6bPqr0lHq5Rs4WDkhP9MNZzl+s9BQkOgayGYWSEv506tfOhvsO
	 atETA7y7KqWXN2aUc5Id4A8PjnntqZ1AotQSWwIgdFDEYz+4lexfpnvgWs709YAxa2
	 WRsC1b40OlodE6MV8Rkbxw7MpR4bFgwYZkrYL7Mo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A517EF80620; Tue, 13 Aug 2024 15:26:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1DB9F80619;
	Tue, 13 Aug 2024 15:26:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03925F80301; Tue, 13 Aug 2024 15:14:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3436CF80517
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 15:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3436CF80517
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MKk1ka3o
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3684eb5be64so3052553f8f.3
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Aug 2024 06:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723554618; x=1724159418;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mP8c2gbWyRGgea+bz+7uGbaKYyoVwEycZmklOCGi8GE=;
        b=MKk1ka3o1BGmPAr2/ZZN33Zwjd+drLfanfc91nhGzRCO5Qf7sBSwBx7EfWoSvPDrMP
         IGvMkNrQdNoWR1IhCX4BQ3T+E6iaO1g0gqJ6m/u6tFUpstwdsLLL7cjLmTYVfDaHIZyk
         +9F2cQH1/sF9yAjxyER6yTxTzmf4/rYZMkCdj30v4FLZwwsBLRADi/YrUM+j42jglEg/
         IpeVMiSwNA0fcr4SyCI/s7llnkAA88E3grGYDfiQmmnQvJ+NOnEF21yMtiLIBBfkBKGz
         9vv5SmWX+IdzGIr2edCGBUGQfF4KatJ4mhYswfU0oIRQUH3a+qUbIiqxDvLqImaNyi+o
         OeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554618; x=1724159418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mP8c2gbWyRGgea+bz+7uGbaKYyoVwEycZmklOCGi8GE=;
        b=tF/xkwjE9pkr2GysBCJbYt1kpSI7geyVp7QURbVN5HTXP6yi9ixXbaCLEe9Ha0SY/T
         P19OXSbqNa7owKphjXNXduki6K8CUkto4R/cx7hKACwzd2lIUt5dZXHAjQBFSlD5dWlO
         FJMAsLtPI2I0M5OlI6ehOIZoNK6K8zqvTqOzxpkf0SXwAmm6zuW47Y4rzwEiZjUd6nVf
         aZupZcwADfswuR7f6/ORHIKzpu9OjinV27TJDuMkZSng3kjPEe6fXQRV5KmqTvhRDRKH
         EjaHpiu0bfyJ8slCaTtZEG3vUcJZGvtNldMDXectKQIF9dKTXzykHQqp/NMOFTCUWeTF
         1icw==
X-Gm-Message-State: AOJu0YycGLy1Z/jiVEpY80CExrW4Ghc9RQ+Dz3i6QDNZ8L6eqgWMv+Xv
	9Zwau9jlTIrVqXlKykP4Yyjfu/2m5CJ8PX32G21bvIi92d3C9avD3kpgAJTZm9A=
X-Google-Smtp-Source: 
 AGHT+IEDchtCCXZEFTjTv7KCKp+KTGrJNg4Wo5BxMZL+yOQsb/AR6j4g5GGlBRSIedjp6ch6nbqYkQ==
X-Received: by 2002:a5d:4481:0:b0:367:96b5:784e with SMTP id
 ffacd0b85a97d-3716cd28208mr1973169f8f.50.1723554617874;
        Tue, 13 Aug 2024 06:10:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4c938280sm10305003f8f.36.2024.08.13.06.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:10:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 13 Aug 2024 15:09:52 +0200
Subject: [PATCH 6/6] soc: qcom: smp2p: use scoped device node handling to
 simplify error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-6-cfb67323a95c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1946;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2cwE07vpiCyGBrhyTLV34EZJb7Hk/Mu8zBy8VUuQNto=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmu1sjJN14aYmlpr8rTr9yYtjfVVS+zWUS2l146
 f7fNMYMCtCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrtbIwAKCRDBN2bmhouD
 1xmRD/9h/P0Het6Jm2rGA3UM3LAszAgU3PyV5T6E96tiL7xRF6IrhT+P6GS1+HrZeLHZt/7/3v2
 xvbX4iYvn7yHnGp//K4u+6YB3isGbI0dSbliRFs8bqdp8MndfYQoMw77n9rZJbSBqLDI8NLKshS
 wUDaHY5WFF894y/XXeTDM/PRA5cD6BlzevUcWPmr8gDtvUH8+LgocW+2P2UwnCwmX2DgwN3ZeQM
 WqLLEiUQTen+QI37hpUg6TvRYCRMLFkr/VMs3/kbHRYir/fBuolFVZFawgeX6gP7BLNVmUQxEst
 ZfqX7RPXVbf3zxG6ZNz74mbX9zbRSw0QoJczdjKiHMGOipCWmR778oHi8igpEKH4eTsQdRJhFnY
 zK15u0Qs8HFOm8ALMDmYrhsUOQyfuwdBcpI23XBimnNl/yZPViJZREmTEZkfe390bmIpc7mTTgo
 nzFuLKquUdYF3T6nDfVXN8btg3tXea42nBTjwWdVR5l8wXJSJWZiMZf/tkl53OxOE0jRJtLehRo
 8lVeIsD4Fcs0OwUKubSHxP8JxytWepvza4Ay3hdomgSPOilOyZfspn4RQikAl02pnm393jTf9M5
 MSeWXlH4VsVFvDiWocSaYUlIMxbToTvHCjMFE1B70QBhw6ry724w2jy33jv+7Mb55dEb/lL0s29
 2YG/JDwEhwT04cA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: JVQAF6GKNOGVCQS46R6I32TLG3MEZR4V
X-Message-ID-Hash: JVQAF6GKNOGVCQS46R6I32TLG3MEZR4V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JVQAF6GKNOGVCQS46R6I32TLG3MEZR4V/>
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
 drivers/soc/qcom/smp2p.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 4aa61b0f11ad..cefcbd61c628 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -539,7 +539,6 @@ static int smp2p_parse_ipc(struct qcom_smp2p *smp2p)
 static int qcom_smp2p_probe(struct platform_device *pdev)
 {
 	struct smp2p_entry *entry;
-	struct device_node *node;
 	struct qcom_smp2p *smp2p;
 	const char *key;
 	int irq;
@@ -593,11 +592,10 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto release_mbox;
 
-	for_each_available_child_of_node(pdev->dev.of_node, node) {
+	for_each_available_child_of_node_scoped(pdev->dev.of_node, node) {
 		entry = devm_kzalloc(&pdev->dev, sizeof(*entry), GFP_KERNEL);
 		if (!entry) {
 			ret = -ENOMEM;
-			of_node_put(node);
 			goto unwind_interfaces;
 		}
 
@@ -605,25 +603,19 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
 		spin_lock_init(&entry->lock);
 
 		ret = of_property_read_string(node, "qcom,entry-name", &entry->name);
-		if (ret < 0) {
-			of_node_put(node);
+		if (ret < 0)
 			goto unwind_interfaces;
-		}
 
 		if (of_property_read_bool(node, "interrupt-controller")) {
 			ret = qcom_smp2p_inbound_entry(smp2p, entry, node);
-			if (ret < 0) {
-				of_node_put(node);
+			if (ret < 0)
 				goto unwind_interfaces;
-			}
 
 			list_add(&entry->node, &smp2p->inbound);
 		} else  {
 			ret = qcom_smp2p_outbound_entry(smp2p, entry, node);
-			if (ret < 0) {
-				of_node_put(node);
+			if (ret < 0)
 				goto unwind_interfaces;
-			}
 
 			list_add(&entry->node, &smp2p->outbound);
 		}

-- 
2.43.0

