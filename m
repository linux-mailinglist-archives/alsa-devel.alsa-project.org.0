Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E608A85FE34
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 17:38:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D171847;
	Thu, 22 Feb 2024 17:38:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D171847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708619893;
	bh=7TaWjSMnr9SyJaL1rSnUq6UVe3SDZbweU+CU/JSE12o=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=p1xqusclmiwstS6eLiFS7t8JnvIUklDhetjH0PDQCGKY90xtxfJe15lwgXBnzreD7
	 mD6la12kNrFZmyPuL0GD/BxE4JOac0ZANPni3ZwdIWef/jsvO44BZ4pBGG7WRg4yEy
	 ZB8Pw/wZBQsfkCmDPUZaru/2kAY1iI2gGKF1OMk8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F390BF805AF; Thu, 22 Feb 2024 17:37:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BE1BF80579;
	Thu, 22 Feb 2024 17:37:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C41DEF80496; Thu, 22 Feb 2024 17:37:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16577F800ED
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 17:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16577F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ig403MHg
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-563f675be29so8267621a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 22 Feb 2024 08:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708619848; x=1709224648;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ythAlB5fOuduCOWoNXa4hv2/pnJOcPq8G9cfPzDgUoI=;
        b=Ig403MHg15h/iVEtyVDpgSD9IBcC2VkCG2IyEu5B1enzEvyXJNmnC3XegE0rWsZid/
         smDgjwYRWP4Bghcfk+7JVJPWz2jnpw4dW+i4Gwpoo4E9QVMky8j6Iht+nepuelAU0YuQ
         kpR5DlmJSOLhktA1rcjiLOpCw6Fg0Cskj73OdMJSxsGAfc41T47T+ID/53vUX1YROTae
         033CkVvyREu4c93K7rbxAaer66SHOhX4YV/eA4xC4E8DewHgmQVH2AEBWPBh39rrFdWJ
         JCd3KBws7g7KUQj5C1Ccid2GYzyJaJ3bSG5W2hmpjRTuyOOxDC5CrRhLX7GfWi01aGI6
         CDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708619848; x=1709224648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ythAlB5fOuduCOWoNXa4hv2/pnJOcPq8G9cfPzDgUoI=;
        b=JBx2sqCmAY/WHUzq4z8JBop3JPXsKXwmQbSB1+5UqBIuUEO2+D5Myn29WMSVl/xS6d
         9sdyjx/9UQZr/5krcwUvi4Lq5bJiRQladbjMQzpcYfYCL826pmfNqjAv8UKOVtOy28OZ
         BP/EWTQHkUphZtkl9T8C9ovDSjjdXTY9ggUB2FYTGcp9OYIiYTkpcMh6vn/6i9DBIxaP
         esDKRJXhwu3sGZ0FYzNBkjiPblrYExGtZyi6PjT9tDm2DI+/peYRtAb4BP5xpjdvE+X1
         hMFKlIUutIBDWgahsThg/jvD3xEOAasB9sxTAjEoefa7SgcvPQq1OhK/B51mkkgBzbVi
         iUCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzQe2E/6by34fsniRcH9vG5CW1kgC4Qe8fGMRa5R8pjMrIob1yF3i+YN7XWLeD4G6DoT2Y63a84TIUu8qrTl1Fz41rwUTzzBBM5OI=
X-Gm-Message-State: AOJu0YwnofFYnB0T6FSobprfSM94zJ2ABlwlIM/d8KsLSt8kIkazSb72
	vl8Enhv8CMOkKkfsLfbw3n1HccHgnYHAx9joDUaeFQeRVjU3ifGvNeZpOc+QJIM=
X-Google-Smtp-Source: 
 AGHT+IEDqRBn3wWYrrFcXKIOrpL73QXc+7HDhyj6TIw4Ua/8t6GPiVQ6GsEbJRHzFBalKuA1vFJmwg==
X-Received: by 2002:a05:6402:5246:b0:565:2183:d296 with SMTP id
 t6-20020a056402524600b005652183d296mr2969008edd.27.1708619847900;
        Thu, 22 Feb 2024 08:37:27 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id
 u19-20020aa7d993000000b005653c441a20sm614191eds.34.2024.02.22.08.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 08:37:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH usb next] ASoC: Revert "ASoC: dt-bindings: Update example for
 enabling USB offload on SM8250"
Date: Thu, 22 Feb 2024 17:32:04 +0100
Message-Id: <20240222163204.65468-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EYX6NZCSIQVBFR4ZQ2SBHUFGUWULO2YT
X-Message-ID-Hash: EYX6NZCSIQVBFR4ZQ2SBHUFGUWULO2YT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EYX6NZCSIQVBFR4ZQ2SBHUFGUWULO2YT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This reverts commit a9c83252bff616cf3a38d55b7c6a6ad63667f2dd from USB
tree, because it depends on other DT bindings changes which were not
applied.  This commit alone causes dt_binding_check failures:

  Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:97.44-45 syntax error

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Greg,

Please take this revert. Original commit should go via Mark's ASoC.
---
 .../devicetree/bindings/sound/qcom,sm8250.yaml    | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 49e4f5bbe9dd..2ab6871e89e5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -227,21 +227,6 @@ examples:
                 sound-dai = <&vamacro 0>;
             };
         };
-
-        usb-dai-link {
-            link-name = "USB Playback";
-            cpu {
-                sound-dai = <&q6afedai USB_RX>;
-            };
-
-            codec {
-                sound-dai = <&usbdai USB_RX>;
-            };
-
-            platform {
-                sound-dai = <&q6routing>;
-            };
-        };
     };
 
   - |
-- 
2.34.1

