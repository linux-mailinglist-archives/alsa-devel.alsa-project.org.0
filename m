Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0704F909033
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2024 18:27:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F33DE66;
	Fri, 14 Jun 2024 18:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F33DE66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718382435;
	bh=rLr1JBmyf4h8ZfpUwJNjeawg01+mTkoSSeFi6OYtlE4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XLn9UGdZmR13gmQ5jMIfzH8U5A8NGis+1ok6VanPcDUm9nsEjGPmZQ7ENZvt39Uhd
	 2EX8IaMytm5/lQ9u3pFnwvPlMPqcSnxcav4SioxMlXWccjrNjMftpdDvWFyFYQrSpw
	 0WGZBDoGEpbrGTXQRTCYOsl8h8v2ZhTzmU6WeQJY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE31CF805AF; Fri, 14 Jun 2024 18:26:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DC79F805BB;
	Fri, 14 Jun 2024 18:26:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EA52F805B5; Fri, 14 Jun 2024 18:24:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA649F802DB
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 18:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA649F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uzwz08yS
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-35e1fcd0c0fso1853986f8f.0
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jun 2024 09:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718382249; x=1718987049;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqVF7q4lvJozPubshiqMpT2VHbao70PEnYzL/muuYWc=;
        b=uzwz08ySDA2JfKR8GxvJf7Rg2b9kk9u1i49uok2Ng1wmLkhw2aFwSA0HhKIC50iJYT
         B/WlBX/+qBbAfzLY2S5hrOKwaE/wV+j7FUoGLrobGwtLEp5oYU/EHOTbpH0rXa93kl+C
         C+u1+bg3/zzfRPXKIesida/Ql0VCJ5AKguM6uSTCkYimKJPy/wIUOhcWP6Am1zyLzP/6
         rxNbmemm9CRPV+cMhwxkkFOt2me9plbb2jCX6b4v3E2cTJt0qpdnvdNaVzmfejY7o7YR
         ZXPppy7T9wzNfTaWlh0KyuDrGBe9boVIZ67c2CrLNPEG+b4Bgaf7xVIK0arJB6LartlB
         w4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382249; x=1718987049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqVF7q4lvJozPubshiqMpT2VHbao70PEnYzL/muuYWc=;
        b=Ji+P9/QQKORAjYLX3CQVlXszYyVcf+Wr6vdHI7Pl4pk77Ib5hW2SK9y0tvHUZkcRGg
         AMSF8N2C45u0nGjGn/osONz+n+vxuk1P2THO1ZVWZrrnac3o30iHR3YV0zIjO6oKVCJ0
         Xjixp3NVDi7HA+QcgM8naH5ue/DS1Jml9mzfJ0wDiQU8G51vNi0S36lLxkVIe3SNoujg
         h5rOXlfTxgPC9KgHip79fY4p1V80o4yTcitrQbmy4e8cuth8PDIEWrH0PLegl5E4l1V4
         fa5o7i723pka8TMgVn8FTIab3Tzc7njQRhy5s4t1U5WOmLZNnnY3BLTx0NoeoG4xPpyY
         0xFQ==
X-Gm-Message-State: AOJu0YzPgTvsxB++mHUzLDwLfJfv5kIKuLvM4nNQzaePmTWY10Dpjn0G
	8TngmT3t9vUdidbpMB46eyVVc0+EL2L81NdIgXSX0FLRlgRSaOXq1e2dwJ1mKUg=
X-Google-Smtp-Source: 
 AGHT+IFYnaf+5rgZ/sPcEHKeTUBhGa2azbnMx/BRcFPt7SXvume6qlcEccJaQcz/vaaoWoci1eBpqQ==
X-Received: by 2002:adf:f60f:0:b0:35f:fa2:3e81 with SMTP id
 ffacd0b85a97d-3607a788b79mr2258337f8f.63.1718382248812;
        Fri, 14 Jun 2024 09:24:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36074e0e5adsm4931165f8f.0.2024.06.14.09.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:24:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 14 Jun 2024 18:24:01 +0200
Subject: [PATCH RFC 1/3] ASoC: dt-bindings: amlogic,axg-sound-card:
 document clocks and clock-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-1-9f57d9e01834@linaro.org>
References: 
 <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org>
In-Reply-To: 
 <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rLr1JBmyf4h8ZfpUwJNjeawg01+mTkoSSeFi6OYtlE4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmbG6lCW1GD+c0W2D0RrxQxor4he3SKfOwZ9JUq1nF
 DUdxVXeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmxupQAKCRB33NvayMhJ0fruEA
 DFKaDVhm7fVnRtNa7JkVplIkxqGF3hliySL3tbgXY+vz/HCL4fngWPHV976mpGon3TfA5W+EysGlla
 nw5NDStdSWFSTjcHLnOc6ax8XkQNPH0zoXPL93wiC0zhxr122GCvP+1EBeMUpBZmSAMKJKwiuUVASd
 RPWI71tJnoDH8W3SVzNktQ8NiRwKME13v8TTjsdmtgRR+w/vH3ia8MpcZpeQDMknfz8iYTlvhtgRIj
 DIS41nwxGxHdBQaZoomdcnIsJ7Ep79AUurh9Ef0bbEzNixGtNTr+D4pAJp4OvVAwVC5Z+fYKICgUD+
 7bAcLO9uexscPpdyq7swOjyG7JNeshoFZPYrpUuYeFBSYJ+Mh5gftd969ZuopkWTgO0klX1j8GKkTS
 l85hXiWFO78C/oKzGQYQZuYKucBLmCH436zbv7HmOYqml1H9jwYuAGh2w9EMRHdu482t1lNXWy/2QN
 Q1SQ2L0Mq2gsXfDdE2Lcpn3GFPo0i5fU71KbthJSX1pxx/snCDyteRFDNdD5kPjvxgO5I00Gs0v1Ty
 NeUhnY9GKWpW+uZnrc497yhY24lNEyjqW768Ydg1b3IdFP1Dzq/R2hynSXb8CPLYc6dZDpNaaZTjsz
 MrAGh0hnHcLVd7DQ6b7X9fn1zk3ngFzeTY/jx+96G0XVQea3sxULd/8/8W2A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: 3UL2TTA3OUING267CGNPWWTD3K6QRHZT
X-Message-ID-Hash: 3UL2TTA3OUING267CGNPWWTD3K6QRHZT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UL2TTA3OUING267CGNPWWTD3K6QRHZT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The sound card design is based on 3 reference PLL frequencies that
are the root of all clock rates calculations.

Today, those 3 frequencies are specified in DT via assigned-clocks,
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
 .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
index 5db718e4d0e7..676ff2731b86 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
@@ -26,6 +26,18 @@ properties:
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
 
+  clocks:
+    maxItems: 3
+    description:
+      Base PLL clocks of audio susbsytem, used to configure base clock
+      frequencies for different audio use-cases.
+
+  clock-names:
+    items:
+      - const: mpll0
+      - const: mpll1
+      - const: mpll2
+
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object

-- 
2.34.1

