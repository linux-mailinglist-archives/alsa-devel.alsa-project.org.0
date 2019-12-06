Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B84FF114EBE
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2019 11:09:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35CC1828;
	Fri,  6 Dec 2019 11:08:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35CC1828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575626984;
	bh=OZoK+9g2om2FO0EVNnaAE0Lj5BbDogxoBKNRIuy6AQA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LslPyb+wOkEnZhKYQako87Xr3fTO/crnRHrLbFnVYliM6mNPPlqbXnEo9k+TWFxMy
	 uVsdqkiuMP/VMV4R9LiDDL7mzec1a5M+mQRC93yyT8exIJNDlDtelJR6lh/RF7bDvB
	 4fb5IIZapIIDDcFwSy4pIUg1+fNVG1FP/UPOaGPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94947F80214;
	Fri,  6 Dec 2019 11:08:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42C16F8010F; Fri,  6 Dec 2019 03:49:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C36C1F8010F
 for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2019 03:49:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C36C1F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="p5fDX/1M"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5de9c1970000>; Thu, 05 Dec 2019 18:48:55 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 05 Dec 2019 18:48:59 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 05 Dec 2019 18:48:59 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 02:48:59 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 02:48:58 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Fri, 6 Dec 2019 02:48:58 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.163.171]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5de9c1990000>; Thu, 05 Dec 2019 18:48:58 -0800
From: Sowjanya Komatineni <skomatineni@nvidia.com>
To: <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
 <jonathanh@nvidia.com>, <digetx@gmail.com>, <mperttunen@nvidia.com>,
 <gregkh@linuxfoundation.org>, <sboyd@kernel.org>, <tglx@linutronix.de>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Date: Thu, 5 Dec 2019 18:48:40 -0800
Message-ID: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1575600535; bh=0yY6O5GHk7xgeOMvI4k8qGNpUWrzvrDV5dKwrtLp/f4=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:Content-Type;
 b=p5fDX/1MwveGhBRGiUlIbddYp8Ctk6ez5ooV/2pkOm633fsIn3zDiZ7j1UbHqdAdG
 Rv/7MxrOAbLMBRFBmpJ+fi/Ib6CB5IKhmUAlvtEm04SwIgmIzk9zDBTNcEDVxaDfjq
 jW5e1b/0nj8Wf2K9Ej2UJl1g/V8+VJvRCHFViRK8wSObItVITQcwRJtVshOhrOdXNR
 YmbH9aw9OtUIGc2gcEwngQX1INW4gt6/Zg+fDdRpxKtDXzJrlNwfcZysxh/CVUEEkd
 TgXaA2tgf/UtKZTZyfZcIhWVO7OOa2fZKvrRuLvkpv3eZcmBoquiJ27La1DxNwQtFh
 bzEqI7udvTKpw==
X-Mailman-Approved-At: Fri, 06 Dec 2019 11:07:58 +0100
Cc: alsa-devel@alsa-project.org, pgaikwad@nvidia.com, spujar@nvidia.com,
 linux-kernel@vger.kernel.org, josephl@nvidia.com, linux-clk@vger.kernel.org,
 arnd@arndb.de, daniel.lezcano@linaro.org, krzk@kernel.org,
 mturquette@baylibre.com, devicetree@vger.kernel.org, mmaddireddy@nvidia.com,
 markz@nvidia.com, alexios.zavras@intel.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, horms+renesas@verge.net.au, tiwai@suse.com,
 allison@lohutok.net, pdeschrijver@nvidia.com, lgirdwood@gmail.com,
 vidyas@nvidia.com, Jisheng.Zhang@synaptics.com
Subject: [alsa-devel] [PATCH v3 00/15] Move PMC clocks into Tegra PMC driver
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

Tegra PMC has clk_out_1, clk_out_2, clk_out_3 and blink controls which
are currently registered by Tegra clock driver using clk_regiser_mux and
clk_register_gate which performs direct Tegra PMC register access.

When Tegra PMC is in secure mode, any access from non-secure world will
not go through.

This patch series adds these Tegra PMC clocks and blink controls to Tegra
PMC driver with PMC as clock provider and removed them from Tegra clock
driver. This also adds PMC specific clock id's to use in device tree and
removed clock ids of PMC clock from Tegra clock driver.

clk_out_1 is dedicated for audio mclk and current ASoC driver does not
setting extern1 as parent for clk_out_1 and enabling clk_out_1 and
currently this is taken care by Tegra clock driver during clock inits
and there is no need to enable this during clock init.

So, this series also includes patch that updates ASoC driver to take
care of configuring parent of mclk and enabling mclk using both extern1
and clk_out_1 and updates all device trees to use clk_out_1 from pmc as
mclk incase if device tree don't specify assigned-clock-parents.

This series also includes a patch for mclk fallback to use extern1
when retrieving mclk fails with new device tree which uses pmc provider
to have this backward compatible of new DT with old kernels.

This series also includes a patch to remove clock ids for these clocks
from clock dt-binding as these clocks are not used in any of the existing
device tree except in tegra210-smaug.dts and this series includes a patch
to update clock provider from tegra_car to pmc in tegra210-smaug.dts for
clk_out_2.

[v3]:	Changes between v2 and v3 are
	- Removes set parent of clk_out_1_mux to extern1 and enabling
	  extern1 from the clock driver.
	- Doesn't enable clk_out_1 and blink by default in pmc driver
	- Updates ASoC driver to take care of audio mclk parent
	  configuration incase if device tree don't specify assigned
	  clock parent properties and enables mclk using both clk_out_1
	  and extern1.
	- updates all device trees using extern1 as mclk in sound node
	  to use clk_out_1 from pmc.
	- patch for YAML format pmc dt-binding
	- Includes v2 feedback

