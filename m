Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E84B445
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:19:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E982F1691;
	Sat, 27 Apr 2019 20:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E982F1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556389174;
	bh=UiqP3vUg0rXLq7yFUnxmnRdvdd57bWrKx+K4/rXDfYE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HIFtfn/brJYESRE7rJPBY1hPeySL7OlSyRqYhX6KLbaADGlCtgk8snTBSUX9bl3CL
	 4MR804a6NuY6yOYK5XaVj1TeDUsbKyz1Eefx8M3jxpefUGntgMA52Kn6E2PzjK3aMQ
	 6saASJDCOO+b7fMtCTYBDN1dIZxsGaXeee32CaZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 046E6F89873;
	Sat, 27 Apr 2019 19:55:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06648F89779; Sat, 27 Apr 2019 19:54:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDDE2F896DD;
 Sat, 27 Apr 2019 19:53:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDDE2F896DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="SO5zhbSs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Vt2uyioe03Vzm33Mye0ShcHKHenQMtD/8Zirx58M5KM=; b=SO5zhbSsKhW6
 lWdCByqUa3Js6b7ojE4gz/fPGYTEhrQyJa2DUUjodaFQVRuf+yk8nvE05uy+XGEQxqOBikcEDpbTa
 YIUX7Kba8vaYnonr4gR1+buYOIhMrEzacnhP8/bD/rw08PGTO4Xsi3w8EbL4IrZQdJZduF0k0MlgF
 3dpCk=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVZ-0004rF-S8; Sat, 27 Apr 2019 17:53:06 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 9D128441D56; Sat, 27 Apr 2019 18:53:02 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160519.30207-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175302.9D128441D56@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:53:02 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add support for IPC IO between DSP
	and Host" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Add support for IPC IO between DSP and Host

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 53e0c72d98ba3eae314c32476103eac47612aa58 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:05:09 -0500
Subject: [PATCH] ASoC: SOF: Add support for IPC IO between DSP and Host

Define an IPC ABI for all host <--> DSP communication. This ABI should
be transport agnostic. i.e. it should work on MMIO and SPI/I2C style
interfaces.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof/control.h   | 158 +++++++
 include/sound/sof/dai-intel.h | 178 ++++++++
 include/sound/sof/dai.h       |  75 +++
 include/sound/sof/header.h    | 158 +++++++
 include/sound/sof/info.h      | 118 +++++
 include/sound/sof/pm.h        |  48 ++
 include/sound/sof/stream.h    | 148 ++++++
 include/sound/sof/trace.h     |  67 +++
 sound/soc/sof/ipc.c           | 832 ++++++++++++++++++++++++++++++++++
 9 files changed, 1782 insertions(+)
 create mode 100644 include/sound/sof/control.h
 create mode 100644 include/sound/sof/dai-intel.h
 create mode 100644 include/sound/sof/dai.h
 create mode 100644 include/sound/sof/header.h
 create mode 100644 include/sound/sof/info.h
 create mode 100644 include/sound/sof/pm.h
 create mode 100644 include/sound/sof/stream.h
 create mode 100644 include/sound/sof/trace.h
 create mode 100644 sound/soc/sof/ipc.c

