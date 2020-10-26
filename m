Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BC0298F18
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 15:21:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46FF316C7;
	Mon, 26 Oct 2020 15:20:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46FF316C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603722098;
	bh=4nXN8cNWgkmMoNSsAUO0/URkWRcvqupSlbbH//WC27w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MfpVK7mpAYFf+TNJm6OJkZBj7o8VcZnhqIjxThfyTkmiwnmP7IYkQQW0yC4xX4C7b
	 hPNITz1ClzYcXfCutWXWxbr//exH8f0jJK8mX/pM00NATk542XxhGhUwKb8veGGWLV
	 yDDR88O9Kzqqf16AoUaDI0JWPALd0+Hx2CKaNv80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F4044F8027C;
	Mon, 26 Oct 2020 15:20:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DC2AF80272; Mon, 26 Oct 2020 15:20:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C282BF801D5
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 15:19:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C282BF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Db3gnizC"
Received: by mail-wm1-x343.google.com with SMTP id c194so11835679wme.2
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 07:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=El9u2gx0cY8E5dk5vr+otYOVhv3UfwiT3Ot69QdQhlU=;
 b=Db3gnizCW/VQkOSs8aeOD0NxrO9VmMVr2LUbHAmPKG0/3Xfb3OHQncLEYrljyhDOzZ
 iCHX3oKR9WYHYWywsKkVDvZ2wtcJhk47cqz/rt9estyguD/HwYh5kGV8+pznNP4A50qy
 g8hz6ywjD185H5adqZW96eClNaNPs5uKeMpBPTP7TPTuql74VB8GZV6K4Vk7n2XfkeIh
 H8mOSjXNZ7NzziLbKHNzHTgEBRk9qvw7CxoMw2Qf1sjVgmnS0oYlX4CLBA5ry85MtWhU
 1jTcdFC425Z1VYdtqWnOsvujBiT1VtSydXbgmXx+BkbZCF8j+RPWGxJAEaRxi5gZ7TAl
 8UBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=El9u2gx0cY8E5dk5vr+otYOVhv3UfwiT3Ot69QdQhlU=;
 b=lUlx6NcJXs5WhSjEM/Wz4TSg7j/lHkBeTVbeQ0BaRpHqneVVSXMEqwJivXAoOQadyn
 IcOrfAX9Fq3qVRw10Ij4E6ElxBrr4tdq6pEMz5THjtLN4gzQAcgE+paV2Knbz4vKZvo6
 N1INfUsKzGfKPtKVonxe2R4Ybc6gRyeZCu0crdBAKiwCJJ7+nN02al2y2MPReJcBEJK+
 F6eE92GJEbPPCt1dk7elOjPkqJdxZw2uyYr7Fxrk6Y1ma2jgva02JyGnC594/8TjAjFy
 oM7vBd4pGWXzAKxttSvlocIPWsyjtar3wl1wzjMLZnPyOL9RiRK5nMVzkgDqUjrxWcJ+
 872Q==
X-Gm-Message-State: AOAM533LMzbvzx7ArcAEDsLq0ZJR5OIwuSYdUgySkJSdqZKf3G+9X2HV
 QXJ4KXjHiKaFmfUDl7M+7EZ19g==
X-Google-Smtp-Source: ABdhPJzbH0P3E8eXb+xShrA9atwUMxNJnLkxwBqG4wEzCSmJ1lgdG1VKIKfuTvw93CNDLLlvgTS7RA==
X-Received: by 2002:a1c:3882:: with SMTP id
 f124mr15720521wma.184.1603721993120; 
 Mon, 26 Oct 2020 07:19:53 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id g4sm20253333wmh.13.2020.10.26.07.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:19:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v1 0/6] ASoC: codecs: add support for LPASS Codec macros
Date: Mon, 26 Oct 2020 14:19:39 +0000
Message-Id: <20201026141945.19707-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
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

This patchset adds support for two Codec Macro blocks( WSA and VA) available in
Qualcomm LPASS (Low Power Audio SubSystem).

There are WSA, VA, TX and RX Macros on LPASS IP, each of the Macro block
has specific connectivity like WSA Macros are intended to connect
to WSA Smart speaker codecs via SoundWire. VA Macro is intended for DMICs,
and TX/RX for Analog codecs via SoundWire like other WCD Codecs to provide
headphone/ear/lineout etc ..

Most of the work is derived from downstream Qualcomm kernels.
Credits to various Qualcomm authors from Patrick Lai's team who have
contributed to this code.

This patchset has been tested on support to Qualcomm Robotics RB5 Development
Kit based on QRB5165 Robotics SoC. This board has 2 WSA881X smart speakers
with onboard DMIC connected to internal LPASS codec via WSA  and VA macros
respectively.

yaml bindings depend on gfm headers from "clk: qcom : add sm8250 LPASS GFM drivers"
patches posted at
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2352255.html

Thanks,
srini

Srinivas Kandagatla (6):
  ASoC: qcom: dt-bindings: add bindings for lpass wsa macro codec
  ASoC: codecs: lpass-wsa-macro: Add support to WSA Macro
  ASoC: codecs: lpass-wsa-macro: add dapm widgets and route
  ASoC: qcom: dt-bindings: add bindings for lpass va macro codec
  ASoC: codecs: lpass-va-macro: Add support to VA Macro
  ASoC: codecs: lpass-va-macro: add dapm widgets and routes

 .../bindings/sound/qcom,lpass-va-macro.yaml   |   68 +
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  |   70 +
 sound/soc/codecs/Kconfig                      |    8 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/lpass-va-macro.c             | 1500 ++++++++++
 sound/soc/codecs/lpass-wsa-macro.c            | 2503 +++++++++++++++++
 sound/soc/codecs/lpass-wsa-macro.h            |   15 +
 7 files changed, 4168 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
 create mode 100644 sound/soc/codecs/lpass-va-macro.c
 create mode 100644 sound/soc/codecs/lpass-wsa-macro.c
 create mode 100644 sound/soc/codecs/lpass-wsa-macro.h

-- 
2.21.0

