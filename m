Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A87A782C3B4
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jan 2024 17:37:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07308E94;
	Fri, 12 Jan 2024 17:37:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07308E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705077464;
	bh=i7un3vONZnr77R7B2m9eLAG2l16u/2NVCWr/W91lMOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r23gNWoxkkXyjBgmkZaukIiutZnqK41tMalTFpWJuVkXXqCZ+dQV7qC07Ge8odAyn
	 25dPdLxMGIqKHkHIcnkmwdTX9NSeIKDLPJ762HVd4xeHcjJqL1qf8XH/llBrHBJETx
	 ejNByhHm7s8sHiaCNbIN0Ee9iMokU3Lns1Scmvwg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78D90F805D8; Fri, 12 Jan 2024 17:36:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4671F805D3;
	Fri, 12 Jan 2024 17:36:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69986F805AD; Fri, 12 Jan 2024 17:36:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E985F80254
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 17:36:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E985F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DRSKRmuu
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e586a62f7so36407835e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 12 Jan 2024 08:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705077386; x=1705682186;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jT3J/E5ihwUzRJFy9hQ6iVDhNFb12f1LhdaU7OTuQXY=;
        b=DRSKRmuuMsd6QKd3mbFjrm+H/OKe5Ru5qjRgPUUtCE1b5h28AA3D9aaGrVMRNpkr4V
         oIRhMc1KIAYLxiTK6amjt9FvC5XPfxVXUP8qRjQhGcGvtgR8ugIahJfSA/S7seE3qNJs
         2lGKIqO5MDw6NVRmGirLQwmTZN5zVV72sGtxTy53K9bAZM0Q8IcCeTbDnV5FnUQeW2hl
         lbQcgq7GnvkSi5SBQGhtmn39ucIZKYPzYIC0dlacrvvqyciPnZF7aoJif7GYZlAcd/Vo
         3e0I+LzbVmE7GEAnRWOI7tLxLpef0+lj+O7MVuecXakMxXNVstXIXqID7mnSZIm2sUi0
         pQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705077386; x=1705682186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jT3J/E5ihwUzRJFy9hQ6iVDhNFb12f1LhdaU7OTuQXY=;
        b=iJmgkKAEnf0Rc/3yk9uhoWkAlkhvlr5R+nJGAlm5KfD4G4LpYmV2BVObZfvZtLRLb3
         V4m2ecOADuuob247H5l/28zSicHnm8g89UwEitgBAWZv6keA6ghb1OOuSbGCU1DopANj
         nhRtfd5L2ftlbTnpVFPo03OGGfjQ5Q2WeRGBhku+kcVndi0e2PNH0Bl0+CSr1JLmQQ9Y
         aPhMs0fgOPrgP2fyKCEAPyov1EUVFrCnQMd0vj1OaVBxmx8hWVUtmJCoywTltBv4wmhp
         C/OhmrthrmjPd7ndMzDEj91mPAPNEd0h9R/eN/5FOvN31RgKQPz9e6gYealRYzFSHVg1
         3Fjw==
X-Gm-Message-State: AOJu0YwJA2uY24sJAY/AwMK5hf39XkP27qYcJcM4RXkKazjecDfFqc7h
	6chUnBBEbx93eG7pB5iq//tSMI87mCEsiRtkRpGSGsViEKw=
X-Google-Smtp-Source: 
 AGHT+IFlMaVngyy4fcefe3Rw09Fi3QjRs3VS/a1z2djmGMgnedmibuNznMaNjRrf8VGdpC8UT7hL8w==
X-Received: by 2002:a05:600c:4505:b0:40e:5534:f6fb with SMTP id
 t5-20020a05600c450500b0040e5534f6fbmr1019053wmo.165.1705077386295;
        Fri, 12 Jan 2024 08:36:26 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id
 bd16-20020a05600c1f1000b0040e5a93ae53sm6573195wmb.22.2024.01.12.08.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 08:36:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v3 3/5] ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for
 shared line
Date: Fri, 12 Jan 2024 17:36:06 +0100
Message-Id: <20240112163608.528453-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SIF535EMHA73BKQ5NYLQSAZ5EZJMXGRJ
X-Message-ID-Hash: SIF535EMHA73BKQ5NYLQSAZ5EZJMXGRJ
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIF535EMHA73BKQ5NYLQSAZ5EZJMXGRJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On newer Qualcomm platforms, like X1E80100-CRD, the WSA884x speakers
share SD_N GPIOs between two speakers, thus a coordinated assertion is
needed.  Linux supports handling shared GPIO lines through "reset-gpios"
property, thus allow specifying either powerdown or reset GPIOs (these
are the same).

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

If previous patches are fine, then this commit is independent and could
be taken via ASoC.
---
 .../devicetree/bindings/sound/qcom,wsa8840.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index d717017b0fdb..22798d22d981 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -28,6 +28,10 @@ properties:
     description: Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  reset-gpios:
+    description: Powerdown/Shutdown line to use (pin SD_N)
+    maxItems: 1
+
   '#sound-dai-cells':
     const: 0
 
@@ -37,11 +41,16 @@ properties:
 required:
   - compatible
   - reg
-  - powerdown-gpios
   - '#sound-dai-cells'
   - vdd-1p8-supply
   - vdd-io-supply
 
+oneOf:
+  - required:
+      - powerdown-gpios
+  - required:
+      - reset-gpios
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

