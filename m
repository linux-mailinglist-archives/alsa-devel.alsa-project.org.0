Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B7A400824
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Sep 2021 01:17:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50D991685;
	Sat,  4 Sep 2021 01:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50D991685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630711044;
	bh=eaI4agEioOZz7KuRzRMHQBUGTVowv+rL6Gq02Z22g44=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CwisVXBlcvj8Wzo+V4WaLMmxgK94lo+3qYr7O1HDU822JmqILSAmT5hXPVMT/EFbf
	 c342+Mt9CUN3wxGaxWtiNC+enfqDviTgO6hkYj4QrtlqkMcJCkKMQYKty6N5L9XmNC
	 0OZavnl8nBWGYaGz96E9k/1hcbwqOP3lgdDHgGkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA852F80088;
	Sat,  4 Sep 2021 01:16:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E44DFF80227; Sat,  4 Sep 2021 01:16:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A341F80088
 for <alsa-devel@alsa-project.org>; Sat,  4 Sep 2021 01:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A341F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JW9vigKQ"
Received: by mail-ed1-x52a.google.com with SMTP id i6so1000933edu.1
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 16:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jmzC+5W6PuoiEpav3LGA2I32fo489OxZqYaZooLG7lc=;
 b=JW9vigKQ9309eJ+4y0IuwAsEGHtBo0JNhyp6fuYUHUT5VzmDppgkuFLZY9CskFv3Nn
 D9Xvg+z9cCH516mv5CxaYqAuffRObxMfD/dmf3Lq0g8409t8Qx9CLn/+iwOHqSnHUyMH
 D81K+B9bzIRu7FWG6z4aURM0KwnMfzhcb69HmmCnoVFPEO26g/Fpu0DmE9zjZrmoDrcK
 Mo6nBezyBIzCDkKLQoeMw+50JO33I7LUH8u+wiqGJp2vz4LzQVp3kMPiZFUfCt9MmBjt
 s5C+1jbesgw8GOWIBClSlh7Y+VCFmB5KylowId03JBvKT8Jk728apL9jZj7imQfvqCfr
 rDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jmzC+5W6PuoiEpav3LGA2I32fo489OxZqYaZooLG7lc=;
 b=Qd7OMky6vhhJqpI1zUVcfFkk47yojQtekwREBbYHfDB8mrMQMrgc1GhNVjRF/t1SVt
 MextSgNsx9ULUiYJoZV9o1RdnNsdeggw+Qiq/ELzYy9Za52WJo6vHaVI7Zln070dh9wV
 nUaZ9Cynbz9orhC/I323uVLLZi6ZZ6j3FUPcDhojMrOdXjKuCD+Js9Wt8RCmBTQL73vq
 YpnDN8fe/yb7E7UjEMP6fxmRW3xr5trV2sqPBGmh9el0OStrRy59YPAV1UY7rQYcUsqJ
 XHfsXiaH89IPBzGetrgYuIk904MZ9eb+PRcIgiBDS67i+hnUJ5Dy0CR+g99z2UQnxHNi
 PeBg==
X-Gm-Message-State: AOAM533MEmOBXsC/QIU+d8JiXt04uvHjOEiVWCMJWCwilnnWXDJ8m9+Z
 sDX+KzH2TmlahMlBJD5MTFg=
X-Google-Smtp-Source: ABdhPJyuRQaZGIsIbO9A9TerzEbIgATo1E295j/y36AwMPBpvYThnT+om998V6J+4YfapTYZekoU0A==
X-Received: by 2002:a05:6402:4cb:: with SMTP id
 n11mr1413449edw.292.1630710957408; 
 Fri, 03 Sep 2021 16:15:57 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id r11sm214068ejy.71.2021.09.03.16.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 16:15:56 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: 
Subject: [PATCH v4 0/4] Rockchip I2S/TDM controller
Date: Sat,  4 Sep 2021 01:15:32 +0200
Message-Id: <20210903231536.225540-1-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

this is version 4 of the I2S/TDM driver patchset. A big thanks
to everyone who has provided their valuable feedback so far.

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
  dt-bindings: sound: add rockchip i2s-tdm binding
  arm64: dts: rockchip: add i2s1 on rk356x
  arm64: dts: rockchip: add analog audio on Quartz64

 .../bindings/sound/rockchip,i2s-tdm.yaml      |  218 ++
 MAINTAINERS                                   |    7 +
 .../boot/dts/rockchip/rk3566-quartz64-a.dts   |   35 +-
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      |   26 +
 sound/soc/rockchip/Kconfig                    |   11 +
 sound/soc/rockchip/Makefile                   |    2 +
 sound/soc/rockchip/rockchip_i2s_tdm.c         | 1832 +++++++++++++++++
 sound/soc/rockchip/rockchip_i2s_tdm.h         |  398 ++++
 8 files changed, 2528 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
 create mode 100644 sound/soc/rockchip/rockchip_i2s_tdm.c
 create mode 100644 sound/soc/rockchip/rockchip_i2s_tdm.h

-- 
2.33.0

