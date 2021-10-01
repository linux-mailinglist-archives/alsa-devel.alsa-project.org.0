Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6256F41F2E3
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 19:17:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E56B416D6;
	Fri,  1 Oct 2021 19:16:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E56B416D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633108655;
	bh=eJ7Bp8R4r0S1kLb3bUvQ94vZPhgNOr1tbkpAkYE9ALY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uOBSpBHixesQ03GHMVJFHnQvKqfAi7l9R6fPNiDRIAFEoEX6haxrTbUCuIukNG4My
	 IKsvnXcLPvPRsexOhcEesivpt68qtUEboB1QFu1TZO+aA0CiUNyEwk+tvm/L4aJ7L7
	 Er7ldbK0KbP2gW61Tkow7lmlB5XjwwcIF04SUkLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FC97F80165;
	Fri,  1 Oct 2021 19:16:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17CDBF80245; Fri,  1 Oct 2021 19:16:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 249BEF80165
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 19:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 249BEF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LyeRdr3V"
Received: by mail-ed1-x52c.google.com with SMTP id g8so37450782edt.7
 for <alsa-devel@alsa-project.org>; Fri, 01 Oct 2021 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YfCu/nNwO7AGzA8uGp45U8eywpx0lfbMyI4anCyuLtI=;
 b=LyeRdr3V+ofrVQMoJDopsWuq+NNZNykiMUcYdt6S+eoTlab74HmZfz8t0RoEoPPil4
 vQC4MEDevmmiY0gxmlFT81eQNnoBhiZr878YhZPYF4mjWO5N2Mi+L4I9zSag3z7Fg0pC
 J54fsY2C6OgdNhH6LxH46aB/xxG+uIDyzaoD6xZDajrmNFJ3VNnA+viL3G4nYxXoTxZz
 /kOH5sninpvb/4ttLBcJzPRWLza2NDamVkPmDgApuyC2+/XZCKRc3Yo6zV/w/nrE9OZO
 U8E46qUcpus+2rvvvJqZZIJwZFiEauVl/Z4l1IwTSCG0zQBTbPKdMZNsYdFjC0Erkxk3
 wljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YfCu/nNwO7AGzA8uGp45U8eywpx0lfbMyI4anCyuLtI=;
 b=HpUS4hsNGaEtV+KAOWLxOYRbGuYEN7krI9bQCzQGWFSIrS4opMGN4xmKgu7Ta7f4Gn
 u69vAH82fuk1jaZ5coeXeLyCLWXI0FY+e3jFh/K03sNHkaDtmtnRX50py08boPrNBgLu
 DD5LgNz8YQOxt7R/ca8SeUoqYvSHV3WRuNHj/Q0Uh0jIpGHmn/6kvcHiPKZ6MzRdAJx5
 iakVCK6QGcpFybl8oBDboag9CW0bv6QbGuQWQ/T4CLzpgeJ7RW8P1sOqnc0XN8ZP6ve2
 MSNq2ix45kdXTcDcjKCsTOEGlv/j+qh3DJUR16ri/d++e5LlLoGS1d5wR2kNM6GprYYh
 KnrQ==
X-Gm-Message-State: AOAM5334v3BdNt2IkKpF8wbVnkADCTxJHLfzns5+oHR0MVo1uD09c6ux
 SoBYtnkxwOy+hNEA/Le5Gf0=
X-Google-Smtp-Source: ABdhPJxA92NBJBLyMapmOz4v0fbfmiaX7QSS24orSuF3nZDF9oaOr8tQQkhTejP9C6G1X5Djap2gww==
X-Received: by 2002:a17:906:2cc9:: with SMTP id
 r9mr7744000ejr.138.1633108570339; 
 Fri, 01 Oct 2021 10:16:10 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id h10sm3588130edf.85.2021.10.01.10.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:16:09 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: 
Subject: [PATCH v5 0/4] Rockchip I2S/TDM controller
Date: Fri,  1 Oct 2021 19:15:27 +0200
Message-Id: <20211001171531.178775-1-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
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

Hello,

this is version 5 of the I2S/TDM driver patchset. A big thanks
to everyone who has provided their valuable feedback so far.

Changes in v5:
 driver:
 - change comment style of the first comment to C++ style
 - make refcount non-atomic, as it's only ever used inside
   a spinlock
 - use newer SND_SOC_DAIFMT_CB* defines
 - change ternary statements to if/else conditions
 - make _clk_compensation_put return 1 if clock changed
 - implement set_bclk_ratio callback
 - always set half frame sync mode in TDM mode
 - automatically enable mclk-calibrate mode when the clocks for
   it are specified in the device tree
 bindings:
 - add Reviewed-by: Rob Herring
 - drop rockchip,frame-width property (done by set_bclk_ratio)
 - drop rockchip,fsync-half-frame property
 - drop rockchip,mclk-calibrate property
 dts:
 - drop empty codec block from Quartz64 device tree

