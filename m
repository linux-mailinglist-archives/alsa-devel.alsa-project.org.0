Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CCB91A5D8
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 13:57:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB8FF218B;
	Thu, 27 Jun 2024 13:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB8FF218B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719489436;
	bh=O85SbDxixdkAuJ/rOhbynhMI7K+2tLwJVFvzLIEa4dU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZhmPIHwbH7KUloJq9o4y4HGgYFskY/71tT2Li4jYJLMjEOnHhdl40cFWRXNAPE34n
	 h46+ihNxzEb7aQEXD+JiBJggHhocOzkJOHQX0cO76L8/jk86HgUjfGxJVz9Y7tntB9
	 A15U7v27Qr6d7wjeBivNoQ2CSvHiOhNpqqsa19N0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B975F805E8; Thu, 27 Jun 2024 13:56:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87373F805D7;
	Thu, 27 Jun 2024 13:56:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FF65F805C3; Thu, 27 Jun 2024 13:56:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10203F8013D
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 13:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10203F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nIkjhgyC
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3674e1931b7so240741f8f.2
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 04:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719489360; x=1720094160;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMZBr+sbQUIlIpJSUfbM5OlpXtb2wUsqZczwBcVbFkk=;
        b=nIkjhgyCM7rYuI7b9F8qP3jfCIuLB/Wk8qYn3M7yT4eHW2KBZiG51HmHgdR0aBHaGe
         28U1AxS52A3xEVLe0OhBH5lW7ramku4IFt7ic1xUHmRBLKx07gj4l0QgSPr4gRNpkbGg
         1r7osMEIS1LtXvdZL2kO5/w79paFQgXcnzgrhz7BWgbk2uB5jIxA1cbq7V1/wzW+6FDg
         pI1mHyqUUEsyI2yZWUTvPJLiMNlI41rx2MWVFZ1p6Wk8Fz+8xvosSNm1lqtpVzRtH9ST
         TTVRckUNI7hOfUuc8PyM5RLGUc6CauAQUhWMWw+j4c92pwmZ5MTwDbUnpBnoH5bUNpPg
         RyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489360; x=1720094160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMZBr+sbQUIlIpJSUfbM5OlpXtb2wUsqZczwBcVbFkk=;
        b=GyzuMt6kao2NcIn2XxJgwqTO3sEYkBCiXrJe4h3BzelEdfav8G55aWaq+mp7vP69Ne
         bslpth0CHLIYDtWOGFYD3K+KrZQgxXKh4jfK7fKJPR7gZq2+KTI3/1kJBXIVos1pFZ+c
         u2H5cetcCclTlFfczzw7sUSIDiWU/iGkAdQtGUXjD3SzcSKZJjJApSc74NOPKpl/CBWb
         MsmasKj5m8GnVoD2ozTNyqM2vTG1gk9Hk9/vWFSIiB/0cese4Hd5fKVsqkDndOg44HYz
         iDrR+bkatdXC415dSAQ15hWh8hYdJfGCJBDDYidHcBzr8FZab2PNAnu0q4gSkO1UjnKc
         RUTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYG8PFArv5Wfq3+plxmnegRQKdLlPJq5oWj20cFZ9OYUtdqwzcnJJxsli8TRhHE+yGjyEzHEOaZY4hgy29i87N/oUV22RnD9mSfvo=
X-Gm-Message-State: AOJu0YxlgSJT4IjMm9HErSAPT5G3sKJtwJ3jVnHGQACssxOrC4uS8AQJ
	HFHqi7MRr2Zi/u+LV+bkeYsjmaplNmOWkIZKCCfzDcVF5XBUGRgUVfL7oT7P4gI=
X-Google-Smtp-Source: 
 AGHT+IEajDfDHrlmCEHYVoCWsrnXSLEqnz7GdWm9eBlB0wFqTWu4cSRsvyee0ui/6XBlSKjTXD4FpQ==
X-Received: by 2002:a5d:5384:0:b0:367:3fdd:632f with SMTP id
 ffacd0b85a97d-3673fdd6404mr1795626f8f.67.1719489360162;
        Thu, 27 Jun 2024 04:56:00 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369980asm1597552f8f.80.2024.06.27.04.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:55:59 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
Date: Thu, 27 Jun 2024 12:55:17 +0100
Subject: [PATCH 1/6] ASoC: dt-bindings: wsa883x: Document port mapping
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v1-1-bd8987d2b332@linaro.org>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
In-Reply-To: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=wrRMEFdk/eFRVK+n/GMcDMkDXGS6UAX+Cl/VfV6o65k=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfVNNk8LDQuSewymFkeGedy5XR8KOApyhZg6lR
 bMky0gHUa2JATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn1TTQAKCRB6of1ZxzRV
 N//KB/9mQ5/GXzpPGZa50BDdqSUPYiXgHhNgIyh+W9yQfxvAWyH9Y7JEeNosJUzEUOzSbEIcUs+
 NqU+0SZSlPJ7dyPSZZp97eCtYFjRrAOmXB43HPpBgu0Ntgqum3Al4cLE9oDqRMJM2Hvpx+fAEt4
 3Hwd2HCfPl51bCjiGJffrYkxfwDVSlClbgLPWuzAP/rYgKWfkHhXvpSMJ35wXXHhr/1Mth5nbAh
 bjC32OTACEqJwhXnGgONN2cZoonXj9xvWmfqOz2UMr8xg5lPbg3PyxPwB2ZX68pUOXE/EYJ8NJ6
 446xN9BEvoA55S8Nv917NtXIMehL8d6jcZ/RFI1RACl8CqaM
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: TQQFV7Y7IGEXGTJ7MEFPKRQKAU27J2MO
X-Message-ID-Hash: TQQFV7Y7IGEXGTJ7MEFPKRQKAU27J2MO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQQFV7Y7IGEXGTJ7MEFPKRQKAU27J2MO/>
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

