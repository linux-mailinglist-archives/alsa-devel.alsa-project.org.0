Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9350F15C493
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 16:53:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C111168D;
	Thu, 13 Feb 2020 16:53:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C111168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581609237;
	bh=8BVh/FAJl4f2MoBJq1xR16dr9XYU9HXgHRGRj1NfH+4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tiFWXHRjFsURWxBglhyux8nB5i0hAUpGuh9x/XnXBf2ooDYRbU36wl8nSATBfQ2+r
	 ABl//aILfLOUIjpJvQFShz4Em/EaseXovn2lxYzb6zWjIhekT+6Qbn/pF+IBZp5Nrq
	 0HdFr8hJl5P7hzrZG99bRGL81tUXqTTCeJ0jrG0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B59FF80218;
	Thu, 13 Feb 2020 16:52:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D08D5F80146; Thu, 13 Feb 2020 16:52:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B3F2F80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 16:52:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B3F2F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="rmDCMt8j"
Received: by mail-wr1-x441.google.com with SMTP id z3so7323158wru.3
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 07:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qRSNHxPBZ1IexXWr4sAA9opPLPtOEFKsiR173BgPSbE=;
 b=rmDCMt8johXf39HuPfvbW10KGlsza5f82dM90WRh/o8esX8OkRNxItKTtPH80Aw7PK
 w6hwn7YXoxCrjoydoLYw8KB+l8rFn0HuY1RWsVR55UzJk4jRrYmR0OqOv9+dllAqoqYI
 IUfZtCwBYWOyibEPrFjbOgM10K11SHeVgTIQpGfnGO+gTk83bitTdzbao0Hgi3r5l3QQ
 a1WcFJOjDtt1x0Fyxqw2UUXZYfxowjJxu3tleaFrPidLlZzONnLFrhPM+kmdV1h3aYm0
 VscLAall4oZEcfJFTKX3LM8+AuGIbObycMU9LRQADS9nEzZrQVzTo3ETriJPaan58JVT
 NeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qRSNHxPBZ1IexXWr4sAA9opPLPtOEFKsiR173BgPSbE=;
 b=p4QPIaCNKMhV730wMG3WYT4C3JUWQBdXAT5yfE2BRPTlfDsxL5C85o7WMIQAzsQifT
 fLzDVcFHzd5S5JpVspvTadMw/5TyLNHAQDp7Ft5MMdby8gFYSiIIEk9i1pmSX5PYrw1u
 wSo+YFeY4pyXlJ1GjSc24lxNCdwNaWc1LLizp7tCs1N8WINIYmbODzjU1ojVfwD0ceT8
 EKQr6YnLfKw+8aDyk3wh8010fVj9G25JnTgO+05bzKcoTiw2xbFGQa+QnAOWw5fFk5t7
 DeNAdSLGmzn51Er9wMOGoDU4TyP6xgvOPFeGzVOfAEM4DpRF8NrVqgdyzCc43kbTikPd
 BIjg==
X-Gm-Message-State: APjAAAWRcfpOYb+t1UO5x2to6fb7cSDVRaqUNfS5ir7lPVg4gYxoeMTP
 qBqHOAsFJYcyQoiXYHYsaCFx6Q==
X-Google-Smtp-Source: APXvYqzaEZ72W0WraKrTyInOswcFFpztUeMtekBYMK7/Qvo39kr8aI6aa2+adZuUr6wwgRuldPDSzw==
X-Received: by 2002:adf:dd51:: with SMTP id u17mr21617587wrm.290.1581609127423; 
 Thu, 13 Feb 2020 07:52:07 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e1sm3319814wrt.84.2020.02.13.07.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:52:06 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Thu, 13 Feb 2020 16:51:50 +0100
Message-Id: <20200213155159.3235792-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 0/9] ASoC: meson: gx: add audio output support
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

This patchset adds support for the i2s and spdif audio outputs of the
amlogic GX SoC family, such the S905, S905X/D, S912 and S805X. These SoCs
are used by a fair amount of boards actively maintained upstream.

