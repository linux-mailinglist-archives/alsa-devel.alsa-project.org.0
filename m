Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EB75BAE18
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 15:25:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6417118CE;
	Fri, 16 Sep 2022 15:24:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6417118CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663334742;
	bh=lkTYQ/jQg1ksJczi+2+kbd6DghLSLSJ/TZE50nKX0gQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nrVXdFma6bsYEIGSwtGDtgCg1nqfE9q7/MGoPalfQ1ZexP535ZJP4q6IK/1NKZhlo
	 DJniCs+Mvkdn2DnE6px54fZXAM9vlW7UUgdsv1NV2qd3/QB/SMIN/1y1Tn6uOKdUX7
	 ay27n5Rrcvg9Qf2TlenUmn20I0MG+4Ti/8bkagio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0225F80254;
	Fri, 16 Sep 2022 15:24:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EEC7F802BE; Fri, 16 Sep 2022 15:24:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCE0FF800B5
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 15:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCE0FF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HwBbWSmt"
Received: by mail-wm1-x32a.google.com with SMTP id ay36so6517993wmb.0
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 06:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=3jErXpZmn2N6mgsVfkwQqr3XmZwaGr9W2eUR2s6Rv7k=;
 b=HwBbWSmt3GXvafXwR7pCNFr0HqraLlcS0XmTtDtLz+70EXcCn72WtK/x540wb8FBqt
 cOJVl/qw5CoAVbAHOG/D0+4rYF6mhnurrtR55hTi53//PDTvoqCOy1xlucfJTnfpn5cU
 ZdetRcsQfw9xWd8MBy9iNzP2JF3ZJnEmX0H4hfeF7Hwx4Qd+khqzMWWxBlCrBhiKP9mo
 CMRQgmVnu70C0Di5zDGxyhDg8XXU3twmnHsfZZuDqQuI/j2L+d3izFin5X/N+QSp7dzU
 irlJsC0p3O0rFiLRcJg4Dc1iC7iwVfNuu0Q7p3IxOah2f1aNrHLR6C4Gb0MvF9upRwoS
 8N1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=3jErXpZmn2N6mgsVfkwQqr3XmZwaGr9W2eUR2s6Rv7k=;
 b=eXlK2rxpRyoJFZ4dRZCORRE8k0oiNtFH86WBRawQqANVTrVbikdPfX2oz48//ZHt3x
 tdq2QjwmCgCUQpnYOWkBld9x/ec6IonPbayNbPBHUrqpQu37uRRsyjTpczhLLfEFTKd0
 Q+0z2aPfskze5FVa8DARXwZAsskz+4ZiS3v8Cm3HzO+wOPk3ud+EIx8Kbuy7EOeo+m0z
 hm44NtDyqMRv/1AAf+MWprbuWvPeYpd5xov9TnH8GkEPQH7yeZxtiqnMvs1Qp6WWTvFP
 K64cJ6SNCYA2CKmBl+Ukz+InNZ9GjtZnkujXpFFuprPKNaGUHS7SS4rl5UCMJwqfNrC7
 xzwg==
X-Gm-Message-State: ACrzQf2QAPVlGzvyuv2Tj8mpmJunOaOBk9xypxRPteum6Yo3cdWCUzx+
 XTgZC8qxPlMFSkGXdzbY+Y/09Q==
X-Google-Smtp-Source: AMsMyM5a4Z1zj9PjOs0QfWwmr5LxZH9v0dgNZRsQyAohxrH0EEAKzAuWxjG1ePB5MEPEHUOb6lsunA==
X-Received: by 2002:a05:600c:34d2:b0:3b4:a617:f3b9 with SMTP id
 d18-20020a05600c34d200b003b4a617f3b9mr3258246wmq.204.1663334678887; 
 Fri, 16 Sep 2022 06:24:38 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b003a608d69a64sm2387061wmq.21.2022.09.16.06.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 06:24:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v5 0/5] ASoC: qcom: add support for sc8280xp machine
Date: Fri, 16 Sep 2022 14:24:22 +0100
Message-Id: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patchset adds support for SC8280XP SoC machine driver.

First patch moves some of the commonly used code to common from sm8250 machine driver
and the follow on code adds minimal support for sc8280xp.

Currently this driver is only tested with SmartSpeakers and Headset
on Lenovo Thinkpad X13s.

Support for sm8450 is tested and I will post the patches soon.

Thanks,
Srini

Changes since v4:
	- fixed typo in commit log
	- sorted compatible strings before adding new ones.

Srinivas Kandagatla (5):
  ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
  ASoC: dt-bindings: qcom: sort compatible strings
  ASoC: dt-bindings: qcom,sm8250: add compatibles for sm8450 and sm8250
  ASoC: qcom: sm8250: move some code to common
  ASoC: qcom: add machine driver for sc8280xp

 .../bindings/sound/qcom,sm8250.yaml           |   4 +-
 sound/soc/qcom/Kconfig                        |  12 ++
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/common.c                       | 173 +++++++++++++++++-
 sound/soc/qcom/common.h                       |  35 ++++
 sound/soc/qcom/sc8280xp.c                     | 157 ++++++++++++++++
 sound/soc/qcom/sm8250.c                       | 152 +--------------
 7 files changed, 388 insertions(+), 147 deletions(-)
 create mode 100644 sound/soc/qcom/sc8280xp.c

-- 
2.21.0

