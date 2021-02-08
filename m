Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A9B3134D5
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 15:19:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E92D1681;
	Mon,  8 Feb 2021 15:18:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E92D1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612793942;
	bh=YndSOESeveLMgCOzfO4dQDZTxE7EvXfxNYBhsQIXg6I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IoaOv8YF3By/eyWLtbbrMbN2yWXLLN+1GHV2+ArsjfzsCLsmNmLU8RgoDlV1qLpa5
	 wMTJ/zGR0791mWhT+lEv4gDwesCtEyS0IJCQNEHNV0Upjff/ZpjlyjOU7Kh5GP5rdX
	 6xEfP0DpDd+d0SDZLgRyPz0qzEBiLf61R2iaLNZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0019F8022D;
	Mon,  8 Feb 2021 15:17:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F0BBF8022B; Mon,  8 Feb 2021 15:17:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BF5CF80114
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 15:17:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BF5CF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Q21a4A0/"
Received: by mail-wr1-x432.google.com with SMTP id r21so1090603wrr.9
 for <alsa-devel@alsa-project.org>; Mon, 08 Feb 2021 06:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ya8iJWuhg4IhqG6QI2i041j1f43lZLHUVVMkqQ5O0KQ=;
 b=Q21a4A0/XdtqSgXZ6h+kviUME6/e8+StmW7CHx99+//fC/usypKybHrD1awOqfsLuD
 PLqL1PUwPlKMeYKMN2CJblvOvKZvy78zGYOsEdUBvv/wjJrWPwfJY0G2Tqt/mcqPvzdi
 KeK77CbJ81MzM3tRe4fSS5Fx0uA0yL8f4MG2jQn9TQmf1xGt1nPz6juo84ZiY7yDk+oj
 8s++8S2R6EvZiBTCyxDqcwpLh4HoUjeyoOTi/uAkHlxQjQ6uX26nk6GYwclnkDwPyXvD
 aLH4/Hy3XOBzKBXAioD0N5nufbFw0SJ1UKoArkmmSTkNaCZp6s+kIQqwrZZKbP0G/Vjl
 JD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ya8iJWuhg4IhqG6QI2i041j1f43lZLHUVVMkqQ5O0KQ=;
 b=XEUyWUT0E/pM9uadGQ5eCKNlHeJPj7mUhRnJYp5HR9aTj7sLMSgfyNEvPYT7PfEeiX
 ycK8TxX/bXF4C6MuTsCtG1MdOb81Q9+1yo0lY5DaVCabJiZWupgj9FUrOSOy7FXCo6Cq
 2F31n+ROKqwRYETHp/Bodq/wz2/+r44S0uw1/7hOMxREfaPlyVMNOdUzOluTal3V5+VY
 JK47m0Qyhq4vWwlAOxo/gO/KsDriNAx8kC4RefofmUM/vRl5DL0dF9so3RQ1I0smlUsh
 9063AIx72nqTO4GI6Vt8TA9TVIQObk6PqhRDw+y5lHjY99nBlPxZF/qIY6qflA7HG05z
 6qdw==
X-Gm-Message-State: AOAM533opNa4p1jBHjTgpJMXw8d1ynvMiaZdzO0l9Cm7nlvSo/w4mCKr
 6bdFOijzmXDTjc4RCzVRlUne9A==
X-Google-Smtp-Source: ABdhPJxqx+9nN9QwBotSTPZO9uUFtL1+shrog/5niiblYSqSWVqoYihHnSsakt+j55niquCXx0diug==
X-Received: by 2002:adf:de86:: with SMTP id w6mr12633459wrl.32.1612793843544; 
 Mon, 08 Feb 2021 06:17:23 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t18sm27949809wrr.56.2021.02.08.06.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 06:17:22 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 0/7] ASoC: codecs: add support for LPASS Codec TX and RX
 macros
Date: Mon,  8 Feb 2021 14:17:12 +0000
Message-Id: <20210208141719.23305-1-srinivas.kandagatla@linaro.org>
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

Thanks for reviewing v1, here is v2 patchset addressing comments from v1.

This patchset adds support for two Codec Macro blocks(TX and RX) available in
Qualcomm LPASS (Low Power Audio SubSystem).

There are WSA, VA, TX and RX Macros on LPASS IP, each of the Macro block
has specific connectivity like WSA Macros are intended to connect
to WSA Smart speaker codecs via SoundWire. VA Macro is intended for DMICs,
and TX/RX for Analog codecs via SoundWire like other WCD938x Codecs to provide
headphone/ear/lineout/amic/dmic etc ..

Most of the work is derived from downstream Qualcomm kernels.
Credits to various Qualcomm authors from Patrick Lai's team who have
contributed to this code.

This patchset has been tested on support to SM8250 MTP Development Board.
This board has 2 WSA881X smart speakers with onboard DMIC connected to
internal LPASS codec via WSA  and VA macros respectively and WCD938x
TX and RX connected via Soundwire via TX and RX Macros reseptively.

Thanks,
srini

Changes since v1
	- make copyright header line with C++ one
	- correct usage of regcache!
	- moved ON/OFF enums to proper switch controls
	- Align all the control naming!
	- inline swrm_clock function.

Srinivas Kandagatla (7):
  ASoC: qcom: dt-bindings: add bindings for lpass rx macro codec
  ASoC: codec: lpass-rx-macro: add support for lpass rx macro
  ASoC: codec: lpass-rx-macro: add dapm widgets and route
  ASoC: codec: lpass-rx-macro: add iir widgets
  ASoC: qcom: dt-bindings: add bindings for lpass tx macro codec
  ASoC: codec: lpass-tx-macro: add support for lpass tx macro
  ASoC: codec: lpass-tx-macro: add dapm widgets and route

 .../bindings/sound/qcom,lpass-rx-macro.yaml   |   62 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml   |   67 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/lpass-rx-macro.c             | 3604 +++++++++++++++++
 sound/soc/codecs/lpass-tx-macro.c             | 1877 +++++++++
 6 files changed, 5624 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
 create mode 100644 sound/soc/codecs/lpass-rx-macro.c
 create mode 100644 sound/soc/codecs/lpass-tx-macro.c

-- 
2.21.0

