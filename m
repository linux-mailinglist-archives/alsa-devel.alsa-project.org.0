Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB6D20BE9B
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jun 2020 06:56:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D03AD1685;
	Sat, 27 Jun 2020 06:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D03AD1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593233773;
	bh=M1QV9DYVmi9nGpSOXMEjjroJtIEVXALpj7wR0ZWR53I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uEeo8M10NoHHUYbSw9VwVApMWBvX5gX+ItsyoicH3zjE2cW8Kk6fjeHESsa7YRxqI
	 E0kA21I4dw8IrKpFavG2KlDGNYo3MqMs1l165XaIZ8fU9nKdvjYKuGkFJhYeX+6Mv9
	 b9CGot82IMcfToGFI9xAEyRL02GEbzGo8KF4FDQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63E05F80259;
	Sat, 27 Jun 2020 06:54:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 411F7F80234; Sat, 27 Jun 2020 06:54:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D7BBF80096
 for <alsa-devel@alsa-project.org>; Sat, 27 Jun 2020 06:54:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D7BBF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="ieyO7nVu"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef6d0eb0000>; Fri, 26 Jun 2020 21:54:03 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 26 Jun 2020 21:54:16 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 26 Jun 2020 21:54:16 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 27 Jun
 2020 04:54:15 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 27 Jun 2020 04:54:15 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ef6d0f20000>; Fri, 26 Jun 2020 21:54:15 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v4 00/23] Add support for Tegra210 Audio
Date: Sat, 27 Jun 2020 10:23:22 +0530
Message-ID: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593233643; bh=gS2LeCBOkNr/NDBOzIl7Kje7Ih0caLuxNgYjjUAkrGI=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Type;
 b=ieyO7nVuxuTmORQkdbE14Hai2Rn9w2fwSB8T/JhuxN7zy4axsO/cN17rh8HCzuI13
 isyZH6lmG6+zUq7FYm5AG7oan9P8z8d0TyZBnLZxfmQAaCWjOnaLAX2PWjlm8FS5Pw
 4CqDGCUGCeW5MewCYcXG5/j/RcD8IVThc8JzvJhJkwjhYVfO6GnbFjHX5UBF0aMDtJ
 hcGekQFPwtuaeURJLIwIkUd3+jsONFmhqdO9YijDc0xOLNY0ovywJlG4rwD12UeEk/
 e/nZRyKdsavpTM31b6Tw2pKmAbchFq5Ub0TzbgVukLdO99DZt0Ghthwx4WCu1N6ceZ
 f22CFnoUVX8aQ==
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 Sameer Pujar <spujar@nvidia.com>, nwartikar@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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

Overview
========
Audio Processing Engine (APE) comprises of Audio DMA (ADMA) and Audio
Hub (AHUB) unit. AHUB is a collection of hardware accelerators for audio
pre-processing and post-processing. It also includes a programmable full
crossbar for routing audio data across these accelerators.

This series exposes some of these below mentioned HW devices as ASoC
components for Tegra platforms from Tegra210 onwards.
 * ADMAIF : The interface between ADMA and AHUB
 * XBAR   : Crossbar for routing audio samples across various modules
 * I2S    : Inter-IC Sound Controller
 * DMIC   : Digital Microphone
 * DSPK   : Digital Speaker

Following is the summary of current series.
 * Add YAML DT binding documentation for above mentioned modules.
 * Helper function for ACIF programming is exposed for Tegra210 and later.
 * Add ASoC driver components for each of the above modules.
 * Add DT entries for above components for Tegra210, Tegra186 and
   Tegra194.
 * Enable these components for Jetson Nano/TX1/TX2/Xavier
 * Enhance simple-card DPCM driver to suit Tegra Audio applications with
   few changes in core.
 * To begin with, enable sound card support for Tegra210 based platforms
   like Jetson Nano/TX1.

Sound card support for platforms based on Tegra186 and later will be
subsequently added which can re-use all of the above components.

Changelog
=========

