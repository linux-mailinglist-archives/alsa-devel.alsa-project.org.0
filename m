Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A19C0B437
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:10:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A73B1685;
	Sat, 27 Apr 2019 20:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A73B1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556388642;
	bh=tMd8cZWPB4CtYFmHpOh5vwG3jEFbijzbTtYOudrOsWc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KT4MrB0KqxlKScS0sLPfe5nPi+N0t7IflaqdNSEwWD5aig1LqLDxRIuQDN/EpzHKc
	 JjDrmb7dlVtPhElyeWgqRVWfb4Mt2Jz4QxXIGGyWvS8o8WD589/USo9FaGNSuCb64K
	 Vj88T4kF/j08hsGP8nr+oQtXFKjgRejc4SgDLpaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09353F897E5;
	Sat, 27 Apr 2019 19:54:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 170D3F8972F; Sat, 27 Apr 2019 19:53:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F954F80CAB;
 Sat, 27 Apr 2019 19:53:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F954F80CAB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Cju3DSCu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=uLVwsqTQbUd3X+I74XdCBaY5xu4AZ8KEBgcgY4D2WMA=; b=Cju3DSCuxBUK
 aVJ01QV6/R7Zz374GSsfKHlM9+zwAkbp04sT+TWLV5m2ljG+fNBLijcLwtBT1CuYfQia/EBL2zmQS
 /2yMKIdqPojCo0e7C8opWrWhKJsJ17IIJ0QAtCQtcrChESeom7JuAVChTLFzrYV6ZdVsjKPe3crit
 NBjxI=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVW-0004qe-6B; Sat, 27 Apr 2019 17:53:03 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id A5EC6441D3E; Sat, 27 Apr 2019 18:52:58 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160519.30207-11-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175258.A5EC6441D3E@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:58 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add userspace ABI support" to the
	asoc tree
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
Content-Type: multipart/mixed; boundary="===============0133486462825915395=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============0133486462825915395==
Content-Type: text/plain

The patch

   ASoC: SOF: Add userspace ABI support

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

From 4483151e765b5a7ffb823fe9bb11128101410427 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:05:15 -0500
Subject: [PATCH] ASoC: SOF: Add userspace ABI support

Add userspace ABI for audio userspace application IO outside of regular
ALSA PCM and kcontrols. This is intended to be used to format
coefficients and data for custom processing components.

Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/uapi/sound/sof/abi.h      |  62 ++++++++++
 include/uapi/sound/sof/eq.h       | 172 +++++++++++++++++++++++++++
 include/uapi/sound/sof/fw.h       |  78 +++++++++++++
 include/uapi/sound/sof/header.h   |  27 +++++
 include/uapi/sound/sof/manifest.h | 188 ++++++++++++++++++++++++++++++
 include/uapi/sound/sof/tokens.h   | 107 +++++++++++++++++
 include/uapi/sound/sof/tone.h     |  21 ++++
 include/uapi/sound/sof/trace.h    |  66 +++++++++++
 8 files changed, 721 insertions(+)
 create mode 100644 include/uapi/sound/sof/abi.h
 create mode 100644 include/uapi/sound/sof/eq.h
 create mode 100644 include/uapi/sound/sof/fw.h
 create mode 100644 include/uapi/sound/sof/header.h
 create mode 100644 include/uapi/sound/sof/manifest.h
 create mode 100644 include/uapi/sound/sof/tokens.h
 create mode 100644 include/uapi/sound/sof/tone.h
 create mode 100644 include/uapi/sound/sof/trace.h

diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
new file mode 100644
index 000000000000..37e0a90dc9e6
--- /dev/null
+++ b/include/uapi/sound/sof/abi.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ */
+
+/**
+ * SOF ABI versioning is based on Semantic Versioning where we have a given
+ * MAJOR.MINOR.PATCH version number. See https://semver.org/
+ *
+ * Rules for incrementing or changing version :-
+ *
+ * 1) Increment MAJOR version if you make incompatible API changes. MINOR and
+ *    PATCH should be reset to 0.
+ *
+ * 2) Increment MINOR version if you add backwards compatible features or
+ *    changes. PATCH should be reset to 0.
+ *
+ * 3) Increment PATCH version if you add backwards compatible bug fixes.
+ */
+
+#ifndef __INCLUDE_UAPI_SOUND_SOF_ABI_H__
+#define __INCLUDE_UAPI_SOUND_SOF_ABI_H__
+
+/* SOF ABI version major, minor and patch numbers */
+#define SOF_ABI_MAJOR 3
+#define SOF_ABI_MINOR 4
+#define SOF_ABI_PATCH 0
+
+/* SOF ABI version number. Format within 32bit word is MMmmmppp */
+#define SOF_ABI_MAJOR_SHIFT	24
+#define SOF_ABI_MAJOR_MASK	0xff
+#define SOF_ABI_MINOR_SHIFT	12
+#define SOF_ABI_MINOR_MASK	0xfff
+#define SOF_ABI_PATCH_SHIFT	0
+#define SOF_ABI_PATCH_MASK	0xfff
+
+#define SOF_ABI_VER(major, minor, patch) \
+	(((major) << SOF_ABI_MAJOR_SHIFT) | \
+	((minor) << SOF_ABI_MINOR_SHIFT) | \
+	((patch) << SOF_ABI_PATCH_SHIFT))
+
+#define SOF_ABI_VERSION_MAJOR(version) \
+	(((version) >> SOF_ABI_MAJOR_SHIFT) & SOF_ABI_MAJOR_MASK)
+#define SOF_ABI_VERSION_MINOR(version)	\
+	(((version) >> SOF_ABI_MINOR_SHIFT) & SOF_ABI_MINOR_MASK)
+#define SOF_ABI_VERSION_PATCH(version)	\
+	(((version) >> SOF_ABI_PATCH_SHIFT) & SOF_ABI_PATCH_MASK)
+
+#define SOF_ABI_VERSION_INCOMPATIBLE(sof_ver, client_ver)		\
+	(SOF_ABI_VERSION_MAJOR((sof_ver)) !=				\
+		SOF_ABI_VERSION_MAJOR((client_ver))			\
+	)
+
+#define SOF_ABI_VERSION SOF_ABI_VER(SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH)
+
+/* SOF ABI magic number "SOF\0". */
+#define SOF_ABI_MAGIC		0x00464F53
+
+#endif
diff --git a/include/uapi/sound/sof/eq.h b/include/uapi/sound/sof/eq.h
new file mode 100644
index 000000000000..666c2b6a3229
--- /dev/null
+++ b/include/uapi/sound/sof/eq.h
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INCLUDE_UAPI_SOUND_SOF_USER_EQ_H__
+#define __INCLUDE_UAPI_SOUND_SOF_USER_EQ_H__
+
+/* FIR EQ type */
+
+#define SOF_EQ_FIR_IDX_SWITCH	0
+
+#define SOF_EQ_FIR_MAX_SIZE 4096 /* Max size allowed for coef data in bytes */
+
+#define SOF_EQ_FIR_MAX_LENGTH 192 /* Max length for individual filter */
+
+#define SOF_EQ_FIR_MAX_RESPONSES 8 /* A blob can define max 8 FIR EQs */
+
+/*
+ * eq_fir_configuration data structure contains this information
+ *     uint32_t size
+ *	   This is the number of bytes need to store the received EQ
+ *	   configuration.
+ *     uint16_t channels_in_config
+ *         This describes the number of channels in this EQ config data. It
+ *         can be different from PLATFORM_MAX_CHANNELS.
+ *     uint16_t number_of_responses
+ *         0=no responses, 1=one response defined, 2=two responses defined, etc.
+ *     int16_t data[]
+ *         assign_response[channels_in_config]
+ *             0 = use first response, 1 = use 2nd response, etc.
+ *             E.g. {0, 0, 0, 0, 1, 1, 1, 1} would apply to channels 0-3 the
+ *	       same first defined response and for to channels 4-7 the second.
+ *         coef_data[]
+ *             Repeated data
+ *             { filter_length, output_shift, h[] }
+ *	       for every EQ response defined where vector h has filter_length
+ *             number of coefficients. Coefficients in h[] are in Q1.15 format.
+ *             E.g. 16384 (Q1.15) = 0.5. The shifts are number of right shifts.
+ *
+ * NOTE: The channels_in_config must be even to have coef_data aligned to
+ * 32 bit word in RAM. Therefore a mono EQ assign must be duplicated to 2ch
+ * even if it would never used. Similarly a 5ch EQ assign must be increased
+ * to 6ch. EQ init will return an error if this is not met.
+ *
+ * NOTE: The filter_length must be multiple of four. Therefore the filter must
+ * be padded from the end with zeros have this condition met.
+ */
+
+struct sof_eq_fir_config {
+	uint32_t size;
+	uint16_t channels_in_config;
+	uint16_t number_of_responses;
+
+	/* reserved */
+	uint32_t reserved[4];
+
+	int16_t data[];
+} __packed;
+
+struct sof_eq_fir_coef_data {
+	int16_t length; /* Number of FIR taps */
+	int16_t out_shift; /* Amount of right shifts at output */
+
+	/* reserved */
+	uint32_t reserved[4];
+
+	int16_t coef[]; /* FIR coefficients */
+} __packed;
+
+/* In the struct above there's two 16 bit words (length, shift) and four
+ * reserved 32 bit words before the actual FIR coefficients. This information
+ * is used in parsing of the configuration blob.
+ */
+#define SOF_EQ_FIR_COEF_NHEADER \
+	(sizeof(struct sof_eq_fir_coef_data) / sizeof(int16_t))
+
+/* IIR EQ type */
+
+#define SOF_EQ_IIR_IDX_SWITCH   0
+
+#define SOF_EQ_IIR_MAX_SIZE 1024 /* Max size allowed for coef data in bytes */
+
+#define SOF_EQ_IIR_MAX_RESPONSES 8 /* A blob can define max 8 IIR EQs */
+
+/* eq_iir_configuration
+ *     uint32_t channels_in_config
+ *         This describes the number of channels in this EQ config data. It
+ *         can be different from PLATFORM_MAX_CHANNELS.
+ *     uint32_t number_of_responses_defined
+ *         0=no responses, 1=one response defined, 2=two responses defined, etc.
+ *     int32_t data[]
+ *         Data consist of two parts. First is the response assign vector that
+ *	   has length of channels_in_config. The latter part is coefficient
+ *         data.
+ *         uint32_t assign_response[channels_in_config]
+ *             -1 = not defined, 0 = use first response, 1 = use 2nd, etc.
+ *             E.g. {0, 0, 0, 0, -1, -1, -1, -1} would apply to channels 0-3 the
+ *             same first defined response and leave channels 4-7 unequalized.
+ *         coefficient_data[]
+ *             <1st EQ>
+ *             uint32_t num_biquads
+ *             uint32_t num_biquads_in_series
+ *             <1st biquad>
+ *             int32_t coef_a2       Q2.30 format
+ *             int32_t coef_a1       Q2.30 format
+ *             int32_t coef_b2       Q2.30 format
+ *             int32_t coef_b1       Q2.30 format
+ *             int32_t coef_b0       Q2.30 format
+ *             int32_t output_shift  number of shifts right, shift left is negative
+ *             int32_t output_gain   Q2.14 format
+ *             <2nd biquad>
+ *             ...
+ *             <2nd EQ>
+ *
+ *         Note: A flat response biquad can be made with a section set to
+ *         b0 = 1.0, gain = 1.0, and other parameters set to 0
+ *         {0, 0, 0, 0, 1073741824, 0, 16484}
+ */
+
+struct sof_eq_iir_config {
+	uint32_t size;
+	uint32_t channels_in_config;
+	uint32_t number_of_responses;
+
+	/* reserved */
+	uint32_t reserved[4];
+
+	int32_t data[]; /* eq_assign[channels], eq 0, eq 1, ... */
+} __packed;
+
+struct sof_eq_iir_header_df2t {
+	uint32_t num_sections;
+	uint32_t num_sections_in_series;
+
+	/* reserved */
+	uint32_t reserved[4];
+
+	int32_t biquads[]; /* Repeated biquad coefficients */
+} __packed;
+
+struct sof_eq_iir_biquad_df2t {
+	int32_t a2; /* Q2.30 */
+	int32_t a1; /* Q2.30 */
+	int32_t b2; /* Q2.30 */
+	int32_t b1; /* Q2.30 */
+	int32_t b0; /* Q2.30 */
+	int32_t output_shift; /* Number of right shifts */
+	int32_t output_gain;  /* Q2.14 */
+} __packed;
+
+/* A full 22th order equalizer with 11 biquads cover octave bands 1-11 in
+ * in the 0 - 20 kHz bandwidth.
+ */
+#define SOF_EQ_IIR_DF2T_BIQUADS_MAX 11
+
+/* The number of int32_t words in sof_eq_iir_header_df2t:
+ *	num_sections, num_sections_in_series, reserved[4]
+ */
+#define SOF_EQ_IIR_NHEADER_DF2T \
+	(sizeof(struct sof_eq_iir_header_df2t) / sizeof(int32_t))
+
+/* The number of int32_t words in sof_eq_iir_biquad_df2t:
+ *	a2, a1, b2, b1, b0, output_shift, output_gain
+ */
+#define SOF_EQ_IIR_NBIQUAD_DF2T \
+	(sizeof(struct sof_eq_iir_biquad_df2t) / sizeof(int32_t))
+
+#endif
diff --git a/include/uapi/sound/sof/fw.h b/include/uapi/sound/sof/fw.h
new file mode 100644
index 000000000000..1afca973eb09
--- /dev/null
+++ b/include/uapi/sound/sof/fw.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ */
+
+/*
+ * Firmware file format .
+ */
+
+#ifndef __INCLUDE_UAPI_SOF_FW_H__
+#define __INCLUDE_UAPI_SOF_FW_H__
+
+#define SND_SOF_FW_SIG_SIZE	4
+#define SND_SOF_FW_ABI		1
+#define SND_SOF_FW_SIG		"Reef"
+
+/*
+ * Firmware module is made up of 1 . N blocks of different types. The
+ * Block header is used to determine where and how block is to be copied in the
+ * DSP/host memory space.
+ */
+enum snd_sof_fw_blk_type {
+	SOF_FW_BLK_TYPE_INVALID	= -1,
+	SOF_FW_BLK_TYPE_START	= 0,
+	SOF_FW_BLK_TYPE_RSRVD0	= SOF_FW_BLK_TYPE_START,
+	SOF_FW_BLK_TYPE_IRAM	= 1,	/* local instruction RAM */
+	SOF_FW_BLK_TYPE_DRAM	= 2,	/* local data RAM */
+	SOF_FW_BLK_TYPE_SRAM	= 3,	/* system RAM */
+	SOF_FW_BLK_TYPE_ROM	= 4,
+	SOF_FW_BLK_TYPE_IMR	= 5,
+	SOF_FW_BLK_TYPE_RSRVD6	= 6,
+	SOF_FW_BLK_TYPE_RSRVD7	= 7,
+	SOF_FW_BLK_TYPE_RSRVD8	= 8,
+	SOF_FW_BLK_TYPE_RSRVD9	= 9,
+	SOF_FW_BLK_TYPE_RSRVD10	= 10,
+	SOF_FW_BLK_TYPE_RSRVD11	= 11,
+	SOF_FW_BLK_TYPE_RSRVD12	= 12,
+	SOF_FW_BLK_TYPE_RSRVD13	= 13,
+	SOF_FW_BLK_TYPE_RSRVD14	= 14,
+	/* use SOF_FW_BLK_TYPE_RSVRDX for new block types */
+	SOF_FW_BLK_TYPE_NUM
+};
+
+struct snd_sof_blk_hdr {
+	enum snd_sof_fw_blk_type type;
+	uint32_t size;		/* bytes minus this header */
+	uint32_t offset;	/* offset from base */
+} __packed;
+
+/*
+ * Firmware file is made up of 1 .. N different modules types. The module
+ * type is used to determine how to load and parse the module.
+ */
+enum snd_sof_fw_mod_type {
+	SOF_FW_BASE	= 0,	/* base firmware image */
+	SOF_FW_MODULE	= 1,	/* firmware module */
+};
+
+struct snd_sof_mod_hdr {
+	enum snd_sof_fw_mod_type type;
+	uint32_t size;		/* bytes minus this header */
+	uint32_t num_blocks;	/* number of blocks */
+} __packed;
+
+/*
+ * Firmware file header.
+ */
+struct snd_sof_fw_header {
+	unsigned char sig[SND_SOF_FW_SIG_SIZE]; /* "Reef" */
+	uint32_t file_size;	/* size of file minus this header */
+	uint32_t num_modules;	/* number of modules */
+	uint32_t abi;		/* version of header format */
+} __packed;
+
+#endif
diff --git a/include/uapi/sound/sof/header.h b/include/uapi/sound/sof/header.h
new file mode 100644
index 000000000000..7868990b0d6f
--- /dev/null
+++ b/include/uapi/sound/sof/header.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INCLUDE_UAPI_SOUND_SOF_USER_HEADER_H__
+#define __INCLUDE_UAPI_SOUND_SOF_USER_HEADER_H__
+
+/*
+ * Header for all non IPC ABI data.
+ *
+ * Identifies data type, size and ABI.
+ * Used by any bespoke component data structures or binary blobs.
+ */
+struct sof_abi_hdr {
+	uint32_t magic;		/**< 'S', 'O', 'F', '\0' */
+	uint32_t type;		/**< component specific type */
+	uint32_t size;		/**< size in bytes of data excl. this struct */
+	uint32_t abi;		/**< SOF ABI version */
+	uint32_t reserved[4];	/**< reserved for future use */
+	uint32_t data[0];	/**< Component data - opaque to core */
+}  __packed;
+
+#endif
diff --git a/include/uapi/sound/sof/manifest.h b/include/uapi/sound/sof/manifest.h
new file mode 100644
index 000000000000..2009ee30fad0
--- /dev/null
+++ b/include/uapi/sound/sof/manifest.h
@@ -0,0 +1,188 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INCLUDE_UAPI_SOUND_SOF_USER_MANIFEST_H__
+#define __INCLUDE_UAPI_SOUND_SOF_USER_MANIFEST_H__
+
+/* start offset for base FW module */
+#define SOF_MAN_ELF_TEXT_OFFSET		0x2000
+
+/* FW Extended Manifest Header id = $AE1 */
+#define SOF_MAN_EXT_HEADER_MAGIC	0x31454124
+
+/* module type load type */
+#define SOF_MAN_MOD_TYPE_BUILTIN	0
+#define SOF_MAN_MOD_TYPE_MODULE		1
+
+struct sof_man_module_type {
+	uint32_t load_type:4;	/* SOF_MAN_MOD_TYPE_ */
+	uint32_t auto_start:1;
+	uint32_t domain_ll:1;
+	uint32_t domain_dp:1;
+	uint32_t rsvd_:25;
+};
+
+/* segment flags.type */
+#define SOF_MAN_SEGMENT_TEXT		0
+#define SOF_MAN_SEGMENT_RODATA		1
+#define SOF_MAN_SEGMENT_DATA		1
+#define SOF_MAN_SEGMENT_BSS		2
+#define SOF_MAN_SEGMENT_EMPTY		15
+
+union sof_man_segment_flags {
+	uint32_t ul;
+	struct {
+		uint32_t contents:1;
+		uint32_t alloc:1;
+		uint32_t load:1;
+		uint32_t readonly:1;
+		uint32_t code:1;
+		uint32_t data:1;
+		uint32_t _rsvd0:2;
+		uint32_t type:4;	/* MAN_SEGMENT_ */
+		uint32_t _rsvd1:4;
+		uint32_t length:16;	/* of segment in pages */
+	} r;
+} __packed;
+
+/*
+ * Module segment descriptor. Used by ROM - Immutable.
+ */
+struct sof_man_segment_desc {
+	union sof_man_segment_flags flags;
+	uint32_t v_base_addr;
+	uint32_t file_offset;
+} __packed;
+
+/*
+ * The firmware binary can be split into several modules.
+ */
+
+#define SOF_MAN_MOD_ID_LEN		4
+#define SOF_MAN_MOD_NAME_LEN		8
+#define SOF_MAN_MOD_SHA256_LEN		32
+#define SOF_MAN_MOD_ID			{'$', 'A', 'M', 'E'}
+
+/*
+ * Each module has an entry in the FW header. Used by ROM - Immutable.
+ */
+struct sof_man_module {
+	uint8_t struct_id[SOF_MAN_MOD_ID_LEN];	/* SOF_MAN_MOD_ID */
+	uint8_t name[SOF_MAN_MOD_NAME_LEN];
+	uint8_t uuid[16];
+	struct sof_man_module_type type;
+	uint8_t hash[SOF_MAN_MOD_SHA256_LEN];
+	uint32_t entry_point;
+	uint16_t cfg_offset;
+	uint16_t cfg_count;
+	uint32_t affinity_mask;
+	uint16_t instance_max_count;	/* max number of instances */
+	uint16_t instance_bss_size;	/* instance (pages) */
+	struct sof_man_segment_desc segment[3];
+} __packed;
+
+/*
+ * Each module has a configuration in the FW header. Used by ROM - Immutable.
+ */
+struct sof_man_mod_config {
+	uint32_t par[4];	/* module parameters */
+	uint32_t is_pages;	/* actual size of instance .bss (pages) */
+	uint32_t cps;		/* cycles per second */
+	uint32_t ibs;		/* input buffer size (bytes) */
+	uint32_t obs;		/* output buffer size (bytes) */
+	uint32_t module_flags;	/* flags, reserved for future use */
+	uint32_t cpc;		/* cycles per single run */
+	uint32_t obls;		/* output block size, reserved for future use */
+} __packed;
+
+/*
+ * FW Manifest Header
+ */
+
+#define SOF_MAN_FW_HDR_FW_NAME_LEN	8
+#define SOF_MAN_FW_HDR_ID		{'$', 'A', 'M', '1'}
+#define SOF_MAN_FW_HDR_NAME		"ADSPFW"
+#define SOF_MAN_FW_HDR_FLAGS		0x0
+#define SOF_MAN_FW_HDR_FEATURES		0xff
+
+/*
+ * The firmware has a standard header that is checked by the ROM on firmware
+ * loading. preload_page_count is used by DMA code loader and is entire
+ * image size on CNL. i.e. CNL: total size of the binary’s .text and .rodata
+ * Used by ROM - Immutable.
+ */
+struct sof_man_fw_header {
+	uint8_t header_id[4];
+	uint32_t header_len;
+	uint8_t name[SOF_MAN_FW_HDR_FW_NAME_LEN];
+	/* number of pages of preloaded image loaded by driver */
+	uint32_t preload_page_count;
+	uint32_t fw_image_flags;
+	uint32_t feature_mask;
+	uint16_t major_version;
+	uint16_t minor_version;
+	uint16_t hotfix_version;
+	uint16_t build_version;
+	uint32_t num_module_entries;
+	uint32_t hw_buf_base_addr;
+	uint32_t hw_buf_length;
+	/* target address for binary loading as offset in IMR - must be == base offset */
+	uint32_t load_offset;
+} __packed;
+
+/*
+ * Firmware manifest descriptor. This can contain N modules and N module
+ * configs. Used by ROM - Immutable.
+ */
+struct sof_man_fw_desc {
+	struct sof_man_fw_header header;
+
+	/* Warning - hack for module arrays. For some unknown reason the we
+	 * have a variable size array of struct man_module followed by a
+	 * variable size array of struct mod_config. These should have been
+	 * merged into a variable array of a parent structure. We have to hack
+	 * around this in many places....
+	 *
+	 * struct sof_man_module man_module[];
+	 * struct sof_man_mod_config mod_config[];
+	 */
+
+} __packed;
+
+/*
+ * Component Descriptor. Used by ROM - Immutable.
+ */
+struct sof_man_component_desc {
+	uint32_t reserved[2];	/* all 0 */
+	uint32_t version;
+	uint8_t hash[SOF_MAN_MOD_SHA256_LEN];
+	uint32_t base_offset;
+	uint32_t limit_offset;
+	uint32_t attributes[4];
+} __packed;
+
+/*
+ * Audio DSP extended metadata. Used by ROM - Immutable.
+ */
+struct sof_man_adsp_meta_file_ext {
+	uint32_t ext_type;	/* always 17 for ADSP extension */
+	uint32_t ext_len;
+	uint32_t imr_type;
+	uint8_t reserved[16];	/* all 0 */
+	struct sof_man_component_desc comp_desc[1];
+} __packed;
+
+/*
+ * Module Manifest for rimage module metadata. Not used by ROM.
+ */
+struct sof_man_module_manifest {
+	struct sof_man_module module;
+	uint32_t text_size;
+} __packed;
+
+#endif
diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
new file mode 100644
index 000000000000..53ea94bf1c08
--- /dev/null
+++ b/include/uapi/sound/sof/tokens.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+ *         Keyon Jie <yang.jie@linux.intel.com>
+ */
+
+/*
+ * Topology IDs and tokens.
+ *
+ * ** MUST BE ALIGNED WITH TOPOLOGY CONFIGURATION TOKEN VALUES **
+ */
+
+#ifndef __INCLUDE_UAPI_SOF_TOPOLOGY_H__
+#define __INCLUDE_UAPI_SOF_TOPOLOGY_H__
+
+/*
+ * Kcontrol IDs
+ */
+#define SOF_TPLG_KCTL_VOL_ID	256
+#define SOF_TPLG_KCTL_ENUM_ID	257
+#define SOF_TPLG_KCTL_BYTES_ID	258
+#define SOF_TPLG_KCTL_SWITCH_ID	259
+
+/*
+ * Tokens - must match values in topology configurations
+ */
+
+/* buffers */
+#define SOF_TKN_BUF_SIZE			100
+#define SOF_TKN_BUF_CAPS			101
+
+/* DAI */
+/* Token retired with ABI 3.2, do not use for new capabilities
+ * #define	SOF_TKN_DAI_DMAC_CONFIG			153
+ */
+#define SOF_TKN_DAI_TYPE			154
+#define SOF_TKN_DAI_INDEX			155
+#define SOF_TKN_DAI_DIRECTION			156
+
+/* scheduling */
+#define SOF_TKN_SCHED_PERIOD			200
+#define SOF_TKN_SCHED_PRIORITY			201
+#define SOF_TKN_SCHED_MIPS			202
+#define SOF_TKN_SCHED_CORE			203
+#define SOF_TKN_SCHED_FRAMES			204
+#define SOF_TKN_SCHED_TIME_DOMAIN		205
+
+/* volume */
+#define SOF_TKN_VOLUME_RAMP_STEP_TYPE		250
+#define SOF_TKN_VOLUME_RAMP_STEP_MS		251
+
+/* SRC */
+#define SOF_TKN_SRC_RATE_IN			300
+#define SOF_TKN_SRC_RATE_OUT			301
+
+/* PCM */
+#define SOF_TKN_PCM_DMAC_CONFIG			353
+
+/* Generic components */
+#define SOF_TKN_COMP_PERIOD_SINK_COUNT		400
+#define SOF_TKN_COMP_PERIOD_SOURCE_COUNT	401
+#define SOF_TKN_COMP_FORMAT			402
+/* Token retired with ABI 3.2, do not use for new capabilities
+ * #define SOF_TKN_COMP_PRELOAD_COUNT		403
+ */
+
+/* SSP */
+#define SOF_TKN_INTEL_SSP_CLKS_CONTROL		500
+#define SOF_TKN_INTEL_SSP_MCLK_ID		501
+#define SOF_TKN_INTEL_SSP_SAMPLE_BITS		502
+#define SOF_TKN_INTEL_SSP_FRAME_PULSE_WIDTH	503
+#define SOF_TKN_INTEL_SSP_QUIRKS		504
+#define SOF_TKN_INTEL_SSP_TDM_PADDING_PER_SLOT	505
+
+/* DMIC */
+#define SOF_TKN_INTEL_DMIC_DRIVER_VERSION	600
+#define SOF_TKN_INTEL_DMIC_CLK_MIN		601
+#define SOF_TKN_INTEL_DMIC_CLK_MAX		602
+#define SOF_TKN_INTEL_DMIC_DUTY_MIN		603
+#define SOF_TKN_INTEL_DMIC_DUTY_MAX		604
+#define SOF_TKN_INTEL_DMIC_NUM_PDM_ACTIVE	605
+#define SOF_TKN_INTEL_DMIC_SAMPLE_RATE		608
+#define SOF_TKN_INTEL_DMIC_FIFO_WORD_LENGTH	609
+
+/* DMIC PDM */
+#define SOF_TKN_INTEL_DMIC_PDM_CTRL_ID		700
+#define SOF_TKN_INTEL_DMIC_PDM_MIC_A_Enable	701
+#define SOF_TKN_INTEL_DMIC_PDM_MIC_B_Enable	702
+#define SOF_TKN_INTEL_DMIC_PDM_POLARITY_A	703
+#define SOF_TKN_INTEL_DMIC_PDM_POLARITY_B	704
+#define SOF_TKN_INTEL_DMIC_PDM_CLK_EDGE		705
+#define SOF_TKN_INTEL_DMIC_PDM_SKEW		706
+
+/* Tone */
+#define SOF_TKN_TONE_SAMPLE_RATE		800
+
+/* Processing Components */
+#define SOF_TKN_PROCESS_TYPE                    900
+
+/* for backward compatibility */
+#define SOF_TKN_EFFECT_TYPE	SOF_TKN_PROCESS_TYPE
+
+#endif
diff --git a/include/uapi/sound/sof/tone.h b/include/uapi/sound/sof/tone.h
new file mode 100644
index 000000000000..d7c6e5d8317e
--- /dev/null
+++ b/include/uapi/sound/sof/tone.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+* This file is provided under a dual BSD/GPLv2 license.  When using or
+* redistributing this file, you may do so under either license.
+*
+* Copyright(c) 2018 Intel Corporation. All rights reserved.
+*/
+
+#ifndef __INCLUDE_UAPI_SOUND_SOF_USER_TONE_H__
+#define __INCLUDE_UAPI_SOUND_SOF_USER_TONE_H__
+
+#define SOF_TONE_IDX_FREQUENCY		0
+#define SOF_TONE_IDX_AMPLITUDE		1
+#define SOF_TONE_IDX_FREQ_MULT		2
+#define SOF_TONE_IDX_AMPL_MULT		3
+#define SOF_TONE_IDX_LENGTH		4
+#define SOF_TONE_IDX_PERIOD		5
+#define SOF_TONE_IDX_REPEATS		6
+#define SOF_TONE_IDX_LIN_RAMP_STEP	7
+
+#endif
diff --git a/include/uapi/sound/sof/trace.h b/include/uapi/sound/sof/trace.h
new file mode 100644
index 000000000000..ffa7288a0f16
--- /dev/null
+++ b/include/uapi/sound/sof/trace.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INCLUDE_UAPI_SOUND_SOF_USER_TRACE_H__
+#define __INCLUDE_UAPI_SOUND_SOF_USER_TRACE_H__
+
+/*
+ * Host system time.
+ *
+ * This property is used by the driver to pass down information about
+ * current system time. It is expressed in us.
+ * FW translates timestamps (in log entries, probe pockets) to this time
+ * domain.
+ *
+ * (cavs: SystemTime).
+ */
+struct system_time {
+	uint32_t val_l;  /* Lower dword of current host time value */
+	uint32_t val_u;  /* Upper dword of current host time value */
+} __packed;
+
+#define LOG_ENABLE		1  /* Enable logging */
+#define LOG_DISABLE		0  /* Disable logging */
+
+#define LOG_LEVEL_CRITICAL	1  /* (FDK fatal) */
+#define LOG_LEVEL_VERBOSE	2
+
+/*
+ * Layout of a log fifo.
+ */
+struct log_buffer_layout {
+	uint32_t read_ptr;  /*read pointer */
+	uint32_t write_ptr; /* write pointer */
+	uint32_t buffer[0]; /* buffer */
+} __packed;
+
+/*
+ * Log buffer status reported by FW.
+ */
+struct log_buffer_status {
+	uint32_t core_id;  /* ID of core that logged to other half */
+} __packed;
+
+#define TRACE_ID_LENGTH 12
+
+/*
+ *  Log entry header.
+ *
+ * The header is followed by an array of arguments (uint32_t[]).
+ * Number of arguments is specified by the params_num field of log_entry
+ */
+struct log_entry_header {
+	uint32_t id_0 : TRACE_ID_LENGTH;	/* e.g. Pipeline ID */
+	uint32_t id_1 : TRACE_ID_LENGTH;	/* e.g. Component ID */
+	uint32_t core_id : 8;		/* Reporting core's id */
+
+	uint64_t timestamp;		/* Timestamp (in dsp ticks) */
+	uint32_t log_entry_address;	/* Address of log entry in ELF */
+} __packed;
+
+#endif
-- 
2.20.1


--===============0133486462825915395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0133486462825915395==--
