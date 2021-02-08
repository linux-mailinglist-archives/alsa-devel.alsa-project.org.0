Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 739C6313C1C
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 19:03:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87D18168B;
	Mon,  8 Feb 2021 19:02:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87D18168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612807411;
	bh=GKTUT2MfGGx0ZTIWB+VGYK4uk+guS+dvloGcpzXNbL8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oOhqs1XNh5FwO86zYH9ZpauOgJ6gBM0G3rChiF2UhsUYeHcpbCdeMOzoRFXfAl0J2
	 41fqFSeZ4an1npO1WziupArZTyBJl5BB5RFnR1krwhOTAaSWXo2zCsi/hJTcESdr11
	 Oae6gASwd8HhkIUCvYb37k9O6/3WhueGiTYUDDao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A169AF8022D;
	Mon,  8 Feb 2021 19:01:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38D44F8022B; Mon,  8 Feb 2021 19:01:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCAB7F80165
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 19:01:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCAB7F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZtQCs63t"
Received: by mail-wr1-x430.google.com with SMTP id m13so18251166wro.12
 for <alsa-devel@alsa-project.org>; Mon, 08 Feb 2021 10:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=15qU8cK0fgAua4gEd/w/zhOHPh1Gn9liZ7KcNZSIbsw=;
 b=ZtQCs63tKC4YNjAK5YtSkl6sRGMzqMgDk9JBWfHaip5ck0jSZBxtvpIAaRPwa/4Io+
 k4klxIU6HWNuAA8dl5xtXzodHH2zZc8AQ1ya6+D+UEWTgJ1zFvzsn0md+EIMZ2rO/bkC
 Eb7Ec+eDvh3Kz15Q8ihsCelhajfqZzJhsaf1coknsthLTdni8EkTINxV5UQMpmoOuycS
 Ap7BuWa6I/xJ1UrEe55XzHpbhp8AApMKsC6y05LrOwdVM6An8kCcJbIp00GVWf7tGqja
 8o3faYsFFgVANYKB+UOdAZC54tVQWlUWy0yOZ0PHmetW5fcrfPF7sLKZZ+jpEZLaWa/k
 lwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=15qU8cK0fgAua4gEd/w/zhOHPh1Gn9liZ7KcNZSIbsw=;
 b=BQrlAUmi8TLKPkpCPiZwv+AOkH4IgVftwnItt7o7TNg+xYnns35GcpSl7bEtJ43hzG
 32+g9MDRAFSXYs0YzvnqXOodFVs84f4W/JBnHQAF/QdKahD/11Xf5bhYRh5lAV8YwiGd
 /MjlRO0O8J0zKvCjLrqA8SXNW41gj/DSIPKT+GpPjcSyRZGNGu0m/dq8V5XpePncvut7
 TW02cZXKUZDweSQYd/9JHwi0Jo/oas7FuzSTMKttwmHmmJB3KofjXV5N9NALsI6nfn7R
 N8AwGbf8d1z7wxhP3WIGgcuLBL49TrB8aPQIEaED3CC2OFFDbHPaEdara1rsYDp4k+ki
 xlVg==
X-Gm-Message-State: AOAM530VwIH9HkbOB7V3ugjWrASzJJCR5c/ne0FHOBH/hOct6lxK2zSp
 7pESusdAW2QmBZo5w9fhZxaJDQ==
X-Google-Smtp-Source: ABdhPJwrqGjJeWdA+BLfOl3RPdiRzmOJ7nilmxlHvJ0QS3yn9XOx2bYatc29bZoEoaYUpqBYS3z34w==
X-Received: by 2002:adf:bb54:: with SMTP id x20mr13257775wrg.112.1612807313722; 
 Mon, 08 Feb 2021 10:01:53 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id l2sm21194937wmq.17.2021.02.08.10.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:01:53 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 0/7] ASoC: codecs: add support for LPASS Codec TX and RX
 macros
Date: Mon,  8 Feb 2021 18:01:02 +0000
Message-Id: <20210208180109.518-1-srinivas.kandagatla@linaro.org>
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

Thanks for reviewing v2, here is v3 patchset addressing comments from v2.

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

Changes since v2:
	- Suffix some of the simple on/off control names with "Switch"

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
 sound/soc/codecs/lpass-rx-macro.c             | 3604 +++++++++++++++++
 sound/soc/codecs/lpass-tx-macro.c             | 1877 +++++++++
 6 files changed, 5624 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
 create mode 100644 sound/soc/codecs/lpass-rx-macro.c
 create mode 100644 sound/soc/codecs/lpass-tx-macro.c

-- 
2.21.0

