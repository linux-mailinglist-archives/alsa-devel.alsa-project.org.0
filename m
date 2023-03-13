Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 831216B70BF
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 09:00:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAA781487;
	Mon, 13 Mar 2023 08:59:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAA781487
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678694433;
	bh=qB8+hwKpzDjVyfolUS5cuUBCKcKsijov7CmdZ1GrjF4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AxuY+793CO0f5IK0GUb503biUE03X8FJE5gH1NdJkOMuaiQMdGnpDvYrWx3yB9hZ8
	 PtlSdnoWwXB+bVX1cqmKPGGDy7AkcIM1v8e2bb8/wGoQcsEttOMbFkSG47LZ9C+lNY
	 UsQkw7yX9L3eB4hEpBx6n+xhF54EvRz5N3VyLRzs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 331F0F8032D;
	Mon, 13 Mar 2023 08:58:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 511F5F80423; Mon, 13 Mar 2023 08:58:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 028ECF8032D
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 08:55:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 028ECF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YUygzuoI
Received: by mail-ed1-x533.google.com with SMTP id y4so15463648edo.2
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Mar 2023 00:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678694155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8w5VDTJefrQL5CEvASX0IO0ZHVw+Up+XulFlBqPg140=;
        b=YUygzuoIl4+mbnorOoZwcJlNJ+waXHrYMKZbIO0F6cxQQrwUtL52vInbWoa4DeKkzz
         MCCHMaKBB0UjSzrD7dMv/ycuiulPFJwL9+CYikog06VBb1kfGN+BpXJan/DII5uKiedc
         5hQmRVV10AyxQR3E6OCGKHPwlf8GPKwXDMHaFDN1Tb7TbXNKCx7NVdw8Du6XP/OL6Qum
         JPR7g3ciRMWRbQHFsYnppXbCeWLkFtp8EVbMe8Bp85KtlaiBC8XmOYcH4XmPF/uT5sqe
         2EFxkktp+I15IDTivhbj/ZAYQC+VCR3Vm0o3hd2m99scYjElkceDNbHbfo+Jg42gwZob
         6ENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678694155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8w5VDTJefrQL5CEvASX0IO0ZHVw+Up+XulFlBqPg140=;
        b=i1+7gMt4DdjEBZbQiKutUM0Lik/8sSXnZuvNxUsznU3Fu6n34OTo7pvlUMyx2vat5M
         kzjFJiIBx//FcWM4ZfQN1ZPulOoYtxM7lEPL38Qzh0JWi6RDKvu6s6Rtr1onLkgXs+pr
         ra/EUjPX1H3Nmb51BfgC/we7cjSVamSLMT5hWpx3jgBP6QXZZV1Vo0X4O1ZxxRoDaYpM
         zLDlp43bKBMpU3bP2ahG2EKW8E3o/RlqTU+ZflFSOvsgkQJ8HxnYbXxnjvTo2hU1zP3l
         1Xo+w4b+AIxbPcUid/9KnEu5g2gx4ezla13G58t0sCAH4r8dLIPxH36KYjHG4iJ8yHK+
         DmHw==
X-Gm-Message-State: AO0yUKUKrjPO32RK4D3RNq0NlPlrbgJ89vuJVOnh4GK6tqm/nnMOOZgp
	Z1XqH5rlzpQSofGVg3pB+Ry2NQ==
X-Google-Smtp-Source: 
 AK7set8CeifPZKO2i7zODdjAgScxJot/p0i/tkeosN0wjbuu/cqMnyxmXc2u3iHqpoMP42NXB7HECw==
X-Received: by 2002:a17:906:9c84:b0:877:8ae7:2e44 with SMTP id
 fj4-20020a1709069c8400b008778ae72e44mr42843027ejc.5.1678694155650;
        Mon, 13 Mar 2023 00:55:55 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:f052:f15:3f90:fcb3])
        by smtp.gmail.com with ESMTPSA id
 bg15-20020a170906a04f00b008e09deb6610sm3100113ejb.200.2023.03.13.00.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 00:55:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] ASoC: add audio digital codecs for Qualcomm SM8550
Date: Mon, 13 Mar 2023 08:55:51 +0100
Message-Id: <20230313075551.17290-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J6NHP422FRFLGHG5GEWXXJHIG2JIWCTQ
X-Message-ID-Hash: J6NHP422FRFLGHG5GEWXXJHIG2JIWCTQ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J6NHP422FRFLGHG5GEWXXJHIG2JIWCTQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Dependencies
============
For va-macro bindings:
https://lore.kernel.org/r/20221118071849.25506-2-srinivas.kandagatla@linaro.org

NOT a dependency
================
The patchset can be applied independently of my previous fix:
https://lore.kernel.org/linux-arm-msm/20230310100937.32485-1-krzysztof.kozlowski@linaro.org/T/#u

Logically, better if they were together, but code will work fine other way.

Changes since v1
================
1. Move the flag define to common header.

Best regards,
Krzysztof

Krzysztof Kozlowski (9):
  ASoC: dt-bindings: qcom,lpass-rx-macro: narrow clocks per variants
  ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8550 RX macro
  ASoC: codecs: lpass-rx-macro: add support for SM8550
  ASoC: dt-bindings: qcom,lpass-tx-macro: narrow clocks per variants
  ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8550 TX macro
  ASoC: codecs: lpass-tx-macro: add support for SM8550
  ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8550 VA macro
  ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8550 WSA macro
  ASoC: codecs: lpass-wsa-macro: add support for SM8550

 .../bindings/sound/qcom,lpass-rx-macro.yaml   | 76 +++++++++++++----
 .../bindings/sound/qcom,lpass-tx-macro.yaml   | 81 +++++++++++++++----
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 18 +++++
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 23 +++++-
 sound/soc/codecs/lpass-macro-common.h         |  3 +
 sound/soc/codecs/lpass-rx-macro.c             | 36 +++++++--
 sound/soc/codecs/lpass-tx-macro.c             | 35 ++++++--
 sound/soc/codecs/lpass-wsa-macro.c            | 37 +++++++--
 8 files changed, 252 insertions(+), 57 deletions(-)

-- 
2.34.1

