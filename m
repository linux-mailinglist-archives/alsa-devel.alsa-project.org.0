Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61126938FA3
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 15:04:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FC7E190B;
	Mon, 22 Jul 2024 15:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FC7E190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721653489;
	bh=KRsPJdZcwmK3gbwOR0QFyaoTgSYfTVGDmjEFVejhQg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PP7jVLWaBPM7z0toHyCl8ePz6dTXGTreq8oQ38bTJVtLfGMxhnX2nzIvXlRBobW8V
	 tr5VDdOmH+NigGQF8aBlUKTs+iCVtvuqwIP4kNDTgW+WH28HDku8c1C8mLhn9Hl6/x
	 0AjF0CpNJrhNy3z0euWkx7mvpX4UzXsX5yqtZtU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D4A7F808C4; Mon, 22 Jul 2024 15:01:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31ABCF808CB;
	Mon, 22 Jul 2024 15:01:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A081F8019B; Mon, 22 Jul 2024 11:54:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 451ADF801F5
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 11:52:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 451ADF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IU6fsPB7
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52efaae7edfso1166475e87.2
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Jul 2024 02:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721641942; x=1722246742;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LueQvPp7jIsOu7JwwYrAGJM7gILiYRCDnqZjPBjPXPA=;
        b=IU6fsPB76kyV5ddtjKnPizGdfKBs1NY5UsbEZanwdV+40WevE/Zi4vKNiDfnR6SdbY
         101YTyrvova99wOZiha9XEpqCfbo+UUlBvvTdeS9J8XiCGCp2dyxsCvu/l8Q48OfjO4v
         vRIiWIc+vGWnGKfNaVlClf3QVrbTO8kC2Cd3PQ3QAXRaRF/rSZ/m17pZrp2FwwQi57/+
         eQZm6UqI9xjUTp1KRoqRkcm3ZgAMRXERJtp8ITJ7twowxKbMV117CMkheN5+lFLwA4LB
         cyHHQml8nULYgoDEDaLen5HmFbzvy8C8JIu5RAC95McJZ+aJwLgxeYy8UvAXquano7oK
         Wepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721641942; x=1722246742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LueQvPp7jIsOu7JwwYrAGJM7gILiYRCDnqZjPBjPXPA=;
        b=WGY18j5XrLSlBdyqXSLjbhKc+iG9kLZ+JveG2LuiTkwnm6N+oGdrfKP8GY/pDrY5QT
         lZXsp7czvtk/Pba15K7RyElQHWJ077+a6oEzy4y9rcCaMmmiJ//fEOUt0pCmgl/9i5Dl
         EHejC4JEr/zfEiXkaecQA9HXmDMQVsXJbpr2RDEO+QKbgKmjT8gjm7LmT99u/cA81Puo
         rgokOPwcKioY57G2iaFFCoj/8be8q8ckNa+Q1YH+fHBE93Rp7kc/saJ0Xdt3YfgHBoiB
         AyqZD08l+qLUIZAZWPAMncObaAdAId5KkcxTb7+BrMKDK49/7lxKg4QrYrcImA5FP9Yb
         F/ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW5UsSe9LHj4H/o2LvD0twPDe7VkIrlRq04/BYCwSpUQyltQ6rNaWxIA45dJzXOq/G6nvHCgJ7ClHGp1yJekdb/D99CkJherN6fD8=
X-Gm-Message-State: AOJu0YzR8De0MOm0VdcrvlFnpl5pUbUXzbm2TwSt/EL/f76DwMuNu+Pd
	iOYoSfgEOVFZjJZDKskkTIpeyIsv4UDbuEpgH8E8qwyMZLBad+2d
X-Google-Smtp-Source: 
 AGHT+IFEAj1t++gm3u7tMYWGE3y1vx+XHwQtuisG9uc4Yr+MK+jmP04CRcVD6fbhOpk4+urwoo37lA==
X-Received: by 2002:a05:6512:2826:b0:52e:764b:b20d with SMTP id
 2adb3069b0e04-52efb7e1281mr4257344e87.28.1721641941605;
        Mon, 22 Jul 2024 02:52:21 -0700 (PDT)
Received: from localhost.localdomain (byy214.neoplus.adsl.tpnet.pl.
 [83.30.44.214])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fc226cdccsm91552e87.164.2024.07.22.02.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 02:52:21 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ASoC: dt-bindings: qcom,sm8250: Add
 msm8953/msm8976-qdsp6-sndcard
Date: Mon, 22 Jul 2024 11:51:07 +0200
Message-ID: <20240722095147.3372-4-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722095147.3372-1-a39.skl@gmail.com>
References: <20240722095147.3372-1-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: a39.skl@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4XLZZND7VB4OW2DL4ZLWPIWAOI6MOKVZ
X-Message-ID-Hash: 4XLZZND7VB4OW2DL4ZLWPIWAOI6MOKVZ
X-Mailman-Approved-At: Mon, 22 Jul 2024 13:00:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XLZZND7VB4OW2DL4ZLWPIWAOI6MOKVZ/>
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
 .../bindings/sound/qcom,sm8250.yaml           | 28 +++++++++++++++++--
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index b2e15ebbd1bc..3b5f8adba725 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -29,6 +29,8 @@ properties:
       - enum:
           - qcom,apq8016-sbc-sndcard
           - qcom,msm8916-qdsp6-sndcard
+          - qcom,msm8953-qdsp6-sndcard
+          - qcom,msm8976-qdsp6-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
           - qcom,qrb5165-rb5-sndcard
@@ -144,10 +146,30 @@ allOf:
         - model
         - reg
         - reg-names
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8953-qdsp6-sndcard
+              - qcom,msm8976-qdsp6-sndcard
+    then:
       properties:
-        reg: false
-        reg-names: false
+        reg:
+          items:
+            - description: Microphone I/O mux register address
+            - description: Speaker I/O mux register address
+            - description: Quinary Mi2S I/O mux register address
+        reg-names:
+          items:
+            - const: mic-iomux
+            - const: spkr-iomux
+            - const: quin-iomux
+      required:
+        - compatible
+        - model
+        - reg
+        - reg-names
 
 additionalProperties: false
 
-- 
2.45.2

