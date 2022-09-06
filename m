Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC025AF146
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 18:56:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7219B3E7;
	Tue,  6 Sep 2022 18:55:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7219B3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483380;
	bh=1VHCaQa5efinGElWof/SpT+iLWPPAyyV0A20ZkpWk30=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BmgOrxhBzXETlCc/wjV3L2+INMU7KLe+syV70lFYYUG9U8XAF1mr1m6KqU6tM4UH0
	 MZNoZH8ZnqK7FRCsJ+FN+RHjpoa9Bs+RiyVSXS1JvZo7K1OR5tRTWodC7lxWkeLTbG
	 qah5idhHpsMFiT6TfJuvaNba1nCv4irwTJmH7kb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD858F8024C;
	Tue,  6 Sep 2022 18:55:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F038F8024C; Tue,  6 Sep 2022 18:55:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B47E5F800E9
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 18:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B47E5F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yG4ac7Nd"
Received: by mail-wr1-x435.google.com with SMTP id bz13so12970970wrb.2
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 09:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=p6vQI2CwgE+q6ddXbTpyyYqLEbh2B3crUHEbmjFAgzQ=;
 b=yG4ac7NdpzOkvdjn0uedl98YkeL+kblRoBov5U2pz9lKAau5dkhf76ou+R23zJMsW8
 UsQA31U0Wm+cgwAASCEdxKxiKBh3CwxlUFMeioUUIrW/yuL1IniHDy8lnVEw2Q5uB4Au
 Yah2UFo4zT+7qOYmqWrV3wlcLHNNiuxxaIiWStu1zjIF64lcr8eCY9Mlrm77no/u2act
 GNeGiRPet7hR7egf/7IvAnYzjlzMXZEXV7rO4cb/D924vO4/Zqj7v77XvDP+83kVF+mI
 mgXWDQ9JYm3UJxW4LfDCgOj/WeK+kqiGEqKcwEl+HlfZFcq/O6kNI3qInnTlPHNf6TC5
 Jt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=p6vQI2CwgE+q6ddXbTpyyYqLEbh2B3crUHEbmjFAgzQ=;
 b=hUVUDmLRoIXiQFi1dWuokmtNNZkD4WhfwoffbX+WCUuDDGYmWv1DL5ZaJjS2m9W0xs
 03FHDhciXP9ZEodkCVsHTlPx6XtTkGbr3JiZH0DXGmCdBtFYKkMJ0g6xoQY9S7WgHMm3
 19p271MJCY2jgCxMv+LvdW5yo66nyv4b4/GwhxVqi6cS11MorQ/RVgmNkmrIQkby4pAY
 0UQAML/mdUKMUsTLSd/PQKXTQAlsAdxQkKjQSDGtqclx8sx36NYgn4xa0dIPEAxNspLl
 FikEFDVK97ifDtKIwB/J3d+gvdMRydjLcfoWphab1TlxP+fO+YO2tUxAFOZMycZfTiKP
 IGgA==
X-Gm-Message-State: ACgBeo3nv+OM3kUqJAHz9LMm4KUV8F83kyqNARCJhn+1Y6Hgq9EmTyyG
 bsVpN2C3E8ttv0kz4dIcj6+rlw==
X-Google-Smtp-Source: AA6agR7SSqNb1Einsp+U+Aa89KAMr9g5aD0bxAbu3IfTxJLaIRqidiBl5f7PYr1G726iQGq6SEmb7A==
X-Received: by 2002:a05:6000:18ad:b0:226:f3b4:74f2 with SMTP id
 b13-20020a05600018ad00b00226f3b474f2mr16033776wri.537.1662483314772; 
 Tue, 06 Sep 2022 09:55:14 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 co4-20020a0560000a0400b0021eed2414c9sm13775906wrb.40.2022.09.06.09.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 09:55:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 0/4] ASoC: qcom: add support for sc8280xp machine
Date: Tue,  6 Sep 2022 17:55:04 +0100
Message-Id: <20220906165508.30801-1-srinivas.kandagatla@linaro.org>
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

Changes since v1:
- make all the exported symbol as EXPORT_SYMBOL_GPL


Srinivas Kandagatla (4):
  ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
  ASoC: dt-bindings: qcom,sm8250: add compatibles for sm8450 and sm8250
  ASoC: qcom: sm8250: move some code to common
  ASoC: qcom: add machine driver for sc8280xp

 .../bindings/sound/qcom,sm8250.yaml           |   2 +
 sound/soc/qcom/Kconfig                        |  11 ++
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/common.c                       | 171 +++++++++++++++++-
 sound/soc/qcom/common.h                       |  12 ++
 sound/soc/qcom/sc8280xp.c                     | 157 ++++++++++++++++
 sound/soc/qcom/sm8250.c                       | 152 +---------------
 7 files changed, 361 insertions(+), 146 deletions(-)
 create mode 100644 sound/soc/qcom/sc8280xp.c

-- 
2.21.0

