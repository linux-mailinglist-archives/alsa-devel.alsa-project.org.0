Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C83BB91A5D1
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 13:56:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36B511E93;
	Thu, 27 Jun 2024 13:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36B511E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719489403;
	bh=Y6a+CFWgHPXv6qT5Hp7vM6uhEG/AZf1fZ0Ct7WBiP/4=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R6DmixQEqM/HpRMbchXjJthsZ65F70TtZIEnWYLyjMoEJcsoenwEYcklOyGyB2SO4
	 S69LTEZO/dRUCzTVpDtdygyAn6xPcpVN/517NkOKVScyvftBDv6g3oTKDRvgD5jdf/
	 +Qw2EPkAlgKO9wohucnTCvpW4MI6iJrw6zb/AFZw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D13E0F805A1; Thu, 27 Jun 2024 13:56:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 800D9F805A0;
	Thu, 27 Jun 2024 13:56:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 733C6F804F2; Thu, 27 Jun 2024 13:56:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8BE4F800ED
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 13:55:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8BE4F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KL1Hftbk
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3629c517da9so7481437f8f.2
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 04:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719489359; x=1720094159;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9YnmAO3MDDhvSz55Ee35ZPJLjBLn/4qKkbnLt4Qs0cQ=;
        b=KL1Hftbk91hs8tuvZDrzRiRm9yfeTlUbUsKMTqxy/xTby5dgN3QUPigpdG13YF4TQ3
         Kf9TLGSQjJF4+f1Sdb9YlOWt30Eh0QRpUdWRKI3JvtFBYl/iXb+0RUkjsF3Ey6/FTylO
         YerP/T5+9/A0B8MvJiu21eRMTOEhXSik4io/yo42cDZOtYfKD2mbmFsNttKkC4utpklr
         zaox6E9gpmxpl5aDjb/3a2a9Ix1BSfL/9qYvHL+/BjIYPoL6FZUm3sM2keYL/Cci1V4t
         ePocS3cNo+yKhMFu9JKPJ1pP1KDJcYBQGl82uN0nX1L47smK4Ajl1xQFbocH4vbZVVvT
         RZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489359; x=1720094159;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YnmAO3MDDhvSz55Ee35ZPJLjBLn/4qKkbnLt4Qs0cQ=;
        b=QHaYBcSLTM2DblVclT41BT66oTT8X6j24Gi6NgkWIhPlsdcWpmBrH08RdawMLRn8/C
         qM3Atomx6ZSUY60IpGZeXqM48MAIzBw5fofwSfaptUZYMNbqyowm7ahWWFnlZU6CjeBB
         UsLlO0nuFgiZ2iDa8R2rebUeIZ35qaTGhDHZPnRSfSdArKUj3GajrHPWEpY1OqmKrvol
         2VshNvZGw20KWNVRLJGnuXdqHmMoPzp2iTQ7pOxzZVNb8WVrrq3uyHIYK25S5SWftMhS
         aremrqq7J4kuuUv9B4aM62ToJDi0n/O1z3ex/ZOXZk/YZS2NaH5j/I/PqmnMYA71RdmT
         ddZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG3JHrGOeIdHUdiuVTwosZH8pRUaKVoKlQYAmLeQUH55SiGFIn69E74ktOBIATZNNXKvibb9bv2DJOvrd+v6q6L6R1BL4weah+P3I=
X-Gm-Message-State: AOJu0YxtRb1YplkFhiAP/3EiBAVcVKdbgNbCXXKdy/r2/pd8UB5gvvk8
	AgwuFWnFLXQdsxR5UNT84arrsVc0TGcf+ZXhDyKETcbQjNjnXLQ8fkumWLDnEFo=
X-Google-Smtp-Source: 
 AGHT+IFCcsrDv77XmQBH18HYnTVf9w5zIC4CEAbu4wPpEDmsx0NRwUNfy6dTe2MXhewFcCnLX56l3w==
