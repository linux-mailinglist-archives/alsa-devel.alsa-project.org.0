Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F39825B14B2
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 08:36:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A377169C;
	Thu,  8 Sep 2022 08:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A377169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662618960;
	bh=YrtGr+KfSEvHW3AfWKWF2oZgqQ5FtKhcvRjR6R138Oc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZoLhixivTGeukw9ig0X88393O+rQRzANCtKo94VoZ6CDL/uyRl3ofZm0UhpYxtW6S
	 qRl24nuBTigCqlJN3Qmwt4zoT5lTPr8mIYKm3yPfKh60vJMtgdW7i1iM7dA4Ba0qNC
	 BveXUcrGTDGLi9Vh0vcvnaXeGJuQFCoYawUPihdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 468B7F804B3;
	Thu,  8 Sep 2022 08:35:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85BA5F8023B; Thu,  8 Sep 2022 08:34:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3464F8011C
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 08:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3464F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ViX7+BLa"
Received: by mail-wm1-x334.google.com with SMTP id
 z14-20020a7bc7ce000000b003a5db0388a8so1539106wmk.1
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 23:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=tLJi+1w8MGj6nplunwfzLCX3uDNlAZf3MHgDHEZL7Y0=;
 b=ViX7+BLaUNPNjuus8Uy3mY8zMA8xwBvhnAt7lISD+fG1MbEQHdxoQFqE8eWQzmNLSB
 Q18yoMXueyqrFpQaJ+XKhiUlOtv1FTnU+7Gm24QDP1SMd2pqnBoaY8llHZA3T72i6GjS
 9oP5NZdd36MOz74OQDmwHTgMLb458ju+f49bxUTB2lnVuQWS2oF394OGuDd1LF+7eav6
 0/EAM5IU3acuhA+7rXT1G7YsWrma30SUIN7bnrpYpUZaKn/SNM/dd8JvX61eJBCspLLu
 Y8IyH6sSMHvlyj1EtBvzBnnw6mEY9JosZaWiZq1MbklzeprFr+EzHwAiHWoVPX1wAT/X
 8XQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=tLJi+1w8MGj6nplunwfzLCX3uDNlAZf3MHgDHEZL7Y0=;
 b=zcmUSs3uDZr6qP3ZzLNDbZv8/a1wtTW0SKS10bRNWFhuUQc1xyGkoZ56fJAm4+4xpE
 EtfSzG69UANdRHvob4J5t3BrrFvppAdRlDTKuVlAQQEZFdMMDT2tJj+mNk2/nQTtbMQq
 ejHd8Sc0XE+jpL3i79a+m43OKdj0bryTkRsJ/j6I2EzXFbkKMkMcnj2Vv1rHhWprzQuC
 cOZr5kzSqAhhdr5r9HreGaQTBd55JurgaEd2QLeJtpcFrn10Ii0WOJ8b5W7HDevqsup3
 cBbHJob8yMi1C9TFlsli6VilpxSect/wjvofUWzb/7a1Gsa4fPFT1rEmD7jZpLVdC0tP
 ei2A==
X-Gm-Message-State: ACgBeo23IsDKgDJ8CK7NPN4jkScl8YANvBKQLxZsSaZS3X/cHr1nrEHx
 VTMNqLBEffzZF1oitf1vcy4uhg==
X-Google-Smtp-Source: AA6agR6s//9gR1fHhZrBCiqxjpoMfwFUfUsDvdRjpzedhvYN3EZbN7hnJaY5j8CiNI4QI2dCOqI7Cg==
X-Received: by 2002:a05:600c:1c1b:b0:3a5:e6ec:d12f with SMTP id
 j27-20020a05600c1c1b00b003a5e6ecd12fmr1106946wms.2.1662618891588; 
 Wed, 07 Sep 2022 23:34:51 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c4f4300b003a2e92edeccsm1549598wmq.46.2022.09.07.23.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 23:34:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 0/4] ASoC: qcom: add support for sc8280xp machine
Date: Thu,  8 Sep 2022 07:34:44 +0100
Message-Id: <20220908063448.27102-1-srinivas.kandagatla@linaro.org>
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

Changes since v2:
 - put SoundWire specific symbols under IS_ENABLED check as not all
   Qcom plaforms need SoundWire that use common.c

Srinivas Kandagatla (4):
  ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
  ASoC: dt-bindings: qcom,sm8250: add compatibles for sm8450 and sm8250
  ASoC: qcom: sm8250: move some code to common
  ASoC: qcom: add machine driver for sc8280xp

 .../bindings/sound/qcom,sm8250.yaml           |   2 +
 sound/soc/qcom/Kconfig                        |  11 ++
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/common.c                       | 173 +++++++++++++++++-
 sound/soc/qcom/common.h                       |  35 ++++
 sound/soc/qcom/sc8280xp.c                     | 157 ++++++++++++++++
 sound/soc/qcom/sm8250.c                       | 152 +--------------
 7 files changed, 386 insertions(+), 146 deletions(-)
 create mode 100644 sound/soc/qcom/sc8280xp.c

-- 
2.21.0

