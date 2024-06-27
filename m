Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA9B91A98B
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 16:45:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EB851931;
	Thu, 27 Jun 2024 16:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EB851931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719499557;
	bh=im24zS9c8NElT+N/gENu7NEwrDfO/2oaS1esQxJvmIE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A1oGbTgtVjqJEdyg/WkDvTCKY00NMcg9JSII/eHiMgIUOMFJaX+6VNpGbEixg8ZBj
	 zrg1czH2tObUZjz4LQOZNNeD/nwsWm5uNAJhLb/QdI0djvB1lzks/Z+3W9SYbiQdpI
	 uN84o74SGQKfxhrgLRLwDHOyoebzu/TfVdD7H1ow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5E19F805ED; Thu, 27 Jun 2024 16:45:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E7D7F80601;
	Thu, 27 Jun 2024 16:45:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0343F805B1; Thu, 27 Jun 2024 16:44:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78D73F8013D
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 16:44:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78D73F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=y2u2Vbo+
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ec5fad1984so68985391fa.0
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 07:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719499485; x=1720104285;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fv7G4wggBcVvOCA5q2uk0HwTlQqcu/RAhSIH1THEBs=;
        b=y2u2Vbo+83wk06XqH4dPwdEtCwxfJnZRiiYR9MUPk1fcYYdj/oJqaUuyCNlZX8dnLv
         yOiCXMlEfkijmM2z6jIMMnZCp0zZ0gVlGKeSnQLueCD2EznZrpMTF081zr9V0qWlL4Jl
         jqPDprwr1myM8ldZxxsWqcCk/s4iBkvOlPZY3ZlagcqEJb/BaxRDjxQC+JZdDxgRx7Jd
         LVDPP+Oj/UdANseHLJznzcrhMMY4mBSTYe+fOdhtxnLcWLY+KRAx7jLCg3FXE60Csc8Q
         wskvZC4JyxQBy1kqK91ENHx5gHuQtiAkvbMK7PqFekICrCq3YA9BL5SoUwtbgmKad68B
         1IFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499485; x=1720104285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fv7G4wggBcVvOCA5q2uk0HwTlQqcu/RAhSIH1THEBs=;
        b=Vo4u35Z24m3KyAEuhFwtglIZtUQIHWWyimwSgKQRxmKWQfSl5jGwEM3qjFJgtEEfIC
         ujv3jzzIB8HLWa+2hcjv8CFeDExYM8mRTlLL+kDOvqoKKL4s5yu2E5USZ+UOz17+nyeJ
         PIEot/xEqmEYT3HXXWXXeV0/0Z7xNizqTJFyVjNzdsQzgAnlS2u48wcsk6cig0ohCqrj
         f6kfbr2qypFNsjlD9yIp4o+Silz8oaXfLMvHo6tRJsbYb9Yr3TrLjo/XfpCj6vttVZ3R
         xRwU85KHtqWpv3YJwzsUEuZ4+nsdGlvrkC7EBCaJaNvsvIRUdWzPEpwuMd0FwJMf5pR1
         +Iaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbEY6SGoBFX4Eb+/LGp+3S7U84GvX8JYTSF+4TIiTfvFoZUr0oyZpynakf3bPQCxZiSENwA7+HQRQQGB2Wg3h7W8OL4UPzxnBiRPM=
X-Gm-Message-State: AOJu0YxgE5m+nj+Djtt88wU8hSgA+pDW9W9cP8bpzjRkHtVVVyvLs4KE
	bCA5lh5/DLsKNGG/Ez1B7nbTCyYry5z4f1OgAaZPzicom/ixYbDXYmrJZMEOqTg=
X-Google-Smtp-Source: 
 AGHT+IEbLn33fk1NZx+p9Ng/LEPBTTHcSVtjsRY8RIe4VyoU34O7xYRjTaOVTRSNTon7MnYbskEVdw==
X-Received: by 2002:a05:6512:2254:b0:52c:df55:e11a with SMTP id
 2adb3069b0e04-52ce18325f3mr13317733e87.9.1719499485122;
        Thu, 27 Jun 2024 07:44:45 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564b7b7c1sm31254075e9.23.2024.06.27.07.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:44:43 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
Date: Thu, 27 Jun 2024 15:44:38 +0100
Subject: [PATCH v2 1/6] ASoC: dt-bindings: wsa883x: Document port mapping
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v2-1-6cc1c5608cdd@linaro.org>
References: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
In-Reply-To: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manikantan R <quic_manrav@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=q2lXJvgATkQ9232ugFsaVN0aY0h1slxdwjETCG0KBuY=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfXrYexE0bCsXqMCoJMK2qX+Svh51N1PDv/q+a
 oMQdJLI6uWJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn162AAKCRB6of1ZxzRV
 Nz0nCACuIuRa5RKmZhysyKUIBtuAriVtIlqHhca5rq1Wr1TgcuGQt2d3t2Dpc6p65k9z952Qrsc
 PF0LonPY3dvyUdhdFAfBB3oYPGdcwkjwq+Az48KLVhIrpmWmvU6FrbF06ynqu+JAI9Ymy5POxJ5
 t9zEc8dEvJFqxt3K3a3NVsD1BsLKJcN6GA+Ox7LVtqDtr5AQMhBK95yqNQ9argu/vJnbYp4kyKp
 hJ2dEmDEQtcIu5SF5qia2lLudFGqZZVqyrQ/iPy0EdsgPpTHkoY7FTXSUoj7xAuUHYYFoTkz9DA
 c7ALvhsGe1nVX9sbecWWyamkZblYNyi7uhv1q1MbEgCYTW7B
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: QKAKIBKEBT2KQ2F627E2WBSJURR2PZ5M
X-Message-ID-Hash: QKAKIBKEBT2KQ2F627E2WBSJURR2PZ5M
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKAKIBKEBT2KQ2F627E2WBSJURR2PZ5M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Manikantan R <quic_manrav@quicinc.com>

Document port mapping property for wsa883x. Port mapping is required
to be able map correct master ports for VI feedback.

All the device ports are not mapped in same order as master ports, so
there is a need for having static port mapping for WSA codecs.

Signed-off-by: Manikantan R <quic_manrav@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
index 8e462cdf0018..14d312f9c345 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml
@@ -32,6 +32,14 @@ properties:
   vdd-supply:
     description: VDD Supply for the Codec
 
+  qcom,port-mapping:
+    description: |
+      Specifies static port mapping between slave and master ports.
+      In the order of slave port index.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+
   '#thermal-sensor-cells':
     const: 0
 

-- 
2.25.1