Changes in v4:
 driver:
 - factor TDE/RDE enable/disable into their own inlined functions
 - add an RDE disable in a location where it looks like it was
   forgotten (rxctrl else), judging by corresponding TDE code
 - remove parentheses around CLK_PPM_MIN/MAX values
 - wording + titlecasing in the clock compensation control
 - use if statement in precious_reg instead
 - refactor rockchip_i2s_io_multiplex to have the switch statements
   in a function call to make the function less unwieldy
 - get rid of IS_ERR checks around clk enable/disable calls where
   already checked before by the probe
 - reworded some error message strings
 - fix potential deadlock in txrxctrl found by Sugar Zhang
   using spin_lock_irqsave
 - fix potential deadlock in trcm_mode found by Sugar Zhang
   using spin_lock_irqsave
 - use devm_platform_get_and_ioremap_resource in probe
 - only set DMA things if controller has capture/playback ability.
   Did not move this into init_dai because I'd then need to pass in
   the res and probe it earlier in the function, and it's also used
   elsewhere in the probe function
 - use _get_optional_exclusive for reset controls, as some controllers
   only have capture or playback capability
 bindings:
 - remove status = "okay" since that's the default
 - change the path configs to be an enum
 - rename "foo" to "bus"
 - make resets optional as controller may lack either playback or
   capture capability, and therefore also doesn't have a reset.
   At least one reset is still required, because a controller with
   no playback and no capture is not very useful

Changes in v3:
 driver:
 - alphabetically sort includes
 - check pm_runtime_get_sync return value, act on it
 - remove unnecessary initialisers in set_fmt
 - use udelay(15) in retry code: 10 retries * 15 = 150, so at worst
   we wait the full i2s register access delay
 - fix some weird returns to return directly
 - use __maybe_unused instead of #ifdef CONFIG_PM_SLEEP, also put
   __maybe_unused on the runtime callbacks
 - use (foo) instead of foo in header macros for precedence reasons
 - when using mclk-calibrate, also turn off/on those clocks during
   suspend and resume operations
 - remove mclk_tx and mclk_rx reenablement code in remove
 - move hclk enablement further down the probe, and disable it
   on probe failure
 - make reset controls mandatory, since the bindings state this too
 - use _exclusive for getting the reset controls
 - change reset assert/deassert delays to both be 10 usec
   (thank you Sugar Zhang!)
 - properly prepare and enable all mclks in probe, especially before
   calling clk_get_rate on them
 - if registering PCM fails, also use the cleanup error path instead of
   returning directly
 - bring back playback and capture only but in the way Sugar Zhang
   suggested it: set those modes depending on dma-names
 - rework clock enablement in general. Probe now always enables these,
   instead of relying on the pm resume thing
 - add myself to MAINTAINERS for this driver
 dt bindings:
 - fix a description still mentioning clk-trcm in the schema
 - document rockchip,io-multiplex, a property that describes the
   hardware as having multiplexed I2S GPIOs so direction needs to
   be changed dynamically
 - document rockchip,mclk-calibrate, which allows specifying
   different clocks for the two sample rate bases and switch between
   them as needed
 - dma-names now doesn't have a set order and items can be absent to
   indicate that the controller doesn't support this mode
 - add myself to MAINTAINERS for these bindings

Changes in v2:
 - remove ad-hoc writeq and needless (and broken) optimisation in
   reset assert/deassert. This wouldn't have worked on Big Endian,
   and would've been pointless on any other platform, as the
   overhead for saving one write was comparatively big
 - fix various checkpatch issues
 - get rid of leftover clk-trcm in schema
 - set status = "okay" in example in schema instead of "disabled"
 - change dma-names so rx is first, adjust device trees as necessary
 - properly reference uint32-array for rx-route and tx-route
   instead of uint32
 - replace trcm-sync with two boolean properties, adjust DT changes
   accordingly and also get rid of the header file
 - get rid of rockchip,no-dmaengine. This was only needed for
   some downstream driver and shouldn't be in the DT
 - get rid of rockchip,capture-only/playback-only. Rationale being
   that I have no way to test whether they're needed, and
   unconditionally setting channels_min to 0 breaks everything
 - change hclk description in "clocks"

Nicolas Frattaroli (4):
  ASoC: rockchip: add support for i2s-tdm controller
  ASoC: dt-bindings: rockchip: add i2s-tdm bindings
  arm64: dts: rockchip: add i2s1 on rk356x
  arm64: dts: rockchip: add analog audio on Quartz64

 .../bindings/sound/rockchip,i2s-tdm.yaml      |  198 ++
 MAINTAINERS                                   |    7 +
 .../boot/dts/rockchip/rk3566-quartz64-a.dts   |   31 +-
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      |   26 +
 sound/soc/rockchip/Kconfig                    |   11 +
 sound/soc/rockchip/Makefile                   |    2 +
 sound/soc/rockchip/rockchip_i2s_tdm.c         | 1848 +++++++++++++++++
 sound/soc/rockchip/rockchip_i2s_tdm.h         |  398 ++++
 8 files changed, 2520 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
 create mode 100644 sound/soc/rockchip/rockchip_i2s_tdm.c
 create mode 100644 sound/soc/rockchip/rockchip_i2s_tdm.h

-- 
2.33.0