diff --git a/include/sound/sof/control.h b/include/sound/sof/control.h
new file mode 100644
index 000000000000..bded69e696d4
--- /dev/null
+++ b/include/sound/sof/control.h
@@ -0,0 +1,158 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INCLUDE_SOUND_SOF_CONTROL_H__
+#define __INCLUDE_SOUND_SOF_CONTROL_H__
+
+#include <uapi/sound/sof/header.h>
+#include <sound/sof/header.h>
+
+/*
+ * Component Mixers and Controls
+ */
+
+/* channel positions - uses same values as ALSA */
+enum sof_ipc_chmap {
+	SOF_CHMAP_UNKNOWN = 0,
+	SOF_CHMAP_NA,		/**< N/A, silent */
+	SOF_CHMAP_MONO,		/**< mono stream */
+	SOF_CHMAP_FL,		/**< front left */
+	SOF_CHMAP_FR,		/**< front right */
+	SOF_CHMAP_RL,		/**< rear left */
+	SOF_CHMAP_RR,		/**< rear right */
+	SOF_CHMAP_FC,		/**< front centre */
+	SOF_CHMAP_LFE,		/**< LFE */
+	SOF_CHMAP_SL,		/**< side left */
+	SOF_CHMAP_SR,		/**< side right */
+	SOF_CHMAP_RC,		/**< rear centre */
+	SOF_CHMAP_FLC,		/**< front left centre */
+	SOF_CHMAP_FRC,		/**< front right centre */
+	SOF_CHMAP_RLC,		/**< rear left centre */
+	SOF_CHMAP_RRC,		/**< rear right centre */
+	SOF_CHMAP_FLW,		/**< front left wide */
+	SOF_CHMAP_FRW,		/**< front right wide */
+	SOF_CHMAP_FLH,		/**< front left high */
+	SOF_CHMAP_FCH,		/**< front centre high */
+	SOF_CHMAP_FRH,		/**< front right high */
+	SOF_CHMAP_TC,		/**< top centre */
+	SOF_CHMAP_TFL,		/**< top front left */
+	SOF_CHMAP_TFR,		/**< top front right */
+	SOF_CHMAP_TFC,		/**< top front centre */
+	SOF_CHMAP_TRL,		/**< top rear left */
+	SOF_CHMAP_TRR,		/**< top rear right */
+	SOF_CHMAP_TRC,		/**< top rear centre */
+	SOF_CHMAP_TFLC,		/**< top front left centre */
+	SOF_CHMAP_TFRC,		/**< top front right centre */
+	SOF_CHMAP_TSL,		/**< top side left */
+	SOF_CHMAP_TSR,		/**< top side right */
+	SOF_CHMAP_LLFE,		/**< left LFE */
+	SOF_CHMAP_RLFE,		/**< right LFE */
+	SOF_CHMAP_BC,		/**< bottom centre */
+	SOF_CHMAP_BLC,		/**< bottom left centre */
+	SOF_CHMAP_BRC,		/**< bottom right centre */
+	SOF_CHMAP_LAST = SOF_CHMAP_BRC,
+};
+
+/* control data type and direction */
+enum sof_ipc_ctrl_type {
+	/*  per channel data - uses struct sof_ipc_ctrl_value_chan */
+	SOF_CTRL_TYPE_VALUE_CHAN_GET = 0,
+	SOF_CTRL_TYPE_VALUE_CHAN_SET,
+	/* component data - uses struct sof_ipc_ctrl_value_comp */
+	SOF_CTRL_TYPE_VALUE_COMP_GET,
+	SOF_CTRL_TYPE_VALUE_COMP_SET,
+	/* bespoke data - uses struct sof_abi_hdr */
+	SOF_CTRL_TYPE_DATA_GET,
+	SOF_CTRL_TYPE_DATA_SET,
+};
+
+/* control command type */
+enum sof_ipc_ctrl_cmd {
+	SOF_CTRL_CMD_VOLUME = 0, /**< maps to ALSA volume style controls */
+	SOF_CTRL_CMD_ENUM,	/**< maps to ALSA enum style controls */
+	SOF_CTRL_CMD_SWITCH,	/**< maps to ALSA switch style controls */
+	SOF_CTRL_CMD_BINARY,	/**< maps to ALSA binary style controls */
+};
+
+/* generic channel mapped value data */
+struct sof_ipc_ctrl_value_chan {
+	uint32_t channel;	/**< channel map - enum sof_ipc_chmap */
+	uint32_t value;
+} __packed;
+
+/* generic component mapped value data */
+struct sof_ipc_ctrl_value_comp {
+	uint32_t index;	/**< component source/sink/control index in control */
+	union {
+		uint32_t uvalue;
+		int32_t svalue;
+	};
+} __packed;
+
+/* generic control data */
+struct sof_ipc_ctrl_data {
+	struct sof_ipc_reply rhdr;
+	uint32_t comp_id;
+
+	/* control access and data type */
+	uint32_t type;		/**< enum sof_ipc_ctrl_type */
+	uint32_t cmd;		/**< enum sof_ipc_ctrl_cmd */
+	uint32_t index;		/**< control index for comps > 1 control */
+
+	/* control data - can either be appended or DMAed from host */
+	struct sof_ipc_host_buffer buffer;
+	uint32_t num_elems;	/**< in array elems or bytes for data type */
+	uint32_t elems_remaining;	/**< elems remaining if sent in parts */
+
+	uint32_t msg_index;	/**< for large messages sent in parts */
+
+	/* reserved for future use */
+	uint32_t reserved[6];
+
+	/* control data - add new types if needed */
+	union {
+		/* channel values can be used by volume type controls */
+		struct sof_ipc_ctrl_value_chan chanv[0];
+		/* component values used by routing controls like mux, mixer */
+		struct sof_ipc_ctrl_value_comp compv[0];
+		/* data can be used by binary controls */
+		struct sof_abi_hdr data[0];
+	};
+} __packed;
+
+/** Event type */
+enum sof_ipc_ctrl_event_type {
+	SOF_CTRL_EVENT_GENERIC = 0,	/**< generic event */
+	SOF_CTRL_EVENT_GENERIC_METADATA,	/**< generic event with metadata */
+	SOF_CTRL_EVENT_KD,	/**< keyword detection event */
+	SOF_CTRL_EVENT_VAD,	/**< voice activity detection event */
+};
+
+/**
+ * Generic notification data.
+ */
+struct sof_ipc_comp_event {
+	struct sof_ipc_reply rhdr;
+	uint16_t src_comp_type;	/**< COMP_TYPE_ */
+	uint32_t src_comp_id;	/**< source component id */
+	uint32_t event_type;	/**< event type - SOF_CTRL_EVENT_* */
+	uint32_t num_elems;	/**< in array elems or bytes for data type */
+
+	/* reserved for future use */
+	uint32_t reserved[8];
+
+	/* control data - add new types if needed */
+	union {
+		/* data can be used by binary controls */
+		struct sof_abi_hdr data[0];
+		/* event specific values */
+		uint32_t event_value;
+	};
+} __packed;
+
+#endif
diff --git a/include/sound/sof/dai-intel.h b/include/sound/sof/dai-intel.h
new file mode 100644
index 000000000000..4bd83f7adddf
--- /dev/null
+++ b/include/sound/sof/dai-intel.h
@@ -0,0 +1,178 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INCLUDE_SOUND_SOF_DAI_INTEL_H__
+#define __INCLUDE_SOUND_SOF_DAI_INTEL_H__
+
+#include <sound/sof/header.h>
+
+ /* ssc1: TINTE */
+#define SOF_DAI_INTEL_SSP_QUIRK_TINTE		(1 << 0)
+ /* ssc1: PINTE */
+#define SOF_DAI_INTEL_SSP_QUIRK_PINTE		(1 << 1)
+ /* ssc2: SMTATF */
+#define SOF_DAI_INTEL_SSP_QUIRK_SMTATF		(1 << 2)
+ /* ssc2: MMRATF */
+#define SOF_DAI_INTEL_SSP_QUIRK_MMRATF		(1 << 3)
+ /* ssc2: PSPSTWFDFD */
+#define SOF_DAI_INTEL_SSP_QUIRK_PSPSTWFDFD	(1 << 4)
+ /* ssc2: PSPSRWFDFD */
+#define SOF_DAI_INTEL_SSP_QUIRK_PSPSRWFDFD	(1 << 5)
+/* ssc1: LBM */
+#define SOF_DAI_INTEL_SSP_QUIRK_LBM		(1 << 6)
+
+ /* here is the possibility to define others aux macros */
+
+#define SOF_DAI_INTEL_SSP_FRAME_PULSE_WIDTH_MAX		38
+#define SOF_DAI_INTEL_SSP_SLOT_PADDING_MAX		31
+
+/* SSP clocks control settings
+ *
+ * Macros for clks_control field in sof_ipc_dai_ssp_params struct.
+ */
+
+/* mclk 0 disable */
+#define SOF_DAI_INTEL_SSP_MCLK_0_DISABLE		BIT(0)
+/* mclk 1 disable */
+#define SOF_DAI_INTEL_SSP_MCLK_1_DISABLE		BIT(1)
+/* mclk keep active */
+#define SOF_DAI_INTEL_SSP_CLKCTRL_MCLK_KA		BIT(2)
+/* bclk keep active */
+#define SOF_DAI_INTEL_SSP_CLKCTRL_BCLK_KA		BIT(3)
+/* fs keep active */
+#define SOF_DAI_INTEL_SSP_CLKCTRL_FS_KA			BIT(4)
+/* bclk idle */
+#define SOF_DAI_INTEL_SSP_CLKCTRL_BCLK_IDLE_HIGH	BIT(5)
+
+/* SSP Configuration Request - SOF_IPC_DAI_SSP_CONFIG */
+struct sof_ipc_dai_ssp_params {
+	struct sof_ipc_hdr hdr;
+	uint16_t reserved1;
+	uint16_t mclk_id;
+
+	uint32_t mclk_rate;	/* mclk frequency in Hz */
+	uint32_t fsync_rate;	/* fsync frequency in Hz */
+	uint32_t bclk_rate;	/* bclk frequency in Hz */
+
+	/* TDM */
+	uint32_t tdm_slots;
+	uint32_t rx_slots;
+	uint32_t tx_slots;
+
+	/* data */
+	uint32_t sample_valid_bits;
+	uint16_t tdm_slot_width;
+	uint16_t reserved2;	/* alignment */
+
+	/* MCLK */
+	uint32_t mclk_direction;
+
+	uint16_t frame_pulse_width;
+	uint16_t tdm_per_slot_padding_flag;
+	uint32_t clks_control;
+	uint32_t quirks;
+} __packed;
+
+/* HDA Configuration Request - SOF_IPC_DAI_HDA_CONFIG */
+struct sof_ipc_dai_hda_params {
+	struct sof_ipc_hdr hdr;
+	uint32_t link_dma_ch;
+} __packed;
+
+/* DMIC Configuration Request - SOF_IPC_DAI_DMIC_CONFIG */
+
+/* This struct is defined per 2ch PDM controller available in the platform.
+ * Normally it is sufficient to set the used microphone specific enables to 1
+ * and keep other parameters as zero. The customizations are:
+ *
+ * 1. If a device mixes different microphones types with different polarity
+ * and/or the absolute polarity matters the PCM signal from a microphone
+ * can be inverted with the controls.
+ *
+ * 2. If the microphones in a stereo pair do not appear in captured stream
+ * in desired order due to board schematics choises they can be swapped with
+ * the clk_edge parameter.
+ *
+ * 3. If PDM bit errors are seen in capture (poor quality) the skew parameter
+ * that delays the sampling time of data by half cycles of DMIC source clock
+ * can be tried for improvement. However there is no guarantee for this to fix
+ * data integrity problems.
+ */
+struct sof_ipc_dai_dmic_pdm_ctrl {
+	struct sof_ipc_hdr hdr;
+	uint16_t id;		/**< PDM controller ID */
+
+	uint16_t enable_mic_a;	/**< Use A (left) channel mic (0 or 1)*/
+	uint16_t enable_mic_b;	/**< Use B (right) channel mic (0 or 1)*/
+
+	uint16_t polarity_mic_a; /**< Optionally invert mic A signal (0 or 1) */
+	uint16_t polarity_mic_b; /**< Optionally invert mic B signal (0 or 1) */
+
+	uint16_t clk_edge;	/**< Optionally swap data clock edge (0 or 1) */
+	uint16_t skew;		/**< Adjust PDM data sampling vs. clock (0..15) */
+
+	uint16_t reserved[3];	/**< Make sure the total size is 4 bytes aligned */
+} __packed;
+
+/* This struct contains the global settings for all 2ch PDM controllers. The
+ * version number used in configuration data is checked vs. version used by
+ * device driver src/drivers/dmic.c need to match. It is incremented from
+ * initial value 1 if updates done for the to driver would alter the operation
+ * of the microhone.
+ *
+ * Note: The microphone clock (pdmclk_min, pdmclk_max, duty_min, duty_max)
+ * parameters need to be set as defined in microphone data sheet. E.g. clock
+ * range 1.0 - 3.2 MHz is usually supported microphones. Some microphones are
+ * multi-mode capable and there may be denied mic clock frequencies between
+ * the modes. In such case set the clock range limits of the desired mode to
+ * avoid the driver to set clock to an illegal rate.
+ *
+ * The duty cycle could be set to 48-52% if not known. Generally these
+ * parameters can be altered within data sheet specified limits to match
+ * required audio application performance power.
+ *
+ * The microphone clock needs to be usually about 50-80 times the used audio
+ * sample rate. With highest sample rates above 48 kHz this can relaxed
+ * somewhat.
+ *
+ * The parameter wake_up_time describes how long time the microphone needs
+ * for the data line to produce valid output from mic clock start. The driver
+ * will mute the captured audio for the given time. The min_clock_on_time
+ * parameter is used to prevent too short clock bursts to happen. The driver
+ * will keep the clock active after capture stop if this time is not yet
+ * met. The unit for both is microseconds (us). Exceed of 100 ms will be
+ * treated as an error.
+ */
+struct sof_ipc_dai_dmic_params {
+	struct sof_ipc_hdr hdr;
+	uint32_t driver_ipc_version;	/**< Version (1..N) */
+
+	uint32_t pdmclk_min;	/**< Minimum microphone clock in Hz (100000..N) */
+	uint32_t pdmclk_max;	/**< Maximum microphone clock in Hz (min...N) */
+
+	uint32_t fifo_fs;	/**< FIFO sample rate in Hz (8000..96000) */
+	uint32_t reserved_1;	/**< Reserved */
+	uint16_t fifo_bits;	/**< FIFO word length (16 or 32) */
+	uint16_t reserved_2;	/**< Reserved */
+
+	uint16_t duty_min;	/**< Min. mic clock duty cycle in % (20..80) */
+	uint16_t duty_max;	/**< Max. mic clock duty cycle in % (min..80) */
+
+	uint32_t num_pdm_active; /**< Number of active pdm controllers */
+
+	uint32_t wake_up_time;      /**< Time from clock start to data (us) */
+	uint32_t min_clock_on_time; /**< Min. time that clk is kept on (us) */
+
+	/* reserved for future use */
+	uint32_t reserved[6];
+
+	/**< variable number of pdm controller config */
+	struct sof_ipc_dai_dmic_pdm_ctrl pdm[0];
+} __packed;
+
+#endif
diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
new file mode 100644
index 000000000000..3b67c93ff101
--- /dev/null
+++ b/include/sound/sof/dai.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INCLUDE_SOUND_SOF_DAI_H__
+#define __INCLUDE_SOUND_SOF_DAI_H__
+
+#include <sound/sof/header.h>
+#include <sound/sof/dai-intel.h>
+
+/*
+ * DAI Configuration.
+ *
+ * Each different DAI type will have it's own structure and IPC cmd.
+ */
+
+#define SOF_DAI_FMT_I2S		1 /**< I2S mode */
+#define SOF_DAI_FMT_RIGHT_J	2 /**< Right Justified mode */
+#define SOF_DAI_FMT_LEFT_J	3 /**< Left Justified mode */
+#define SOF_DAI_FMT_DSP_A	4 /**< L data MSB after FRM LRC */
+#define SOF_DAI_FMT_DSP_B	5 /**< L data MSB during FRM LRC */
+#define SOF_DAI_FMT_PDM		6 /**< Pulse density modulation */
+
+#define SOF_DAI_FMT_CONT	(1 << 4) /**< continuous clock */
+#define SOF_DAI_FMT_GATED	(0 << 4) /**< clock is gated */
+
+#define SOF_DAI_FMT_NB_NF	(0 << 8) /**< normal bit clock + frame */
+#define SOF_DAI_FMT_NB_IF	(2 << 8) /**< normal BCLK + inv FRM */
+#define SOF_DAI_FMT_IB_NF	(3 << 8) /**< invert BCLK + nor FRM */
+#define SOF_DAI_FMT_IB_IF	(4 << 8) /**< invert BCLK + FRM */
+
+#define SOF_DAI_FMT_CBM_CFM	(0 << 12) /**< codec clk & FRM master */
+#define SOF_DAI_FMT_CBS_CFM	(2 << 12) /**< codec clk slave & FRM master */
+#define SOF_DAI_FMT_CBM_CFS	(3 << 12) /**< codec clk master & frame slave */
+#define SOF_DAI_FMT_CBS_CFS	(4 << 12) /**< codec clk & FRM slave */
+
+#define SOF_DAI_FMT_FORMAT_MASK		0x000f
+#define SOF_DAI_FMT_CLOCK_MASK		0x00f0
+#define SOF_DAI_FMT_INV_MASK		0x0f00
+#define SOF_DAI_FMT_MASTER_MASK		0xf000
+
+/** \brief Types of DAI */
+enum sof_ipc_dai_type {
+	SOF_DAI_INTEL_NONE = 0,		/**< None */
+	SOF_DAI_INTEL_SSP,		/**< Intel SSP */
+	SOF_DAI_INTEL_DMIC,		/**< Intel DMIC */
+	SOF_DAI_INTEL_HDA,		/**< Intel HD/A */
+};
+
+/* general purpose DAI configuration */
+struct sof_ipc_dai_config {
+	struct sof_ipc_cmd_hdr hdr;
+	uint32_t type;		/**< DAI type - enum sof_ipc_dai_type */
+	uint32_t dai_index;	/**< index of this type dai */
+
+	/* physical protocol and clocking */
+	uint16_t format;	/**< SOF_DAI_FMT_ */
+	uint16_t reserved16;	/**< alignment */
+
+	/* reserved for future use */
+	uint32_t reserved[8];
+
+	/* HW specific data */
+	union {
+		struct sof_ipc_dai_ssp_params ssp;
+		struct sof_ipc_dai_dmic_params dmic;
+		struct sof_ipc_dai_hda_params hda;
+	};
+} __packed;
+
+#endif
diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
new file mode 100644
index 000000000000..ccb6a004b37b
--- /dev/null
+++ b/include/sound/sof/header.h
@@ -0,0 +1,158 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INCLUDE_SOUND_SOF_HEADER_H__
+#define __INCLUDE_SOUND_SOF_HEADER_H__
+
+#include <uapi/sound/sof/abi.h>
+
+/** \addtogroup sof_uapi uAPI
+ *  SOF uAPI specification.
+ *  @{
+ */
+
+/*
+ * IPC messages have a prefixed 32 bit identifier made up as follows :-
+ *
+ * 0xGCCCNNNN where
+ * G is global cmd type (4 bits)
+ * C is command type (12 bits)
+ * I is the ID number (16 bits) - monotonic and overflows
+ *
+ * This is sent at the start of the IPM message in the mailbox. Messages should
+ * not be sent in the doorbell (special exceptions for firmware .
+ */
+
+/* Global Message - Generic */
+#define SOF_GLB_TYPE_SHIFT			28
+#define SOF_GLB_TYPE_MASK			(0xf << SOF_GLB_TYPE_SHIFT)
+#define SOF_GLB_TYPE(x)				((x) << SOF_GLB_TYPE_SHIFT)
+
+/* Command Message - Generic */
+#define SOF_CMD_TYPE_SHIFT			16
+#define SOF_CMD_TYPE_MASK			(0xfff << SOF_CMD_TYPE_SHIFT)
+#define SOF_CMD_TYPE(x)				((x) << SOF_CMD_TYPE_SHIFT)
+
+/* Global Message Types */
+#define SOF_IPC_GLB_REPLY			SOF_GLB_TYPE(0x1U)
+#define SOF_IPC_GLB_COMPOUND			SOF_GLB_TYPE(0x2U)
+#define SOF_IPC_GLB_TPLG_MSG			SOF_GLB_TYPE(0x3U)
+#define SOF_IPC_GLB_PM_MSG			SOF_GLB_TYPE(0x4U)
+#define SOF_IPC_GLB_COMP_MSG			SOF_GLB_TYPE(0x5U)
+#define SOF_IPC_GLB_STREAM_MSG			SOF_GLB_TYPE(0x6U)
+#define SOF_IPC_FW_READY			SOF_GLB_TYPE(0x7U)
+#define SOF_IPC_GLB_DAI_MSG			SOF_GLB_TYPE(0x8U)
+#define SOF_IPC_GLB_TRACE_MSG			SOF_GLB_TYPE(0x9U)
+
+/*
+ * DSP Command Message Types
+ */
+
+/* topology */
+#define SOF_IPC_TPLG_COMP_NEW			SOF_CMD_TYPE(0x001)
+#define SOF_IPC_TPLG_COMP_FREE			SOF_CMD_TYPE(0x002)
+#define SOF_IPC_TPLG_COMP_CONNECT		SOF_CMD_TYPE(0x003)
+#define SOF_IPC_TPLG_PIPE_NEW			SOF_CMD_TYPE(0x010)
+#define SOF_IPC_TPLG_PIPE_FREE			SOF_CMD_TYPE(0x011)
+#define SOF_IPC_TPLG_PIPE_CONNECT		SOF_CMD_TYPE(0x012)
+#define SOF_IPC_TPLG_PIPE_COMPLETE		SOF_CMD_TYPE(0x013)
+#define SOF_IPC_TPLG_BUFFER_NEW			SOF_CMD_TYPE(0x020)
+#define SOF_IPC_TPLG_BUFFER_FREE		SOF_CMD_TYPE(0x021)
+
+/* PM */
+#define SOF_IPC_PM_CTX_SAVE			SOF_CMD_TYPE(0x001)
+#define SOF_IPC_PM_CTX_RESTORE			SOF_CMD_TYPE(0x002)
+#define SOF_IPC_PM_CTX_SIZE			SOF_CMD_TYPE(0x003)
+#define SOF_IPC_PM_CLK_SET			SOF_CMD_TYPE(0x004)
+#define SOF_IPC_PM_CLK_GET			SOF_CMD_TYPE(0x005)
+#define SOF_IPC_PM_CLK_REQ			SOF_CMD_TYPE(0x006)
+#define SOF_IPC_PM_CORE_ENABLE			SOF_CMD_TYPE(0x007)
+
+/* component runtime config - multiple different types */
+#define SOF_IPC_COMP_SET_VALUE			SOF_CMD_TYPE(0x001)
+#define SOF_IPC_COMP_GET_VALUE			SOF_CMD_TYPE(0x002)
+#define SOF_IPC_COMP_SET_DATA			SOF_CMD_TYPE(0x003)
+#define SOF_IPC_COMP_GET_DATA			SOF_CMD_TYPE(0x004)
+
+/* DAI messages */
+#define SOF_IPC_DAI_CONFIG			SOF_CMD_TYPE(0x001)
+#define SOF_IPC_DAI_LOOPBACK			SOF_CMD_TYPE(0x002)
+
+/* stream */
+#define SOF_IPC_STREAM_PCM_PARAMS		SOF_CMD_TYPE(0x001)
+#define SOF_IPC_STREAM_PCM_PARAMS_REPLY		SOF_CMD_TYPE(0x002)
+#define SOF_IPC_STREAM_PCM_FREE			SOF_CMD_TYPE(0x003)
+#define SOF_IPC_STREAM_TRIG_START		SOF_CMD_TYPE(0x004)
+#define SOF_IPC_STREAM_TRIG_STOP		SOF_CMD_TYPE(0x005)
+#define SOF_IPC_STREAM_TRIG_PAUSE		SOF_CMD_TYPE(0x006)
+#define SOF_IPC_STREAM_TRIG_RELEASE		SOF_CMD_TYPE(0x007)
+#define SOF_IPC_STREAM_TRIG_DRAIN		SOF_CMD_TYPE(0x008)
+#define SOF_IPC_STREAM_TRIG_XRUN		SOF_CMD_TYPE(0x009)
+#define SOF_IPC_STREAM_POSITION			SOF_CMD_TYPE(0x00a)
+#define SOF_IPC_STREAM_VORBIS_PARAMS		SOF_CMD_TYPE(0x010)
+#define SOF_IPC_STREAM_VORBIS_FREE		SOF_CMD_TYPE(0x011)
+
+/* trace and debug */
+#define SOF_IPC_TRACE_DMA_PARAMS		SOF_CMD_TYPE(0x001)
+#define SOF_IPC_TRACE_DMA_POSITION		SOF_CMD_TYPE(0x002)
+
+/* Get message component id */
+#define SOF_IPC_MESSAGE_ID(x)			((x) & 0xffff)
+
+/* maximum message size for mailbox Tx/Rx */
+#define SOF_IPC_MSG_MAX_SIZE			384
+
+/*
+ * Structure Header - Header for all IPC structures except command structs.
+ * The size can be greater than the structure size and that means there is
+ * extended bespoke data beyond the end of the structure including variable
+ * arrays.
+ */
+
+struct sof_ipc_hdr {
+	uint32_t size;			/**< size of structure */
+} __packed;
+
+/*
+ * Command Header - Header for all IPC commands. Identifies IPC message.
+ * The size can be greater than the structure size and that means there is
+ * extended bespoke data beyond the end of the structure including variable
+ * arrays.
+ */
+
+struct sof_ipc_cmd_hdr {
+	uint32_t size;			/**< size of structure */
+	uint32_t cmd;			/**< SOF_IPC_GLB_ + cmd */
+} __packed;
+
+/*
+ * Generic reply message. Some commands override this with their own reply
+ * types that must include this at start.
+ */
+struct sof_ipc_reply {
+	struct sof_ipc_cmd_hdr hdr;
+	int32_t error;			/**< negative error numbers */
+}  __packed;
+
+/*
+ * Compound commands - SOF_IPC_GLB_COMPOUND.
+ *
+ * Compound commands are sent to the DSP as a single IPC operation. The
+ * commands are split into blocks and each block has a header. This header
+ * identifies the command type and the number of commands before the next
+ * header.
+ */
+
+struct sof_ipc_compound_hdr {
+	struct sof_ipc_cmd_hdr hdr;
+	uint32_t count;		/**< count of 0 means end of compound sequence */
+}  __packed;
+
+/** @}*/
+
+#endif
diff --git a/include/sound/sof/info.h b/include/sound/sof/info.h
new file mode 100644
index 000000000000..21dae04d8183
--- /dev/null
+++ b/include/sound/sof/info.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INCLUDE_SOUND_SOF_INFO_H__
+#define __INCLUDE_SOUND_SOF_INFO_H__
+
+#include <sound/sof/header.h>
+#include <sound/sof/stream.h>
+
+/*
+ * Firmware boot and version
+ */
+
+#define SOF_IPC_MAX_ELEMS	16
+
+/* extended data types that can be appended onto end of sof_ipc_fw_ready */
+enum sof_ipc_ext_data {
+	SOF_IPC_EXT_DMA_BUFFER = 0,
+	SOF_IPC_EXT_WINDOW,
+};
+
+/* FW version - SOF_IPC_GLB_VERSION */
+struct sof_ipc_fw_version {
+	struct sof_ipc_hdr hdr;
+	uint16_t major;
+	uint16_t minor;
+	uint16_t micro;
+	uint16_t build;
+	uint8_t date[12];
+	uint8_t time[10];
+	uint8_t tag[6];
+	uint32_t abi_version;
+
+	/* reserved for future use */
+	uint32_t reserved[4];
+} __packed;
+
+/* FW ready Message - sent by firmware when boot has completed */
+struct sof_ipc_fw_ready {
+	struct sof_ipc_cmd_hdr hdr;
+	uint32_t dspbox_offset;	 /* dsp initiated IPC mailbox */
+	uint32_t hostbox_offset; /* host initiated IPC mailbox */
+	uint32_t dspbox_size;
+	uint32_t hostbox_size;
+	struct sof_ipc_fw_version version;
+
+	/* Miscellaneous debug flags showing build/debug features enabled */
+	union {
+		uint64_t reserved;
+		struct {
+			uint64_t build:1;
+			uint64_t locks:1;
+			uint64_t locks_verbose:1;
+			uint64_t gdb:1;
+		} bits;
+	} debug;
+
+	/* reserved for future use */
+	uint32_t reserved[4];
+} __packed;
+
+/*
+ * Extended Firmware data. All optional, depends on platform/arch.
+ */
+enum sof_ipc_region {
+	SOF_IPC_REGION_DOWNBOX	= 0,
+	SOF_IPC_REGION_UPBOX,
+	SOF_IPC_REGION_TRACE,
+	SOF_IPC_REGION_DEBUG,
+	SOF_IPC_REGION_STREAM,
+	SOF_IPC_REGION_REGS,
+	SOF_IPC_REGION_EXCEPTION,
+};
+
+struct sof_ipc_ext_data_hdr {
+	struct sof_ipc_cmd_hdr hdr;
+	uint32_t type;		/**< SOF_IPC_EXT_ */
+} __packed;
+
+struct sof_ipc_dma_buffer_elem {
+	struct sof_ipc_hdr hdr;
+	uint32_t type;		/**< SOF_IPC_REGION_ */
+	uint32_t id;		/**< platform specific - used to map to host memory */
+	struct sof_ipc_host_buffer buffer;
+} __packed;
+
+/* extended data DMA buffers for IPC, trace and debug */
+struct sof_ipc_dma_buffer_data {
+	struct sof_ipc_ext_data_hdr ext_hdr;
+	uint32_t num_buffers;
+
+	/* host files in buffer[n].buffer */
+	struct sof_ipc_dma_buffer_elem buffer[];
+}  __packed;
+
+struct sof_ipc_window_elem {
+	struct sof_ipc_hdr hdr;
+	uint32_t type;		/**< SOF_IPC_REGION_ */
+	uint32_t id;		/**< platform specific - used to map to host memory */
+	uint32_t flags;		/**< R, W, RW, etc - to define */
+	uint32_t size;		/**< size of region in bytes */
+	/* offset in window region as windows can be partitioned */
+	uint32_t offset;
+} __packed;
+
+/* extended data memory windows for IPC, trace and debug */
+struct sof_ipc_window {
+	struct sof_ipc_ext_data_hdr ext_hdr;
+	uint32_t num_windows;
+	struct sof_ipc_window_elem window[];
+}  __packed;
+
+#endif
diff --git a/include/sound/sof/pm.h b/include/sound/sof/pm.h
new file mode 100644
index 000000000000..8ae3ad45bdf7
--- /dev/null
+++ b/include/sound/sof/pm.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INCLUDE_SOUND_SOF_PM_H__
+#define __INCLUDE_SOUND_SOF_PM_H__
+
+#include <sound/sof/header.h>
+
+/*
+ * PM
+ */
+
+/* PM context element */
+struct sof_ipc_pm_ctx_elem {
+	struct sof_ipc_hdr hdr;
+	uint32_t type;
+	uint32_t size;
+	uint64_t addr;
+}  __packed;
+
+/*
+ * PM context - SOF_IPC_PM_CTX_SAVE, SOF_IPC_PM_CTX_RESTORE,
+ * SOF_IPC_PM_CTX_SIZE
+ */
+struct sof_ipc_pm_ctx {
+	struct sof_ipc_cmd_hdr hdr;
+	struct sof_ipc_host_buffer buffer;
+	uint32_t num_elems;
+	uint32_t size;
+
+	/* reserved for future use */
+	uint32_t reserved[8];
+
+	struct sof_ipc_pm_ctx_elem elems[];
+} __packed;
+
+/* enable or disable cores - SOF_IPC_PM_CORE_ENABLE */
+struct sof_ipc_pm_core_config {
+	struct sof_ipc_cmd_hdr hdr;
+	uint32_t enable_mask;
+} __packed;
+
+#endif
diff --git a/include/sound/sof/stream.h b/include/sound/sof/stream.h
new file mode 100644
index 000000000000..643f175cb479
--- /dev/null
+++ b/include/sound/sof/stream.h
@@ -0,0 +1,148 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INCLUDE_SOUND_SOF_STREAM_H__
+#define __INCLUDE_SOUND_SOF_STREAM_H__
+
+#include <sound/sof/header.h>
+
+/*
+ * Stream configuration.
+ */
+
+#define SOF_IPC_MAX_CHANNELS			8
+
+/* common sample rates for use in masks */
+#define SOF_RATE_8000		(1 <<  0) /**< 8000Hz  */
+#define SOF_RATE_11025		(1 <<  1) /**< 11025Hz */
+#define SOF_RATE_12000		(1 <<  2) /**< 12000Hz */
+#define SOF_RATE_16000		(1 <<  3) /**< 16000Hz */
+#define SOF_RATE_22050		(1 <<  4) /**< 22050Hz */
+#define SOF_RATE_24000		(1 <<  5) /**< 24000Hz */
+#define SOF_RATE_32000		(1 <<  6) /**< 32000Hz */
+#define SOF_RATE_44100		(1 <<  7) /**< 44100Hz */
+#define SOF_RATE_48000		(1 <<  8) /**< 48000Hz */
+#define SOF_RATE_64000		(1 <<  9) /**< 64000Hz */
+#define SOF_RATE_88200		(1 << 10) /**< 88200Hz */
+#define SOF_RATE_96000		(1 << 11) /**< 96000Hz */
+#define SOF_RATE_176400		(1 << 12) /**< 176400Hz */
+#define SOF_RATE_192000		(1 << 13) /**< 192000Hz */
+
+/* continuous and non-standard rates for flexibility */
+#define SOF_RATE_CONTINUOUS	(1 << 30)  /**< range */
+#define SOF_RATE_KNOT		(1 << 31)  /**< non-continuous */
+
+/* generic PCM flags for runtime settings */
+#define SOF_PCM_FLAG_XRUN_STOP	(1 << 0) /**< Stop on any XRUN */
+
+/* stream PCM frame format */
+enum sof_ipc_frame {
+	SOF_IPC_FRAME_S16_LE = 0,
+	SOF_IPC_FRAME_S24_4LE,
+	SOF_IPC_FRAME_S32_LE,
+	SOF_IPC_FRAME_FLOAT,
+	/* other formats here */
+};
+
+/* stream buffer format */
+enum sof_ipc_buffer_format {
+	SOF_IPC_BUFFER_INTERLEAVED,
+	SOF_IPC_BUFFER_NONINTERLEAVED,
+	/* other formats here */
+};
+
+/* stream direction */
+enum sof_ipc_stream_direction {
+	SOF_IPC_STREAM_PLAYBACK = 0,
+	SOF_IPC_STREAM_CAPTURE,
+};
+
+/* stream ring info */
+struct sof_ipc_host_buffer {
+	struct sof_ipc_hdr hdr;
+	uint32_t phy_addr;
+	uint32_t pages;
+	uint32_t size;
+	uint32_t reserved[3];
+} __packed;
+
+struct sof_ipc_stream_params {
+	struct sof_ipc_hdr hdr;
+	struct sof_ipc_host_buffer buffer;
+	uint32_t direction;	/**< enum sof_ipc_stream_direction */
+	uint32_t frame_fmt;	/**< enum sof_ipc_frame */
+	uint32_t buffer_fmt;	/**< enum sof_ipc_buffer_format */
+	uint32_t rate;
+	uint16_t stream_tag;
+	uint16_t channels;
+	uint16_t sample_valid_bytes;
+	uint16_t sample_container_bytes;
+
+	/* for notifying host period has completed - 0 means no period IRQ */
+	uint32_t host_period_bytes;
+
+	uint32_t reserved[2];
+	uint16_t chmap[SOF_IPC_MAX_CHANNELS];	/**< channel map - SOF_CHMAP_ */
+} __packed;
+
+/* PCM params info - SOF_IPC_STREAM_PCM_PARAMS */
+struct sof_ipc_pcm_params {
+	struct sof_ipc_cmd_hdr hdr;
+	uint32_t comp_id;
+	uint32_t flags;		/**< generic PCM flags - SOF_PCM_FLAG_ */
+	uint32_t reserved[2];
+	struct sof_ipc_stream_params params;
+}  __packed;
+
+/* PCM params info reply - SOF_IPC_STREAM_PCM_PARAMS_REPLY */
+struct sof_ipc_pcm_params_reply {
+	struct sof_ipc_reply rhdr;
+	uint32_t comp_id;
+	uint32_t posn_offset;
+} __packed;
+
+/* free stream - SOF_IPC_STREAM_PCM_PARAMS */
+struct sof_ipc_stream {
+	struct sof_ipc_cmd_hdr hdr;
+	uint32_t comp_id;
+} __packed;
+
+/* flags indicating which time stamps are in sync with each other */
+#define	SOF_TIME_HOST_SYNC	(1 << 0)
+#define	SOF_TIME_DAI_SYNC	(1 << 1)
+#define	SOF_TIME_WALL_SYNC	(1 << 2)
+#define	SOF_TIME_STAMP_SYNC	(1 << 3)
+
+/* flags indicating which time stamps are valid */
+#define	SOF_TIME_HOST_VALID	(1 << 8)
+#define	SOF_TIME_DAI_VALID	(1 << 9)
+#define	SOF_TIME_WALL_VALID	(1 << 10)
+#define	SOF_TIME_STAMP_VALID	(1 << 11)
+
+/* flags indicating time stamps are 64bit else 3use low 32bit */
+#define	SOF_TIME_HOST_64	(1 << 16)
+#define	SOF_TIME_DAI_64		(1 << 17)
+#define	SOF_TIME_WALL_64	(1 << 18)
+#define	SOF_TIME_STAMP_64	(1 << 19)
+
+struct sof_ipc_stream_posn {
+	struct sof_ipc_reply rhdr;
+	uint32_t comp_id;	/**< host component ID */
+	uint32_t flags;		/**< SOF_TIME_ */
+	uint32_t wallclock_hz;	/**< frequency of wallclock in Hz */
+	uint32_t timestamp_ns;	/**< resolution of timestamp in ns */
+	uint64_t host_posn;	/**< host DMA position in bytes */
+	uint64_t dai_posn;	/**< DAI DMA position in bytes */
+	uint64_t comp_posn;	/**< comp position in bytes */
+	uint64_t wallclock;	/**< audio wall clock */
+	uint64_t timestamp;	/**< system time stamp */
+	uint32_t xrun_comp_id;	/**< comp ID of XRUN component */
+	int32_t xrun_size;	/**< XRUN size in bytes */
+}  __packed;
+
+#endif
diff --git a/include/sound/sof/trace.h b/include/sound/sof/trace.h
new file mode 100644
index 000000000000..7d211f319a92
--- /dev/null
+++ b/include/sound/sof/trace.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INCLUDE_SOUND_SOF_TRACE_H__
+#define __INCLUDE_SOUND_SOF_TRACE_H__
+
+#include <sound/sof/header.h>
+#include <sound/sof/stream.h>
+
+/*
+ * DMA for Trace
+ */
+
+#define SOF_TRACE_FILENAME_SIZE		32
+
+/* DMA for Trace params info - SOF_IPC_DEBUG_DMA_PARAMS */
+struct sof_ipc_dma_trace_params {
+	struct sof_ipc_cmd_hdr hdr;
+	struct sof_ipc_host_buffer buffer;
+	uint32_t stream_tag;
+}  __packed;
+
+/* DMA for Trace params info - SOF_IPC_DEBUG_DMA_PARAMS */
+struct sof_ipc_dma_trace_posn {
+	struct sof_ipc_reply rhdr;
+	uint32_t host_offset;	/* Offset of DMA host buffer */
+	uint32_t overflow;	/* overflow bytes if any */
+	uint32_t messages;	/* total trace messages */
+}  __packed;
+
+/*
+ * Commom debug
+ */
+
+/*
+ * SOF panic codes
+ */
+#define SOF_IPC_PANIC_MAGIC			0x0dead000
+#define SOF_IPC_PANIC_MAGIC_MASK		0x0ffff000
+#define SOF_IPC_PANIC_CODE_MASK			0x00000fff
+#define SOF_IPC_PANIC_MEM			(SOF_IPC_PANIC_MAGIC | 0x0)
+#define SOF_IPC_PANIC_WORK			(SOF_IPC_PANIC_MAGIC | 0x1)
+#define SOF_IPC_PANIC_IPC			(SOF_IPC_PANIC_MAGIC | 0x2)
+#define SOF_IPC_PANIC_ARCH			(SOF_IPC_PANIC_MAGIC | 0x3)
+#define SOF_IPC_PANIC_PLATFORM			(SOF_IPC_PANIC_MAGIC | 0x4)
+#define SOF_IPC_PANIC_TASK			(SOF_IPC_PANIC_MAGIC | 0x5)
+#define SOF_IPC_PANIC_EXCEPTION			(SOF_IPC_PANIC_MAGIC | 0x6)
+#define SOF_IPC_PANIC_DEADLOCK			(SOF_IPC_PANIC_MAGIC | 0x7)
+#define SOF_IPC_PANIC_STACK			(SOF_IPC_PANIC_MAGIC | 0x8)
+#define SOF_IPC_PANIC_IDLE			(SOF_IPC_PANIC_MAGIC | 0x9)
+#define SOF_IPC_PANIC_WFI			(SOF_IPC_PANIC_MAGIC | 0xa)
+#define SOF_IPC_PANIC_ASSERT			(SOF_IPC_PANIC_MAGIC | 0xb)
+
+/* panic info include filename and line number */
+struct sof_ipc_panic_info {
+	struct sof_ipc_hdr hdr;
+	uint32_t code;			/* SOF_IPC_PANIC_ */
+	char filename[SOF_TRACE_FILENAME_SIZE];
+	uint32_t linenum;
+}  __packed;
+
+#endif
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
new file mode 100644
index 000000000000..d00373ceca12
--- /dev/null
+++ b/sound/soc/sof/ipc.c
@@ -0,0 +1,832 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018 Intel Corporation. All rights reserved.
+//
+// Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+//
+// Generic IPC layer that can work over MMIO and SPI/I2C. PHY layer provided
+// by platform driver code.
+//
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+#include "sof-priv.h"
+#include "ops.h"
+
+/*
+ * IPC message default size and timeout (ms).
+ * TODO: allow platforms to set size and timeout.
+ */
+#define IPC_TIMEOUT_MS		300
+
+static void ipc_trace_message(struct snd_sof_dev *sdev, u32 msg_id);
+static void ipc_stream_message(struct snd_sof_dev *sdev, u32 msg_cmd);
+
+/*
+ * IPC message Tx/Rx message handling.
+ */
+
+/* SOF generic IPC data */
+struct snd_sof_ipc {
+	struct snd_sof_dev *sdev;
+
+	/* protects messages and the disable flag */
+	struct mutex tx_mutex;
+	/* disables further sending of ipc's */
+	bool disable_ipc_tx;
+
+	struct snd_sof_ipc_msg msg;
+};
+
+struct sof_ipc_ctrl_data_params {
+	size_t msg_bytes;
+	size_t hdr_bytes;
+	size_t pl_size;
+	size_t elems;
+	u32 num_msg;
+	u8 *src;
+	u8 *dst;
+};
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_VERBOSE_IPC)
+static void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
+{
+	u8 *str;
+	u8 *str2 = NULL;
+	u32 glb;
+	u32 type;
+
+	glb = cmd & SOF_GLB_TYPE_MASK;
+	type = cmd & SOF_CMD_TYPE_MASK;
+
+	switch (glb) {
+	case SOF_IPC_GLB_REPLY:
+		str = "GLB_REPLY"; break;
+	case SOF_IPC_GLB_COMPOUND:
+		str = "GLB_COMPOUND"; break;
+	case SOF_IPC_GLB_TPLG_MSG:
+		str = "GLB_TPLG_MSG";
+		switch (type) {
+		case SOF_IPC_TPLG_COMP_NEW:
+			str2 = "COMP_NEW"; break;
+		case SOF_IPC_TPLG_COMP_FREE:
+			str2 = "COMP_FREE"; break;
+		case SOF_IPC_TPLG_COMP_CONNECT:
+			str2 = "COMP_CONNECT"; break;
+		case SOF_IPC_TPLG_PIPE_NEW:
+			str2 = "PIPE_NEW"; break;
+		case SOF_IPC_TPLG_PIPE_FREE:
+			str2 = "PIPE_FREE"; break;
+		case SOF_IPC_TPLG_PIPE_CONNECT:
+			str2 = "PIPE_CONNECT"; break;
+		case SOF_IPC_TPLG_PIPE_COMPLETE:
+			str2 = "PIPE_COMPLETE"; break;
+		case SOF_IPC_TPLG_BUFFER_NEW:
+			str2 = "BUFFER_NEW"; break;
+		case SOF_IPC_TPLG_BUFFER_FREE:
+			str2 = "BUFFER_FREE"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
+	case SOF_IPC_GLB_PM_MSG:
+		str = "GLB_PM_MSG";
+		switch (type) {
+		case SOF_IPC_PM_CTX_SAVE:
+			str2 = "CTX_SAVE"; break;
+		case SOF_IPC_PM_CTX_RESTORE:
+			str2 = "CTX_RESTORE"; break;
+		case SOF_IPC_PM_CTX_SIZE:
+			str2 = "CTX_SIZE"; break;
+		case SOF_IPC_PM_CLK_SET:
+			str2 = "CLK_SET"; break;
+		case SOF_IPC_PM_CLK_GET:
+			str2 = "CLK_GET"; break;
+		case SOF_IPC_PM_CLK_REQ:
+			str2 = "CLK_REQ"; break;
+		case SOF_IPC_PM_CORE_ENABLE:
+			str2 = "CORE_ENABLE"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
+	case SOF_IPC_GLB_COMP_MSG:
+		str = "GLB_COMP_MSG: SET_VALUE";
+		switch (type) {
+		case SOF_IPC_COMP_SET_VALUE:
+			str2 = "SET_VALUE"; break;
+		case SOF_IPC_COMP_GET_VALUE:
+			str2 = "GET_VALUE"; break;
+		case SOF_IPC_COMP_SET_DATA:
+			str2 = "SET_DATA"; break;
+		case SOF_IPC_COMP_GET_DATA:
+			str2 = "GET_DATA"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
+	case SOF_IPC_GLB_STREAM_MSG:
+		str = "GLB_STREAM_MSG";
+		switch (type) {
+		case SOF_IPC_STREAM_PCM_PARAMS:
+			str2 = "PCM_PARAMS"; break;
+		case SOF_IPC_STREAM_PCM_PARAMS_REPLY:
+			str2 = "PCM_REPLY"; break;
+		case SOF_IPC_STREAM_PCM_FREE:
+			str2 = "PCM_FREE"; break;
+		case SOF_IPC_STREAM_TRIG_START:
+			str2 = "TRIG_START"; break;
+		case SOF_IPC_STREAM_TRIG_STOP:
+			str2 = "TRIG_STOP"; break;
+		case SOF_IPC_STREAM_TRIG_PAUSE:
+			str2 = "TRIG_PAUSE"; break;
+		case SOF_IPC_STREAM_TRIG_RELEASE:
+			str2 = "TRIG_RELEASE"; break;
+		case SOF_IPC_STREAM_TRIG_DRAIN:
+			str2 = "TRIG_DRAIN"; break;
+		case SOF_IPC_STREAM_TRIG_XRUN:
+			str2 = "TRIG_XRUN"; break;
+		case SOF_IPC_STREAM_POSITION:
+			str2 = "POSITION"; break;
+		case SOF_IPC_STREAM_VORBIS_PARAMS:
+			str2 = "VORBIS_PARAMS"; break;
+		case SOF_IPC_STREAM_VORBIS_FREE:
+			str2 = "VORBIS_FREE"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
+	case SOF_IPC_FW_READY:
+		str = "FW_READY"; break;
+	case SOF_IPC_GLB_DAI_MSG:
+		str = "GLB_DAI_MSG";
+		switch (type) {
+		case SOF_IPC_DAI_CONFIG:
+			str2 = "CONFIG"; break;
+		case SOF_IPC_DAI_LOOPBACK:
+			str2 = "LOOPBACK"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
+	case SOF_IPC_GLB_TRACE_MSG:
+		str = "GLB_TRACE_MSG"; break;
+	default:
+		str = "unknown GLB command"; break;
+	}
+
+	if (str2)
+		dev_dbg(dev, "%s: 0x%x: %s: %s\n", text, cmd, str, str2);
+	else
+		dev_dbg(dev, "%s: 0x%x: %s\n", text, cmd, str);
+}
+#else
+static inline void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
+{
+	dev_dbg(dev, "%s: 0x%x\n", text, cmd);
+}
+#endif
+
+/* wait for IPC message reply */
+static int tx_wait_done(struct snd_sof_ipc *ipc, struct snd_sof_ipc_msg *msg,
+			void *reply_data)
+{
+	struct snd_sof_dev *sdev = ipc->sdev;
+	struct sof_ipc_cmd_hdr *hdr = msg->msg_data;
+	int ret;
+
+	/* wait for DSP IPC completion */
+	ret = wait_event_timeout(msg->waitq, msg->ipc_complete,
+				 msecs_to_jiffies(IPC_TIMEOUT_MS));
+
+	if (ret == 0) {
+		dev_err(sdev->dev, "error: ipc timed out for 0x%x size %d\n",
+			hdr->cmd, hdr->size);
+		snd_sof_dsp_dbg_dump(ipc->sdev, SOF_DBG_REGS | SOF_DBG_MBOX);
+		snd_sof_trace_notify_for_error(ipc->sdev);
+		ret = -ETIMEDOUT;
+	} else {
+		/* copy the data returned from DSP */
+		ret = msg->reply_error;
+		if (msg->reply_size)
+			memcpy(reply_data, msg->reply_data, msg->reply_size);
+		if (ret < 0)
+			dev_err(sdev->dev, "error: ipc error for 0x%x size %zu\n",
+				hdr->cmd, msg->reply_size);
+		else
+			ipc_log_header(sdev->dev, "ipc tx succeeded", hdr->cmd);
+	}
+
+	return ret;
+}
+
+/* send IPC message from host to DSP */
+static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
+				       void *msg_data, size_t msg_bytes,
+				       void *reply_data, size_t reply_bytes)
+{
+	struct snd_sof_dev *sdev = ipc->sdev;
+	struct snd_sof_ipc_msg *msg;
+	int ret;
+
+	if (ipc->disable_ipc_tx)
+		return -ENODEV;
+
+	/*
+	 * The spin-lock is also still needed to protect message objects against
+	 * other atomic contexts.
+	 */
+	spin_lock_irq(&sdev->ipc_lock);
+
+	/* initialise the message */
+	msg = &ipc->msg;
+
+	msg->header = header;
+	msg->msg_size = msg_bytes;
+	msg->reply_size = reply_bytes;
+	msg->reply_error = 0;
+
+	/* attach any data */
+	if (msg_bytes)
+		memcpy(msg->msg_data, msg_data, msg_bytes);
+
+	sdev->msg = msg;
+
+	ret = snd_sof_dsp_send_msg(sdev, msg);
+	/* Next reply that we receive will be related to this message */
+	if (!ret)
+		msg->ipc_complete = false;
+
+	spin_unlock_irq(&sdev->ipc_lock);
+
+	if (ret < 0) {
+		/* So far IPC TX never fails, consider making the above void */
+		dev_err_ratelimited(sdev->dev,
+				    "error: ipc tx failed with error %d\n",
+				    ret);
+		return ret;
+	}
+
+	ipc_log_header(sdev->dev, "ipc tx", msg->header);
+
+	/* now wait for completion */
+	if (!ret)
+		ret = tx_wait_done(ipc, msg, reply_data);
+
+	return ret;
+}
+
+/* send IPC message from host to DSP */
+int sof_ipc_tx_message(struct snd_sof_ipc *ipc, u32 header,
+		       void *msg_data, size_t msg_bytes, void *reply_data,
+		       size_t reply_bytes)
+{
+	int ret;
+
+	if (msg_bytes > SOF_IPC_MSG_MAX_SIZE ||
+	    reply_bytes > SOF_IPC_MSG_MAX_SIZE)
+		return -ENOBUFS;
+
+	/* Serialise IPC TX */
+	mutex_lock(&ipc->tx_mutex);
+
+	ret = sof_ipc_tx_message_unlocked(ipc, header, msg_data, msg_bytes,
+					  reply_data, reply_bytes);
+
+	mutex_unlock(&ipc->tx_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(sof_ipc_tx_message);
+
+/* handle reply message from DSP */
+int snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32 msg_id)
+{
+	struct snd_sof_ipc_msg *msg = &sdev->ipc->msg;
+	unsigned long flags;
+
+	/*
+	 * Protect against a theoretical race with sof_ipc_tx_message(): if the
+	 * DSP is fast enough to receive an IPC message, reply to it, and the
+	 * host interrupt processing calls this function on a different core
+	 * from the one, where the sending is taking place, the message might
+	 * not yet be marked as expecting a reply.
+	 */
+	spin_lock_irqsave(&sdev->ipc_lock, flags);
+
+	if (msg->ipc_complete) {
+		spin_unlock_irqrestore(&sdev->ipc_lock, flags);
+		dev_err(sdev->dev, "error: no reply expected, received 0x%x",
+			msg_id);
+		return -EINVAL;
+	}
+
+	/* wake up and return the error if we have waiters on this message ? */
+	msg->ipc_complete = true;
+	wake_up(&msg->waitq);
+
+	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL(snd_sof_ipc_reply);
+
+/* DSP firmware has sent host a message  */
+void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc_cmd_hdr hdr;
+	u32 cmd, type;
+	int err = 0;
+
+	/* read back header */
+	snd_sof_ipc_msg_data(sdev, NULL, &hdr, sizeof(hdr));
+	ipc_log_header(sdev->dev, "ipc rx", hdr.cmd);
+
+	cmd = hdr.cmd & SOF_GLB_TYPE_MASK;
+	type = hdr.cmd & SOF_CMD_TYPE_MASK;
+
+	/* check message type */
+	switch (cmd) {
+	case SOF_IPC_GLB_REPLY:
+		dev_err(sdev->dev, "error: ipc reply unknown\n");
+		break;
+	case SOF_IPC_FW_READY:
+		/* check for FW boot completion */
+		if (!sdev->boot_complete) {
+			err = sof_ops(sdev)->fw_ready(sdev, cmd);
+			if (err < 0) {
+				/*
+				 * this indicates a mismatch in ABI
+				 * between the driver and fw
+				 */
+				dev_err(sdev->dev, "error: ABI mismatch %d\n",
+					err);
+			} else {
+				/* firmware boot completed OK */
+				sdev->boot_complete = true;
+			}
+
+			/* wake up firmware loader */
+			wake_up(&sdev->boot_wait);
+		}
+		break;
+	case SOF_IPC_GLB_COMPOUND:
+	case SOF_IPC_GLB_TPLG_MSG:
+	case SOF_IPC_GLB_PM_MSG:
+	case SOF_IPC_GLB_COMP_MSG:
+		break;
+	case SOF_IPC_GLB_STREAM_MSG:
+		/* need to pass msg id into the function */
+		ipc_stream_message(sdev, hdr.cmd);
+		break;
+	case SOF_IPC_GLB_TRACE_MSG:
+		ipc_trace_message(sdev, type);
+		break;
+	default:
+		dev_err(sdev->dev, "error: unknown DSP message 0x%x\n", cmd);
+		break;
+	}
+
+	ipc_log_header(sdev->dev, "ipc rx done", hdr.cmd);
+}
+EXPORT_SYMBOL(snd_sof_ipc_msgs_rx);
+
+/*
+ * IPC trace mechanism.
+ */
+
+static void ipc_trace_message(struct snd_sof_dev *sdev, u32 msg_id)
+{
+	struct sof_ipc_dma_trace_posn posn;
+
+	switch (msg_id) {
+	case SOF_IPC_TRACE_DMA_POSITION:
+		/* read back full message */
+		snd_sof_ipc_msg_data(sdev, NULL, &posn, sizeof(posn));
+		snd_sof_trace_update_pos(sdev, &posn);
+		break;
+	default:
+		dev_err(sdev->dev, "error: unhandled trace message %x\n",
+			msg_id);
+		break;
+	}
+}
+
+/*
+ * IPC stream position.
+ */
+
+static void ipc_period_elapsed(struct snd_sof_dev *sdev, u32 msg_id)
+{
+	struct snd_sof_pcm_stream *stream;
+	struct sof_ipc_stream_posn posn;
+	struct snd_sof_pcm *spcm;
+	int direction;
+
+	spcm = snd_sof_find_spcm_comp(sdev, msg_id, &direction);
+	if (!spcm) {
+		dev_err(sdev->dev,
+			"error: period elapsed for unknown stream, msg_id %d\n",
+			msg_id);
+		return;
+	}
+
+	stream = &spcm->stream[direction];
+	snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+
+	dev_dbg(sdev->dev, "posn : host 0x%llx dai 0x%llx wall 0x%llx\n",
+		posn.host_posn, posn.dai_posn, posn.wallclock);
+
+	memcpy(&stream->posn, &posn, sizeof(posn));
+
+	/* only inform ALSA for period_wakeup mode */
+	if (!stream->substream->runtime->no_period_wakeup)
+		snd_pcm_period_elapsed(stream->substream);
+}
+
+/* DSP notifies host of an XRUN within FW */
+static void ipc_xrun(struct snd_sof_dev *sdev, u32 msg_id)
+{
+	struct snd_sof_pcm_stream *stream;
+	struct sof_ipc_stream_posn posn;
+	struct snd_sof_pcm *spcm;
+	int direction;
+
+	spcm = snd_sof_find_spcm_comp(sdev, msg_id, &direction);
+	if (!spcm) {
+		dev_err(sdev->dev, "error: XRUN for unknown stream, msg_id %d\n",
+			msg_id);
+		return;
+	}
+
+	stream = &spcm->stream[direction];
+	snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+
+	dev_dbg(sdev->dev,  "posn XRUN: host %llx comp %d size %d\n",
+		posn.host_posn, posn.xrun_comp_id, posn.xrun_size);
+
+#if defined(CONFIG_SND_SOC_SOF_DEBUG_XRUN_STOP)
+	/* stop PCM on XRUN - used for pipeline debug */
+	memcpy(&stream->posn, &posn, sizeof(posn));
+	snd_pcm_stop_xrun(stream->substream);
+#endif
+}
+
+/* stream notifications from DSP FW */
+static void ipc_stream_message(struct snd_sof_dev *sdev, u32 msg_cmd)
+{
+	/* get msg cmd type and msd id */
+	u32 msg_type = msg_cmd & SOF_CMD_TYPE_MASK;
+	u32 msg_id = SOF_IPC_MESSAGE_ID(msg_cmd);
+
+	switch (msg_type) {
+	case SOF_IPC_STREAM_POSITION:
+		ipc_period_elapsed(sdev, msg_id);
+		break;
+	case SOF_IPC_STREAM_TRIG_XRUN:
+		ipc_xrun(sdev, msg_id);
+		break;
+	default:
+		dev_err(sdev->dev, "error: unhandled stream message %x\n",
+			msg_id);
+		break;
+	}
+}
+
+/* get stream position IPC - use faster MMIO method if available on platform */
+int snd_sof_ipc_stream_posn(struct snd_sof_dev *sdev,
+			    struct snd_sof_pcm *spcm, int direction,
+			    struct sof_ipc_stream_posn *posn)
+{
+	struct sof_ipc_stream stream;
+	int err;
+
+	/* read position via slower IPC */
+	stream.hdr.size = sizeof(stream);
+	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_POSITION;
+	stream.comp_id = spcm->stream[direction].comp_id;
+
+	/* send IPC to the DSP */
+	err = sof_ipc_tx_message(sdev->ipc,
+				 stream.hdr.cmd, &stream, sizeof(stream), &posn,
+				 sizeof(*posn));
+	if (err < 0) {
+		dev_err(sdev->dev, "error: failed to get stream %d position\n",
+			stream.comp_id);
+		return err;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(snd_sof_ipc_stream_posn);
+
+static int sof_get_ctrl_copy_params(enum sof_ipc_ctrl_type ctrl_type,
+				    struct sof_ipc_ctrl_data *src,
+				    struct sof_ipc_ctrl_data *dst,
+				    struct sof_ipc_ctrl_data_params *sparams)
+{
+	switch (ctrl_type) {
+	case SOF_CTRL_TYPE_VALUE_CHAN_GET:
+	case SOF_CTRL_TYPE_VALUE_CHAN_SET:
+		sparams->src = (u8 *)src->chanv;
+		sparams->dst = (u8 *)dst->chanv;
+		break;
+	case SOF_CTRL_TYPE_VALUE_COMP_GET:
+	case SOF_CTRL_TYPE_VALUE_COMP_SET:
+		sparams->src = (u8 *)src->compv;
+		sparams->dst = (u8 *)dst->compv;
+		break;
+	case SOF_CTRL_TYPE_DATA_GET:
+	case SOF_CTRL_TYPE_DATA_SET:
+		sparams->src = (u8 *)src->data->data;
+		sparams->dst = (u8 *)dst->data->data;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* calculate payload size and number of messages */
+	sparams->pl_size = SOF_IPC_MSG_MAX_SIZE - sparams->hdr_bytes;
+	sparams->num_msg = DIV_ROUND_UP(sparams->msg_bytes, sparams->pl_size);
+
+	return 0;
+}
+
+static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
+				       struct sof_ipc_ctrl_data *cdata,
+				       struct sof_ipc_ctrl_data_params *sparams,
+				       bool send)
+{
+	struct sof_ipc_ctrl_data *partdata;
+	size_t send_bytes;
+	size_t offset = 0;
+	size_t msg_bytes;
+	size_t pl_size;
+	int err = 0;
+	int i;
+
+	/* allocate max ipc size because we have at least one */
+	partdata = kzalloc(SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
+	if (!partdata)
+		return -ENOMEM;
+
+	if (send)
+		sof_get_ctrl_copy_params(cdata->type, cdata, partdata, sparams);
+	else
+		sof_get_ctrl_copy_params(cdata->type, partdata, cdata, sparams);
+
+	msg_bytes = sparams->msg_bytes;
+	pl_size = sparams->pl_size;
+
+	/* copy the header data */
+	memcpy(partdata, cdata, sparams->hdr_bytes);
+
+	/* Serialise IPC TX */
+	mutex_lock(&sdev->ipc->tx_mutex);
+
+	/* copy the payload data in a loop */
+	for (i = 0; i < sparams->num_msg; i++) {
+		send_bytes = min(msg_bytes, pl_size);
+		partdata->num_elems = send_bytes;
+		partdata->rhdr.hdr.size = sparams->hdr_bytes + send_bytes;
+		partdata->msg_index = i;
+		msg_bytes -= send_bytes;
+		partdata->elems_remaining = msg_bytes;
+
+		if (send)
+			memcpy(sparams->dst, sparams->src + offset, send_bytes);
+
+		err = sof_ipc_tx_message_unlocked(sdev->ipc,
+						  partdata->rhdr.hdr.cmd,
+						  partdata,
+						  partdata->rhdr.hdr.size,
+						  partdata,
+						  partdata->rhdr.hdr.size);
+		if (err < 0)
+			break;
+
+		if (!send)
+			memcpy(sparams->dst + offset, sparams->src, send_bytes);
+
+		offset += pl_size;
+	}
+
+	mutex_unlock(&sdev->ipc->tx_mutex);
+
+	kfree(partdata);
+	return err;
+}
+
+/*
+ * IPC get()/set() for kcontrols.
+ */
+int snd_sof_ipc_set_get_comp_data(struct snd_sof_ipc *ipc,
+				  struct snd_sof_control *scontrol,
+				  u32 ipc_cmd,
+				  enum sof_ipc_ctrl_type ctrl_type,
+				  enum sof_ipc_ctrl_cmd ctrl_cmd,
+				  bool send)
+{
+	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
+	struct snd_sof_dev *sdev = ipc->sdev;
+	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
+	struct sof_ipc_fw_version *v = &ready->version;
+	struct sof_ipc_ctrl_data_params sparams;
+	size_t send_bytes;
+	int err;
+
+	/* read or write firmware volume */
+	if (scontrol->readback_offset != 0) {
+		/* write/read value header via mmaped region */
+		send_bytes = sizeof(struct sof_ipc_ctrl_value_chan) *
+		cdata->num_elems;
+		if (send)
+			snd_sof_dsp_block_write(sdev, sdev->mmio_bar,
+						scontrol->readback_offset,
+						cdata->chanv, send_bytes);
+
+		else
+			snd_sof_dsp_block_read(sdev, sdev->mmio_bar,
+					       scontrol->readback_offset,
+					       cdata->chanv, send_bytes);
+		return 0;
+	}
+
+	cdata->rhdr.hdr.cmd = SOF_IPC_GLB_COMP_MSG | ipc_cmd;
+	cdata->cmd = ctrl_cmd;
+	cdata->type = ctrl_type;
+	cdata->comp_id = scontrol->comp_id;
+	cdata->msg_index = 0;
+
+	/* calculate header and data size */
+	switch (cdata->type) {
+	case SOF_CTRL_TYPE_VALUE_CHAN_GET:
+	case SOF_CTRL_TYPE_VALUE_CHAN_SET:
+		sparams.msg_bytes = scontrol->num_channels *
+			sizeof(struct sof_ipc_ctrl_value_chan);
+		sparams.hdr_bytes = sizeof(struct sof_ipc_ctrl_data);
+		sparams.elems = scontrol->num_channels;
+		break;
+	case SOF_CTRL_TYPE_VALUE_COMP_GET:
+	case SOF_CTRL_TYPE_VALUE_COMP_SET:
+		sparams.msg_bytes = scontrol->num_channels *
+			sizeof(struct sof_ipc_ctrl_value_comp);
+		sparams.hdr_bytes = sizeof(struct sof_ipc_ctrl_data);
+		sparams.elems = scontrol->num_channels;
+		break;
+	case SOF_CTRL_TYPE_DATA_GET:
+	case SOF_CTRL_TYPE_DATA_SET:
+		sparams.msg_bytes = cdata->data->size;
+		sparams.hdr_bytes = sizeof(struct sof_ipc_ctrl_data) +
+			sizeof(struct sof_abi_hdr);
+		sparams.elems = cdata->data->size;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	cdata->rhdr.hdr.size = sparams.msg_bytes + sparams.hdr_bytes;
+	cdata->num_elems = sparams.elems;
+	cdata->elems_remaining = 0;
+
+	/* send normal size ipc in one part */
+	if (cdata->rhdr.hdr.size <= SOF_IPC_MSG_MAX_SIZE) {
+		err = sof_ipc_tx_message(sdev->ipc, cdata->rhdr.hdr.cmd, cdata,
+					 cdata->rhdr.hdr.size, cdata,
+					 cdata->rhdr.hdr.size);
+
+		if (err < 0)
+			dev_err(sdev->dev, "error: set/get ctrl ipc comp %d\n",
+				cdata->comp_id);
+
+		return err;
+	}
+
+	/* data is bigger than max ipc size, chop into smaller pieces */
+	dev_dbg(sdev->dev, "large ipc size %u, control size %u\n",
+		cdata->rhdr.hdr.size, scontrol->size);
+
+	/* large messages is only supported from ABI 3.3.0 onwards */
+	if (v->abi_version < SOF_ABI_VER(3, 3, 0)) {
+		dev_err(sdev->dev, "error: incompatible FW ABI version\n");
+		return -EINVAL;
+	}
+
+	err = sof_set_get_large_ctrl_data(sdev, cdata, &sparams, send);
+
+	if (err < 0)
+		dev_err(sdev->dev, "error: set/get large ctrl ipc comp %d\n",
+			cdata->comp_id);
+
+	return err;
+}
+EXPORT_SYMBOL(snd_sof_ipc_set_get_comp_data);
+
+/*
+ * IPC layer enumeration.
+ */
+
+int snd_sof_dsp_mailbox_init(struct snd_sof_dev *sdev, u32 dspbox,
+			     size_t dspbox_size, u32 hostbox,
+			     size_t hostbox_size)
+{
+	sdev->dsp_box.offset = dspbox;
+	sdev->dsp_box.size = dspbox_size;
+	sdev->host_box.offset = hostbox;
+	sdev->host_box.size = hostbox_size;
+	return 0;
+}
+EXPORT_SYMBOL(snd_sof_dsp_mailbox_init);
+
+int snd_sof_ipc_valid(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
+	struct sof_ipc_fw_version *v = &ready->version;
+
+	dev_info(sdev->dev,
+		 "Firmware info: version %d:%d:%d-%s\n",  v->major, v->minor,
+		 v->micro, v->tag);
+	dev_info(sdev->dev,
+		 "Firmware: ABI %d:%d:%d Kernel ABI %d:%d:%d\n",
+		 SOF_ABI_VERSION_MAJOR(v->abi_version),
+		 SOF_ABI_VERSION_MINOR(v->abi_version),
+		 SOF_ABI_VERSION_PATCH(v->abi_version),
+		 SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
+
+	if (SOF_ABI_VERSION_INCOMPATIBLE(SOF_ABI_VERSION, v->abi_version)) {
+		dev_err(sdev->dev, "error: incompatible FW ABI version\n");
+		return -EINVAL;
+	}
+
+	if (ready->debug.bits.build) {
+		dev_info(sdev->dev,
+			 "Firmware debug build %d on %s-%s - options:\n"
+			 " GDB: %s\n"
+			 " lock debug: %s\n"
+			 " lock vdebug: %s\n",
+			 v->build, v->date, v->time,
+			 ready->debug.bits.gdb ? "enabled" : "disabled",
+			 ready->debug.bits.locks ? "enabled" : "disabled",
+			 ready->debug.bits.locks_verbose ? "enabled" : "disabled");
+	}
+
+	/* copy the fw_version into debugfs at first boot */
+	memcpy(&sdev->fw_version, v, sizeof(*v));
+
+	return 0;
+}
+EXPORT_SYMBOL(snd_sof_ipc_valid);
+
+struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_ipc *ipc;
+	struct snd_sof_ipc_msg *msg;
+
+	/* check if mandatory ops required for ipc are defined */
+	if (!sof_ops(sdev)->fw_ready) {
+		dev_err(sdev->dev, "error: ipc mandatory ops not defined\n");
+		return NULL;
+	}
+
+	ipc = devm_kzalloc(sdev->dev, sizeof(*ipc), GFP_KERNEL);
+	if (!ipc)
+		return NULL;
+
+	mutex_init(&ipc->tx_mutex);
+	ipc->sdev = sdev;
+	msg = &ipc->msg;
+
+	/* indicate that we aren't sending a message ATM */
+	msg->ipc_complete = true;
+
+	/* pre-allocate message data */
+	msg->msg_data = devm_kzalloc(sdev->dev, SOF_IPC_MSG_MAX_SIZE,
+				     GFP_KERNEL);
+	if (!msg->msg_data)
+		return NULL;
+
+	msg->reply_data = devm_kzalloc(sdev->dev, SOF_IPC_MSG_MAX_SIZE,
+				       GFP_KERNEL);
+	if (!msg->reply_data)
+		return NULL;
+
+	init_waitqueue_head(&msg->waitq);
+
+	return ipc;
+}
+EXPORT_SYMBOL(snd_sof_ipc_init);
+
+void snd_sof_ipc_free(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_ipc *ipc = sdev->ipc;
+
+	/* disable sending of ipc's */
+	mutex_lock(&ipc->tx_mutex);
+	ipc->disable_ipc_tx = true;
+	mutex_unlock(&ipc->tx_mutex);
+}
+EXPORT_SYMBOL(snd_sof_ipc_free);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
