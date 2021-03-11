Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50364337AFA
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 18:36:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3022170F;
	Thu, 11 Mar 2021 18:35:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3022170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615484199;
	bh=d0C8Ojll3/EEuWuxavFwZaiz9yzAt97Fw/VErCXjdtg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=INSy5Y7nnzoYShMkoWWDxQrU458cM4nkdQacnZZo8GBRALNdK7/hK7VnxGrLEyS/7
	 +eaLPyt57Iupevh/KLRkkK2ZcE755QYLhaqbGzjI8s4z9DjmPgHa9lvJj4IMlRykAD
	 XQhJ0dKnsGsNAK7Fau/QrW8sBA1Zs+mEuN/nQwgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58A3CF80275;
	Thu, 11 Mar 2021 18:35:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24BEEF80256; Thu, 11 Mar 2021 18:35:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 484DBF800BF
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 18:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 484DBF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zkwOxIEa"
Received: by mail-wr1-x42f.google.com with SMTP id l12so2981354wry.2
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 09:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=66tTTfF5r6oUktX13OauExH1HuAm+OFPdK/+vXqQOQY=;
 b=zkwOxIEa6c8D5QbUHxY1j0HRCVQu5oihUH8Z5p4P9vA5q/nURFNx/VXJBhk+jMxhrB
 BnUB1j7sErY/oomCD9yoDNRxxAHWiMeAep5pOmErv+VLZ16gyxDaO2gK98wsVprHY5p/
 R6Cjo/07TSvdQxmVTu+1AQ+cvYcgC2JxwQ/iPb3aOQACTGk+fQytpBTobXrqimNUspVn
 G9XXgiwJIb+rS17XoYnRO1wgTvY/ITX30t+HBsVix+4P9d1TyiZ/sX20sFa7qmi+r5dM
 WXNUtHW5bekn+SpbokTeb6oWkGevg8pxzcqYqYI3EcVAzRDjiUL8C4Ku19bo6/3tfZTX
 kuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=66tTTfF5r6oUktX13OauExH1HuAm+OFPdK/+vXqQOQY=;
 b=EqUIrTmVsOQuyOsOHz83SUi3IN+INPq5UVeFx3N+StnGvj+l8f7weod9lsZGNL/nJP
 czZKnnUJlNgldLjlU1eImlHy//liqj3SRa0GoXUDmMmnfbkAQRKGf/xtvaaGN6UwaRe7
 Y2N7V8BwuLumM+ZBKtPq1rVEMNrD3XEfI0AWkPWVuiA5cGsZfJX4cos0w/j1tIgXBOqm
 Eb2wBNnmKFf3nCDvIYJ5HNItvqFmS7vOSsSIJ1Iyq3V8tXQvSg5dVMBiDintpasOF/Ty
 PA9VWY7XTLhSw5mhkP/Hw91ZbPDO8+D0v1SvamLc9DJJ232tfc7w85Am2XkdDl/W7Kaq
 DV+A==
X-Gm-Message-State: AOAM531ihgrvypRAcfGi/BNLmdDW0r5w/cTIsv6oGksOqof5EKs9hDmv
 bGQh/t71BfeVZU4EYwI2Y1AXDg==
X-Google-Smtp-Source: ABdhPJwcthG3QwbLdp+pL70hoWTIadW9sUoXZnpm6KSu0v13JgxV+GMEkj8ootJFcGASY5/YXirevw==
X-Received: by 2002:adf:fa41:: with SMTP id y1mr9713611wrr.256.1615484099379; 
 Thu, 11 Mar 2021 09:34:59 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id 36sm5221152wrh.94.2021.03.11.09.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:34:58 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/7] ASoC: codecs: add wcd938x support
Date: Thu, 11 Mar 2021 17:34:09 +0000
Message-Id: <20210311173416.25219-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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

This patchset adds support for Qualcomm WCD938X codec.

Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
connected over SoundWire. This device has two SoundWire devices, RX and
TX respectively supporting 4 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
7 x TX diff inputs, 8 DMICs and MBHC.

Even though this device has two SoundWire devices, only tx device has
access to main codec Control/Status Registers!

This patchset along with other SoundWire patches on the list
have been tested on SM8250 MTP device.

Am planning to send support for MBHC once this driver gets accepted!

Thanks,
srini

Srinivas Kandagatla (7):
  ASoC: dt-bindings: wcd938x: add bindings for wcd938x
  ASoC: codecs: wcd-clsh: add new version support
  ASoC: codecs: wcd938x: add basic driver
  ASoC: codecs: wcd938x: add basic controls
  ASoC: codecs: wcd938x: add playback dapm widgets
  ASoC: codecs: wcd938x: add capture dapm widgets
  ASoC: codecs: wcd938x: add audio routing

 .../bindings/sound/qcom,wcd938x.yaml          |  127 +
 sound/soc/codecs/Kconfig                      |    9 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wcd-clsh-v2.c                |  350 +-
 sound/soc/codecs/wcd-clsh-v2.h                |   16 +
 sound/soc/codecs/wcd938x-sdw.c                |  294 ++
 sound/soc/codecs/wcd938x.c                    | 3688 +++++++++++++++++
 sound/soc/codecs/wcd938x.h                    |  675 +++
 8 files changed, 5151 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
 create mode 100644 sound/soc/codecs/wcd938x-sdw.c
 create mode 100644 sound/soc/codecs/wcd938x.c
 create mode 100644 sound/soc/codecs/wcd938x.h

-- 
2.21.0