X-Received: by 2002:a05:6000:4594:b0:362:c7b3:7649 with SMTP id
 ffacd0b85a97d-366e95eaeedmr10169584f8f.56.1719489358695;
        Thu, 27 Jun 2024 04:55:58 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369980asm1597552f8f.80.2024.06.27.04.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:55:58 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
Subject: [PATCH 0/6] ASoC: codecs: wsa88xx: add support for static port
 mapping.
Date: Thu, 27 Jun 2024 12:55:16 +0100
Message-Id: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACRTfWYC/x2NQQ6DMAwEv4J8xlIIKYd+peJgglN8IAkOQkiIv
 zf0ONpZzQWFVbjAu7lA+ZAiKVbo2gb8QvHLKHNlsMY6M9gBc9IdV8rI4WV83xs3O4KqT1QYJ6X
 ol+ew+bRiSIqRz/3Zs3KQ85/6jPf9A60tv1p6AAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=Y6a+CFWgHPXv6qT5Hp7vM6uhEG/AZf1fZ0Ct7WBiP/4=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfVNNbQVTHgiekg0lErk4gt5ZWmMGBmysToq7S
 t48/kIo622JATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn1TTQAKCRB6of1ZxzRV
 N6V/B/9AkRh3hlZAiigVdic/fNvxeVo66fZnqgO/Q8IAgdIpjMxo7qSFqoMZFmordGgniBjUHUS
 kfY3HrEHUV6I6pPpVzVn2AFmv/OXXzHO2qN7UEYWyF4CfTxpjwEVMjMHZTUOOF9l9E8ppfCzjoc
 jc9KYXFGb3TREZx/wLZ+7Q5kMHnhmYnrGZv3Ch7vLjN3dVaZ3OYWOQF71+08qwJrlg5oaflKgwL
 bk1YKD9vzdOO56TkEI5Gycsec2yaWwUmHDsSxW859bUdeUQTLPCxw4+vyRqOMGIuyEP9W615rKM
 UJSgbtUu4Jt296ZnPZS4OVbCgHyU444GWLGHdEbdx3igEKRT
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: FPSV6U3GH64RAI6SIDHK4ZJ3Q6TX3KXE
X-Message-ID-Hash: FPSV6U3GH64RAI6SIDHK4ZJ3Q6TX3KXE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPSV6U3GH64RAI6SIDHK4ZJ3Q6TX3KXE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Existing way of allocating soundwire master ports on Qualcommm platforms is
dynamic, and in linear order starting from 1 to MAX_PORTS.
This will work as long as soundwire device ports are 1:1 mapped
linearly. However on most Qcom SoCs like SM8550, SM8650, x1e80100, these
are NOT mapped in that order.

The result of this is that only one speaker among the pair of speakers
is always silent, With recent changes for WSA codec to support codec
versions and along with these patches we are able to get all speakers
working on these SoCs.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Manikantan R (1):
      ASoC: dt-bindings: wsa883x: Document port mapping property

Srinivas Kandagatla (5):
      ASoC: codecs: wsa883x: parse port-mapping information
      ASoC: dt-bindings: wsa8840: Document port mapping property
      ASoC: codecs: wsa884x: parse port-mapping information
      arm64: dts: x1e80100-crd: fix wsa soundwire port mapping
      arm64: dts: x1e80100-qcp: fix wsa soundwire port mapping

 Documentation/devicetree/bindings/sound/qcom,wsa883x.yaml | 8 ++++++++
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts                 | 4 ++++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                 | 2 ++
 sound/soc/codecs/wsa883x.c                                | 8 ++++++++
 sound/soc/codecs/wsa884x.c                                | 8 ++++++++
 6 files changed, 38 insertions(+)
---
base-commit: 9935be184a55dd84fc3275094f2df095491f6ea1
change-id: 20240626-port-map-ef50c3304d4a

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