This was tested on:
 * amlogic s912 q200
 * libretech s805x-ac (frite)
 * libretech s905x-cc (potato)
 * libretech s905d-pc (tartiflette)

This could also possibly support meson8 32bits SoCs but I have not tested
it myself and it could require some further tweaks.

The audio subsystem found on these SoCs has now been dropped in the newer
designs. All recent SoCs families (like g12a and sm1) derive from the AXG
audio architecture.

Jerome Brunet (9):
  ASoC: core: allow a dt node to provide several components
  ASoC: meson: g12a: extract codec-to-codec utils
  ASoC: meson: aiu: add audio output dt-bindings
  ASoC: meson: aiu: add i2s and spdif support
  ASoC: meson: aiu: add hdmi codec control support
  ASoC: meson: aiu: add internal dac codec control support
  ASoC: meson: axg: extract sound card utils
  ASoC: meson: gx: add sound card dt-binding documentation
  ASoC: meson: gx: add sound card support

 .../bindings/sound/amlogic,aiu.yaml           | 111 +++++
 .../bindings/sound/amlogic,gx-sound-card.yaml | 113 +++++
 include/dt-bindings/sound/meson-aiu.h         |  18 +
 sound/soc/meson/Kconfig                       |  24 ++
 sound/soc/meson/Makefile                      |  15 +
 sound/soc/meson/aiu-acodec-ctrl.c             | 205 +++++++++
 sound/soc/meson/aiu-codec-ctrl.c              | 152 +++++++
 sound/soc/meson/aiu-encoder-i2s.c             | 324 ++++++++++++++
 sound/soc/meson/aiu-encoder-spdif.c           | 209 +++++++++
 sound/soc/meson/aiu-fifo-i2s.c                | 153 +++++++
 sound/soc/meson/aiu-fifo-spdif.c              | 186 ++++++++
 sound/soc/meson/aiu-fifo.c                    | 223 ++++++++++
 sound/soc/meson/aiu-fifo.h                    |  50 +++
 sound/soc/meson/aiu.c                         | 390 +++++++++++++++++
 sound/soc/meson/aiu.h                         |  91 ++++
 sound/soc/meson/axg-card.c                    | 403 ++----------------
 sound/soc/meson/g12a-tohdmitx.c               | 219 ++--------
 sound/soc/meson/gx-card.c                     | 141 ++++++
 sound/soc/meson/meson-card-utils.c            | 385 +++++++++++++++++
 sound/soc/meson/meson-card.h                  |  55 +++
 sound/soc/meson/meson-codec-glue.c            | 149 +++++++
 sound/soc/meson/meson-codec-glue.h            |  32 ++
 sound/soc/soc-core.c                          |   8 +
 23 files changed, 3104 insertions(+), 552 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
 create mode 100644 include/dt-bindings/sound/meson-aiu.h
 create mode 100644 sound/soc/meson/aiu-acodec-ctrl.c
 create mode 100644 sound/soc/meson/aiu-codec-ctrl.c
 create mode 100644 sound/soc/meson/aiu-encoder-i2s.c
 create mode 100644 sound/soc/meson/aiu-encoder-spdif.c
 create mode 100644 sound/soc/meson/aiu-fifo-i2s.c
 create mode 100644 sound/soc/meson/aiu-fifo-spdif.c
 create mode 100644 sound/soc/meson/aiu-fifo.c
 create mode 100644 sound/soc/meson/aiu-fifo.h
 create mode 100644 sound/soc/meson/aiu.c
 create mode 100644 sound/soc/meson/aiu.h
 create mode 100644 sound/soc/meson/gx-card.c
 create mode 100644 sound/soc/meson/meson-card-utils.c
 create mode 100644 sound/soc/meson/meson-card.h
 create mode 100644 sound/soc/meson/meson-codec-glue.c
 create mode 100644 sound/soc/meson/meson-codec-glue.h

-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
