Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA28E8FC853
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 11:49:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74E90868;
	Wed,  5 Jun 2024 11:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74E90868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717580986;
	bh=Hcboqt/mCTVI1F3jHOS4TQJM3QuLm78ZsIrceEwB3No=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DKZWoF6vMkIhqSr7bH27adAohZYlm1Z6GmIWiVxRgLnOcSuLEkWUIvfW5WS4QQ8KJ
	 NJitMvaswo3zWXC2mKidAlo1OFTwqLhdEneoRap7Gqf7EsQzgYmlywPcLGlgOl43De
	 mT3bLKZnKsgf+DaeibUF5hAmUbPnOqQ5C7UHfnTw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 515BAF805AE; Wed,  5 Jun 2024 11:49:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 494BFF8059F;
	Wed,  5 Jun 2024 11:49:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD245F800FA; Wed,  5 Jun 2024 11:43:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11B44F800FA
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 11:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11B44F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cWm4/NjP
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2eaa80cb573so53671871fa.1
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jun 2024 02:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717580453; x=1718185253;
 darn=alsa-project.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N2ukym6a7idvbhiMPUeFxPFQ9JMmthq9JaArWccCKyo=;
        b=cWm4/NjP6jtxd4siAYB+oqx9NYFHi3p73a6w7lZbnC6hZlhJOwF2k7WVTTNKm9VRze
         v9UAXnstxe9hWCm+n2b3zfGLtNaaauPLHweKPlEMbxv7q+0WBJKdWgPvkTIvWAIZe4/1
         e2qMjM1IA3+G+rv/NJmR/CJhGsuEnuU+yZHBq2AqZN6XqN6IQTgyMQq+HOG3YFel4LHA
         wEOWBNfaR3zDdJ410s1OylsE9zUNqNFT6Xa0wC/Wjdef8afLcQ2+k0TNMNlSTHuU8wRA
         DCcZippapj+wfwESO6W0DIx3clng+k/xUBGZY78w2142WC8eDJgPRZ7h7m+uWXO1731n
         ESuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717580453; x=1718185253;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2ukym6a7idvbhiMPUeFxPFQ9JMmthq9JaArWccCKyo=;
        b=ma1Q9W4X+s0QvqtiLataKEMQ+I8qKXKEJp1SywzvJsUxiIezwbddzon0VrNLCj7fCu
         UtwNnSL3C7/zuf3iRyJU9Own0TaHoBhUDjYvEnbZoSLgq7Ft7MlQtwAHarMD3N/aDcEJ
         YMP45dB3QuovNjhARTrIkh74xDwQA1CemNG8gjLT7xroIEN9/Wc+hLXubMj7CFVrt6SB
         gOZSnMvz3YBlnRfzmq3YNmW9xcqtv0GbmWCFCSREJn7zDcud8VU8Vbk+u5/sq5959Q1R
         Px8QfWrMnmj7iA0i/YYBTLpuKk8UAYjVUKHlbwfXSKEHtvBYe8z+AYFstTrWO38GWyVB
         hb5A==
X-Gm-Message-State: AOJu0Yx/vQTQdcxe2cw+xzZZ1gziAuf/f1R8cUUJJTOgel8HULXJjilg
	K8hE0wlIzEO44Kr7BiAvB3b5HpaiT4oC9BPVnYOi6Hkm/ike2srDtvbOGvnxkiU=
X-Google-Smtp-Source: 
 AGHT+IFMcjnS3DnsYbqQlASFRzhCm5EUynN8y8SEbAtGYnAGKbONFNfagI8RnrgkTFcQSK2RQsYS/g==
X-Received: by 2002:a2e:3c0f:0:b0:2ea:7a2a:c044 with SMTP id
 38308e7fff4ca-2eac7a54157mr10681711fa.37.1717580453531;
        Wed, 05 Jun 2024 02:40:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215814f0besm14561375e9.43.2024.06.05.02.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 02:40:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Jun 2024 11:40:51 +0200
Subject: [PATCH] ASoC: dt-bindings: amlogic,gx-sound-card: drop minItems
 for audio-widgets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-v1-1-65bd7cc2e09b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKIyYGYC/x2MQQrCMBAAv1L27MKmqAe/Ih62yTYu2CRkUxVK/
 97Q0zAwzAYmVcXgMWxQ5aumOXVxlwH8m1MU1NAdRhqvdKcbtlzUIy+fHDvXYq0KLzhpCpqi4ax
 /MeQ1aMafhijNkEgczz6wown6uVQ5sz5+vvb9AKX1oeaFAAAA
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Hcboqt/mCTVI1F3jHOS4TQJM3QuLm78ZsIrceEwB3No=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYDKkt2DGUfinkqCMwZEThmnPMR3bgoN1YFiAvLEI
 czAZEUeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmAypAAKCRB33NvayMhJ0aPrEA
 CuKabcMnfZApG9Ja4UOCYeP0CSfWmNy2Y7L2lZfzWotJsMv4VpYAuKJ8itU2PgMfzoR1CX+UL7zPFU
 Mg+vioYU2EJ6P4CGDlYfl/35ZWobModRrHWugri3CgoecgPWqDPm0o6pwyKTy8SibKvVtS+Y+eJgI3
 FznWEHipHGIqi54kjex98EPJyPogfKS7z1YI+7pjKb8p33uvgKEbqDx9lRv21vAXwCHyQBvY4iSDc7
 ohq/FhOlDt84sRC3aR9sse+qMK9/Ca1OsEVVpLeODncPM7QHwkQA8851CGFbTkCS/C0cvpGew1UjGJ
 QdC+kPB4L4iTjmK+ptzbL2DJM6eYbY1yI9lSbJ+jPcJeGZph/D0KMp2Vap2KfFlG+ie9f1IN43xOQm
 fgofKD9pML5aAutw+451YZQbo6Tc2QoQpRZBjto+IpTFt6FuBaC2uahR0yBE+I5Il0IvqUIooxihOl
 M3y0tv5+fNmeEbnLAOlD9+7TWyd3h8nfo0LBVx4kSz/FnmQo0rsR7oL2SrXEcHhr5T8uXoxiKAUYHC
 vqwQaOBBSwMNeyW2jvJee0ARwJVm3HhTk3GtFS/fPh2VZvdJrA0b6scDmsVcmOsIHELP0bPY2OK0sN
 9WVwvlKF42oOaTuBA5r6HLDwXWr37rfKyKnJLuX5LQK73vw5f2VbS/y/SmJA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: FLRYPSJAK3EP6Y7SYGJLLDFH4UDD6HNY
X-Message-ID-Hash: FLRYPSJAK3EP6Y7SYGJLLDFH4UDD6HNY
X-MailFrom: neil.armstrong@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FLRYPSJAK3EP6Y7SYGJLLDFH4UDD6HNY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Like "audio-routing" drop the minItems: 2 from the "audio-widgets", because
any limit here - lower or upper- is rather meaningless.

This will also fix `dtbs_check` warnings like:
sound: audio-widgets: ['Speaker', '7J4-14 LEFT', 'Speaker', '7J4-11 RIGHT'] is too long

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index d4277d342e69..0ecdaf7190e9 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -23,7 +23,6 @@ properties:
 
   audio-widgets:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-    minItems: 2
     description: |-
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name

---
base-commit: c3f38fa61af77b49866b006939479069cd451173
change-id: 20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-00e1afcda10b

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

