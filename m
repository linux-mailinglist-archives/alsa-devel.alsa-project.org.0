Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 886CE944B0D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 14:13:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55BBA3F9B;
	Thu,  1 Aug 2024 14:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55BBA3F9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722514397;
	bh=ub3FOT3N4vnIxLUsFS2HSpg9K4GlOZ+9OZbF4CeT7Fo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fqoulJLDkbpQpUgvPvujtq+STsyNtTd6mMglEpAAd7ykbi/om/GparOD9jtfjKi3o
	 ST2mvRk5HNtcQN2Z1utuQpvWd8acyn5cMgZC8Dt/9g2vVYbLrfW0h+joDur2bUoYp5
	 ZdxecWWZCW4/CoZZLv1uBzV/f9NK9rUTJBNheMqo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47027F8065B; Thu,  1 Aug 2024 14:11:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7730FF80683;
	Thu,  1 Aug 2024 14:11:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B294FF8026A; Wed, 31 Jul 2024 17:31:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4277F80579
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 17:26:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4277F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YcVe95Qq
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-427fc97a88cso39095435e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jul 2024 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439572; x=1723044372;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1Cyu5R+oW5fffURVcJfSnNMpwp4wHNtRUsf1XeMFf4=;
        b=YcVe95Qq82dQu1okPfcIo1sbb/p1pp7PglGFDpJ7pg3oFdlSEpjcvRp3lTa7jnLq6k
         11QoLI0SMDcvUbQoIGrUqapR06uAoCBuXwn07a/bnnspu3nnXeDwLbGEEqOvuw7Vpa7Q
         YutVh9h5oh6bB+JYbWXJ4uAF5MNWP3RTzWOOHj1vHJiDVgtSOJ/kTyfu6A5hvdSfnAEV
         VDeCHrChJfJO/WNbF8DJhgCoMdniAf6kzL8+Jj94AYk3IQwGbkttyirv4/esvtzp1fLa
         avmgq04RSCtBK7svxWkomyFFPPnmaWk05P2P6HvaYHj075aZvWdOAnrndEvllFIoHJOR
         eddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439572; x=1723044372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1Cyu5R+oW5fffURVcJfSnNMpwp4wHNtRUsf1XeMFf4=;
        b=gFVggkC+gid1eKhUa4TmgBT+8kVUcjYo5LuIhMigmfxA5zDrERN28AZ22Amhxx8jpR
         s9WEJeM7XHHHeJ51tuQy9Gsr1f9ZXFFvpU3VjydyiIw4UZv0jNwdJPVImj3LoStJ9BFS
         aPibF9kXs73xsNbCdMJq8mIH0/jbFVdv57nLgCXEp3P/PuhpDRKLmlhCTdmtjMwkSyrz
         x0SMI9DFRL4xUtzI74EzpTiOwrlgCm5hGvtciNcCHkMc9gaxzIo/xSZ/IBxcOQ3+fN5j
         nZFl4q+AMOcClOva1Gs2SBncyyr0BLhvTcmcj/2rZWvDK5WUugmvXr6dpR1pA167VIKR
         nI+Q==
X-Gm-Message-State: AOJu0YxXnOsHbqu0gPbKl7XNqMazW6AsYGzQ05gu40L9Kd+KEJhX44Nq
	npBTWNPmjKMwbmtiqFBP9j+QgPDSYdi4y6Xnmzp4HhUnG49aaIba
X-Google-Smtp-Source: 
 AGHT+IE4tWC1HMsu8ewKdcCzKf9d3rockdZHaoPstllb0YXHMBWMItwOq1au+xKA5f8sl27YWu529w==
X-Received: by 2002:a05:600c:3547:b0:426:5f8f:51a4 with SMTP id
 5b1f17b1804b1-42811d89f99mr87663815e9.12.1722439572060;
        Wed, 31 Jul 2024 08:26:12 -0700 (PDT)
Received: from [127.0.1.1] (byv161.neoplus.adsl.tpnet.pl. [83.30.41.161])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bb64755sm25430985e9.36.2024.07.31.08.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:26:11 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Wed, 31 Jul 2024 17:25:29 +0200
Subject: [PATCH v3 5/8] ASoC: dt-bindings: apq8016-sbc: Add
 msm8953/msm8976-qdsp6-sndcard
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-msm8953-msm8976-asoc-v3-5-163f23c3a28d@gmail.com>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.14.0
X-MailFrom: a39.skl@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4CIRYO23OIKQE52HX2XWJTGEZV6L4X6P
X-Message-ID-Hash: 4CIRYO23OIKQE52HX2XWJTGEZV6L4X6P
X-Mailman-Approved-At: Thu, 01 Aug 2024 12:06:31 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CIRYO23OIKQE52HX2XWJTGEZV6L4X6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document MSM8953/MSM8976 QDSP6 cards.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 .../bindings/sound/qcom,apq8016-sbc-sndcard.yaml   | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
index 6ad451549036..43db5ad65d75 100644
--- a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
@@ -15,16 +15,22 @@ properties:
     enum:
       - qcom,apq8016-sbc-sndcard
       - qcom,msm8916-qdsp6-sndcard
+      - qcom,msm8953-qdsp6-sndcard
+      - qcom,msm8976-qdsp6-sndcard
 
   reg:
+    minItems: 2
     items:
       - description: Microphone I/O mux register address
       - description: Speaker I/O mux register address
+      - description: Quinary Mi2S I/O mux register address
 
   reg-names:
+    minItems: 2
     items:
       - const: mic-iomux
       - const: spkr-iomux
+      - const: quin-iomux
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
@@ -106,6 +112,27 @@ required:
   - reg-names
   - model
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apq8016-sbc-sndcard
+              - qcom,msm8916-qdsp6-sndcard
+    then:
+      properties:
+        reg:
+          maxItems: 2
+        reg-names:
+          maxItems: 2
+    else:
+      properties:
+        reg:
+          minItems: 3
+        reg-names:
+          minItems: 3
+
 additionalProperties: false
 
 examples:

-- 
2.45.2

