Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4B4E8703
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 12:30:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F26172223;
	Tue, 29 Oct 2019 12:29:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F26172223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572348643;
	bh=JV6iQLtlpBiA2x1UY2cWF3mS9XMf/JGiabCGCmFmVYc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cjru9Mkjy+PFv9iiPW8D7k8PylmyX20XoaH3gEYFEDvMqnGvLaSP7gk6JgpNf0Kow
	 6IRArooOQmtj44+9m8XDumlW3oPqxK5szshirQ8Y1kXkSLc180bOt5gtbdCDoF0d4Q
	 xAD4wGyeDajOsSCKW8WyVZAZlb9AHcTwQGZWjkuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E21C9F803D7;
	Tue, 29 Oct 2019 12:28:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81EFDF803CF; Tue, 29 Oct 2019 12:28:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFA2FF800E7
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 12:28:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFA2FF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hgqZKdfC"
Received: by mail-wr1-x441.google.com with SMTP id a11so13210879wra.6
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 04:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8IfX0jQOtqDn2pCZaOvwF7GcoFk09fED5oporBC3z5U=;
 b=hgqZKdfCfJnFj64xw3rXV3VPEK6d30/74W69Yz65m7g+kcAqJDHvB87K3T3uaOzxdG
 gDZMXPaHvF023TiCfdStdHxb59TDTlRirgQZCPVLF7e4Sq24i/aoB6trORieuPmale8m
 4H5agAOoNs10bZaFM+1LWvTScfQOQdVGEeHSKlbz1XFHUB42UXM10+8WtH1MCpJ4zajW
 z14D1/7i8aPEvwd8jvt6XlVu9U14gCyk/J8s0iS6GmyyTFJX96AQ5reclNp10Ie3hrsb
 g6sje56OCtVCgIX1MfM/wLcb/p9eZincHg4Nxes1s2mDThkK8LhqjuM2aoG+QAuaS/C3
 CrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8IfX0jQOtqDn2pCZaOvwF7GcoFk09fED5oporBC3z5U=;
 b=hsxtJwxh4tKxZ4EXVrj/AFmrbUOYJo0njyLOchgyLzkWAXrU8s1MohnaYpXUQTdJtd
 +I44zyK25zMssGOABP0yISQuGGzU9FqUzGw+Qxhg8ubKyHwu6eadUe4xcP0FYDy4Go0N
 IF5i91SKtzr94TRl6Cok17AHx5QAI3ydMCpbsIbzupuzluwyIPSNnAMPAzv3zeiRgHb9
 /ac8Hhk+d8kNY8nXUvScZjfSlIqg3im8BC5S/bHL6jhuzw4W0iSUo6gbxAuri0UESbFc
 wo5PU2hGDFf2lkswE1uxynIrUrXY8iQhUIZ2UgJYV+2S3LzRB3wRaYAnkn1pSy1AlpH4
 zQOQ==
X-Gm-Message-State: APjAAAUfhPJkVaDbrTP7Ejb/I/Np/YkSwQoZZgbu6wEprs6++YfmpEST
 Nxeg2LYMiFs5ou5rnO67X0dx3g==
X-Google-Smtp-Source: APXvYqxX7UvGklw4BukJiiU81RExjsPkGX9S1gah8yPCTcdMvKCN/bvu59A8jbhXzGu0JHLxw6LDnQ==
X-Received: by 2002:adf:ea50:: with SMTP id j16mr18810399wrn.295.1572348530671; 
 Tue, 29 Oct 2019 04:28:50 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id f20sm2373247wmb.6.2019.10.29.04.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 04:28:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
 linus.walleij@linaro.org
Date: Tue, 29 Oct 2019 11:26:49 +0000
Message-Id: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v3 00/11] ASoC: Add support to WCD9340/WCD9341
	codec
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

This patchset adds support to Qualcomm WCD9340/WCD9341 Codec which
is a standalone Hi-Fi audio codec IC.
This codec supports both I2S/I2C and SLIMbus audio interfaces.
On slimbus interface it supports two data lanes; 16 Tx ports
and 8 Rx ports. It has Five DACs and seven dedicated interpolators,
Multibutton headset control (MBHC), Active noise cancellation,
Sidetone paths, MAD (mic activity detection) and codec processing engine.
It supports Class-H differential earpiece out and stereo single
ended headphones out.

This codec also has integrated SoundWire controller.
Patchset for this is already sent for review at
https://patchwork.kernel.org/cover/11185769/
    
This patchset has been tested on SDM845 based DragonBoard DB845c and
Lenovo Yoga C630 laptop with WSA881x smart speaker amplifiers via
soundwire and 4 DMICs.

Pin Controller patch does not have any link dependency, it can go by its own.

Most of the code in this driver is rework of Qualcomm downstream drivers
used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.

If anyone is interested to try, here are working set of patches on top of rc3.
https://git.linaro.org/people/srinivas.kandagatla/linux.git/log/?h=audio/v5.4-rc5-YOGA-C630
alsa ucm files:
https://git.linaro.org/people/srinivas.kandagatla/alsa-lib.git/log/?h=DB845c

Thanks,
srini

Changes since v2:
- Updated mfd driver as suggested by Lee.
- Updated bindings as suggested by Rob.
- Addressed various comments by Cezary Rojewski
- Cleaned up code a bit.

Srinivas Kandagatla (10):
  ASoC: dt-bindings: add dt bindings for WCD9340/WCD9341 audio codec
  mfd: wcd934x: add support to wcd9340/wcd9341 codec
  ASoC: wcd934x: add support to wcd9340/wcd9341 codec
  ASoC: wcd934x: add basic controls
  ASoC: wcd934x: add playback dapm widgets
  ASoC: wcd934x: add capture dapm widgets
  ASoC: wcd934x: add audio routings
  dt-bindings: pinctrl: qcom-wcd934x: Add bindings for gpio
  ASoC: qcom: dt-bindings: Add compatible for DB845c and Lenovo Yoga
  ASoC: qcom: sdm845: add support to DB845c and Lenovo Yoga

Yeleswarapu Nagaradhesh (1):
  pinctrl: qcom-wcd934x: Add support to wcd934x pinctrl driver.

 .../pinctrl/qcom,wcd934x-pinctrl.yaml         |   52 +
 .../devicetree/bindings/sound/qcom,sdm845.txt |    5 +-
 .../bindings/sound/qcom,wcd934x.yaml          |  162 +
 drivers/mfd/Kconfig                           |   12 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/wcd934x.c                         |  306 +
 drivers/pinctrl/qcom/Kconfig                  |    7 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c   |  365 ++
 include/linux/mfd/wcd934x/registers.h         |  529 ++
 include/linux/mfd/wcd934x/wcd934x.h           |   31 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd934x.c                    | 5084 +++++++++++++++++
 sound/soc/qcom/sdm845.c                       |   86 +-
 15 files changed, 6651 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
 create mode 100644 drivers/mfd/wcd934x.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-wcd934x-gpio.c
 create mode 100644 include/linux/mfd/wcd934x/registers.h
 create mode 100644 include/linux/mfd/wcd934x/wcd934x.h
 create mode 100644 sound/soc/codecs/wcd934x.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
