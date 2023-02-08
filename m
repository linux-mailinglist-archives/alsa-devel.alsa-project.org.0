Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 898DA68ECAA
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 11:19:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E458BE8F;
	Wed,  8 Feb 2023 11:18:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E458BE8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675851541;
	bh=JsZRidRfwgBr9Kbk/3VQMZV7ndDjiB+luPTXZw8TfKA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QsoJ77tElTgyV9+V4xAlxNd1FggzAsvYSCeIbgkHKYTRaexHL2jfWYJTrU0TpHGdV
	 j2VNSV7hgDBd+J3HiG0JBXgDZ5ZaUfD//WqtqoiS7XbgplV+pyEm1k+PGKjKWRCddO
	 NPOBG4dAdtFASnxjklLDAbVWLt4nGTzrBcwZA9gg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B7B5F80567;
	Wed,  8 Feb 2023 11:16:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B56CF80525; Wed,  8 Feb 2023 11:16:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DA31F800AF
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 11:16:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DA31F800AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xf5P1mZE
Received: by mail-wm1-x331.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so1060259wmb.5
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 02:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIP8R/xQ7Af6ETfQwAtdNDiVKk4oUEjwkSgHlIW4k74=;
        b=xf5P1mZEQ/f8xsXxbbauz7U4oW97zmEDzPAR0GIA0F5EDCDkpZUY+iw2NzZnbALPST
         TVc6K+bd2QnughBFtQjAMZgZm7kKlhkxxvJ39ct/UqN4rfbYPLfZ17F5zd9cMq8WmqyB
         iIEStiLAR467EaRWFZIL2D26DlCk/x1W6S4AWVmxfgq/N6jxGI6Bhov/30Ozk1ekxdoK
         +AIAhD8xo6sEo/W4CgDu0iXlpBOHfDcZqAGFQJ3Kj+5DUFa0VpWWFn3q3XGRrD7FqGXg
         jIAv9a8SvAaUUYlm9kIal6+y1sYhHU4VEISUeAAAH7Xb9FBAN6eZPMHpur7FJfMtcwqe
         Lv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIP8R/xQ7Af6ETfQwAtdNDiVKk4oUEjwkSgHlIW4k74=;
        b=OR6+7Q746QmxmMO9WpYGbHsDMiJBc6eOd/txtxvEGjklDQ+DfseEMwDUeb5HuITlQY
         8LgUCH65TnMb+1dc/N7m3sWNCBVpV1uNTuNIEvGMHXLEL5yZnjzhZwZEXgQvZF6e9oP+
         g4cTocxquEtesGRde0ZtgyqaQF2IjaJ1RaRpmIENYDXkJDqt3hqHduGruuqIXMDJRrUV
         r2pMPPrkb+JQfO9KBrd4/FWygnWeUvudxwOupfEKuOWsj48FlDZn4Rde3oAPI67CQWSe
         MbvYPeggFpImHIaunm2SqJwvk23blD/Ob3WUDDkqry+w3OfJyfyfcuQp4ldEMHqqkckY
         +L7w==
X-Gm-Message-State: AO0yUKUZe3bYQyzZ8f5QJefXnZJumT00ESgdSueTKT7dxbK5rKcNK5iJ
	Ae5LwAFBWD8m4uaq0ZStHbIzlg==
X-Google-Smtp-Source: 
 AK7set+f5AbP6DO1p1Rfbv0AhFB9vPMBJ9BONhfBuIOjQDgrlQaXszTkx7Bz9W4uMCB6M3CKPbrG9g==
X-Received: by 2002:a05:600c:3c9c:b0:3dc:d5b:5f6a with SMTP id
 bg28-20020a05600c3c9c00b003dc0d5b5f6amr6011165wmb.30.1675851361711;
        Wed, 08 Feb 2023 02:16:01 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b003dc4ecfc4d7sm1496328wmq.29.2023.02.08.02.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 02:16:01 -0800 (PST)
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
Subject: [PATCH v2 7/7] dt-bindings: remoteproc: qcom,glink-edge: correct
 label description
Date: Wed,  8 Feb 2023 11:15:45 +0100
Message-Id: <20230208101545.45711-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KANVSANNQ7QN6QP273X7WAGQO5BYBMSW
X-Message-ID-Hash: KANVSANNQ7QN6QP273X7WAGQO5BYBMSW
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KANVSANNQ7QN6QP273X7WAGQO5BYBMSW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Correct the description of 'label' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. None
---
 .../devicetree/bindings/remoteproc/qcom,glink-edge.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
index 8e133ab55ff3..15e6851e1ff8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
@@ -42,7 +42,9 @@ properties:
     maxItems: 1
 
   label:
-    description: The names of the state bits used for SMP2P output
+    description:
+      Name of the edge, used for debugging and identification purposes. The
+      node name will be used if this is not present.
 
   mboxes:
     maxItems: 1
-- 
2.34.1