v3 -> v4
--------
 * [1/23] "ASoC: dt-bindings: tegra: Add DT bindings for Tegra210"
   - Removed multiple examples and retained one example per doc
   - Fixed as per inputs on the previous series
   - Tested bindings with 'make dt_binding_check/dtbs_check'

 * [2/23] "ASoC: tegra: Add support for CIF programming"
   - No change

 * Common changes (for patch [3/10] to [7/10])
   - Mixer control overrides, for PCM parameters (rate, channel, bits),
     in each driver are dropped.
   - Updated routing as per DPCM usage
   - Minor changes related to formatting

 * New changes (patch [8/23] to [18/23] and patch [23/23])
   - Based on discussions in following threads DPCM is used for Tegra Audio.
     https://lkml.org/lkml/2020/2/20/91
     https://lkml.org/lkml/2020/4/30/519
   - The simple-card driver is used for Tegra Audio and accordingly
     some enhancements are made in simple-card and core drivers.
   - Patch [8/23] to [18/23] are related to simple-card and core changes.
   - Patch [23/23] adds sound card support to realize complete audio path.
     This is based on simple-card driver with proposed enhancements.
   - Re-ordered patches depending on above 

v2 -> v3
--------
 * [1/10]  "dt-bindings: sound: tegra: add DT binding for AHUB
   - Updated licence
   - Removed redundancy w.r.t items/const/enum
   - Added constraints wherever needed with "pattern" property

 * [2/10]  "ASoC: tegra: add support for CIF programming"
   - Removed tegra_cif.c
   - Instead added inline helper function in tegra_cif.h

 * common changes (for patch [3/10] to [7/10])
   - Replace LATE system calls with Normal sleep
   - Remove explicit RPM suspend in driver remove() call
   - Use devm_kzalloc() instead of devm_kcalloc() for single element
   - Replace 'ret' with 'err' for better reading
   - Consistent error printing style across drivers
   - Minor formating fixes

 * [8/10]  "arm64: tegra: add AHUB components for few Tegra chips"
   - no change

 * [9/10]  "arm64: tegra: enable AHUB modules for few Tegra chips"
   - no change

 * [10/10] "arm64: defconfig: enable AHUB components for Tegra210 and later"
   (New patch)
   - Enables ACONNECT and AHUB components. With this AHUB and components are
     registered with ASoC core.


v1 -> v2
--------
 * [1/9] "dt-bindings: sound: tegra: add DT binding for AHUB"
   - no changes

 * [2/9] "ASoC: tegra: add support for CIF programming"
   - removed CIF programming changes for legacy chips.
   - this patch now exposes helper function for CIF programming,
     which can be used on Tegra210 later.
   - later tegra_cif.c can be extended for legacy chips as well.
   - updated commit message accordingly

 * [3/9] "ASoC: tegra: add Tegra210 based DMIC driver"
   - removed unnecessary initialization of 'ret' in probe()

 * [4/9] "ASoC: tegra: add Tegra210 based I2S driver"
   - removed unnecessary initialization of 'ret' in probe()
   - fixed indentation
   - added consistent bracing for if-else clauses
   - updated 'rx_fifo_th' type to 'unsigned int'
   - used BIT() macro for defines like '1 << {x}' in tegra210_i2s.h

 * [5/9] "ASoC: tegra: add Tegra210 based AHUB driver"
   - used of_device_get_match_data() to get 'soc_data' and removed
    explicit of_match_device()
   - used devm_platform_ioremap_resource() and removed explicit
    platform_get_resource()
   - fixed indentation for devm_snd_soc_register_component()
   - updated commit message
   - updated commit message to reflect compatible binding for Tegra186 and
     Tegra194.
* [6/9] "ASoC: tegra: add Tegra186 based DSPK driver"
   - removed unnecessary initialization of 'ret' in probe()
   - updated 'max_th' to 'unsigned int'
   - shortened lengthy macro names to avoid wrapping in
     tegra186_dspk_wr_reg() and to be consistent

 * [7/9] "ASoC: tegra: add Tegra210 based ADMAIF driver"
   - used of_device_get_match_data() and removed explicit of_match_device()
   - used BIT() macro for defines like '1 << {x}' in tegra210_admaif.h
   - updated commit message to reflect compatible binding for Tegra186 and
     Tegra194.

 * [8/9] "arm64: tegra: add AHUB components for few Tegra chips"
   - no change

 * [9/9] "arm64: tegra: enable AHUB modules for few Tegra chips"
   - no change

 * common changes for patch [3/9] to [7/9]
   - sorted headers in alphabetical order
   - moved MODULE_DEVICE_TABLE() right below *_of_match table
   - removed macro DRV_NAME
   - removed explicit 'owner' field from platform_driver structure
   - added 'const' to snd_soc_dai_ops structure

