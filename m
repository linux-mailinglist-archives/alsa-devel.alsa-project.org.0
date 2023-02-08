Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C454F68ECA4
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 11:18:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3870F207;
	Wed,  8 Feb 2023 11:17:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3870F207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675851490;
	bh=x0OAhCWI98C7X40UhGCZCKEbS/LwlbB9r5n8T7K1d4w=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QxsXA1BQAamGf/NZtZd7SX3nnt+Xda7Rvkhp/EEIiDnnqYkDoSuXLiT8AP84ttV+Y
	 hiCekjK3Q/wWrI22pI3YaaRV7hGPxHUepwGo30F2X1ZiT4xBgn28cNLCbSMLbnykOV
	 tiZpcOI6ptFmgLqOjohOj06fwNXm804zDgPMMm1s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3861AF80529;
	Wed,  8 Feb 2023 11:16:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B46A3F80518; Wed,  8 Feb 2023 11:16:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0DBDF800AF
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 11:15:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0DBDF800AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=otB5oI1h
Received: by mail-wm1-x32c.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso1043954wmp.3
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 02:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AX0KvsHNXIwnS/VJd4Zm7BJ6Z2WcU4zrwjwY9zApro=;
        b=otB5oI1h2JjdnPTN1uupxEvdwOdGJFMuwogAF3TapP0WoZkknD9Ir79LtK5kA8SIMi
         iJwSnkoxqtECHPDMRzgQHfmIiccFRY6jyy3EllP4YZPfOUScCxib0YDMY8XiqcoYfapF
         YixXF5FqGyzIZ9Oo5YVZK3HRr2u0e8PkFJ2CFJ5tf2B+exRAUUHuKPzaWlO0t8E4IDT4
         Nbse+sG1sO4pBXqNdrWKxgrMR1dq2/oq2uf8Co6dnxOwxymkuU/vF0vw9A+PUIl0dVsq
         oJhj6Wl4xajS7UzXwMw9yJLvVK4RLBV6X3N1g+89BY0jhk33VyRzhBewiBaM8TmHDrcx
         BS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AX0KvsHNXIwnS/VJd4Zm7BJ6Z2WcU4zrwjwY9zApro=;
        b=EKr80R3fVNoO7t2jA1rzfpa9n4xa5OO3vvlZUAXADY0egwd6f7xPfO07lz72askQii
         RGp9/rKp7EfCzlSYnqCXQvK010huNXmvfZbNkZHGcYAtn/eGT1QwoAADNEUsUqo9KXfR
         fQIRYPDQL/x6Uad7uARYtxX+ACOaUd3pAEvTTJNlzc6VnET8vOJ5wUZroCZeSAMR1HMs
         fPC0wBDuYpL5iJ6sBo0tCEWRLPtqlmr6zDqDoMWzz7n8Kuo/1H40i7oxHWbJEUI0Shii
         DvCJHQBMlyMWgsvhCGnjUXRh1BbM/QmShiuJP2fK/SCJnry5tc46+fNbhZJ3Kiu6egbz
         nt+g==
X-Gm-Message-State: AO0yUKWXwoUBva0h7JY2Z+xZCfFgeqhePAWSt1vSCrcJt10yyuBxQVX4
	T0W9+tjN95tKA0iK44Z/Wp3ONw==
X-Google-Smtp-Source: 
 AK7set/KVAJ9urDvdx9Mib0W5fhtxUGBPc2Cgcsin9K4324Fl6UNdsN4sun4S8bzZmC8WB1eg90eOg==
X-Received: by 2002:a05:600c:708:b0:3df:fcbd:3159 with SMTP id
 i8-20020a05600c070800b003dffcbd3159mr1354532wmn.3.1675851356081;
        Wed, 08 Feb 2023 02:15:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b003dc4ecfc4d7sm1496328wmq.29.2023.02.08.02.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 02:15:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 4/7] dt-bindings: mailbox: qcom,apcs-kpss-global: drop
 mbox-names from example
Date: Wed,  8 Feb 2023 11:15:42 +0100
Message-Id: <20230208101545.45711-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TLX2SCIW7TJJEGHKQS7ZY7EH6QWHE5LL
X-Message-ID-Hash: TLX2SCIW7TJJEGHKQS7ZY7EH6QWHE5LL
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Qualcomm G-Link RPM edge bindings do not allow and do not use mbox-names
property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. None.
2. Previously was sent as separate patch.

There are no strict dependencies. This can go anytime. The next patch
(glink-rpm-edge) should be applied in the same or later cycle (could be
via different trees).
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 943f9472ae10..56b386b688b3 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -155,7 +155,6 @@ examples:
         interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
         qcom,rpm-msg-ram = <&rpm_msg_ram>;
         mboxes = <&apcs_glb 0>;
-        mbox-names = "rpm_hlos";
     };
 
   # Example apcs with qcs404
-- 
2.34.1

