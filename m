Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 508DA387B5D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 16:39:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C20C516ED;
	Tue, 18 May 2021 16:38:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C20C516ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621348777;
	bh=HloZHh0gvo6W66DAE61+wcndNU4y1U4wXFtKtKsv2ms=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aTyIGjyRBE5raDmwEKV6ya6jUMqaWPFeJX3abrcpICSIBbssVgu4BL73AHoNwSn4m
	 T6ZJeQN09ys22PVpccWSyHSlUCQmm3XRTlg4p/tnKOwBcqhX63vcJ2udePZFzojNtj
	 3KWDx23anXZV+22qex3KWX8Tss7/2tnIaH90PGHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 397ACF80229;
	Tue, 18 May 2021 16:38:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B540CF80217; Tue, 18 May 2021 16:38:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 560BBF8014C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 16:38:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 560BBF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="U9PbCXaP"
Received: by mail-wm1-x32d.google.com with SMTP id u133so5567726wmg.1
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 07:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mE2MENBP8OHhxc2QEqxv5MmkAUk1hcdbV87e9Jg3ziM=;
 b=U9PbCXaPBtKPTQBynkPy5/aESRYE6eNapGtHSu4pYxv5aULFyUWY8AZ7qWFQD5qo/V
 zsGgfz7GoOzcnSB2BS7+2KbhyE5aYi6soJGsGlERG4kfNjJ5RX65tOY2NFJOXxcOepDW
 vsQdpv5l5zcL1HISRFIMmvGlJLIDYvYyzWxS8lR//PgOqdrNpTmJ2aJD75uDfYLxEv34
 9V8wQU5F5jdI3bF9wp0PBJv9yYj7UUGz1/ClQphuMqXbDFNOG02quhAvF7DwbHfFd59l
 0KP7V+vJf53X0ORg7zSz9nIjY2Jq4zy6wJ6sJ6Nh4Bj/pQ1E/qfACEnHVQ8af7XzloFW
 k2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mE2MENBP8OHhxc2QEqxv5MmkAUk1hcdbV87e9Jg3ziM=;
 b=qm+ZwHAfZYljnqqp+tESe5Vz4pfKoUwgoFUwcZij2c4B0MoMcEKW19+eEp74wuXHie
 PMzhELgGG3xp9zGX5HKjOgHHfiX3okw6AzIu4hspD2l/rOnz9yIshWuOdVsgAb3BliiG
 omzdX3znhMW641EAg1W0YRCGVcfP+A6D1sVbaVoEuS5yJN5hkODcVEyR97tDRUNVe4/W
 ziG9VuaimpNqjSpg/OMmLoXJj1YyhD9W+6WCDvs/kqp50BRi0JrktCB0Fsoo93cDhc4W
 Cpj9R7RtApm2n7XiBHJQP85ySMKrD/Zhpuv4QD1+KiAsKrNR9ERl/krrFPYH/flz8Dwe
 qwAw==
X-Gm-Message-State: AOAM531nQbEpatPZleYu+FtIHer9PR2r2ACU0LW9xaXuaee84rYyOEtL
 DEPJSJZfqVJ+2Qb9zUgjciq+mQ==
X-Google-Smtp-Source: ABdhPJwhaavdxdJD/EGbuei1v8exFvlpDGMlyeRZHP/pamSqgThe6zrK9mpkaG17vL5EeKmg/5ebtw==
X-Received: by 2002:a1c:b384:: with SMTP id c126mr5889386wmf.110.1621348684125; 
 Tue, 18 May 2021 07:38:04 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m6sm21329087wrp.29.2021.05.18.07.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 07:38:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v6 0/9] ASoC: codecs: add wcd938x support
Date: Tue, 18 May 2021 15:37:50 +0100
Message-Id: <20210518143759.16837-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

This patchset adds support for Qualcomm WCD938X codec.

Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
connected over SoundWire. This device has two SoundWire devices, RX and
TX respectively supporting 4 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
7 x TX diff inputs, 8 DMICs and MBHC.

Eventhough this device has two SoundWire devices, only tx device has
access to main codec Control/Status Registers!

For codec driver to be functional it would need both tx and rx Soundwire devices
to be up and this is taken care by using device component framework and device-links
are used to ensure proper pm dependencies. Ex tx does not enter suspend
before rx or codec is suspended.

This patchset along with other SoundWire patches on the list
have been tested on SM8250 MTP device.

Thanks,
srini

Changes since v5:
	- removed ref in qcom,mbhc-buttons-vthreshold-microvolt bindings
	 to fix dt_bindings_check warning


Srinivas Kandagatla (9):
  ASoC: dt-bindings: wcd938x: add bindings for wcd938x
  ASoC: codecs: wcd-clsh: add new version support
  ASoC: codecs: wcd938x: add basic driver
  ASoC: dt-bindings: wcd938x-sdw: add bindings for wcd938x-sdw
  ASoC: codecs: wcd938x-sdw: add SoundWire driver
  ASoC: codecs: wcd938x: add basic controls
  ASoC: codecs: wcd938x: add playback dapm widgets
  ASoC: codecs: wcd938x: add capture dapm widgets
  ASoC: codecs: wcd938x: add audio routing

 .../bindings/sound/qcom,wcd938x-sdw.yaml      |   70 +
 .../bindings/sound/qcom,wcd938x.yaml          |  148 +
 sound/soc/codecs/Kconfig                      |   13 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/wcd-clsh-v2.c                |  348 +-
 sound/soc/codecs/wcd-clsh-v2.h                |   16 +
 sound/soc/codecs/wcd938x-sdw.c                |  298 ++
 sound/soc/codecs/wcd938x.c                    | 3753 +++++++++++++++++
 sound/soc/codecs/wcd938x.h                    |  705 ++++
 9 files changed, 5345 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
 create mode 100644 sound/soc/codecs/wcd938x-sdw.c
 create mode 100644 sound/soc/codecs/wcd938x.c
 create mode 100644 sound/soc/codecs/wcd938x.h

-- 
2.21.0

