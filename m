Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF5D473A93
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:10:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B29D18AF;
	Tue, 14 Dec 2021 03:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B29D18AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639447843;
	bh=p+Atbx1T0hJL77QhSz5D4sLUKrL5qIphCAu9EgL6L+c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vCbYUcVOaYv3X298Iz19zPii50AMcfOOPhvD5JOhZn9ucRIF6JY7cWaq+rofaJmFv
	 /4O0IoJNay5ZBwBHTqWvds4aFBVISemEUrui4wOSNtS/rf+klXz2AthUHhyTRd9yR3
	 hhhS4MOeSBqZtzjKK84/kDCgYiNNWm5HDShMxZOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FF30F80475;
	Tue, 14 Dec 2021 03:09:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 304C5F80249; Tue, 14 Dec 2021 03:09:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC104F801EC
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC104F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="e/RZbID6"
Received: by mail-pg1-x529.google.com with SMTP id l10so5151840pgm.7
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aGpwxkuxgJlF2ScGoX0mxqTL+SO+4V6cMdr7++0D90s=;
 b=e/RZbID6StMkmoqHk4vZTg26rNxDdELX0xWSGXf1jzrjQNX23EBbLEx3qqyuvPtdNh
 xrwqftVMSFxkidkEdewcaCGY3t/teM4Cp0B/Rm8UojoYYwMulReuRH2Pf9JwqiRT5bNA
 2vqYICKaNcV3G/M2fKMHmKo4qKtepVqr0XjWj7d8J7XilWk5DpHeHtqLto0Uhspghwit
 csipGTag2IU3bam62m79iFHsiVKBPvmXtqjw0+TSxS5NBu+VXeKS6LGB6I1T8T0VkdK7
 vIyPHsKE+UH/MkNBPYPbNVOrV8uWrUjAHzutVHDbNvLQvbabZXQhiMQmCqdMLm4xNZ02
 9sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=aGpwxkuxgJlF2ScGoX0mxqTL+SO+4V6cMdr7++0D90s=;
 b=fwmivMC4yKqDvT74q4hZmvJ7iCZz11rk0cS7bVesroc0gEozrBjK8o/MCVGFZ712os
 e/MGfI565GXs7Aw6A1CC1yx0OY300T5tq4my+4XCOw4QaGeL1eOtbzl3VgnfBN6j1Bz9
 Hkl4RaEhmjiLmfThde68++XzNQeZWNw7JEl8I3tGwYojI94MfBJ4oYM6u7ZRWH105r5m
 WiRJ9p8LLR0HnsTbZIMkHjxko53eIOWDS2+/Fep6qg86lXIv3XoooWJyAAaenE8oC1e1
 EgFzudAH4wbhgxMJ1NwjLq1f8AdI8a9HaYiXOgQn4lBTwe9BFSMktvjvbFggGmBQsZ4T
 c2CA==
X-Gm-Message-State: AOAM533kEeYnn72W8xMscpKXcDK6uzJaNaslyeht9OguuI0qLP5zkQzN
 q3Dwitte8+fOFvkdrbimUMtaPcDKu7E=
X-Google-Smtp-Source: ABdhPJxOSNlG5csE/Drt8lDVAr7De2UuV+S04g0tpnnJWXPxH6YCHHnDmFz5+/St/jTXPdBjG3sqPg==
X-Received: by 2002:aa7:8283:0:b0:49f:a0d0:abcf with SMTP id
 s3-20020aa78283000000b0049fa0d0abcfmr1731630pfm.70.1639447762514; 
 Mon, 13 Dec 2021 18:09:22 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:22 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/22] ASoC: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:21 +0900
Message-Id: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

I'm now posting below patch to ASoC/DT ML,
sorry for my multi post,
but this patch-set is independent from it.

	ASoC: dt-bindings: audio-graph-port: enable both flag/phandle for bitclock/frame-master
	https://lore.kernel.org/r/20211208064852.507977-1-kuninori.morimoto.gx@renesas.com

This patch-set tries to use dev_err_probe() helper function
instead of manual dev_err() code.
I hope ASoC will be more clean code by this patch-set.

	- if (err < 0) {
	-	if (err != -EPROBE_DEFER)
	-		dev_err(...);
	-	return err;
	- }
	+ if (err < 0)
	+	return dev_err_probe(...);

