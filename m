Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DC3316249
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 10:33:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE2E016D6;
	Wed, 10 Feb 2021 10:32:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE2E016D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612949617;
	bh=Cb4iNWF616qtSQvKoypzlOAqR/i2WOgfgjX3CCiRCAs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CMCLpklUscJ91pQpnpMy1XFQq/6X07fpxIivqWJXFHfBnIJfZt4ucbJFhNImlQP9w
	 p3P4L24psrXbY1PtOqGGKc0bTLk18yUsUgoA7Dq8FS4yNh3MC+eQ41/PwUXD2KxmnD
	 PnUbrvM+Ja/oY6zALvjPbFP+jnZHISZs76ivpKe4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33B10F80169;
	Wed, 10 Feb 2021 10:32:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA8A0F8022B; Wed, 10 Feb 2021 10:32:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F607F800F1
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 10:31:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F607F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yzn2Rjyf"
Received: by mail-wr1-x435.google.com with SMTP id q8so1605254wru.13
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 01:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k5sKCODv0QrgXZ2RFmVU6ynQ+Rw3VG9UBUsttRl/jOY=;
 b=yzn2RjyfE+Ymq+e4RPMMkQCkMSNwsPMS59gJgkIT2ZjbB7e995bEVoQTtwAWtUaEro
 XtwQr2u1ntNWYpHVl8EZdnhtmBMsQ6rUrDlUg6vVDAyzgy8YeiU0gyPpfFXWend/xtpV
 5PFOMIysnm0y5E+EcNg2bQh/0BPPsC3r/7lBDDK3TxeI0RzRIIktfgImIchwajbi3YAr
 V4r2Iz1UwYUjBs/hjNgP6eLPV92Ei29AThVrQ9ZGNaDRF+NbS8PzapMcyPMVOmDZy62Z
 JtiluXt7om/oKfKJL6XsL8XJW7wPsz3fYG8nbPYLC97dF1/+td6KTiFazGG8oCIRZZ1w
 gefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k5sKCODv0QrgXZ2RFmVU6ynQ+Rw3VG9UBUsttRl/jOY=;
 b=qxI0Bx5RHoYZwFd599BYFBEqv7vyTMcAsZzLXhgmqwQ2TFwJ/70VrENgkH5rTh9Q3R
 kuOne8oJ9x9mDZDtWWNPKUWZQqKaNMjsAMC9tGLZuHIXAFVStPuxpB/TMk1HUIcnaJr8
 WqsyMSiWk81qBm2GLM7h1ceInyg/eyXvB+aRj+kZM0kB9GryYVwzKqwTce2O87S3J0UH
 NWFjp7BB4JukOBh4ssGhCdzWMS5TsHL5L0Hf0jAOFkRLAyCQMvlxQPLDUZcmWHfaxQz+
 kAjVV3oyhjFnhN3tgLAm+I56Tl+U5byoOqs6izoPv4bol6w2A8d/X6Txy59S1wfGYYFp
 DOaA==
X-Gm-Message-State: AOAM533J0Bv6GSpYXLCU3e5Ds1FnB06IjeM7MTRxmRl8p5i2zuDlETjD
 YZF9gH48Lxphps1Yv8p1rPD2zg==
X-Google-Smtp-Source: ABdhPJxG5BW+H4n04fn0kKilEgXQaMM+3i3D3fQtUIGSsLB2BXZLKfjyhH8893sPibNZPZelUtg+WQ==
X-Received: by 2002:a05:6000:c7:: with SMTP id
 q7mr2572228wrx.364.1612949516138; 
 Wed, 10 Feb 2021 01:31:56 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t2sm2150583wru.53.2021.02.10.01.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 01:31:55 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v4 0/7] ASoC: codecs: add support for LPASS Codec TX and RX
 macros
Date: Wed, 10 Feb 2021 09:30:48 +0000
Message-Id: <20210210093055.18350-1-srinivas.kandagatla@linaro.org>
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

Changes since v3:
	- fixed two minor warnings reported by kernel test robot using clang

Srinivas Kandagatla (7):
  ASoC: qcom: dt-bindings: add bindings for lpass rx macro codec
  ASoC: codecs: lpass-rx-macro: add support for lpass rx macro
  ASoC: codecs: lpass-rx-macro: add dapm widgets and route
  ASoC: codecs: lpass-rx-macro: add iir widgets
  ASoC: qcom: dt-bindings: add bindings for lpass tx macro codec
  ASoC: codecs: lpass-tx-macro: add support for lpass tx macro
  ASoC: codecs: lpass-tx-macro: add dapm widgets and route

 .../bindings/sound/qcom,lpass-rx-macro.yaml   |   62 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml   |   67 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/lpass-rx-macro.c             | 3606 +++++++++++++++++
 sound/soc/codecs/lpass-tx-macro.c             | 1874 +++++++++
 6 files changed, 5623 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
 create mode 100644 sound/soc/codecs/lpass-rx-macro.c
 create mode 100644 sound/soc/codecs/lpass-tx-macro.c

-- 
2.21.0