==================
Sameer Pujar (23):
  ASoC: dt-bindings: tegra: Add DT bindings for Tegra210
  ASoC: tegra: Add support for CIF programming
  ASoC: tegra: Add Tegra210 based DMIC driver
  ASoC: tegra: Add Tegra210 based I2S driver
  ASoC: tegra: Add Tegra210 based AHUB driver
  ASoC: tegra: Add Tegra186 based DSPK driver
  ASoC: tegra: Add Tegra210 based ADMAIF driver
  ASoC: soc-core: Fix component name_prefix parsing
  ASoC: simple-card: Use of_node and DAI names for DAI link names
  ASoC: simple-card: Wrong daifmt for CPU end of DPCM DAI link
  ASoC: simple-card: Loop over all children for 'mclk-fs'
  ASoC: simple-card: Support DPCM DAI link with multiple Codecs
  ASoC: simple-card: DPCM DAI link direction as per DAI capability
  ASoC: soc-core: Probe auxiliary component before others
  ASoC: soc-core: Identify 'no_pcm' DAI links for DPCM
  ASoC: soc-pcm: Get all BEs along DAPM path
  ASoC: dt-bindings: simple-card: Add compatible for component chaining
  ASoC: simple-card: Add support for component chaining
  arm64: defconfig: Build AHUB component drivers
  arm64: defconfig: Enable CONFIG_TEGRA210_ADMA
  arm64: tegra: Add DT binding for AHUB components
  arm64: tegra: Enable AHUB components on few Tegra platforms
  arm64: tegra: Add support for APE sound card on Jetson Nano and TX1

 .../bindings/sound/nvidia,tegra186-dspk.yaml       |  88 +++
 .../bindings/sound/nvidia,tegra210-admaif.yaml     | 116 +++
 .../bindings/sound/nvidia,tegra210-ahub.yaml       | 144 ++++
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |  88 +++
 .../bindings/sound/nvidia,tegra210-i2s.yaml        | 106 +++
 .../devicetree/bindings/sound/simple-card.yaml     |   1 +
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  48 ++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 231 +++++-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  36 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 239 +++++-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 136 +++-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  85 +++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 219 +++++-
 arch/arm64/configs/defconfig                       |   8 +
 include/sound/simple_card.h                        |   5 +
 include/sound/soc.h                                |   3 +
 sound/soc/generic/simple-card.c                    |  96 ++-
 sound/soc/soc-core.c                               |  43 +-
 sound/soc/soc-dai.c                                |   1 +
 sound/soc/soc-pcm.c                                |   3 +-
 sound/soc/tegra/Kconfig                            |  56 ++
 sound/soc/tegra/Makefile                           |  10 +
 sound/soc/tegra/tegra186_dspk.c                    | 427 +++++++++++
 sound/soc/tegra/tegra186_dspk.h                    |  70 ++
 sound/soc/tegra/tegra210_admaif.c                  | 845 +++++++++++++++++++++
 sound/soc/tegra/tegra210_admaif.h                  | 162 ++++
 sound/soc/tegra/tegra210_ahub.c                    | 578 ++++++++++++++
 sound/soc/tegra/tegra210_ahub.h                    | 100 +++
 sound/soc/tegra/tegra210_dmic.c                    | 440 +++++++++++
 sound/soc/tegra/tegra210_dmic.h                    |  82 ++
 sound/soc/tegra/tegra210_i2s.c                     | 780 +++++++++++++++++++
 sound/soc/tegra/tegra210_i2s.h                     | 126 +++
 sound/soc/tegra/tegra_cif.h                        |  65 ++
 sound/soc/tegra/tegra_pcm.c                        | 235 +++++-
 sound/soc/tegra/tegra_pcm.h                        |  21 +-
 35 files changed, 5657 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
 create mode 100644 sound/soc/tegra/tegra186_dspk.c
 create mode 100644 sound/soc/tegra/tegra186_dspk.h
 create mode 100644 sound/soc/tegra/tegra210_admaif.c
 create mode 100644 sound/soc/tegra/tegra210_admaif.h
 create mode 100644 sound/soc/tegra/tegra210_ahub.c
 create mode 100644 sound/soc/tegra/tegra210_ahub.h
 create mode 100644 sound/soc/tegra/tegra210_dmic.c
 create mode 100644 sound/soc/tegra/tegra210_dmic.h
 create mode 100644 sound/soc/tegra/tegra210_i2s.c
 create mode 100644 sound/soc/tegra/tegra210_i2s.h
 create mode 100644 sound/soc/tegra/tegra_cif.h

-- 
2.7.4

