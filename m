Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 329D5386A8
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 10:58:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B36115E4;
	Fri,  7 Jun 2019 10:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B36115E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559897937;
	bh=Mp5A9+a63pa5iXFawwsEXROARZTLzwmL8CJ4Z9Q3QEQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kLXaxkTmBR56AEVV74X/JR6p4wUOCQfwu/bEOupSA4WCfEzFpVEFlSpGolU6XmrLC
	 z6vtuvAI3+VZW3xmifJpwU3Bey1Qi6WCplJJZrD+SSnPEQHeSchOLQXXI8+a/N+JBx
	 vp5N+5JURZ45ETJAOgOQwDnzorOogrYiOhyjHtbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E99B6F896DB;
	Fri,  7 Jun 2019 10:57:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E40D1F896DD; Fri,  7 Jun 2019 10:57:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33B8EF80709
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 10:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33B8EF80709
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UtFYE8HX"
Received: by mail-wm1-x344.google.com with SMTP id a15so1174495wmj.5
 for <alsa-devel@alsa-project.org>; Fri, 07 Jun 2019 01:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6oaxDiNI3V3Y1FcG5gCLYWig+jTKPdpgP/iJOfNbmxQ=;
 b=UtFYE8HXQeDyMoOUEyIiC8jHexlyvpIeLNTRUprfHZT1sLKojwFJIAAQcXaz3MtAVW
 Fk8CHPEf0eKC3aTQBxmsvbwWqHwHK+K5ppaxYz53eJb5SGUiiXgcUUj/Z/ePSsvuifhO
 pDw96ayeUi3yqpur5/U+VIDZGlmLK70TFOTXU+JEbQ3uBvyHbItfjIQagS3TCeh5/Q7J
 cMYanxgK42yIq9X7rbZvUOGbebPci6MBgt+3PM74c1XLBwAubEQU+iVsaLk2kU3iC51d
 BXviQ4+Pkn/vC4vRDZ3LO6aQCjXEtEp4Vd/Db7f696mklhwzUVIB2E7VMSnsSiktCgHd
 /M6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6oaxDiNI3V3Y1FcG5gCLYWig+jTKPdpgP/iJOfNbmxQ=;
 b=ZYuHdZoOVsqpyLQ9slxGes0Uxb6weZUC1Kb8BKip7cy7cNmTuSuPAQxJCX2/1dSdu0
 nWuhxFA81s+jVF0BU9tP8PohaAQxG7LMvCCLfESp4SFdwXoVl86t7MHqcrrXv/MaAnEa
 rntlGVjgHKlyvuwZWJQcSUoSixfwleYsQcuG5T61glnkd72EckToj/a2tA3J+0IuE1y8
 DpWJNWsn2CzmO4BiArnIu32Gu10YbXBiO8kgAosFoldZ1ZDOsWCRQ3JFZ5QPcatcAvmq
 SjsNU0+HDbaVk32wS62uLUptEUwG7qXzOvAHpKr+dm4lo/QpI39Hl1pifWzSxv4pv7VY
 IUnA==
X-Gm-Message-State: APjAAAXZ3Y1+k87GioYGSdVqFOev4iqNd+8ImhfMwKIjyKJegYQrSTo4
 sOSV87dtuzdxHHgCt+fJCNQErA==
X-Google-Smtp-Source: APXvYqwLMDVCNl5uQgvplPXCm62/RRTWw4niXyTJwh05YHHXxpnhloJtxM8sGpE1uyEofQ+ZzKOsGA==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr2642243wmk.99.1559897827098; 
 Fri, 07 Jun 2019 01:57:07 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id d10sm2035308wrh.91.2019.06.07.01.57.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 01:57:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Date: Fri,  7 Jun 2019 09:56:37 +0100
Message-Id: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [RFC PATCH 0/6] soundwire: Add support to Qualcomm
	SoundWire master
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi All, 

This patchset is very first version of Qualcomm SoundWire Master Controller
found in most of Qualcomm SoCs and WCD audio codecs.

This driver along with WCD934x codec and WSA881x Class-D Smart Speaker Amplifier
drivers is on DragonBoard DB845c based of SDM845 SoC.
WCD934x and WSA881x patches will be posted soon.

SoundWire controller on SDM845 is integrated in WCD934x audio codec via
SlimBus interface.

Currently this driver is very minimal and only supports PDM.

Most of the code in this driver is rework of Qualcomm downstream drivers
used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.

TODO:
	Test and add PCM support.

Thanks,
srini

Srinivas Kandagatla (5):
  ASoC: core: add support to snd_soc_dai_get_sdw_stream()
  soundwire: core: define SDW_MAX_PORT
  soundwire: stream: make stream name a const pointer
  dt-bindings: soundwire: add bindings for Qcom controller
  soundwire: qcom: add support for SoundWire controller

Vinod Koul (1):
  soundwire: Add compute_params callback

 .../bindings/soundwire/qcom,swr.txt           |  62 ++
 drivers/soundwire/Kconfig                     |   9 +
 drivers/soundwire/Makefile                    |   4 +
 drivers/soundwire/qcom.c                      | 983 ++++++++++++++++++
 drivers/soundwire/stream.c                    |  11 +-
 include/linux/soundwire/sdw.h                 |   7 +-
 include/sound/soc-dai.h                       |  10 +
 7 files changed, 1083 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,swr.txt
 create mode 100644 drivers/soundwire/qcom.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
