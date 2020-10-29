Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4125429EA1B
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 12:10:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B652915DC;
	Thu, 29 Oct 2020 12:09:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B652915DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603969820;
	bh=6Se1AfAXYp6uNOwppK855o2Y+mpIrtETUnudTSP/+AQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iLXmcSBLIwWDGGHEHPAqvZYJ9laIpt4sj5hKcWDboHcT5MEPPupgbBMw2ritABOUG
	 ZrKyfV0YEWFiSZOk11ckimG+ecg2zM69yVngoIYlPsQy6NcyIS4PJWx+YL1DQ5jXWw
	 2VdKi82PWslqlzFg4qmK086JuX9XmgTmNKDv5f3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 987E5F80217;
	Thu, 29 Oct 2020 12:08:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE339F80217; Thu, 29 Oct 2020 12:08:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2335BF80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 12:08:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2335BF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ByNrfm0K"
Received: by mail-wr1-x444.google.com with SMTP id k10so948147wrw.13
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 04:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LmGv0yRIVyV9z98kEqM68q1Q8ecpHQ7rH5nlZRYkiqc=;
 b=ByNrfm0KwHmzFqI+B0tQDo8PL5NERMC96ssfvEmQFy8mWOSvglwJdlUljs8gLq5IQw
 olWuy0+61OM9rLSkYUUZ4FvYB19h6orusLGDrOjP4jVnMykUksmLzyi/aX5oRaYhD5Sp
 iQUY/YlQIdxWvx8IPSVzQKvEbaMyhDLzggvZFuAu77zgwWPpAvVoC6ikXP5u3CG60lLf
 S8wXkp9DHOTu+wVw1bOxEJBFLzQN9Apjemq28zT1PyZa8MIHsJ8NYoUfRBC8DH6ja3JM
 onjKeVltaGt/acvPv0Q0K/52IgWgm2lV3mepxyl+OOlpqdgyEwzLJAD1V/pNd8nRJbx6
 pc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LmGv0yRIVyV9z98kEqM68q1Q8ecpHQ7rH5nlZRYkiqc=;
 b=L5bnFXKcRpLiaW1+YRNfX2NZuJ/TrODX3INIJkkJUkSUJXlBLTDTUCZyEoCwyRXWHL
 GZmALvXy/O5ZMCuRbsXMHBRGxTc8uuGLKzl15qDXhEwIOkiqNgI3wbaP6pQMvbi5jZM2
 mXKO7BhbNiD8zrcTje1xZJyqdL8r9WGrakfDgZhKrWlfI8blOBN7cLPdNs5o0yq7uArB
 SWhmJHoWAXh/tLZFw2kLGUvpVXvl1ui/foBHZYIJPMqnmvxaYcxxO06UPKVd9gWvs+ad
 dmvuE5eMTPr1kOaVlkBszZ7rq3WBM6SUHsleQQsJMFbW2eR4T887otHqz9EuoMipgA5a
 P63g==
X-Gm-Message-State: AOAM532DlUr6WTheAwAsuzehUlY4Qh67U0g2UEeOzmLOEn+aRcrUYmLf
 IfcyvxFKIVFihDyqqZd6n4ui34LFEvg2VQ==
X-Google-Smtp-Source: ABdhPJz0GKBBs+Rqk3fG1bevQ6hm1UzIOXVocSMV4O1tP/5cPXwjjN7nvP/eRMpt7VA4KzCoGgE2aw==
X-Received: by 2002:adf:f607:: with SMTP id t7mr5236339wrp.39.1603969720660;
 Thu, 29 Oct 2020 04:08:40 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n4sm3710830wmi.32.2020.10.29.04.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 04:08:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 0/6] ASoC: codecs: add support for LPASS Codec macros
Date: Thu, 29 Oct 2020 11:08:23 +0000
Message-Id: <20201029110829.16425-1-srinivas.kandagatla@linaro.org>
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

-Changes since v1:
 - updated code to fix cppcheck errors suggested by Pierre
 - fixed various coding style and variable initialization suggested by Pierre.
 - yaml bindings clock names replaced with constants.

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
 sound/soc/codecs/lpass-va-macro.c             | 1500 ++++++++++
 sound/soc/codecs/lpass-wsa-macro.c            | 2472 +++++++++++++++++
 sound/soc/codecs/lpass-wsa-macro.h            |   15 +
 7 files changed, 4135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
 create mode 100644 sound/soc/codecs/lpass-va-macro.c
 create mode 100644 sound/soc/codecs/lpass-wsa-macro.c
 create mode 100644 sound/soc/codecs/lpass-wsa-macro.h

-- 
2.21.0

