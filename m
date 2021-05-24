Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E76D438E2B7
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 10:50:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CBD5169C;
	Mon, 24 May 2021 10:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CBD5169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621846237;
	bh=B99zkbCcQ5TQlJvvHp2ziqyw7lLrvBMmURM/s4xoeCA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O7ZsX3aDv52hGSvchEfEIsxpNs6C1n0e4Ggk7HVoG9skx0aooVifbBEWffCb/EpCp
	 RXA8Wpypn7CnEu0FLI2mUf9Rm6IUJom3+ukvJny3NitXzvbfsB18+5loYhjCFy5Ufp
	 +aK94qKS+Y5YvF1Qsg6y4PXbePUjo706bYP1w2N4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F980F8022B;
	Mon, 24 May 2021 10:48:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F285F80482; Mon, 24 May 2021 10:48:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 011B2F80137
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 10:48:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 011B2F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="h8z0eUTG"
Received: by mail-wr1-x434.google.com with SMTP id y14so25578288wrm.13
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 01:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T0Klvg/FSrb8SCc53K65JSRhutNFINCGv3YACvznWOY=;
 b=h8z0eUTGOInpV5Ca67KyakhslJZT0QJQ5BZP6cvAmlwttykRnVKloIXoqpQjQbs+Xr
 poV0N6H//49KgGH9WIx90WwtlI6pP+mqcZq4yYlTvrb5HlnJpa47/EqVnd1YjgaOOctv
 ygr738zsR54dyRezCJsw17zqZ1Du0rSY6lZvCkthefn8t2jOy6nCK6NfKgN3gpndTGNS
 drqzD2bBBfzuPPJHoNQf145KzhEa/IYd4QKf/iJX+TU21LwbHb6utsK9e5+QLJbNaTUR
 X8y2yLeZ/7shLB9rJKGXKU/+2ERN4JFlAnQ8Z/IXcoYEOOU22agfWXSsy0iOjO4xQc0a
 HweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T0Klvg/FSrb8SCc53K65JSRhutNFINCGv3YACvznWOY=;
 b=L9vd0dILtBvkfhrDE+XUPDlhnvDVvpwYZuPnuVGE2W+S/WRibUs7A3S3YZ1o9j/tAG
 9Mfz7iFevlSvvDPDn0Y+VqdckS4siC/UApcjBNcGBZl5MovW/RIOtG2+uSRW69BxV/cE
 z4eQNiW4NjUC249fpVP7epuoLBbJkARJEwdEDyQnOwVnOJ3b3F9qHCStVR48mJTNERL9
 Dn92Zsaq1ZhRgi/RgDvyYcUexI0nLBmoXAB2GCY4rvYmrarakuVv3jVLpFV4qHUkPh2y
 y1d4LpH/gaEPE/LHteM+5Lt0WF8hZnPIVfo7yiELTuan+fYXsS9je3HUFgUUeEpCqsTG
 9oCA==
X-Gm-Message-State: AOAM532hj6E7AzmgNjFRtP+KA31Tr11Kg4hKewkcBzgYxEaZYvWir8XD
 coKFod+E+KF6vFCyWQVMCQqSSQ==
X-Google-Smtp-Source: ABdhPJyJ2gcNefbeLfe6t0ysjHd+wh6CTcXC/KA3fGUGoIQTUXLgQAZD7vZaO+Dm42N/DOGJcaqHFw==
X-Received: by 2002:a5d:45c6:: with SMTP id b6mr20964972wrs.333.1621846121134; 
 Mon, 24 May 2021 01:48:41 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x206sm4034548wmx.47.2021.05.24.01.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 01:48:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v7 0/9] ASoC: codecs: add wcd938x support
Date: Mon, 24 May 2021 09:48:19 +0100
Message-Id: <20210524084828.12787-1-srinivas.kandagatla@linaro.org>
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

Changes since v6:
- Removed unnecessary maxItems from qcom,tx/rx-device property as suggested by RobH.


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
 .../bindings/sound/qcom,wcd938x.yaml          |  146 +
 sound/soc/codecs/Kconfig                      |   13 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/wcd-clsh-v2.c                |  348 +-
 sound/soc/codecs/wcd-clsh-v2.h                |   16 +
 sound/soc/codecs/wcd938x-sdw.c                |  298 ++
 sound/soc/codecs/wcd938x.c                    | 3753 +++++++++++++++++
 sound/soc/codecs/wcd938x.h                    |  705 ++++
 9 files changed, 5343 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
 create mode 100644 sound/soc/codecs/wcd938x-sdw.c
 create mode 100644 sound/soc/codecs/wcd938x.c
 create mode 100644 sound/soc/codecs/wcd938x.h

-- 
2.21.0

