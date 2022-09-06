Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB85AF17E
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 19:03:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0985882C;
	Tue,  6 Sep 2022 19:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0985882C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483793;
	bh=Kgj0DNtVW18sdcpE52kikcoRY1sWCGabotJvJIRYFTY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l8jj0OFRybnwhpuBUG83bwBd1LPdsTKlSxCL8uiSL9IGqeSpz4/68FMwMr3T/rc0q
	 RjNV15NSW+NAxtksuyN3rRKhm2fjN59rz4E8HSSWnbmszsmibKaodaZ5y6rEthi07t
	 8LEhRpQHmtxjTVDgemkkj2ZQ2/6U2YwVHYjkn9HY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 262B5F8047B;
	Tue,  6 Sep 2022 19:02:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 460D6F8011C; Tue,  6 Sep 2022 19:02:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B775F8011C
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 19:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B775F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TXRn4OzR"
Received: by mail-wm1-x332.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so9994303wme.1
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 10:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=fqbVR0/pYtalFeUPIEz7ZYhuS1uYGPBfqPC7dvf/8Hc=;
 b=TXRn4OzRw1fW++9vKnMzH+g/r7f1EyS/oo2E42frNUymESrW0Rx2Qs3BXnJwfx4bQy
 klg55C8eq/bYCnVJtQ/swaUqk8OcT9bEQvyBYYYLnPviHdazRh8v8fwIkzAwIA5WuUql
 x0bNITJCBHyu2KH8zle3uP4dfZgy4qyp2Nsd4apH44v/nzhAKjJDT+NDHZ3ptm7Q6Nx6
 vZcDsXh72RKtRs3PxeResEgHH7jO5PWGKcoDtWd8lo6NcCRJ+v0xTHQuQIsuPrPyLlaJ
 8qifHRitEsP4UZAyU+/OsAcWMMteFQq4R7lqruAfXl+KINuly74EtLVTjCBLqGwsVJvT
 Tfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=fqbVR0/pYtalFeUPIEz7ZYhuS1uYGPBfqPC7dvf/8Hc=;
 b=Cr33OGWatJr0H/SF/8sbcffK1tOlSfSO52ytZzyAJHaFJMK1nFlsOwbR4ocN6225uy
 IvB2mJ3XI2bxwbRxpzpcX4SY0PocH5/HufUAx1QVLCL/IzJfIzBm+MC6M59v7knKsCOy
 +H5rMt3M6k5yq3gd2GYo2HF9oVXC/dgHSSeaCO4s0ZycPoGLnUrJ+D8VaLFXZXvdSs1J
 Vl29TfNjjALV4B4yufoeGOZMh7AVR1M3X3dBkTLo5QdRs6CTXsq9n3TkatifiIN5O+aU
 gmEfpLcFyHTxaGbWcpQD5WVRC7w/NUb9cs1wr3lVD7eTClgI2G+Wp4X0EF8q82qoJenz
 iRew==
X-Gm-Message-State: ACgBeo2CF1DQq8kWdqKPd+CK1PII/GEe+WJaQ+eWY7NQuKueq+JBDNh9
 F8xzxw3JHwILITPTHjtwfg6Ohg==
X-Google-Smtp-Source: AA6agR7ggY+xobY1zkdFdqFhBWr7EgzRCH5ej/RpqXkiV++HXnF1gxlVAHP2RSaBTqtJIxuAwC8x8A==
X-Received: by 2002:a05:600c:4148:b0:3a5:4f94:577b with SMTP id
 h8-20020a05600c414800b003a54f94577bmr14683472wmm.167.1662483726815; 
 Tue, 06 Sep 2022 10:02:06 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:02:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 00/12] ASoC: codecs: qcom add support for SM8450 and
 SC8280XP
Date: Tue,  6 Sep 2022 18:01:00 +0100
Message-Id: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
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

This patchset adds support for SM8450 and SC8280XP SoC and also some of
the fixes requried to get stable audio on X13s.

Tested SmartSpeakers and Headset on SM8450 MTP and
Lenovo Thinkpad X13s.

Changes since v1:
- moved va-macro from using of_device_is_compatible to compatible data
- added some fixes for qcom codecs.

Srinivas Kandagatla (12):
  ASoC: codecs: wsa-macro: handle swr_reset correctly
  ASoC: codecs: rx-macro: handle swr_reset correctly
  ASoC: codecs: tx-macro: handle swr_reset correctly
  ASoC: codecs: tx-macro: fix active_decimator array
  ASoC: codecs: tx-macro: fix kcontrol put
  ASoC: codecs: wsa883x: add clock stop support
  ASoC: qcom: dt-bindings: add sm8450 and sc8280xp compatibles
  ASoC: codecs: wsa-macro: add support for sm8450 and sc8280xp
  ASoC: codecs: tx-macro: add support for sm8450 and sc8280xp
  ASoC: codecs: rx-macro: add support for sm8450 and sc8280xp
  ASoC: codecs: va-macro: clear the frame sync counter before enabling
  ASoC: codecs: va-macro: add support for sm8450 and sc8280xp

 .../bindings/sound/qcom,lpass-rx-macro.yaml   |  2 +
 .../bindings/sound/qcom,lpass-tx-macro.yaml   |  2 +
 .../bindings/sound/qcom,lpass-va-macro.yaml   |  2 +
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  |  2 +
 sound/soc/codecs/lpass-rx-macro.c             | 18 ++--
 sound/soc/codecs/lpass-tx-macro.c             | 36 ++++----
 sound/soc/codecs/lpass-va-macro.c             | 82 +++++++++++++++++--
 sound/soc/codecs/lpass-wsa-macro.c            | 19 ++---
 sound/soc/codecs/wsa883x.c                    | 28 +------
 9 files changed, 120 insertions(+), 71 deletions(-)

-- 
2.21.0