[v2]:	Changes between v1 and v2 are
	- v2 includes patches for adding clk_out_1, clk_out_2, clk_out_3,
	  blink controls to Tegra PMC driver and removing clk-tegra-pmc.
	- feedback related to pmc clocks in Tegra PMC driver from v1
	- Removed patches for WB0 PLLM overrides and PLLE IDDQ PMC programming
	  by the clock driver using helper functions from Tegra PMC.

 	  Note:
	  To use helper functions from PMC driver, PMC early init need to
	  happen prior to using helper functions and these helper functions are
	  for PLLM Override and PLLE IDDQ programming in PMC during PLLM/PLLE
	  clock registration which happen in clock_init prior to Tegra PMC
	  probe.
	  Moving PLLM/PLLE clocks registration to happen after Tegra PMC
	  impacts other clocks EMC, MC and corresponding tegra_emc_init and
	  tegra_mc_init.
	  This implementation of configuring PMC registers thru helper
	  functions in clock driver needs proper changes across PMC, Clock,
	  EMC and MC inits to have it work across all Tegra platforms.

	  Currently PLLM Override is not enabled in the bootloader so proper
	  patches for this fix will be taken care separately.

[v1]:	v1 includes patches for below fixes.
	- adding clk_out_1, clk_out_2, clk_out_3, blink controls to Tegra PMC
	  driver and removing clk-tegra-pmc.
	- updated clock provider from tegra_car to pmc in the device tree
	  tegra210-smaug.dts that uses clk_out_2.
	- Added helper functions in PMC driver for WB0 PLLM overrides and PLLE
	  IDDQ programming to use by clock driver and updated clock driver to
	  use these helper functions and removed direct PMC access from clock
	  driver and all pmc base address references in clock driver.


Sowjanya Komatineni (15):
  dt-bindings: soc: tegra-pmc: Add Tegra PMC clock bindings
  dt-bindings: tegra: Convert Tegra PMC bindings to YAML
  soc: tegra: Add Tegra PMC clock registrations into PMC driver
  dt-bindings: soc: tegra-pmc: Add id for Tegra PMC blink control
  soc: pmc: Add blink output clock registration to Tegra PMC
  clk: tegra: Remove tegra_pmc_clk_init along with clk ids
  dt-bindings: clock: tegra: Remove pmc clock ids from clock dt-bindings
  ASoC: tegra: Add audio mclk control through clk_out_1 and extern1
  ASoC: tegra: Add fallback for audio mclk
  clk: tegra: Remove extern1 and cdev1 from clocks inittable
  ARM: dts: tegra: Add clock-cells property to pmc
  arm64: tegra: Add clock-cells property to Tegra PMC node
  ARM: tegra: Update sound node clocks in device tree
  arm64: tegra: smaug: Change clk_out_2 provider to pmc
  ASoC: nau8825: change Tegra clk_out_2 provider from tegra_car to pmc

 .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      |  45 ++-
 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     | 291 ++++++++++++++++++
 .../devicetree/bindings/sound/nau8825.txt          |   2 +-
 arch/arm/boot/dts/tegra114-dalmore.dts             |   7 +-
 arch/arm/boot/dts/tegra114.dtsi                    |   4 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi        |   7 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi             |   7 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |   7 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi               |   7 +-
 arch/arm/boot/dts/tegra124-venice2.dts             |   7 +-
 arch/arm/boot/dts/tegra124.dtsi                    |   4 +-
 arch/arm/boot/dts/tegra20.dtsi                     |   4 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi         |   7 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi              |   7 +-
 arch/arm/boot/dts/tegra30-beaver.dts               |   7 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |   7 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi             |   7 +-
 arch/arm/boot/dts/tegra30.dtsi                     |   4 +-
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   4 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   2 +
 drivers/clk/tegra/Makefile                         |   1 -
 drivers/clk/tegra/clk-id.h                         |   7 -
 drivers/clk/tegra/clk-tegra-pmc.c                  | 122 --------
 drivers/clk/tegra/clk-tegra114.c                   |  12 -
 drivers/clk/tegra/clk-tegra124.c                   |  28 +-
 drivers/clk/tegra/clk-tegra20.c                    |   5 -
 drivers/clk/tegra/clk-tegra210.c                   |  12 -
 drivers/clk/tegra/clk-tegra30.c                    |  13 -
 drivers/clk/tegra/clk.h                            |   1 -
 drivers/soc/tegra/pmc.c                            | 340 +++++++++++++++++++++
 include/dt-bindings/clock/tegra114-car.h           |  14 +-
 include/dt-bindings/clock/tegra124-car-common.h    |  14 +-
 include/dt-bindings/clock/tegra20-car.h            |   2 +-
 include/dt-bindings/clock/tegra210-car.h           |  14 +-
 include/dt-bindings/clock/tegra30-car.h            |  14 +-
 include/dt-bindings/soc/tegra-pmc.h                |  19 ++
 sound/soc/tegra/tegra_asoc_utils.c                 |  76 ++++-
 sound/soc/tegra/tegra_asoc_utils.h                 |   1 +
 39 files changed, 890 insertions(+), 244 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
 delete mode 100644 drivers/clk/tegra/clk-tegra-pmc.c
 create mode 100644 include/dt-bindings/soc/tegra-pmc.h

-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
