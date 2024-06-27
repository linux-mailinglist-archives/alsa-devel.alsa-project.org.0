Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FE991A985
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 16:45:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3A802110;
	Thu, 27 Jun 2024 16:45:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3A802110
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719499525;
	bh=TUm0RaYqomUaGHfxczMiGxcHyL3VSRfdBI0wiwOJXjs=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Og9T8Q+kPxtLA/oRLvuud5+jDNDX966iD18sZ2Crl5BFx18gi0UUcXrFxgb0QHGfe
	 VImacUfVa1N/q01dK0zF1AjbKTm24kJSkfcHFamuTaJarmA2HWsJAx6CZzl71EFjLb
	 tJgSHpKWBzPwczQ+UtB86yTZNJ3hjm5F8Lj8YXe0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F58BF805AE; Thu, 27 Jun 2024 16:44:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E333F805AF;
	Thu, 27 Jun 2024 16:44:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96D5EF8049C; Thu, 27 Jun 2024 16:44:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71DA8F800ED
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 16:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71DA8F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WaRcO6au
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42565cdf99cso7235995e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 07:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719499482; x=1720104282;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AmLpAWmlJIdMq/VoHVTuZd9JbEM9j0iTEvmVKd3mZ4w=;
        b=WaRcO6aulwIF3jVAJma63jTdhYmBCvK2MC7pFXgNXQ582egMXSM/4RnHZ5VG/Bw+GN
         LJVSGEESOb52s1A/emj9m6p/yFIroFincL9Nxd3Y+bRCpzmIRGSoGBqlRICQ0TF88Kqn
         igWzWGx9LMg96qXiS6dxhBkl3ZBQsULZqbf+SxyP3xmGUQhnHv2MsTB9Bcb0SMatjK/r
         /aFbQK59DrCbOf/guPfmZqkKFSIsxIhpH+WY7nenqnbT626SWmQKOwPXr2baG+FBxGa1
         lQDTV35QGYRoPBmUsv+pGKCspt2vLszPqq7pOxWlbALW4QzYAayRqjhgSx+PsrXqgpBX
         +NRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499482; x=1720104282;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmLpAWmlJIdMq/VoHVTuZd9JbEM9j0iTEvmVKd3mZ4w=;
        b=RQ3iY8B/xA7tId4nSJKJQQrZt7gb61l0sRvkU1vdQX26TjIXKbJpvfyALlitHRFCvg
         DkB4gWxHUbgEuAWmiGmyWMlFtUOcqHM+d+6NUTn//D3DVUsAZrJdtiKfgRNfElPtLP/c
         JEDVNNkGcQdrF9++vQCqOccSnGPJ/+gxqAAVSBYK4zja8UrS2OEs7OsnwFBebhPfZLtg
         hHXZ6TYsJiVpmc0zBKyE4aer3Bjm2cCXYBTOlHaF/Onr01mQcezRD2M0ND0kK43IazdU
         YOxkf+sGsRgF9pyxFWtHVTfkukGbn5KaOQNhtyzIVg8YEtWtHg379vbNjY0bvL87ROFe
         SBbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnmt0gifvDdwGaS4EHNtkdfschSzG0F0l8paz/Vgwg8QzcyjHaLDx2a3zVspvbon7X+TihmBBr60fcwaqSapFDaWpmbhwjpYc/BnQ=
X-Gm-Message-State: AOJu0YwrHBx8755GaocVhYYbTDrqE1EXzo3nqsv7qduR6FgxOgSToHrt
	FeRCGKkyZPfPTYFN8KxRHvhN04iVzJO9zSrjDHY7RIKdUo7NgtYESFRria0N8BI=
X-Google-Smtp-Source: 
 AGHT+IGovERBfpldUSDoy9yj6OyIfZTUPkLDC3sHsnVcAxkg0Vg/RCJP9nojWITLyBFMPwHPCMaAEA==
X-Received: by 2002:a05:600c:460a:b0:425:6976:f5d6 with SMTP id
 5b1f17b1804b1-4256976f94bmr391785e9.33.1719499482639;
        Thu, 27 Jun 2024 07:44:42 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564b7b7c1sm31254075e9.23.2024.06.27.07.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:44:41 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
Subject: [PATCH v2 0/6] ASoC: codecs: wsa88xx: add support for static port
 mapping.
Date: Thu, 27 Jun 2024 15:44:37 +0100
Message-Id: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANV6fWYC/22Nyw6CMBBFf4XM2jG1RURX/odh0ccATaTFKSEYw
 r9bWLs895GzQiL2lOBRrMA0++RjyCBPBdheh47Qu8wghSxFJSscI0846BGpvQqrlChdqSHPjU6
 EhnWw/X742DhgGxkDLdPej0ytXw7Vq8nc+zRF/h7m+bKnfyTzBQUaV9/rm5NGKfl8+6A5niN30
 Gzb9gNqRURKwQAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=TUm0RaYqomUaGHfxczMiGxcHyL3VSRfdBI0wiwOJXjs=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfXrYjFzYED0KcuZ2JaqXktrm4rVyEowwWxnc7
 ZMDozvIgn2JATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn162AAKCRB6of1ZxzRV
 N5JDB/43Bh6z6Gxcpdr+eCHQGR8F/SIcmOhRRJob22JEBqE9fxst1E4BmGL2OWc9anSJ0JiQvkG
 wDIlBGjV1kd2ClZwCkihYlOGZqDyxLdstSPAqpthkcIiPFejtitraxcVTB6sKMsdHRduPfak3qS
 qlE78YAwYpcjAq3tZyO3XkgrsuaJU3CQlZjaxe5lky/jxbnpINsDWMv8ZgyVFZziwHTOw6IQlWP
 blVTM+0Ha5AyruwnFkVODH/aJ0JgMS5n/LcsSVU7qW8mmlC/f9K27eXosEO7HhQcNiAN9LdM8/o
 /VE0NoeMHe8r9saW0v5K8xUmAzVcYdrw/i7xMiAdl4CeMkAJ
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: MMTAYLGNNAWZ7FRXB4Y72SVSF2ECDWQT
X-Message-ID-Hash: MMTAYLGNNAWZ7FRXB4Y72SVSF2ECDWQT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MMTAYLGNNAWZ7FRXB4Y72SVSF2ECDWQT/>
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
Changes in v2:
- used dev_dbg instead of dev_info
- Link to v1: https://lore.kernel.org/r/20240626-port-map-v1-0-bd8987d2b332@linaro.org

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

