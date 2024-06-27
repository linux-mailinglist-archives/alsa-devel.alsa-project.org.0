Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E52B91A98F
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 16:46:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0723521DD;
	Thu, 27 Jun 2024 16:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0723521DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719499570;
	bh=lE5cuvuL9G95IfOe9RWKWZGLXmj/X5MR2oSFCb1vVEw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VCxzYILExeCmUOxSg+KCYFKHRXPhQoGT96GKPSH51lrKgpQks9KhwjoB9fJDiZKpt
	 YPQMMsDX9aEdO4ijoaZarvONDI2bhOwyvDr44NLXhy1zN/AsZF3qmPki45few3WPvj
	 DrRXRZ2vFoK4ks6FGdY8+pqdKQ4QuAwr+zB+Mwb0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC4BFF80619; Thu, 27 Jun 2024 16:45:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AF17F80616;
	Thu, 27 Jun 2024 16:45:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD9CEF805C0; Thu, 27 Jun 2024 16:44:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6939EF805A9
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 16:44:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6939EF805A9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YifmdX/X
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-424acfff613so24237565e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 07:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719499491; x=1720104291;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRJmTF7L/9R7w6etZ1hOgP2bjz9f74jpdrGthQ0OD1c=;
        b=YifmdX/XRHjU5RdKx18Mft5nJeuamsv/YlloodNgpXknAgt8ClqiNczZWjMY1vPjhp
         U05M8t6UDe2qgWUyQTFWAjm3frC95KZGRQFIYSzvpgyqIOObC3K/B207JIRiIzyrEQwg
         zeFn6hfaDGvcGLz3J8F8sAOg/XXykGNPV5eAHQqoKU5LmfDCByxfRbDYQn0D0XVZ61RK
         87JauFl29dezzdLSuq5t3W0+DCTtxqc8YsRGDJJ2jiTXjMg4+J93Nyy24L+QKFwLu6qj
         /ZqfBK6F8hixZiqbzHIgwMGOGJrod4PjJom+Rnyu+6QFOehtY13JRmRueiJPPlw9VGbb
         QqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499491; x=1720104291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRJmTF7L/9R7w6etZ1hOgP2bjz9f74jpdrGthQ0OD1c=;
        b=t+gjaxPD15emIOCbGw+raDaSVZ4X32nj2lqORBFAW6MSHLBNHGnHGFEgFK5aHCF/+R
         1MuqaiuatdO79FKEJaV9d9zJaeelleveyAQMce7wJLvzKD8oUJ2hXT1Eeh6OYTdjvTx+
         a1N8W1XlRtQeWagXmmpM4h6p+FVDvru52zMgRnzYxR8LBiqlHnVEgEBrkHxw449JaGJY
         aet0FPpB17Isg/mJWYJmzTQlvk4mnk9ByJn/bHtF0Febz4PxlNzXrbkFOylkWUoqi50S
         qf4Vf7OvXqo8eU6FoWtDguf88pO6pqYte9jkNnKmFjXm1uVPLBJzx6HXaXI+bIT/lE0g
         W8DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb1RqZtFGyIzpujFpglEfOcN6RPdkzoaWwDmQNIo9NsZ5o4D0FCUZ0Cf8e+iXsJcWogbFUtfL3z+dNDM8YC9s/3lrF/6Jm+eR5+JA=
X-Gm-Message-State: AOJu0YyzMEfJOtdxm+ocUGcYWQT7iXfB/lCm4tm4Yotu4AthZwYuhmdZ
	yffCroQNHH4eBXmsy6lsylDIiHdnZnEfDfRa5rse8Nqd4bhMh/RebIEmtYt0a90=
X-Google-Smtp-Source: 
 AGHT+IGNUBrnTko7rPX48x8ABrouRQvgTCE+3KFWPLeGW85kH8CD41VU6V7kD+IEBwpxVGEhVujWHA==
X-Received: by 2002:a05:600c:2e04:b0:425:641c:5f40 with SMTP id
 5b1f17b1804b1-425641c606amr19393175e9.39.1719499491245;
        Thu, 27 Jun 2024 07:44:51 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564b7b7c1sm31254075e9.23.2024.06.27.07.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:44:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 15:44:40 +0100
Subject: [PATCH v2 3/6] ASoC: dt-bindings: wsa8840: Document port mapping
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v2-3-6cc1c5608cdd@linaro.org>
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
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=lE5cuvuL9G95IfOe9RWKWZGLXmj/X5MR2oSFCb1vVEw=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfXrYwbTrjcD2u071XMsefeUX9UvlY3GzadeVQ
 LSyDLhB39qJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn162AAKCRB6of1ZxzRV
 NwNDB/wKyhxatFXvVz/JsbO1otbEB2++w45VwdupIDhwMMbziatHubmsQuubODvbWYR3lIbDq8/
 QZrqhc8BxXjqNRUvJmr55IpLHDivtCipYSievqCmGYlQ1ue2Lj/shYo4UuSaJ9YXtti7c0aT520
 whvV1Er/oW8PXxOD7xI9Fn2qmtHN292sM8gdImW5z+sVHow21Aq1pg7YTPW7jkGWuzJUqo/hYrG
 ieFfyX7PJXMu5gnArHOImyPGjSka0jhDVTk006jh/ypG99OO4E6jCeedtr1o56Fr54GhgCYhQuc
 vOeA07iMxEZqqJDKXGx5oCySNpC/XyOzpseJQtC3wYxp+WJj
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: OB6IRFMFTRGOCCZA4CKZNTB4S6E7PNY6
X-Message-ID-Hash: OB6IRFMFTRGOCCZA4CKZNTB4S6E7PNY6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OB6IRFMFTRGOCCZA4CKZNTB4S6E7PNY6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document port mapping property for wsa884x. Port mapping is required
to be able map correct master ports.

All the device ports are not mapped in same order as master ports, so
there is a need for having static port mapping for WSA codecs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index 22798d22d981..83e0360301e1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -32,6 +32,14 @@ properties:
     description: Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  qcom,port-mapping:
+    description: |
+      Specifies static port mapping between slave and master ports.
+      In the order of slave port index.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 6
+    maxItems: 6
+
   '#sound-dai-cells':
     const: 0
 

-- 
2.25.1

