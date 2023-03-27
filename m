Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3BF6CA5A0
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 15:24:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AF50823;
	Mon, 27 Mar 2023 15:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AF50823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679923451;
	bh=psx29dt3nCpa8f7De58KBdXDOdDW5kkvAJov8nB6ofc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZP0DoM7Jc6KwVu8jUUaVa/iB7k7dtcMKZ8vUV0y8SG7AK0PKKQtfTKOWBihOb72Sp
	 iEPEg/jPDhVsqwSmvjNLf3G2rMFL1o0o2Wm/vf0qUdsJWGJ7WSgvWLwDfhMP16ILaT
	 QhvMmr+fyR36Ju1C6JmkMVA/hEskXTJ7aEWF/5dU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D49DDF80423;
	Mon, 27 Mar 2023 15:23:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 829BBF8053D; Mon, 27 Mar 2023 15:23:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14CAFF800C9
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 15:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14CAFF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fBdz5o8q
Received: by mail-ed1-x531.google.com with SMTP id eh3so36073350edb.11
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679923389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RAzgsxWh6iXA0Nkdpgf/2nCg4Tswo7Jo12F1Nk5UNUo=;
        b=fBdz5o8qi/Khlda5m9/yDdNzXPS0MNmVt/DaVgzii1B2WIVPpnEomjCEobZnn3Skfd
         iUzOZyFrp6PwIRZqxHwuQ2VtOTKVFfEDWL2o+uQ2PqQmOlvvywYXzU61f6ZyswdiIntW
         g9lt1f+YAPywDl4UbdvFIi1H6ONB0/6bgKlExrPL7Idco0A2bNKtE8Qmn7as7GBpYEgh
         DqRhZQN1TGtQGQSfetXAj8fNv1CY3M705cWxv0MSqOy1tGPwyjqBTwpNVldWV4wQt3kD
         D88Q0nVmfqbuZGOkvYHQCK2Gz/D1JS3XpX77uyqXL+brFlcgU4Kz+fvqx5NMfbgJAzIX
         ua7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAzgsxWh6iXA0Nkdpgf/2nCg4Tswo7Jo12F1Nk5UNUo=;
        b=xC+eLmq88XkwhczeHjsNs1rCMQVC+aNdfTttJ1dagR4ZD3cC51n91wMezlzCoU3iRA
         awD4eFBVeWOPCwSsJegPxrP1vxOdVJbKTdym8e2PRMejQX+xeMA5vRx0xUlAsWUgrZpC
         YAR5XT1DaHVnn5DfQpI8oONYFGfmRZmcN/FAgthZLdJ6ZoBQ7GXTOWqVqLm0c0gQZ+M4
         vV/uZ/OzRQ46lVvUi6rkwam/vlevWf9yHJDQ9uPq9+n/C/y9zhnU0/UULEPTXHNxC7mc
         JYbl/WJ28Ox9ErhhbqoxaK5SFvAUvTiN8+ot+AM6MOJ6Lfmz/0NyqYKER4kxvcsZYj89
         QCNQ==
X-Gm-Message-State: AAQBX9dYMO86Hx6H8ci0T2a4uMCVv9hnpxb467wZaZGEEQ+XKe0HaZM6
	GBKAOeBwPs96YkWDw59sk2XY9Q==
X-Google-Smtp-Source: 
 AKy350Yzur9V43SIMdNu02lm0MTMhSQJ9oj2fMsNEnVoo1PNdyeY8nk4vpk1vFV5UUzWcfbhUnR4hQ==
X-Received: by 2002:a17:907:7e8e:b0:932:dae5:2af9 with SMTP id
 qb14-20020a1709077e8e00b00932dae52af9mr15876869ejc.51.1679923389159;
        Mon, 27 Mar 2023 06:23:09 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id
 gy24-20020a170906f25800b00930445428acsm14286814ejb.14.2023.03.27.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:23:08 -0700 (PDT)
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
Subject: [PATCH v3 00/10] ASoC: add audio digital codecs for Qualcomm SM8550
Date: Mon, 27 Mar 2023 15:22:44 +0200
Message-Id: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SO654OMDGPN27QA2XSHVMVGK3M5DPQCW
X-Message-ID-Hash: SO654OMDGPN27QA2XSHVMVGK3M5DPQCW
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SO654OMDGPN27QA2XSHVMVGK3M5DPQCW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

This patchset can be merged as is - no dependencies.

Changes since v2
================
1. Rebase.
2. New patch: ASoC: dt-bindings: qcom,lpass-va-macro: Add missing NPL clock.
3. Add Rb tags.

Changes since v1
================
1. Move the flag define to common header.

NOT a dependency
================
The patchset can be applied independently of my previous fix:
https://lore.kernel.org/linux-arm-msm/20230310100937.32485-1-krzysztof.kozlowski@linaro.org/T/#u

Logically, better if they were together, but code will work fine other way.

Best regards,
Krzysztof

Krzysztof Kozlowski (10):
  ASoC: dt-bindings: qcom,lpass-rx-macro: narrow clocks per variants
  ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8550 RX macro
  ASoC: codecs: lpass-rx-macro: add support for SM8550
  ASoC: dt-bindings: qcom,lpass-tx-macro: narrow clocks per variants
  ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8550 TX macro
  ASoC: codecs: lpass-tx-macro: add support for SM8550
  ASoC: dt-bindings: qcom,lpass-va-macro: Add missing NPL clock
  ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8550 VA macro
  ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8550 WSA macro
  ASoC: codecs: lpass-wsa-macro: add support for SM8550

 .../bindings/sound/qcom,lpass-rx-macro.yaml   | 76 +++++++++++++---
 .../bindings/sound/qcom,lpass-tx-macro.yaml   | 81 +++++++++++++----
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 86 ++++++++++++++++---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 23 ++++-
 sound/soc/codecs/lpass-macro-common.h         |  3 +
 sound/soc/codecs/lpass-rx-macro.c             | 36 ++++++--
 sound/soc/codecs/lpass-tx-macro.c             | 35 ++++++--
 sound/soc/codecs/lpass-wsa-macro.c            | 37 ++++++--
 8 files changed, 309 insertions(+), 68 deletions(-)

-- 
2.34.1

