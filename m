Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA231F582
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 15:22:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8943E16DA;
	Wed, 15 May 2019 15:21:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8943E16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557926563;
	bh=03Wgf+UYZs9d/dQKW9m7qoW/EuneSl2MWPLMuEGy3QA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dX1JQWBjyL4C10mD/xiQiTMPHXhPyHK7I0QxCI6v6utxECaCd41Vk+UqBLvIUw3GB
	 8bCkyO5j1EvKhLNDawWom/P6CU3sOXF1PPuib/OdbHaUE4yoGbEfheiVT5bP4Q1pkS
	 ZpgL6rRaIp3YylI8PkaAVLW9Fdz1U1mrKebNvSMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 588BAF89734;
	Wed, 15 May 2019 15:19:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8038FF80C17; Wed, 15 May 2019 15:19:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 124A3F8078F
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 15:19:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 124A3F8078F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="vZJh22fk"
Received: by mail-wr1-x442.google.com with SMTP id w12so2677020wrp.2
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 06:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JG2kah723rKt+6zVIVINToTJ1x5sX35cOTL/TkyEYK4=;
 b=vZJh22fkqgxxzQYvoRgM2gvXtNWcFHA4w/ZhpXhg3KcO5ZYtjNKkseZoctyABSvJYM
 JNXexdB8b7YXqUh/5OWvK48RZeoIDCCWPoWronkJubu2sqLNjPQOW88bdogK8PEQiGMc
 zo18n9fcq58uSAzG5iop6qietQv3MER71K3ppvb1yVZfJU6VdcoOQw+MQJ5O8306Lvma
 zamrxMsrIEPwYPooRGHEPa8l06Q2BaP/8XZRivdDkyAdSFUNR7NzuEmlMhamIM5YXg0N
 xZpBDhwzk3jHq7UNVDBVdogplW0YEikZzTMBBfQpXXSVQWmKU8oFYxHSHbA6GbytzTEi
 Eqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JG2kah723rKt+6zVIVINToTJ1x5sX35cOTL/TkyEYK4=;
 b=K10pOgvkoaBkjTAEbSVtnJqkbrjuXb2uhpw0aSTkLaK/xMI/tVd0x0yZxn3kpUzOzL
 tcFHLptiopKpBBK4IJr9N0H0J4gmMzE9WKMabuB+IBkoSBbpkDIvIdDZpL/m5DQVoad6
 7GfgmJnq2vDFzbI0WYFzAoVwK/6qJZreZTnh3FN0nYYn2Hcv87uSRyr8aHdub1ajMKHx
 eDCpts5XbB6Yx+Yx7LEjIza73DbRc3LJf8Zq5lwfT07q3C9nAqbzmhpvtJQj13yUX1hE
 wvcSX/oW+r/7uGNt2exqw/HIIUy1GCqGN9uDD7Dbe2X+eowlJoq6UjqKYaT8Oi0QcJcX
 4d7Q==
X-Gm-Message-State: APjAAAWHwQbTt2UOaIKT7ErJYD1LvvML71tbaI9W/LEpysxHAZJBAL0c
 j2vdwIIHjlRdpx+8GV05FuiVDA==
X-Google-Smtp-Source: APXvYqwBEr5yG88UvIos7c0fJnIW12gLKqi73L00zTVXIyfiLBv41bjumlNMgrgZkorOKeNy3+7XIw==
X-Received: by 2002:a5d:4e50:: with SMTP id r16mr189913wrt.197.1557926342964; 
 Wed, 15 May 2019 06:19:02 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b206sm2789848wmd.28.2019.05.15.06.19.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 06:19:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed, 15 May 2019 15:18:53 +0200
Message-Id: <20190515131858.32130-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 0/5] ASoC: meson: add hdmitx glue support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On the Amlogic SoC, there is a glue between the SoC audio outputs and the
input of the embedded Synopsys HDMI controller.

On the g12a, this glue is mostly a couple of muxes to select the i2s and
spdif inputs of the hdmi controller. Each of these inputs may have
different hw_params and fmt which makes our life a little bit more
interesting, especially when switching between to active inputs.

This glue is modeled as codec driver and uses codec-to-codec links to
connect to the Synopsys controller. This allows to use the regular
hdmi-codec driver (used by dw-hdmi i2s).

To avoid glitches while switching input, the trick is to temporarily
force a disconnection of the mux output, which shutdowns the output dai
link. This also ensure that the stream parameters and fmt are updated
when the output is connected back.

Jerome Brunet (5):
  ASoC: meson: axg-card: set link name based on link node name
  ASoC: dapm: allow muxes to force a disconnect
  ASoC: meson: add tohdmitx DT bindings
  ASoC: meson: axg-card: add basic codec-to-codec link support
  ASoC: meson: add g12a tohdmitx control

 .../bindings/sound/amlogic,g12a-tohdmitx.txt  |  55 +++
 .../dt-bindings/sound/meson-g12a-tohdmitx.h   |  13 +
 sound/soc/meson/Kconfig                       |   8 +
 sound/soc/meson/Makefile                      |   2 +
 sound/soc/meson/axg-card.c                    |  31 +-
 sound/soc/meson/g12a-tohdmitx.c               | 413 ++++++++++++++++++
 sound/soc/soc-dapm.c                          |   2 +-
 7 files changed, 518 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
 create mode 100644 include/dt-bindings/sound/meson-g12a-tohdmitx.h
 create mode 100644 sound/soc/meson/g12a-tohdmitx.c

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
