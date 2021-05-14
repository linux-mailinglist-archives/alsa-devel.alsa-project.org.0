Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F46F380763
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 12:36:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BD1C177E;
	Fri, 14 May 2021 12:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BD1C177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620988563;
	bh=l1fV3SmIJboDgNcJ8o1TkgCjkn7IUrc94YlsiX7DTIg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n4ZaYjwcfXhx7H8yB68NpQMf6pzOHqMURngHxX9a9rAh34kQ0tKEMjQEiS5eO48bF
	 jEgPhYbm6APLDI3SverNHvYdQbkv6ewfgLWtdO5YAAIJUbyLZZ3B8Cd8Bq3hsV2/XG
	 9rrii7+dipFQrrf1ObDcW1uF1Ejc+n3nYHnO6G0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CC52F80240;
	Fri, 14 May 2021 12:34:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE3F4F8026B; Fri, 14 May 2021 12:34:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67FC8F8013A
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 12:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67FC8F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HCH05kXu"
Received: by mail-wm1-x335.google.com with SMTP id
 o26-20020a1c4d1a0000b0290146e1feccdaso2194172wmh.0
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 03:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxFsMw/ASck33U7Mqk3LoU2yKCnAFtEobb/NZjQDAzg=;
 b=HCH05kXusEupK+2z01YypSWqf1XAM3/UEcHjRE30Rtf9PGVfhguIgLfaHK2R9z3gte
 Bjkpgp4fbKH6FPZp8glUZk5npkxGdPyNBoPBnl0h+spYsdjOYSDS8wny9edEG2zTPkZm
 Jeev3GRTV21oJ8PHJOmh4G1Ejoqv74sGgH2o8432uSGBXy2LN72lnM1PZyhI+0wFhVrI
 NhNSPxK478e70u5q0zLwJQr/yckz9E7xNe9fC4j0cmybJuF9k4nqoLRbgtdM7mtz3dFe
 rL9MU4BTu3j4uBxoJ+lBDSLu7IoDOzJXtYFZo8t4A0eec1+kk4XOCkfV4gcGT+FDa/sF
 BYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxFsMw/ASck33U7Mqk3LoU2yKCnAFtEobb/NZjQDAzg=;
 b=LFFWzolWadX3ACa633kMAE8b918YtsTp9rjSPg3XJzxlUZYIS5DEoUcvb1r8gkQU7a
 io9Tv6kn5Je2RgEBZisohC4HFOpetNogt4mkGIfuGpeBBMDSseCe6SdW/fypBMQgKffO
 m/8yZOvnAr/Egp5iPZxPvRNWLlAvaFfSSqUJH6BCt/Yu9MeMZBoBz47DcqyZEG4j3iB5
 QhlzSHCUWtezRcQ1wI82KuNxtmKCw58FLLyppr44/Zq4Vc+8Ea8h5QVbfoPYzb9jJe3+
 RgfOIMC797G7SfRZwMV4GL2SYfOqLCezSKzi+YOx2IJjmHVAUwZyKPQYbciTRl8nalxk
 jzgg==
X-Gm-Message-State: AOAM532CETq80F+9Qm6uLykas89hBxxzF69wehcgbu3orpzfbzSW+tn3
 DYp3Q9Nkp1L7TJf+AfNN2qM28Q==
X-Google-Smtp-Source: ABdhPJw3PZi7Kk90pacZhiEh2rY6D9unoLQP2qXm9HOpxu03dxLTtfCVZt956NwC36DOpUCB1R1Dvw==
X-Received: by 2002:a05:600c:4150:: with SMTP id
 h16mr9081252wmm.45.1620988469093; 
 Fri, 14 May 2021 03:34:29 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id k16sm5015498wmi.44.2021.05.14.03.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 03:34:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v5 0/9] ASoC: codecs: add wcd938x support
Date: Fri, 14 May 2021 11:33:56 +0100
Message-Id: <20210514103405.29927-1-srinivas.kandagatla@linaro.org>
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

Changes since v4:
	- updated dt-bindings and example as suggested by RobH
	- moved SoundWire specific functions to sdw driver.
	- fixed wrong indentation reported by kernel test robot

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
 .../bindings/sound/qcom,wcd938x.yaml          |  149 +
 sound/soc/codecs/Kconfig                      |   13 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/wcd-clsh-v2.c                |  348 +-
 sound/soc/codecs/wcd-clsh-v2.h                |   16 +
 sound/soc/codecs/wcd938x-sdw.c                |  298 ++
 sound/soc/codecs/wcd938x.c                    | 3753 +++++++++++++++++
 sound/soc/codecs/wcd938x.h                    |  705 ++++
 9 files changed, 5346 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
 create mode 100644 sound/soc/codecs/wcd938x-sdw.c
 create mode 100644 sound/soc/codecs/wcd938x.c
 create mode 100644 sound/soc/codecs/wcd938x.h

-- 
2.21.0

