Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C402A7D23
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 12:36:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 598D11673;
	Thu,  5 Nov 2020 12:35:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 598D11673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604576203;
	bh=RJXov8QOxsjgYn0KdjzxmXV1MN4EJi8t6pU94GiMVW0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H86SMyg9uT0CUPLC/XWAIujAbVcIcfsTAIYtsha2zpMUgcMv494+wqCQ5tMJleSbl
	 l1R+umlL3mCduvMvnZqjnjwa6N1sRAkLBvfX7RxoiSVcvn2V0GyyDuJ12/V4MUTps6
	 u6rnkJme5urjNf369v5aDR7Ze8LmLWsDfKKrNDek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1E3CF80272;
	Thu,  5 Nov 2020 12:35:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 305BFF80272; Thu,  5 Nov 2020 12:35:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F960F800EC
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 12:35:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F960F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QX1pqLEl"
Received: by mail-wr1-x444.google.com with SMTP id w1so1362325wrm.4
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 03:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XvjCkKngYE2d+J4nil/WpI1yvSfXYpPNmzvk7VIM7Sw=;
 b=QX1pqLElgUOAMv3Vji4ojrlU2MCamjPnkC2TLxIw7ymKBnAlNQ2GiLy+ud3BYdAuAa
 ocf51mlfgPoZATNohh2GOiXRngkriA8NNct+tRuSrH1KL3Rd2Pn8v37gTg0Zx7fiRG+G
 Hoh+s7NpMQvxVcl2behW8dH5fOlbiiznqq7f/HfAXElR8LHIkgEnx4bCGRmKU+urIrum
 K7NFphwfZ5+k6xfjiaX6FPcpod+xFX+z/r8s4OHEWzTkEk5BIMUWdAZMD6xRgxHhN2bP
 IdgFW6t/l4AGlT76W9yj9ZpdpBpG+BaeK/6hNNbrZZd+/WNTZxQ28FT9v751Lqup53mq
 vu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XvjCkKngYE2d+J4nil/WpI1yvSfXYpPNmzvk7VIM7Sw=;
 b=BRQRaAPjqsPZp8N7hh7/Lfm3RFEFqLAoeRh0948+ncMWWnFzmDcJSuCxjo7+xG/ASt
 KCXHZKeu51j2sRV3aFqpvlzK/nj6QaRTlMZ/cxRQ5cf/e+gS9+CXKwFp6jQeVDQcB3hO
 ZgKYzzThkFK6ojdUnOMVmyr344W00Fbw6Of7QXC3qJP5CTBJnWIQT0jsT0QzX9As1Raf
 YgyfBvO8oNxEk9HPYPZFtVoITfBSZPOu23cyDiI/o7XYoi6bmElBVgtB4g1oayZvBIdx
 WPNS7bRiPXaWba/7I7Tjje1rn73hkmYiRFK/65Krho6MNkLGTBm8s5c4t1Z3GumPJZL2
 /OOg==
X-Gm-Message-State: AOAM532Qz9LSyQkayBYup1gBTJYEUxvBWCjJsFkplXRPdCAZU8OT/ey8
 1Qaj+cT1VRHVh4nG91AYbcWw0g==
X-Google-Smtp-Source: ABdhPJwAMtjK3f6sLO7RWDc74aAw55duLeGvZmuy2Y1/1dYh1n/xoa8FcVogHR4NqV8ZezLc5XT5Hw==
X-Received: by 2002:a5d:4148:: with SMTP id c8mr2339688wrq.261.1604576101950; 
 Thu, 05 Nov 2020 03:35:01 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t199sm2096129wmt.46.2020.11.05.03.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 03:35:01 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 0/6] ASoC: codecs: add support for LPASS Codec macros
Date: Thu,  5 Nov 2020 11:34:52 +0000
Message-Id: <20201105113458.12360-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Thanks,
srini

-Changes since v2:
 - various unnecessary variable intializations removed, suggested by Pierre
 - fixed a static checker error
 - collected reviews for dt-bindings.
 - fixed licence headers as suggested by Pierre.

Srinivas Kandagatla (6):
  ASoC: qcom: dt-bindings: add bindings for lpass wsa macro codec
  ASoC: codecs: lpass-wsa-macro: Add support to WSA Macro
  ASoC: codecs: lpass-wsa-macro: add dapm widgets and route
  ASoC: qcom: dt-bindings: add bindings for lpass va macro codec
  ASoC: codecs: lpass-va-macro: Add support to VA Macro
  ASoC: codecs: lpass-va-macro: add dapm widgets and routes

 .../bindings/sound/qcom,lpass-va-macro.yaml   |   67 +
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  |   69 +
 sound/soc/codecs/Kconfig                      |    8 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/lpass-va-macro.c             | 1503 ++++++++++
 sound/soc/codecs/lpass-wsa-macro.c            | 2464 +++++++++++++++++
 sound/soc/codecs/lpass-wsa-macro.h            |   17 +
 7 files changed, 4132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
 create mode 100644 sound/soc/codecs/lpass-va-macro.c
 create mode 100644 sound/soc/codecs/lpass-wsa-macro.c
 create mode 100644 sound/soc/codecs/lpass-wsa-macro.h

-- 
2.21.0

