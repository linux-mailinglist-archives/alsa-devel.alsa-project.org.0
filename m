Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCCF35F829
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 17:50:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 321721670;
	Wed, 14 Apr 2021 17:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 321721670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618415459;
	bh=mYC7esqEY35FETpDpS41DyT79rJCBIGTzoFcSERwUYk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BmHVlysoi/aLL7oLI1HJJkTwOZaBWqPMW6PLtd3k02P0zIHutovP9yiNUBTB7CMTZ
	 Y5Y9SQL2sHjzqE6lf5hBd2UPGTRGfJWIPQu8PN+QQp9XzcBPWocSubA4MQ1n1oOYrX
	 a3oOfZ5kxjwDv+j5roHUcsvFvMeAJO/BENyT48PA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 731FAF8027C;
	Wed, 14 Apr 2021 17:49:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF35FF80271; Wed, 14 Apr 2021 17:49:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02646F800FF
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 17:49:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02646F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ifN3HHo2"
Received: by mail-ej1-x636.google.com with SMTP id l4so32114204ejc.10
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 08:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oMKMWHGSc2AZxOCks5CbacE7do82GypDg6I7ptXCTPw=;
 b=ifN3HHo2uHgUNkNPLNGibyPPNTee0A/WwXZ3W9wiEBTeiCIiHTpqRvDod/xY9JmVQY
 1xtpnno8iG8qU80tUcVP1qHLxU767UFrx2PWjm8w65s4qw0MfeSlRpuLLVtesuesNTHp
 7ovIAr6uksvHBIkCyc2J/+d9WdXNRPT5XZ3SNKUZf6sCm98KSHkRlHjA7lNen9GQL7T5
 pEDuFIuFeYt0UkvfVPYcs40H3OMmd5hWGKhpwkaDFk8Z6oSJfE4S7wdiw+dsoWh7qR/F
 nlcWJFRWnSeLbMp9vsZYX8DmzilLFDxEp+0mx4cas3/qXqPysbHP+QCawNVZ0SwO0uiC
 b0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oMKMWHGSc2AZxOCks5CbacE7do82GypDg6I7ptXCTPw=;
 b=CQl9hiMcVwRiFKl5bEKpov7/L+VyBnhYib9HrEFhDIb3VxM8lxlbM3DMgDlQllmeP1
 1Ftrp6X8szlLYnfAQnlTBB9x0Ys5ZE63LVxqYUGDIpxjIId20tXuH6sgYRvCkv+qtY0z
 oULMGriobqLF5uKMCeAKggLpLhrwxERknC2o4m9GqYnjMR4S1y4a1ScLaiVEhaeDQf1K
 nKl/svjDxTaUITnYDXbAxK+koky/unA2It4x4dyRav5J9JPvQoja7gQeW3gTTg1W7u8j
 jbYmHtz1O8S4HnCy90Xjdocv9/MS6H3twTBCiIhN7EceZkcn7EDWaj9Rx5pPrYuL1Tld
 iGMw==
X-Gm-Message-State: AOAM531FMVqzRugmt1pvVQkH/T6nBKZFB2eWJM1Q1CplF0GT/t1FI2tp
 Y6Gb/375PJDMRQejsNIIGFTmBQ==
X-Google-Smtp-Source: ABdhPJy0ePkOSl5fcbKQnTE2gibN+aVrlMi6IEXeohPhMbVHg0xuGLaPgYbBApxGYU1sA9ovGWbA3w==
X-Received: by 2002:a17:906:2755:: with SMTP id
 a21mr22774800ejd.278.1618415363438; 
 Wed, 14 Apr 2021 08:49:23 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q12sm10495540ejy.91.2021.04.14.08.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 08:49:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v4 0/9] ASoC: codecs: add wcd938x support
Date: Wed, 14 Apr 2021 16:48:36 +0100
Message-Id: <20210414154845.21964-1-srinivas.kandagatla@linaro.org>
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

Am planning to send support for MBHC once this driver gets accepted!

Thanks,
srini

Many thanks for reviewing v3.

Changes since v3:
- Moved to using driver component framework
- Added device links to allow correct runtime PM
- added runtime pm support
- split codec bindings into two parts one for codec and other for soundwire device.
- 
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

 .../bindings/sound/qcom,wcd938x-sdw.yaml      |   61 +
 .../bindings/sound/qcom,wcd938x.yaml          |  176 +
 sound/soc/codecs/Kconfig                      |   13 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/wcd-clsh-v2.c                |  348 +-
 sound/soc/codecs/wcd-clsh-v2.h                |   16 +
 sound/soc/codecs/wcd938x-sdw.c                |  230 +
 sound/soc/codecs/wcd938x.c                    | 3786 +++++++++++++++++
 sound/soc/codecs/wcd938x.h                    |  670 +++
 9 files changed, 5294 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
 create mode 100644 sound/soc/codecs/wcd938x-sdw.c
 create mode 100644 sound/soc/codecs/wcd938x.c
 create mode 100644 sound/soc/codecs/wcd938x.h

-- 
2.21.0

