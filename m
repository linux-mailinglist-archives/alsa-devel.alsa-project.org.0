Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1086B4050
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 14:23:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78A0917E9;
	Fri, 10 Mar 2023 14:22:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78A0917E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678454613;
	bh=+xhJypxnoSALY1LlpSFIC7c7YEa9oqtmJm2ooI+KlWk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=M5p1beBX4zhLgKTbA+YAZBaYEWi9G1A802tsswr9WPvgp+fJye+s4B8rbpMJ4C6XM
	 F529aOSUjFBQ6xwLm3anUAtaNVoOUwXHcsvK+8gJZD7Yfy64JgxYma0rAY9yQSbdm4
	 ttA3UwWzKRdnpPWOvVu2qDH7YQ2H75tP+rRlMZ3w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D75C0F80482;
	Fri, 10 Mar 2023 14:22:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4956F80482; Fri, 10 Mar 2023 14:22:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D7B1F8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 14:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D7B1F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZUTkGCW3
Received: by mail-ed1-x52b.google.com with SMTP id j11so20363848edq.4
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 05:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678454524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5T8f82bUHjqZUCty2l1r+11I08uBphsz2e1x3k1UV0=;
        b=ZUTkGCW33X1K/tCGdzAxxLxfv00/g/6rmybU7DtTJStp08qmKi2SxtwB1gsNK6YkQz
         CNvEK8w926oxIV6hH/eREA9AcURYcCiNQjL1vf7hLATC4HPBxPMdYNJlkh6GCEAr3PYo
         WKlIW92zw5ZrfuU9110nSdts3IWyuYpluNf6Xdb2JwuHM17ItMte885aja6p/+C6RP5Q
         wovOKc/7i5FJ5ykd3HAndnl82TqJ0fGZ4SuhnQz4/rNRhYzMERKIc2nY0kgQcUDWz0zt
         nwz+kS+fNDMbQMm0OYoZgwbSnApcV7lJYIMYNiUwN+wIKX4OAEtkzBbb84SXLdoAKxXP
         0yyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678454524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5T8f82bUHjqZUCty2l1r+11I08uBphsz2e1x3k1UV0=;
        b=4Uqp/ESXtG3aaMGhCQqFb4x6MYH9U3nPKIJLer4UHBwWINDCjRMtrZ1wG2syorlqg6
         oTaD46BkVRQYfvgp2OG8KUhMoyQ7ri8QjfQzAclgSjqJj5lx3eC37dIguzEknGg8rTnX
         vJsxMpQfRaiJl9GckA2ZIFLw3HKQilnuwWXHbUtwOCDikQDUyy7t78asCwS7nKmYACDv
         vungG5aRIDYM+rmtaoLiFfbPUxvJ6cA2uGrseyQYYueESlAfzwwaAHhQY5D4/5kFWg/9
         WRNXp45F0sBqWeJjo3M9xDyqpA59/k0FnFoP+jbDQdzQS7e+mOsipcv/SlB8mvmSPFIQ
         ZOlg==
X-Gm-Message-State: AO0yUKWwusql6+4Ne+6S9RIYhqgPfgsO6RAkiscK3HAeySUsI+10mnuR
	IHhbdBe7UJdV0oW4NcG4cGSwew==
X-Google-Smtp-Source: 
 AK7set9GlyPV0rFLe1f2eiN1gBQ5GV1AdTOmGeTJjZwFIvAIXSn1ibLseUzeiuavtJXID8UiFUym8w==
X-Received: by 2002:a17:906:a4b:b0:88a:cbd1:e663 with SMTP id
 x11-20020a1709060a4b00b0088acbd1e663mr22727203ejf.6.1678454524129;
        Fri, 10 Mar 2023 05:22:04 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id
 zc4-20020a170906988400b008b17879ec95sm959124ejb.22.2023.03.10.05.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:22:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] ASoC: add audio digital codecs for Qualcomm SM8550
Date: Fri, 10 Mar 2023 14:21:52 +0100
Message-Id: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2CF7BZJCI2KRHW5QP2TAQ5UWZ2BXPSP5
X-Message-ID-Hash: 2CF7BZJCI2KRHW5QP2TAQ5UWZ2BXPSP5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CF7BZJCI2KRHW5QP2TAQ5UWZ2BXPSP5/>
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
 sound/soc/codecs/lpass-rx-macro.c             | 39 +++++++--
 sound/soc/codecs/lpass-tx-macro.c             | 38 +++++++--
 sound/soc/codecs/lpass-wsa-macro.c            | 38 +++++++--
 7 files changed, 256 insertions(+), 57 deletions(-)

-- 
2.34.1

