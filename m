Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE36296295E
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Aug 2024 15:55:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E603A844;
	Wed, 28 Aug 2024 15:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E603A844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724853301;
	bh=H1c4ha+5GYzDLEbE4i1lNMGNdBCv90PmwIHjIeK7TAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UUFqPCyUYae+ahhA2iV9JVkvK/oB/ygBbbHCF/INgJKaItCrtciBa5z6fsswHaqGb
	 JvJowGmTbSCeul0wOoIXiKEjCn4fh0evQoK9i7F9BCUydeQ3bSZGZXR5vCQcuGtZAY
	 FsRtn1D0afZZgqtC10APp6ktZVK2VAsJSRx+pMxA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6AC8F805DF; Wed, 28 Aug 2024 15:54:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B500CF805DF;
	Wed, 28 Aug 2024 15:54:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CB32F80568; Wed, 28 Aug 2024 15:54:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23CA2F80087
	for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2024 15:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23CA2F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yMvZcliQ
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42816ca797fso61244755e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Aug 2024 06:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724853242; x=1725458042;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKFmLO3/lL3Nmg2MZkLt12OObockGDaQF70Wv4NVfcg=;
        b=yMvZcliQz/ZX4EGf6Yjql/rHoeHgy9VQlSk+3BeY4xn2u/Cn8MDgZZH1BP/JcdOen3
         jnF1EQmmDQ8hTIS86tZaL+NyVG/dUFtUGxJ7Ud2RkKC2mFM8rQhn87EY/iSmS2lzUpSr
         ViGMQA4Yee118YHQbKS9t+ZSozwzycCObjqU796r6hVPJhWCIiqvdlsjhVfdude74XZE
         4DO9C4QP8JJt+q3dthN0+zt2nSnLbxWmv2jqTXsy18JGzznyh68M7Ujx6o3pcO5nIa4I
         hQAJtEG7Hhff5fq08ndZWJFMrZP6f1Q0qGN7VjVW9zI5RA3fHtG9WLuiK2Xt25csc33O
         uvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724853242; x=1725458042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKFmLO3/lL3Nmg2MZkLt12OObockGDaQF70Wv4NVfcg=;
        b=qH9oylVvzL4zZ7M18u78xvA8f/DXuv+C5+pv1UydrXkijwt2t4EMd0KlZDQZA1vHVY
         zlhYJe2YwXLu4PmQqRgO/Ton1mcDwzGxFG5P6Qh4XYWjPosJjRgkPOV52NUdtThZ6Lho
         4DDLBngk/wVbN/eR1Wxs3ItppjsIjpVkKPmsGvpldVeMWoFgq3O/6FpORko85PFZ27IE
         f739karrO5/po71uGqAw903LL5wc0rsAxnDnUzseWqGsr7Cp88PatI8nkEEk+/4nzkN1
         U/tPzlq1blQ8Gs6XT1JO/+oA9xBbSPFP7cbxAbfCsDXgTjWlJ72pc3SVaTg6zmeb8oHJ
         JRlA==
X-Gm-Message-State: AOJu0Yw2uOhwl3ms5ARfD0wLb+Wzd5T0thdMCD6BHG2Z4Hfp/IH/QFy1
	imHNX6wF4XeWxPpz3WtsaoKHHF/xe45SvuRVsJCg+M3IbEoCTFCKP+fHDlvvg+Y=
X-Google-Smtp-Source: 
 AGHT+IHSwoWHMFDjpKFcK9pcwJPtwmfEIa1A/D9/8Z2Dvd6+CqPWbqEAoRbKZE5vSyxTCHeL3rK7vw==
X-Received: by 2002:a05:600c:19d2:b0:427:9a8f:9717 with SMTP id
 5b1f17b1804b1-42ba64c2453mr17313295e9.0.1724853241539;
        Wed, 28 Aug 2024 06:54:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730813c44asm15613395f8f.34.2024.08.28.06.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 06:54:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Aug 2024 15:53:54 +0200
Subject: [PATCH v2 1/3] ASoC: dt-bindings: amlogic,axg-sound-card: document
 clocks property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-1-58159abf0779@linaro.org>
References: 
 <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
In-Reply-To: 
 <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=H1c4ha+5GYzDLEbE4i1lNMGNdBCv90PmwIHjIeK7TAo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmzyv2DUmjHipIUmDw1VvFv3gYyKSp37htJ4T7g7y2
 Yy5W4c+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZs8r9gAKCRB33NvayMhJ0UQcD/
 wM1sahnvh7BlHNGmJyn8QxdB0ucze7tbl3ftwdIlJoqnyAF9V5NGDbe15HkoR1MXxiIICMBEVrKl/8
 +q1dz5aZMfphY7lHShsY/MdZ6lNm7kSOSU8kM9L40Nd2XOTkr5PU8mfaONDidmxwC/jFiPHE7ilFpQ
 C5uYMvoa84cRrhXVk4uMPnkA8w2qybW+LfxiEUvlt5fNv5CkDlRdogs14syofwQdCNe9ezW8UR5pLY
 ivKIGzTSD3CBNUsmnzRx3w2wFgQ9ZJ8Aca9D2feC1G/3c3CRbWUzvs9WkzKYY+XEYtECJRoWJEx9Ot
 8yZT/colrVm615sewPkKOMszEzWfm3Rc+bojYiiIJTIvdAQDv/VUvt+BFXdfkdqdIyvLhVvAhp5+Hu
 ch01cknvRXXb5EPJ0lu+sKGMnJ7KWrs20e2kJRp6HLRkIhKpvDrJCWL6Kj/FWdJcBh3B7TRqbDuycr
 BVLF/PYIv6xGoCzxwKihusUc0faG2WzwlJybQkrBoxdkM2lYyR90TlII0fuBYAGEcunlDs2Nfs5JTB
 2FFrFaM/spiPI9vvfhI5tr/4jk+Z1qIXo7lQ6PLam6VRz2jnhGMs+fsjnuxYibONBgsQ7T8nprvCkz
 wYDlC5p2qBePzz82BZ9ZopTxv1KqASLS4YV4Khg06DsRsXdmrk1Co7mrATag==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: VUJKO2YRC5UZO7QY65HLFQPMOKDY3D6W
X-Message-ID-Hash: VUJKO2YRC5UZO7QY65HLFQPMOKDY3D6W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VUJKO2YRC5UZO7QY65HLFQPMOKDY3D6W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The sound card design is based on reference PLL frequencies that
are the root of all clock rates calculations.

Today, those frequencies are currently specified in DT via assigned-clocks,
because they correspond to the basic audio use-case.

It makes no sense to setup clock rates for a sound card without
referencing the clocks for the sound card, mainly because at
some point more complex audio use cases will be supported
and those root rates would need to change.

To solve this situation, let's legitimize the presence of assigned-clocks
in the sound card by documenting those clocks, as it describes a true
dependency of the sound card and paths the way of more complex
audio uses-cases involving those root frequencies.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
index 5db718e4d0e7..4f13e8ab50b2 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
@@ -26,6 +26,13 @@ properties:
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
 
+  clocks:
+    minItems: 1
+    maxItems: 3
+    description:
+      Base PLL clocks of audio susbsytem, used to configure base clock
+      frequencies for different audio use-cases.
+
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object

-- 
2.34.1