Kuninori Morimoto (22):
  ASoC: codecs: ak4118: Use dev_err_probe() helper
  ASoC: codecs: es7241: Use dev_err_probe() helper
  ASoC: codecs: max9759: Use dev_err_probe() helper
  ASoC: codecs: max9860: Use dev_err_probe() helper
  ASoC: codecs: pcm3168a: Use dev_err_probe() helper
  ASoC: codecs: sgtl5000: Use dev_err_probe() helper
  ASoC: codecs: simple-amplifier: Use dev_err_probe() helper
  ASoC: codecs: simple-mux: Use dev_err_probe() helper
  ASoC: codecs: ssm2305: Use dev_err_probe() helper
  ASoC: codecs: tlv320aic31xx: Use dev_err_probe() helper
  ASoC: ateml: Use dev_err_probe() helper
  ASoC: ti: Use dev_err_probe() helper
  ASoC: fsl: Use dev_err_probe() helper
  ASoC: generic: Use dev_err_probe() helper
  ASoC: img: Use dev_err_probe() helper
  ASoC: meson: Use dev_err_probe() helper
  ASoC: mxs: Use dev_err_probe() helper
  ASoC: qcom: Use dev_err_probe() helper
  ASoC: rockchip: Use dev_err_probe() helper
  ASoC: samsung: Use dev_err_probe() helper
  ASoC: stm: Use dev_err_probe() helper
  ASoC: sunxi: Use dev_err_probe() helper

 sound/soc/atmel/mikroe-proto.c          |  6 +--
 sound/soc/atmel/tse850-pcm5142.c        | 32 +++++--------
 sound/soc/codecs/ak4118.c               | 18 +++----
 sound/soc/codecs/es7241.c               | 28 ++++-------
 sound/soc/codecs/max9759.c              | 28 ++++-------
 sound/soc/codecs/max9860.c              | 12 ++---
 sound/soc/codecs/pcm3168a.c             | 22 +++------
 sound/soc/codecs/sgtl5000.c             |  5 +-
 sound/soc/codecs/simple-amplifier.c     | 10 ++--
 sound/soc/codecs/simple-mux.c           | 10 ++--
 sound/soc/codecs/ssm2305.c              | 11 ++---
 sound/soc/codecs/tlv320aic31xx.c        | 16 ++-----
 sound/soc/fsl/fsl-asoc-card.c           |  3 +-
 sound/soc/fsl/imx-card.c                | 17 +++----
 sound/soc/fsl/imx-sgtl5000.c            |  4 +-
 sound/soc/fsl/imx-spdif.c               |  4 +-
 sound/soc/generic/audio-graph-card.c    |  5 +-
 sound/soc/generic/audio-graph-card2.c   |  4 +-
 sound/soc/generic/simple-card.c         |  3 +-
 sound/soc/img/img-i2s-in.c              |  8 ++--
 sound/soc/img/img-i2s-out.c             | 24 ++++------
 sound/soc/img/img-parallel-out.c        | 24 ++++------
 sound/soc/img/img-spdif-in.c            |  8 ++--
 sound/soc/img/img-spdif-out.c           | 24 ++++------
 sound/soc/img/pistachio-internal-dac.c  |  9 ++--
 sound/soc/meson/aiu.c                   | 36 +++++---------
 sound/soc/meson/axg-fifo.c              | 16 ++-----
 sound/soc/meson/axg-pdm.c               | 25 +++-------
 sound/soc/meson/axg-spdifin.c           | 17 ++-----
 sound/soc/meson/axg-spdifout.c          | 17 ++-----
 sound/soc/meson/axg-tdm-formatter.c     | 50 ++++++--------------
 sound/soc/meson/axg-tdm-interface.c     | 25 +++-------
 sound/soc/meson/meson-card-utils.c      |  8 ++--
 sound/soc/meson/t9015.c                 | 14 ++----
 sound/soc/mxs/mxs-sgtl5000.c            |  8 +---
 sound/soc/qcom/common.c                 | 10 ++--
 sound/soc/rockchip/rk3288_hdmi_analog.c | 10 ++--
 sound/soc/samsung/aries_wm8994.c        | 17 +++----
 sound/soc/samsung/arndale.c             |  5 +-
 sound/soc/samsung/littlemill.c          |  5 +-
 sound/soc/samsung/lowland.c             |  5 +-
 sound/soc/samsung/odroid.c              |  4 +-
 sound/soc/samsung/smdk_wm8994.c         |  4 +-
 sound/soc/samsung/smdk_wm8994pcm.c      |  4 +-
 sound/soc/samsung/snow.c                |  9 ++--
 sound/soc/samsung/speyside.c            |  5 +-
 sound/soc/samsung/tm2_wm5110.c          |  3 +-
 sound/soc/samsung/tobermory.c           |  5 +-
 sound/soc/stm/stm32_i2s.c               | 62 +++++++++----------------
 sound/soc/stm/stm32_sai.c               | 37 ++++++---------
 sound/soc/stm/stm32_sai_sub.c           | 25 ++++------
 sound/soc/stm/stm32_spdifrx.c           | 44 ++++++------------
 sound/soc/sunxi/sun4i-codec.c           |  3 +-
 sound/soc/ti/davinci-mcasp.c            | 10 ++--
 sound/soc/ti/j721e-evm.c                | 10 ++--
 55 files changed, 271 insertions(+), 557 deletions(-)

-- 
2.25.1

