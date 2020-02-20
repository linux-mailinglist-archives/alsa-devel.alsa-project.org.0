Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 877EB1657CA
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 07:37:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0D0516A3;
	Thu, 20 Feb 2020 07:36:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0D0516A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582180628;
	bh=PdbazBPjPZ0DfEiqWwzVM1PjVT2G1L6aIHUSn40R49w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LtX9fO3ab7y0MOdRln4u9vbt8HSAlwO8i1tVQFWvF6To5kucz+SIwJ9XJX7szS8o0
	 KQzl+4h4Oo6LjGnBr2Dw9BvnTsh++68/IA2jc5Dp/E/GPTu9tE+nPeZjGW9RvyLQxC
	 qLQLP6JILbmmwCVm5+/aJzXqxGdlUTycPzeIfGI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DC9EF80145;
	Thu, 20 Feb 2020 07:35:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 099A8F80148; Thu, 20 Feb 2020 07:35:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C75DF8011D
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 07:35:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C75DF8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="fLhWaNE3"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e4e285d0001>; Wed, 19 Feb 2020 22:34:05 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 19 Feb 2020 22:35:17 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 19 Feb 2020 22:35:17 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Feb
 2020 06:35:17 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Thu, 20 Feb 2020 06:35:16 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e4e289f0001>; Wed, 19 Feb 2020 22:35:16 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <robh+dt@kernel.org>
Subject: [PATCH v3 00/10] add ASoC components for AHUB
Date: Thu, 20 Feb 2020 12:04:42 +0530
Message-ID: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1582180445; bh=Z37BJ+MMqRRQHdYLSPpiPQGwP7SvJrqMimTP4ECmOf4=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Type;
 b=fLhWaNE345r7bKxEJlPPcb5hlsY//W4hjv0ZM3LvX4FIIiS0cBR8cBnxB1CaJ2tHS
 Fdak4PiJCtTUC9Xd5Qsl6N4tXm41O6o6Wu/KhMIakLqYmXGNlPERfxTV3TUqJIepax
 ZuZVTuZmAHn2Qq2XSEebDeUVkjifuZ4Rdv+8/iJkjeQANLvKQPII22DEoP6r9kiEOQ
 etYTaOyQo9gAKZYsj/aM1A9EYYDVmVekxdbGmz6gcAxZOW6k7KBE07Om3fyP7QMeWN
 zk1+rhsYd7MGWGgKBNs8VS7rKDsRh8K8mRUmYrggDmrH7bo4lUoJ3dCiq3jFpFDSwK
 k2L2azBWTSgqw==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org,
 Sameer Pujar <spujar@nvidia.com>, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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
The Audio Hub (AHUB) is part of the Audio Processing Engine (APE) which
comprises a collection of hardware accelerators for audio pre-processing
and post-processing. It also includes a programmable full crossbar for
routing audio data across these accelerators.

This series exposes some of these below mentioned HW devices as ASoC
components for Tegra platforms from Tegra210 onwards.
 * ADMAIF : The interface between ADMA and AHUB
 * XBAR   : Crossbar for routing audio samples across various modules
 * I2S    : Inter-IC Sound Controller
 * DMIC   : Digital Microphone
 * DSPK   : Digital Speaker

Following is the summary of current series.
 1. Add YAML DT binding documentation for above mentioned modules.
 2. Helper function for ACIF programming is exposed for Tegra210 and later.
 3. Add ASoC driver components for each of the above modules.
 4. Add DT entries for above components for Tegra210, Tegra186 and
    Tegra194.
 5. Enable these components for Jetson-Tx1, Jetson-Tx2 and Jetson-Xavier.

Machine driver series will be sent separately.

Changelog
=========

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

=================
Sameer Pujar (10):
  dt-bindings: sound: tegra: add DT binding for AHUB
  ASoC: tegra: add support for CIF programming
  ASoC: tegra: add Tegra210 based DMIC driver
  ASoC: tegra: add Tegra210 based I2S driver
  ASoC: tegra: add Tegra210 based AHUB driver
  ASoC: tegra: add Tegra186 based DSPK driver
  ASoC: tegra: add Tegra210 based ADMAIF driver
  arm64: tegra: add AHUB components for few Tegra chips
  arm64: tegra: enable AHUB modules for few Tegra chips
  arm64: defconfig: enable AHUB components for Tegra210 and later

 .../bindings/sound/nvidia,tegra186-dspk.yaml       |  88 ++
 .../bindings/sound/nvidia,tegra210-admaif.yaml     | 163 ++++
 .../bindings/sound/nvidia,tegra210-ahub.yaml       | 110 +++
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |  88 ++
 .../bindings/sound/nvidia,tegra210-i2s.yaml        | 101 +++
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  48 ++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 231 ++++-
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  36 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 239 +++++-
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  40 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 145 ++++
 arch/arm64/configs/defconfig                       |   7 +
 sound/soc/tegra/Kconfig                            |  56 ++
 sound/soc/tegra/Makefile                           |  10 +
 sound/soc/tegra/tegra186_dspk.c                    | 510 +++++++++++
 sound/soc/tegra/tegra186_dspk.h                    |  73 ++
 sound/soc/tegra/tegra210_admaif.c                  | 884 +++++++++++++++++++
 sound/soc/tegra/tegra210_admaif.h                  | 164 ++++
 sound/soc/tegra/tegra210_ahub.c                    | 651 ++++++++++++++
 sound/soc/tegra/tegra210_ahub.h                    | 125 +++
 sound/soc/tegra/tegra210_dmic.c                    | 515 +++++++++++
 sound/soc/tegra/tegra210_dmic.h                    |  85 ++
 sound/soc/tegra/tegra210_i2s.c                     | 938 +++++++++++++++++++++
 sound/soc/tegra/tegra210_i2s.h                     | 132 +++
 sound/soc/tegra/tegra_cif.h                        |  63 ++
 sound/soc/tegra/tegra_pcm.c                        | 222 ++++-
 sound/soc/tegra/tegra_pcm.h                        |  23 +-
 27 files changed, 5743 insertions(+), 4 deletions(-)
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

