Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AC5B3280
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 00:52:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18A4A166E;
	Mon, 16 Sep 2019 00:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18A4A166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568587943;
	bh=RzNdUS/sas19jXV19Jr2nTcdPNijHoBgMoIixufXAWk=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cPfljo/SQRwE+w7x9tFB4Yz2SvUkxZ6/rNF19jypcC5QbxfHITXTJAOlCUUju06qc
	 d8XDSwfOA83r+EjZK5a8ulsFuE95uRa2kSYef9YzUtxcdsWdQGhIlB2/CuI78wsNa/
	 xOWrvqbfofQsNgXUn17aCE9WasNWzSU1iaNzAaFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51366F80361;
	Mon, 16 Sep 2019 00:50:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35C91F80361; Mon, 16 Sep 2019 00:50:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_13,PRX_BODY_141,PRX_BODY_26,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AC16F801DA
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 00:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AC16F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Nq7aoUXi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=APgJTIEUKP6ci2Pg/Sj4U/0WILKyY/M8VhiGfUBmO5o=; b=Nq7aoUXil9WiqaAWuQeH985dX
 E+0wstB2oISyy11PizZJWRUr4tTwPX4pck/8LC+y1H6jgS3w/+FvDrMOLnxXSU3gs9YiTfUfal8pT
 ebqrKPkjf9uk6+1rhTc0R2g7y07moP2LsO9IYhZT5gGypQqULYRV6VUXvWxbLu+efIi0k=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i9dLb-0001YZ-Aj; Sun, 15 Sep 2019 22:50:23 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 391C127415FF; Sun, 15 Sep 2019 23:50:22 +0100 (BST)
Date: Sun, 15 Sep 2019 23:50:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190915225022.GO4352@sirena.co.uk>
MIME-Version: 1.0
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [GIT PULL] ASoC updates for v5.4 round II
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
Content-Type: multipart/mixed; boundary="===============8451277013890323712=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8451277013890323712==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ZQ/M1iA+qg8otEW"
Content-Disposition: inline


--4ZQ/M1iA+qg8otEW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 6fa5963c37a2e3335eba0b7455e35a01318ebc15:

  ASoC: hdmi-codec: Add an op to set callback function for plug event (2019-09-09 14:50:03 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.4-2

for you to fetch changes up to a54f8485727e6e85b5dfe1d9708b80d13fe8bf5f:

  Merge branch 'asoc-5.4' into asoc-next (2019-09-15 10:31:44 +0100)

----------------------------------------------------------------
ASoC: Final merge window fixes for v5.4

A few small fixes and one feature that came in since I sent you the
earlier pull request.

----------------------------------------------------------------
Mark Brown (2):
      Merge branch 'asoc-5.3' into asoc-linus
      Merge branch 'asoc-5.4' into asoc-next

Peter Ujfalusi (1):
      ASoC: dmaengine: Replace strncpy() with strscpy_pad() for pcm->name

Saiyam Doshi (2):
      ASoC: wcd9335: remove redundant use of ret variable
      ASoC: sdm845: remove unneeded semicolon

Viorel Suman (1):
      ASoC: fsl_sai: Implement set_bclk_ratio

 .clang-format                                      |  17 +-
 .gitignore                                         |   3 +
 .mailmap                                           |   8 +
 Documentation/PCI/index.rst                        |   2 +-
 Documentation/PCI/pci-error-recovery.rst           |   5 +-
 .../PCI/{picebus-howto.rst => pciebus-howto.rst}   |   0
 Documentation/RCU/rculist_nulls.txt                |   2 +-
 Documentation/admin-guide/conf.py                  |  10 -
 Documentation/admin-guide/hw-vuln/spectre.rst      |  88 ++-
 Documentation/admin-guide/kernel-parameters.txt    |  17 +-
 Documentation/admin-guide/mm/transhuge.rst         |   2 +-
 Documentation/admin-guide/sysctl/net.rst           |  29 +-
 Documentation/conf.py                              |  30 +-
 Documentation/core-api/conf.py                     |  10 -
 Documentation/crypto/conf.py                       |  10 -
 Documentation/dev-tools/conf.py                    |  10 -
 Documentation/devicetree/bindings/Makefile         |   4 +-
 .../devicetree/bindings/arm/idle-states.txt        |   2 +-
 Documentation/devicetree/bindings/arm/renesas.yaml |   2 +-
 .../bindings/arm/socionext/milbeaut.yaml           |   2 +-
 .../devicetree/bindings/arm/ti/ti,davinci.yaml     |   2 +-
 .../bindings/clock/allwinner,sun4i-a10-ccu.yaml    |   2 +-
 .../intel,ixp4xx-network-processing-engine.yaml    |   2 +-
 .../devicetree/bindings/iio/accel/adi,adxl345.yaml |   2 +-
 .../devicetree/bindings/iio/accel/adi,adxl372.yaml |   2 +-
 .../interrupt-controller/amazon,al-fic.txt         |  16 +-
 .../intel,ixp4xx-interrupt.yaml                    |   2 +-
 .../interrupt-controller/snps,archs-idu-intc.txt   |  30 +-
 ...er.yaml => intel,ixp4xx-ahb-queue-manager.yaml} |   2 +-
 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    |   2 +-
 Documentation/devicetree/bindings/net/dsa/ksz.txt  |   1 +
 Documentation/devicetree/bindings/net/fsl-fec.txt  |  30 +-
 Documentation/devicetree/bindings/net/macb.txt     |   4 +-
 .../bindings/nvmem/allwinner,sun4i-a10-sid.yaml    |   4 +-
 .../devicetree/bindings/nvmem/nvmem-consumer.yaml  |  45 ++
 Documentation/devicetree/bindings/nvmem/nvmem.txt  |  81 +--
 Documentation/devicetree/bindings/nvmem/nvmem.yaml |  93 +++
 .../phy/allwinner,sun6i-a31-mipi-dphy.yaml         |   2 +-
 .../bindings/pinctrl/st,stm32-pinctrl.yaml         |   3 +-
 Documentation/devicetree/bindings/riscv/cpus.txt   | 162 -----
 Documentation/devicetree/bindings/riscv/cpus.yaml  |  16 +
 .../devicetree/bindings/riscv/sifive.yaml          |   2 +-
 .../devicetree/bindings/spi/spi-controller.yaml    |   1 -
 .../bindings/timer/intel,ixp4xx-timer.yaml         |   2 +-
 Documentation/devicetree/bindings/usb/usb251xb.txt |   6 +-
 Documentation/doc-guide/conf.py                    |  10 -
 Documentation/driver-api/80211/conf.py             |  10 -
 Documentation/driver-api/conf.py                   |  10 -
 Documentation/driver-api/generic-counter.rst       |   4 +-
 Documentation/driver-api/phy/phy.rst               |   4 +-
 Documentation/driver-api/pm/conf.py                |  10 -
 Documentation/filesystems/cifs/TODO                |  26 +-
 Documentation/filesystems/conf.py                  |  10 -
 Documentation/gpu/conf.py                          |  10 -
 Documentation/hwmon/k8temp.rst                     |   2 +-
 Documentation/index.rst                            |   3 +
 Documentation/input/conf.py                        |  10 -
 Documentation/kernel-hacking/conf.py               |  10 -
 Documentation/locking/spinlocks.rst                |   4 +-
 Documentation/maintainer/conf.py                   |  10 -
 Documentation/media/conf.py                        |  12 -
 Documentation/memory-barriers.txt                  |   2 +-
 Documentation/networking/conf.py                   |  10 -
 Documentation/networking/tls-offload.rst           |  41 +-
 Documentation/networking/tuntap.txt                |   4 +-
 Documentation/power/index.rst                      |   2 +-
 .../powerpc/{bootwrapper.txt => bootwrapper.rst}   |  28 +-
 .../powerpc/{cpu_families.txt => cpu_families.rst} |  23 +-
 .../powerpc/{cpu_features.txt => cpu_features.rst} |   6 +-
 Documentation/powerpc/{cxl.txt => cxl.rst}         |  46 +-
 .../powerpc/{cxlflash.txt => cxlflash.rst}         |  10 +-
 .../powerpc/{DAWR-POWER9.txt => dawr-power9.rst}   |  15 +-
 Documentation/powerpc/{dscr.txt => dscr.rst}       |  18 +-
 ...ror-recovery.txt => eeh-pci-error-recovery.rst} | 108 +--
 ...ssisted-dump.txt => firmware-assisted-dump.rst} | 117 ++--
 Documentation/powerpc/{hvcs.txt => hvcs.rst}       | 108 +--
 Documentation/powerpc/index.rst                    |  34 +
 Documentation/powerpc/isa-versions.rst             |  15 +-
 Documentation/powerpc/{mpc52xx.txt => mpc52xx.rst} |  12 +-
 ...powernv.txt => pci_iov_resource_on_powernv.rst} |  15 +-
 Documentation/powerpc/{pmu-ebb.txt => pmu-ebb.rst} |   1 +
 Documentation/powerpc/ptrace.rst                   | 156 +++++
 Documentation/powerpc/ptrace.txt                   | 151 -----
 .../powerpc/{qe_firmware.txt => qe_firmware.rst}   |  37 +-
 .../{syscall64-abi.txt => syscall64-abi.rst}       |  29 +-
 ...ctional_memory.txt => transactional_memory.rst} |  45 +-
 Documentation/process/conf.py                      |  10 -
 Documentation/process/deprecated.rst               |  14 +
 .../process/embargoed-hardware-issues.rst          | 279 ++++++++
 Documentation/process/index.rst                    |   1 +
 Documentation/s390/vfio-ccw.rst                    |  31 +-
 Documentation/sh/conf.py                           |  10 -
 Documentation/sound/conf.py                        |  10 -
 Documentation/sphinx/load_config.py                |  27 +-
 .../translations/it_IT/doc-guide/sphinx.rst        |  19 +-
 Documentation/translations/it_IT/process/index.rst |   1 +
 .../translations/it_IT/process/kernel-docs.rst     |  11 +-
 .../it_IT/process/maintainer-pgp-guide.rst         |  25 +-
 .../it_IT/process/programming-language.rst         |  51 ++
 .../translations/ko_KR/memory-barriers.txt         |   2 +-
 Documentation/userspace-api/conf.py                |  10 -
 Documentation/{virtual => virt}/index.rst          |   0
 .../kvm/amd-memory-encryption.rst                  |   0
 Documentation/{virtual => virt}/kvm/api.txt        |   2 +-
 .../{virtual => virt}/kvm/arm/hyp-abi.txt          |   0
 Documentation/{virtual => virt}/kvm/arm/psci.txt   |   0
 Documentation/{virtual => virt}/kvm/cpuid.rst      |   0
 Documentation/{virtual => virt}/kvm/devices/README |   0
 .../{virtual => virt}/kvm/devices/arm-vgic-its.txt |   0
 .../{virtual => virt}/kvm/devices/arm-vgic-v3.txt  |   0
 .../{virtual => virt}/kvm/devices/arm-vgic.txt     |   0
 .../{virtual => virt}/kvm/devices/mpic.txt         |   0
 .../{virtual => virt}/kvm/devices/s390_flic.txt    |   0
 .../{virtual => virt}/kvm/devices/vcpu.txt         |   0
 .../{virtual => virt}/kvm/devices/vfio.txt         |   0
 Documentation/{virtual => virt}/kvm/devices/vm.txt |   0
 .../{virtual => virt}/kvm/devices/xics.txt         |   0
 .../{virtual => virt}/kvm/devices/xive.txt         |   0
 .../{virtual => virt}/kvm/halt-polling.txt         |   0
 Documentation/{virtual => virt}/kvm/hypercalls.txt |   4 +-
 Documentation/{virtual => virt}/kvm/index.rst      |   1 +
 Documentation/{virtual => virt}/kvm/locking.txt    |   0
 Documentation/{virtual => virt}/kvm/mmu.txt        |   2 +-
 Documentation/{virtual => virt}/kvm/msr.txt        |   0
 Documentation/{virtual => virt}/kvm/nested-vmx.txt |   0
 Documentation/{virtual => virt}/kvm/ppc-pv.txt     |   0
 .../{virtual => virt}/kvm/review-checklist.txt     |   2 +-
 Documentation/{virtual => virt}/kvm/s390-diag.txt  |   0
 .../{virtual => virt}/kvm/timekeeping.txt          |   0
 .../{virtual => virt}/kvm/vcpu-requests.rst        |   0
 Documentation/{virtual => virt}/paravirt_ops.rst   |   0
 .../{virtual => virt}/uml/UserModeLinux-HOWTO.txt  |   0
 Documentation/vm/conf.py                           |  10 -
 Documentation/vm/hmm.rst                           |   2 +-
 Documentation/watchdog/hpwdt.rst                   |   2 +-
 Documentation/x86/conf.py                          |  10 -
 MAINTAINERS                                        | 139 ++--
 Makefile                                           |  28 +-
 arch/arc/boot/dts/Makefile                         |   3 +
 arch/arc/include/asm/entry-arcv2.h                 |   2 +-
 arch/arc/include/asm/linkage.h                     |   8 +-
 arch/arc/include/asm/mach_desc.h                   |   3 +-
 arch/arc/kernel/mcip.c                             |  60 +-
 arch/arc/kernel/unwind.c                           |   5 +-
 arch/arc/mm/dma.c                                  |   2 +-
 arch/arc/plat-hsdk/platform.c                      |  87 ++-
 arch/arm/Kconfig                                   |   4 +
 arch/arm/Kconfig.debug                             |   5 -
 arch/arm/boot/dts/am33xx-l4.dtsi                   |  16 +-
 arch/arm/boot/dts/am33xx.dtsi                      |  32 +-
 arch/arm/boot/dts/am4372.dtsi                      |  32 +-
 arch/arm/boot/dts/am437x-l4.dtsi                   |   4 +
 arch/arm/boot/dts/am571x-idk.dts                   |   7 +-
 arch/arm/boot/dts/am572x-idk.dts                   |   7 +-
 arch/arm/boot/dts/am574x-idk.dts                   |   7 +-
 arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi    |   3 +-
 arch/arm/boot/dts/am57xx-beagle-x15-revb1.dts      |   7 +-
 arch/arm/boot/dts/am57xx-beagle-x15-revc.dts       |   7 +-
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts    |   3 +
 arch/arm/boot/dts/dra7-evm.dts                     |   2 +-
 arch/arm/boot/dts/dra7-l4.dtsi                     |   6 +-
 arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi          |  50 +-
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi            |   2 +-
 arch/arm/boot/dts/imx6ul-geam.dts                  |   2 +-
 arch/arm/boot/dts/imx6ul-isiot.dtsi                |   2 +-
 arch/arm/boot/dts/imx6ul-pico-hobbit.dts           |   2 +-
 arch/arm/boot/dts/imx6ul-pico-pi.dts               |   4 +-
 arch/arm/boot/dts/imx7ulp.dtsi                     |   2 +-
 arch/arm/boot/dts/vf610-bk4.dts                    |   4 +-
 arch/arm/configs/u8500_defconfig                   |  34 +-
 arch/arm/include/asm/dma-mapping.h                 |   4 +-
 arch/arm/kernel/hw_breakpoint.c                    |   5 +
 arch/arm/kernel/signal.c                           |   1 +
 arch/arm/kvm/coproc.c                              |  23 +-
 arch/arm/lib/backtrace.S                           |   2 +-
 arch/arm/mach-davinci/sleep.S                      |   1 +
 arch/arm/mach-ep93xx/crunch.c                      |   1 +
 arch/arm/mach-netx/Kconfig                         |  22 -
 arch/arm/mach-netx/Makefile                        |  13 -
 arch/arm/mach-netx/Makefile.boot                   |   3 -
 arch/arm/mach-netx/fb.c                            |  65 --
 arch/arm/mach-netx/fb.h                            |  12 -
 arch/arm/mach-netx/generic.c                       | 182 -----
 arch/arm/mach-netx/generic.h                       |  14 -
 arch/arm/mach-netx/include/mach/hardware.h         |  27 -
 arch/arm/mach-netx/include/mach/irqs.h             |  58 --
 arch/arm/mach-netx/include/mach/netx-regs.h        | 420 ------------
 arch/arm/mach-netx/include/mach/pfifo.h            |  42 --
 arch/arm/mach-netx/include/mach/uncompress.h       |  63 --
 arch/arm/mach-netx/include/mach/xc.h               |  30 -
 arch/arm/mach-netx/nxdb500.c                       | 197 ------
 arch/arm/mach-netx/nxdkn.c                         |  90 ---
 arch/arm/mach-netx/nxeb500hmi.c                    | 174 -----
 arch/arm/mach-netx/pfifo.c                         |  56 --
 arch/arm/mach-netx/time.c                          | 141 ----
 arch/arm/mach-netx/xc.c                            | 246 -------
 arch/arm/mach-omap1/ams-delta-fiq-handler.S        |   3 +-
 arch/arm/mach-omap1/ams-delta-fiq.c                |   4 +-
 arch/arm/mach-omap1/board-ams-delta.c              |  10 +-
 arch/arm/mach-omap2/omap4-common.c                 |   3 +
 arch/arm/mach-omap2/omap_hwmod_7xx_data.c          |   3 +-
 arch/arm/mach-rpc/riscpc.c                         |   1 +
 arch/arm/mach-tegra/reset.c                        |   2 +-
 arch/arm/mm/Kconfig                                |   1 +
 arch/arm/mm/alignment.c                            |   4 +-
 arch/arm/mm/dma-mapping.c                          |  59 ++
 arch/arm/mm/init.c                                 |  13 +-
 arch/arm/plat-omap/dma.c                           |  14 +-
 arch/arm64/Makefile                                |   2 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |   6 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        |   1 +
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts      |   1 +
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h     |   4 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   3 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |   1 +
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |   6 +-
 arch/arm64/include/asm/arch_gicv3.h                |   6 +
 arch/arm64/include/asm/cpufeature.h                |   7 +-
 arch/arm64/include/asm/daifflags.h                 |   2 +
 arch/arm64/include/asm/efi.h                       |   6 +-
 arch/arm64/include/asm/elf.h                       |   2 +-
 arch/arm64/include/asm/kvm_arm.h                   |   7 +-
 arch/arm64/include/asm/memory.h                    |  10 +-
 arch/arm64/include/asm/pgtable.h                   |  12 +-
 arch/arm64/include/asm/processor.h                 |  14 +-
 arch/arm64/include/asm/ptrace.h                    |   2 +-
 arch/arm64/include/asm/stacktrace.h                |  78 ++-
 arch/arm64/include/asm/vdso/compat_gettimeofday.h  |  40 ++
 arch/arm64/include/uapi/asm/bpf_perf_event.h       |   2 +-
 arch/arm64/kernel/cpufeature.c                     |  22 +-
 arch/arm64/kernel/debug-monitors.c                 |  14 +-
 arch/arm64/kernel/entry.S                          |  22 +-
 arch/arm64/kernel/fpsimd.c                         |  29 +-
 arch/arm64/kernel/ftrace.c                         |  22 +-
 arch/arm64/kernel/hw_breakpoint.c                  |  11 +-
 arch/arm64/kernel/module.c                         |   4 +
 arch/arm64/kernel/perf_callchain.c                 |   7 +-
 arch/arm64/kernel/probes/kprobes.c                 |  40 +-
 arch/arm64/kernel/process.c                        |  36 +-
 arch/arm64/kernel/return_address.c                 |  12 +-
 arch/arm64/kernel/smp.c                            |   2 +-
 arch/arm64/kernel/stacktrace.c                     |  62 +-
 arch/arm64/kernel/time.c                           |   7 +-
 arch/arm64/kernel/traps.c                          |  14 +-
 arch/arm64/kernel/vdso/Makefile                    |  13 +-
 arch/arm64/kernel/vdso32/Makefile                  |  14 +-
 arch/arm64/kvm/hyp/debug-sr.c                      |  30 +
 arch/arm64/kvm/regmap.c                            |   5 +
 arch/arm64/kvm/sys_regs.c                          |  32 +-
 arch/arm64/mm/dma-mapping.c                        |   4 +-
 arch/arm64/mm/fault.c                              |  57 +-
 arch/csky/include/uapi/asm/byteorder.h             |   2 +-
 arch/csky/include/uapi/asm/cachectl.h              |   2 +-
 arch/csky/include/uapi/asm/perf_regs.h             |   2 +-
 arch/csky/include/uapi/asm/ptrace.h                |   2 +-
 arch/csky/include/uapi/asm/sigcontext.h            |   2 +-
 arch/csky/include/uapi/asm/unistd.h                |   2 +-
 arch/mips/cavium-octeon/octeon-usb.c               |   1 +
 arch/mips/include/asm/octeon/cvmx-sli-defs.h       |   1 +
 arch/mips/kernel/cacheinfo.c                       |   2 +
 arch/mips/kernel/i8253.c                           |   3 +-
 arch/mips/kvm/emulate.c                            |   1 +
 arch/mips/kvm/mips.c                               |  10 -
 arch/mips/oprofile/op_model_mipsxx.c               |  13 +
 arch/mips/pci/ops-bcm63xx.c                        |   1 +
 arch/mips/vdso/vdso.h                              |   1 +
 arch/nds32/include/uapi/asm/auxvec.h               |   2 +-
 arch/nds32/include/uapi/asm/byteorder.h            |   2 +-
 arch/nds32/include/uapi/asm/cachectl.h             |   2 +-
 arch/nds32/include/uapi/asm/fp_udfiex_crtl.h       |   2 +-
 arch/nds32/include/uapi/asm/param.h                |   2 +-
 arch/nds32/include/uapi/asm/ptrace.h               |   2 +-
 arch/nds32/include/uapi/asm/sigcontext.h           |   2 +-
 arch/nds32/include/uapi/asm/unistd.h               |   2 +-
 arch/nds32/kernel/signal.c                         |   2 +
 arch/parisc/Makefile                               |   5 +-
 arch/parisc/boot/compressed/Makefile               |   4 +-
 arch/parisc/boot/compressed/vmlinux.lds.S          |   4 +-
 .../configs/{default_defconfig => defconfig}       |   0
 arch/parisc/include/asm/kprobes.h                  |   4 +
 arch/parisc/include/asm/pgtable.h                  |   3 +-
 arch/parisc/kernel/ftrace.c                        |   3 +-
 arch/parisc/kernel/pacache.S                       |   3 +-
 arch/parisc/math-emu/Makefile                      |   1 +
 arch/parisc/mm/fault.c                             |   1 +
 arch/powerpc/include/asm/cache.h                   |   8 +-
 arch/powerpc/include/asm/hvcall.h                  |  11 +-
 arch/powerpc/include/asm/pmc.h                     |   5 +-
 arch/powerpc/include/asm/unistd.h                  |   1 +
 arch/powerpc/include/uapi/asm/bpf_perf_event.h     |   2 +-
 arch/powerpc/include/uapi/asm/kvm_para.h           |   2 +-
 arch/powerpc/kernel/align.c                        |   4 +
 arch/powerpc/kernel/entry_32.S                     |   8 +
 arch/powerpc/kernel/entry_64.S                     |   5 +
 arch/powerpc/kernel/exceptions-64s.S               |   2 +-
 arch/powerpc/kernel/process.c                      |  21 +-
 arch/powerpc/kernel/signal_32.c                    |   3 +
 arch/powerpc/kernel/signal_64.c                    |   5 +
 arch/powerpc/kernel/syscalls/syscall.tbl           |   2 +-
 arch/powerpc/kvm/book3s_32_mmu.c                   |   1 +
 arch/powerpc/kvm/book3s_64_vio.c                   |   6 +-
 arch/powerpc/kvm/book3s_64_vio_hv.c                |   6 +-
 arch/powerpc/kvm/book3s_hv.c                       |  13 +
 arch/powerpc/kvm/book3s_xive.c                     |   4 +-
 arch/powerpc/kvm/book3s_xive_native.c              |   4 +-
 arch/powerpc/kvm/powerpc.c                         |  15 +-
 arch/powerpc/mm/book3s64/hash_utils.c              |   9 +
 arch/powerpc/mm/kasan/kasan_init_32.c              |   7 +-
 arch/powerpc/mm/mem.c                              |   2 +-
 arch/powerpc/mm/nohash/tlb.c                       |   1 -
 arch/powerpc/platforms/pseries/papr_scm.c          |  73 +-
 arch/powerpc/sysdev/xive/common.c                  |   7 +-
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi         |  16 +-
 .../riscv/boot/dts/sifive/hifive-unleashed-a00.dts |   9 +
 arch/riscv/configs/defconfig                       |  12 +-
 arch/riscv/configs/rv32_defconfig                  |   3 +
 arch/riscv/include/asm/Kbuild                      |   1 +
 arch/riscv/include/asm/fixmap.h                    |   4 -
 arch/riscv/include/asm/pgtable.h                   |  12 +-
 arch/riscv/include/asm/switch_to.h                 |   8 +-
 arch/riscv/include/asm/tlbflush.h                  |  11 +-
 arch/riscv/include/uapi/asm/auxvec.h               |   2 +-
 arch/riscv/include/uapi/asm/bitsperlong.h          |   2 +-
 arch/riscv/include/uapi/asm/byteorder.h            |   2 +-
 arch/riscv/include/uapi/asm/hwcap.h                |   2 +-
 arch/riscv/include/uapi/asm/ptrace.h               |   2 +-
 arch/riscv/include/uapi/asm/sigcontext.h           |   2 +-
 arch/riscv/include/uapi/asm/ucontext.h             |   2 +-
 arch/riscv/include/uapi/asm/unistd.h               |   1 +
 arch/riscv/kernel/process.c                        |  11 +-
 arch/riscv/kernel/vdso/Makefile                    |   2 +-
 arch/riscv/lib/Makefile                            |   2 -
 arch/riscv/lib/delay.c                             |   6 +-
 arch/riscv/lib/udivdi3.S                           |  32 -
 arch/s390/boot/Makefile                            |   2 +-
 arch/s390/boot/boot.h                              |   2 +
 arch/s390/boot/head.S                              |   1 +
 arch/s390/boot/ipl_parm.c                          |   2 -
 arch/s390/boot/kaslr.c                             |   1 +
 arch/s390/boot/version.c                           |   7 +
 arch/s390/configs/debug_defconfig                  | 330 ++++++----
 arch/s390/configs/defconfig                        | 233 ++++---
 arch/s390/configs/zfcpdump_defconfig               |  31 +-
 arch/s390/hypfs/hypfs_vm.c                         |   4 +-
 arch/s390/include/asm/bitops.h                     |  73 +-
 arch/s390/include/asm/page.h                       |   2 +
 arch/s390/include/asm/qdio.h                       |  10 +-
 arch/s390/include/asm/setup.h                      |   5 +-
 arch/s390/include/asm/unistd.h                     |   1 +
 arch/s390/include/uapi/asm/bpf_perf_event.h        |   2 +-
 arch/s390/include/uapi/asm/ipl.h                   |   2 +-
 arch/s390/include/uapi/asm/zcrypt.h                |  35 +-
 arch/s390/kernel/dumpstack.c                       |   6 +-
 arch/s390/kernel/head64.S                          |   7 -
 arch/s390/kernel/ipl.c                             |   9 -
 arch/s390/kernel/machine_kexec_reloc.c             |   1 +
 arch/s390/kernel/perf_cpum_cf_diag.c               |   2 +-
 arch/s390/kernel/setup.c                           |   3 +-
 arch/s390/kernel/syscalls/syscall.tbl              |   2 +-
 arch/s390/kernel/vdso.c                            |   5 -
 arch/s390/kernel/vmlinux.lds.S                     |  10 +-
 arch/s390/kvm/kvm-s390.c                           |  10 -
 arch/s390/lib/xor.c                                |   1 +
 arch/s390/mm/dump_pagetables.c                     |  12 +-
 arch/s390/mm/fault.c                               |   3 +
 arch/s390/mm/gmap.c                                |   4 +-
 arch/s390/mm/pgalloc.c                             |   6 +-
 arch/s390/net/bpf_jit_comp.c                       |  12 +-
 arch/s390/scripts/Makefile.chkbss                  |   3 +-
 arch/sh/include/uapi/asm/setup.h                   |   2 +-
 arch/sh/include/uapi/asm/types.h                   |   2 +-
 arch/sh/kernel/disassemble.c                       |   5 +-
 arch/sh/kernel/hw_breakpoint.c                     |   1 +
 arch/sparc/include/uapi/asm/oradax.h               |   2 +-
 arch/um/include/shared/timer-internal.h            |  14 +-
 arch/um/kernel/process.c                           |   2 +-
 arch/um/kernel/time.c                              |  16 +-
 arch/x86/Makefile                                  |   1 +
 arch/x86/boot/compressed/pgtable_64.c              |  13 +-
 arch/x86/boot/string.c                             |   8 +
 arch/x86/entry/calling.h                           |  17 +
 arch/x86/entry/entry_32.S                          |  13 +-
 arch/x86/entry/entry_64.S                          |  21 +-
 arch/x86/events/amd/ibs.c                          |  13 +-
 arch/x86/events/core.c                             |   2 +-
 arch/x86/events/intel/core.c                       |  15 +-
 arch/x86/events/intel/ds.c                         |   2 +-
 arch/x86/hyperv/mmu.c                              |   8 +-
 arch/x86/include/asm/bootparam_utils.h             |  64 +-
 arch/x86/include/asm/cpufeatures.h                 |   3 +
 arch/x86/include/asm/ftrace.h                      |   1 -
 arch/x86/include/asm/intel-family.h                |  15 +
 arch/x86/include/asm/kvm_host.h                    |  10 +-
 arch/x86/include/asm/msr-index.h                   |   1 +
 arch/x86/include/asm/nospec-branch.h               |   2 +-
 arch/x86/include/asm/perf_event.h                  |  12 +-
 arch/x86/include/asm/uaccess.h                     |   4 +-
 arch/x86/include/asm/vdso/gettimeofday.h           |  36 +
 arch/x86/include/uapi/asm/byteorder.h              |   2 +-
 arch/x86/include/uapi/asm/hwcap2.h                 |   2 +-
 arch/x86/include/uapi/asm/sigcontext32.h           |   2 +-
 arch/x86/include/uapi/asm/types.h                  |   2 +-
 arch/x86/kernel/apic/apic.c                        |  68 +-
 arch/x86/kernel/apic/bigsmp_32.c                   |  24 +-
 arch/x86/kernel/apic/io_apic.c                     |   8 +-
 arch/x86/kernel/apic/probe_32.c                    |   3 +-
 arch/x86/kernel/cpu/amd.c                          |  66 ++
 arch/x86/kernel/cpu/bugs.c                         | 107 ++-
 arch/x86/kernel/cpu/common.c                       |  44 +-
 arch/x86/kernel/cpu/mtrr/cyrix.c                   |   1 +
 arch/x86/kernel/cpu/umwait.c                       |  39 +-
 arch/x86/kernel/head_64.S                          |   8 +-
 arch/x86/kernel/hpet.c                             |  12 +-
 arch/x86/kernel/kvm.c                              |   8 -
 arch/x86/kernel/ptrace.c                           |   1 +
 arch/x86/kernel/stacktrace.c                       |   2 +-
 arch/x86/kernel/sysfb_efi.c                        |  46 ++
 arch/x86/kernel/uprobes.c                          |  17 +-
 arch/x86/kvm/debugfs.c                             |  46 +-
 arch/x86/kvm/hyperv.c                              |   5 +-
 arch/x86/kvm/lapic.c                               |  13 +-
 arch/x86/kvm/mmu.c                                 |  35 +-
 arch/x86/kvm/svm.c                                 |  28 +-
 arch/x86/kvm/vmx/nested.c                          |   4 +
 arch/x86/kvm/vmx/vmx.c                             |  20 +-
 arch/x86/kvm/x86.c                                 |  41 +-
 arch/x86/lib/cpu.c                                 |   1 +
 arch/x86/math-emu/errors.c                         |   5 +-
 arch/x86/math-emu/fpu_trig.c                       |   2 +-
 arch/x86/mm/fault.c                                |  15 +-
 arch/x86/mm/pageattr.c                             |  26 +-
 arch/x86/net/bpf_jit_comp.c                        |   9 +-
 arch/x86/power/cpu.c                               |  86 ++-
 arch/x86/purgatory/Makefile                        |  36 +-
 arch/x86/purgatory/purgatory.c                     |   6 +
 arch/x86/purgatory/string.c                        |  23 -
 arch/xtensa/kernel/coprocessor.S                   |   1 +
 arch/xtensa/kernel/setup.c                         |   1 +
 block/bfq-iosched.c                                | 135 ++--
 block/blk-cgroup.c                                 |   9 +-
 block/blk-iolatency.c                              |   3 +
 block/blk-mq-sched.h                               |   9 -
 block/blk-mq.c                                     |   4 -
 block/blk-rq-qos.c                                 |   7 +-
 block/blk-settings.c                               |   3 +-
 block/blk-sysfs.c                                  |   3 +
 block/genhd.c                                      |   2 +-
 drivers/acpi/arm64/iort.c                          |   4 +-
 drivers/acpi/device_pm.c                           |   4 +-
 drivers/acpi/nfit/core.c                           |  28 +-
 drivers/acpi/nfit/nfit.h                           |  24 +
 drivers/acpi/scan.c                                |   6 +
 drivers/android/binder.c                           |   5 +-
 drivers/ata/libahci_platform.c                     |   4 +-
 drivers/ata/libata-scsi.c                          |  21 +
 drivers/ata/libata-sff.c                           |   6 +
 drivers/ata/libata-zpodd.c                         |   2 +-
 drivers/ata/pata_rb532_cf.c                        |   1 -
 drivers/atm/Kconfig                                |   2 +-
 drivers/atm/iphase.c                               |   8 +-
 drivers/auxdisplay/Kconfig                         |   5 +
 drivers/auxdisplay/charlcd.c                       |   2 +-
 {include/misc => drivers/auxdisplay}/charlcd.h     |   5 +
 drivers/auxdisplay/hd44780.c                       |   3 +-
 drivers/auxdisplay/ht16k33.c                       |   4 +-
 drivers/auxdisplay/panel.c                         |   4 +-
 drivers/base/core.c                                |  83 ++-
 drivers/base/firmware_loader/firmware.h            |   4 +-
 drivers/base/platform.c                            |   9 +-
 drivers/base/regmap/Kconfig                        |   2 +-
 drivers/block/aoe/aoedev.c                         |  13 +-
 drivers/block/ataflop.c                            |   1 +
 drivers/block/drbd/drbd_main.c                     |   2 +
 drivers/block/drbd/drbd_receiver.c                 |  14 +-
 drivers/block/loop.c                               |  18 +-
 drivers/block/nbd.c                                |   2 +-
 drivers/block/rbd.c                                |  11 +
 drivers/block/xen-blkback/xenbus.c                 |   6 +-
 drivers/bluetooth/btqca.c                          |  29 +-
 drivers/bluetooth/btqca.h                          |   7 +
 drivers/bluetooth/btusb.c                          |   4 +-
 drivers/bluetooth/hci_ath.c                        |   3 +
 drivers/bluetooth/hci_bcm.c                        |   3 +
 drivers/bluetooth/hci_intel.c                      |   3 +
 drivers/bluetooth/hci_ldisc.c                      |  13 +
 drivers/bluetooth/hci_mrvl.c                       |   3 +
 drivers/bluetooth/hci_qca.c                        |  12 +-
 drivers/bluetooth/hci_uart.h                       |   1 +
 drivers/bus/hisi_lpc.c                             |  47 +-
 drivers/bus/ti-sysc.c                              |  24 +-
 drivers/char/hpet.c                                |   3 +-
 drivers/char/ipmi/ipmb_dev_int.c                   |   2 +-
 drivers/char/tpm/tpm-chip.c                        |  43 +-
 drivers/char/tpm/tpm.h                             |   2 +
 drivers/char/tpm/tpm1-cmd.c                        |  36 +-
 drivers/char/tpm/tpm2-cmd.c                        |   6 +-
 drivers/clk/at91/clk-generated.c                   |   2 +
 drivers/clk/clk.c                                  |  49 +-
 drivers/clk/mediatek/clk-mt8183.c                  |  46 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |  16 +-
 drivers/clk/samsung/clk-exynos5-subcmu.c           |  16 +-
 drivers/clk/samsung/clk-exynos5-subcmu.h           |   2 +-
 drivers/clk/samsung/clk-exynos5250.c               |   7 +-
 drivers/clk/samsung/clk-exynos5420.c               | 162 +++--
 drivers/clk/socfpga/clk-periph-s10.c               |   2 +-
 drivers/clk/sprd/Kconfig                           |   1 +
 drivers/clocksource/timer-riscv.c                  |   6 +-
 drivers/connector/connector.c                      |   6 +-
 drivers/cpufreq/cpufreq.c                          |   2 +-
 drivers/cpufreq/pasemi-cpufreq.c                   |  23 +-
 drivers/crypto/ccp/ccp-crypto-aes-galois.c         |  14 +
 drivers/crypto/ccp/ccp-dev.c                       |   8 +
 drivers/crypto/ccp/ccp-ops.c                       |  33 +-
 drivers/crypto/ux500/cryp/cryp.c                   |   6 +
 drivers/dma/dw-edma/dw-edma-core.h                 |   2 +-
 drivers/dma/dw-edma/dw-edma-pcie.c                 |  18 +-
 drivers/dma/dw-edma/dw-edma-v0-core.c              |  34 +-
 drivers/dma/dw-edma/dw-edma-v0-debugfs.c           |  29 +-
 drivers/dma/fsldma.c                               |   1 +
 drivers/dma/sh/rcar-dmac.c                         |  28 +-
 drivers/dma/sprd-dma.c                             |  10 +-
 drivers/dma/ste_dma40.c                            |   4 +-
 drivers/dma/stm32-mdma.c                           |   2 +-
 drivers/dma/tegra210-adma.c                        |   4 +-
 drivers/dma/ti/dma-crossbar.c                      |   4 +-
 drivers/dma/ti/omap-dma.c                          |   8 +-
 drivers/firewire/core-device.c                     |   2 +-
 drivers/firewire/core-iso.c                        |   2 +-
 drivers/firewire/core-topology.c                   |   1 +
 drivers/firmware/Kconfig                           |   5 +-
 drivers/firmware/efi/libstub/efi-stub-helper.c     |  38 +-
 drivers/firmware/iscsi_ibft.c                      |   4 +
 drivers/fpga/Kconfig                               |   1 +
 drivers/fpga/altera-ps-spi.c                       |  11 +-
 drivers/fsi/fsi-scom.c                             |   8 +-
 drivers/gpio/gpio-pca953x.c                        |  15 +-
 drivers/gpio/gpiolib-of.c                          |   2 +-
 drivers/gpio/gpiolib.c                             |  59 +-
 drivers/gpu/drm/Kconfig                            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  35 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |  27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gds.h            |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c             |  78 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  22 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   9 +
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |  49 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  29 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                    |   1 -
 drivers/gpu/drm/amd/amdgpu/soc15.c                 |   5 -
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  47 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |  28 -
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   |   1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  16 +-
 .../amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c |   4 +-
 .../amd/display/dc/clk_mgr/dce112/dce112_clk_mgr.c |   4 +-
 .../amd/display/dc/clk_mgr/dce120/dce120_clk_mgr.c |   4 +-
 .../amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c   |   3 +
 drivers/gpu/drm/amd/display/dc/core/dc.c           |  17 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c      |  30 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c   |  39 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |  11 +-
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   3 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.c       |   4 +
 .../amd/display/dc/dce110/dce110_hw_sequencer.c    |  24 +-
 .../drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  21 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.c  |   5 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.c    |  18 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c |  22 +-
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c  |   2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_resource.c  |   4 +
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c  |  37 ++
 drivers/gpu/drm/amd/display/dc/dsc/drm_dsc_dc.c    |   6 +
 drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   4 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |   1 +
 drivers/gpu/drm/amd/display/include/dpcd_defs.h    |   2 +-
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     |   1 +
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c         | 125 ++--
 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c  |   9 +
 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c |  66 +-
 drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h     |  14 +-
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c         | 211 ++++--
 drivers/gpu/drm/amd/powerplay/navi10_ppt.h         |   4 +
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c          |  62 +-
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c         |  65 +-
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c    |  11 +-
 .../drm/arm/display/komeda/komeda_format_caps.c    |  19 +
 .../drm/arm/display/komeda/komeda_format_caps.h    |   3 +
 .../drm/arm/display/komeda/komeda_framebuffer.c    |   5 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |  30 +-
 .../gpu/drm/arm/display/komeda/komeda_pipeline.h   |   1 +
 .../drm/arm/display/komeda/komeda_wb_connector.c   |   2 +-
 drivers/gpu/drm/ast/ast_main.c                     |   5 +-
 drivers/gpu/drm/ast/ast_mode.c                     |   2 +-
 drivers/gpu/drm/ast/ast_post.c                     |   2 +-
 drivers/gpu/drm/bochs/bochs_kms.c                  |   1 +
 drivers/gpu/drm/bridge/Kconfig                     |   4 +-
 drivers/gpu/drm/drm_client.c                       |  60 +-
 drivers/gpu/drm/drm_client_modeset.c               |   2 +-
 drivers/gpu/drm/drm_fb_helper.c                    |  51 +-
 drivers/gpu/drm/drm_framebuffer.c                  |   2 +-
 drivers/gpu/drm/drm_modes.c                        |  60 +-
 drivers/gpu/drm/exynos/Kconfig                     |   1 +
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         |   4 +-
 drivers/gpu/drm/i915/Makefile                      |   1 -
 drivers/gpu/drm/i915/display/intel_bios.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_bw.c            |  15 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c         |  11 +
 drivers/gpu/drm/i915/display/intel_ddi.c           |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c       |   6 +-
 drivers/gpu/drm/i915/display/intel_display_power.c |  11 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  10 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c          |   3 +-
 drivers/gpu/drm/i915/display/intel_vbt_defs.h      |   6 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c          |   2 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c         |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c     |  20 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c           |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c          |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c             |   7 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c        |  10 +-
 drivers/gpu/drm/i915/gt/intel_context.c            |  27 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c          |  20 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c          |  24 -
 drivers/gpu/drm/i915/gt/intel_engine_pm.h          |  12 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h       |  12 +
 drivers/gpu/drm/i915/gt/intel_gt_pm.c              |  21 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h              |   2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c                |  10 +-
 drivers/gpu/drm/i915/gt/intel_reset.c              |  58 +-
 drivers/gpu/drm/i915/gt/intel_ringbuffer.c         |  31 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c        |  38 +-
 drivers/gpu/drm/i915/gt/mock_engine.c              |   1 +
 drivers/gpu/drm/i915/gt/selftest_reset.c           |   5 +-
 drivers/gpu/drm/i915/gt/selftest_workarounds.c     |   7 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c              |  10 -
 drivers/gpu/drm/i915/gvt/fb_decoder.c              |   6 +-
 drivers/gpu/drm/i915/gvt/gtt.c                     |   9 +
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |  12 +
 drivers/gpu/drm/i915/gvt/scheduler.c               |  59 +-
 drivers/gpu/drm/i915/gvt/trace_points.c            |   2 -
 drivers/gpu/drm/i915/i915_drv.c                    |   6 +
 drivers/gpu/drm/i915/i915_drv.h                    |   5 +-
 drivers/gpu/drm/i915/i915_gem.c                    |  25 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c                |   8 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   7 +-
 drivers/gpu/drm/i915/i915_perf.c                   |  67 +-
 drivers/gpu/drm/i915/i915_trace.h                  |  76 +--
 drivers/gpu/drm/i915/i915_vgpu.c                   |   3 +
 drivers/gpu/drm/i915/intel_drv.h                   |   2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c            |  10 +-
 drivers/gpu/drm/i915/intel_wakeref.h               |  15 +
 drivers/gpu/drm/ingenic/ingenic-drm.c              |   5 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  55 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   2 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   3 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |  16 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   2 +-
 drivers/gpu/drm/msm/msm_drv.c                      |   5 +-
 drivers/gpu/drm/msm/msm_gem.c                      |  47 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  22 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c              |  47 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c      |  24 +-
 .../gpu/drm/nouveau/nvkm/subdev/secboot/gp102.c    |  12 +
 drivers/gpu/drm/omapdrm/dss/output.c               |   4 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |   2 +-
 drivers/gpu/drm/qxl/qxl_drv.c                      |  20 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |   6 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   2 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |   4 +-
 drivers/gpu/drm/selftests/drm_cmdline_selftests.h  |   7 +
 .../gpu/drm/selftests/test-drm_cmdline_parser.c    | 130 ++++
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |   1 +
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |   1 +
 drivers/gpu/drm/tegra/output.c                     |   8 +-
 drivers/gpu/drm/ttm/ttm_page_alloc_dma.c           |   6 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c                |   6 +-
 drivers/hid/hid-a4tech.c                           |  30 +-
 drivers/hid/hid-cp2112.c                           |   8 +-
 drivers/hid/hid-holtek-kbd.c                       |   9 +-
 drivers/hid/hid-ids.h                              |   5 +-
 drivers/hid/hid-logitech-dj.c                      |  10 +-
 drivers/hid/hid-logitech-hidpp.c                   |  14 +-
 drivers/hid/hid-quirks.c                           |   2 +
 drivers/hid/hid-sony.c                             |  15 +-
 drivers/hid/hid-tmff.c                             |  12 +
 drivers/hid/intel-ish-hid/ipc/hw-ish.h             |   1 +
 drivers/hid/intel-ish-hid/ipc/pci-ish.c            |   1 +
 drivers/hid/usbhid/hiddev.c                        |  12 +
 drivers/hid/wacom_wac.c                            |  19 +-
 drivers/hv/channel.c                               |   2 +-
 drivers/hv/hv_trace.h                              |   2 +-
 drivers/hv/hyperv_vmbus.h                          |   2 -
 drivers/hwmon/lm75.c                               |   2 +-
 drivers/hwmon/nct6775.c                            |   3 +-
 drivers/hwmon/nct7802.c                            |   6 +-
 drivers/hwmon/occ/common.c                         |   6 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |   1 +
 drivers/hwtracing/intel_th/msu.h                   |   2 +-
 drivers/hwtracing/intel_th/pci.c                   |  10 +
 drivers/hwtracing/intel_th/pti.h                   |   2 +-
 drivers/hwtracing/stm/core.c                       |   1 -
 drivers/i2c/busses/i2c-at91-core.c                 |   2 +-
 drivers/i2c/busses/i2c-at91-master.c               |   9 +-
 drivers/i2c/busses/i2c-bcm-iproc.c                 |  15 +-
 drivers/i2c/busses/i2c-designware-slave.c          |   1 +
 drivers/i2c/busses/i2c-emev2.c                     |  16 +-
 drivers/i2c/busses/i2c-i801.c                      |  15 +-
 drivers/i2c/busses/i2c-imx.c                       |  18 +-
 drivers/i2c/busses/i2c-mt65xx.c                    |  11 +-
 drivers/i2c/busses/i2c-nvidia-gpu.c                |   2 +-
 drivers/i2c/busses/i2c-piix4.c                     |  12 +-
 drivers/i2c/busses/i2c-rcar.c                      |  11 +-
 drivers/i2c/busses/i2c-s3c2410.c                   |   1 +
 drivers/i2c/busses/i2c-stm32.h                     |   2 +-
 drivers/i2c/i2c-core-base.c                        |   2 +-
 drivers/iio/accel/cros_ec_accel_legacy.c           |   1 -
 drivers/iio/adc/ingenic-adc.c                      |  54 ++
 drivers/iio/adc/max9611.c                          |   4 +-
 drivers/iio/adc/rcar-gyroadc.c                     |   4 +-
 drivers/iio/frequency/adf4371.c                    |   8 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c         |  43 ++
 drivers/infiniband/core/cma.c                      |   6 +-
 drivers/infiniband/core/core_priv.h                |   5 +-
 drivers/infiniband/core/counters.c                 |  27 +-
 drivers/infiniband/core/device.c                   | 102 ++-
 drivers/infiniband/core/mad.c                      |  20 +-
 drivers/infiniband/core/nldev.c                    |  11 +-
 drivers/infiniband/core/restrack.c                 |  15 +-
 drivers/infiniband/core/umem.c                     |   7 +-
 drivers/infiniband/core/umem_odp.c                 |   4 -
 drivers/infiniband/core/user_mad.c                 |   6 +-
 drivers/infiniband/hw/bnxt_re/ib_verbs.c           |   7 +-
 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c         |   8 +-
 drivers/infiniband/hw/bnxt_re/qplib_rcfw.h         |  11 +-
 drivers/infiniband/hw/bnxt_re/qplib_res.c          |  13 +-
 drivers/infiniband/hw/bnxt_re/qplib_res.h          |   2 +-
 drivers/infiniband/hw/bnxt_re/qplib_sp.c           |  14 +-
 drivers/infiniband/hw/bnxt_re/qplib_sp.h           |   7 +-
 drivers/infiniband/hw/hfi1/chip.c                  |  11 +-
 drivers/infiniband/hw/hfi1/fault.c                 |  12 +-
 drivers/infiniband/hw/hfi1/rc.c                    |   2 -
 drivers/infiniband/hw/hfi1/tid_rdma.c              | 119 +---
 drivers/infiniband/hw/hfi1/verbs.c                 |   2 +
 drivers/infiniband/hw/hns/Kconfig                  |   6 +-
 drivers/infiniband/hw/hns/Makefile                 |   8 +-
 drivers/infiniband/hw/hns/hns_roce_db.c            |  15 +-
 drivers/infiniband/hw/hns/hns_roce_hw_v1.c         |   4 +-
 drivers/infiniband/hw/mlx4/mad.c                   |   4 +-
 drivers/infiniband/hw/mlx5/devx.c                  |  11 +-
 drivers/infiniband/hw/mlx5/main.c                  |  13 +-
 drivers/infiniband/hw/mlx5/mem.c                   |   5 +-
 drivers/infiniband/hw/mlx5/mlx5_ib.h               |  15 +
 drivers/infiniband/hw/mlx5/mr.c                    |  51 +-
 drivers/infiniband/hw/mlx5/odp.c                   |  48 +-
 drivers/infiniband/hw/mlx5/qp.c                    |  37 +-
 drivers/infiniband/hw/qedr/main.c                  |  10 +-
 drivers/infiniband/sw/siw/Kconfig                  |   2 +-
 drivers/infiniband/sw/siw/siw.h                    |  10 +-
 drivers/infiniband/sw/siw/siw_cm.c                 | 116 ++--
 drivers/infiniband/sw/siw/siw_cq.c                 |   5 +-
 drivers/infiniband/sw/siw/siw_main.c               |   5 +-
 drivers/infiniband/sw/siw/siw_mem.c                |  14 +-
 drivers/infiniband/sw/siw/siw_mem.h                |   2 +-
 drivers/infiniband/sw/siw/siw_qp.c                 |  22 +-
 drivers/infiniband/sw/siw/siw_qp_rx.c              |  26 +-
 drivers/infiniband/sw/siw/siw_qp_tx.c              |  80 ++-
 drivers/infiniband/sw/siw/siw_verbs.c              |  56 +-
 drivers/input/joystick/iforce/iforce-usb.c         |   5 +
 drivers/input/keyboard/Kconfig                     |   2 +
 drivers/input/keyboard/applespi.c                  |  29 +-
 drivers/input/mouse/elantech.c                     |  55 +-
 drivers/input/mouse/synaptics.c                    |   1 +
 drivers/input/serio/hyperv-keyboard.c              |  35 +-
 drivers/input/tablet/kbtab.c                       |   6 +-
 drivers/input/touchscreen/usbtouchscreen.c         |   2 +
 drivers/iommu/amd_iommu.c                          |  40 +-
 drivers/iommu/amd_iommu_init.c                     |  90 +++
 drivers/iommu/amd_iommu_types.h                    |   9 +
 drivers/iommu/arm-smmu-v3.c                        |   4 +-
 drivers/iommu/dma-iommu.c                          |  28 +-
 drivers/iommu/intel-iommu-debugfs.c                |   6 +-
 drivers/iommu/intel-iommu.c                        | 145 ++--
 drivers/iommu/intel-svm.c                          |  36 +-
 drivers/iommu/iova.c                               |  23 +-
 drivers/iommu/virtio-iommu.c                       |  40 +-
 drivers/irqchip/irq-gic-v3-its.c                   |   2 +-
 drivers/irqchip/irq-gic-v3.c                       |   4 +
 drivers/irqchip/irq-imx-gpcv2.c                    |   1 +
 drivers/irqchip/irq-mbigen.c                       |   9 +-
 drivers/isdn/hardware/mISDN/hfcsusb.c              |  13 +-
 drivers/macintosh/smu.c                            |   1 +
 drivers/md/bcache/super.c                          |   3 +
 drivers/md/bcache/sysfs.c                          |  20 +-
 drivers/md/dm-bufio.c                              |   4 +-
 drivers/md/dm-dust.c                               |  11 +-
 drivers/md/dm-integrity.c                          |  15 +
 drivers/md/dm-kcopyd.c                             |   5 +-
 drivers/md/dm-raid.c                               |   2 +-
 drivers/md/dm-table.c                              |  21 +-
 drivers/md/dm-zoned-metadata.c                     |  68 +-
 drivers/md/dm-zoned-reclaim.c                      |  47 +-
 drivers/md/dm-zoned-target.c                       |  68 +-
 drivers/md/dm-zoned.h                              |  11 +
 drivers/md/persistent-data/dm-btree.c              |  31 +-
 drivers/md/persistent-data/dm-space-map-metadata.c |   2 +-
 drivers/media/platform/omap/omap_vout_vrfb.c       |   3 +-
 drivers/media/platform/vivid/vivid-core.c          |   8 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |   2 +-
 drivers/mfd/db8500-prcmu.c                         |   2 +
 drivers/mfd/omap-usb-host.c                        |   4 +-
 drivers/mfd/rk808.c                                |   6 +-
 drivers/misc/Kconfig                               |   1 +
 drivers/misc/eeprom/Kconfig                        |   3 +
 drivers/misc/eeprom/at24.c                         |   2 +-
 drivers/misc/habanalabs/command_submission.c       |   2 +-
 drivers/misc/habanalabs/device.c                   |   5 +-
 drivers/misc/habanalabs/firmware_if.c              |  22 +-
 drivers/misc/habanalabs/goya/goya.c                |  83 ++-
 drivers/misc/habanalabs/goya/goyaP.h               |   2 +-
 drivers/misc/habanalabs/habanalabs.h               |  25 +-
 drivers/misc/habanalabs/hw_queue.c                 |  14 +-
 .../misc/habanalabs/include/goya/goya_packets.h    |  13 +
 drivers/misc/habanalabs/irq.c                      |  27 +-
 drivers/misc/habanalabs/memory.c                   |   2 +
 drivers/misc/lkdtm/bugs.c                          |   4 +-
 drivers/misc/mei/hw-me-regs.h                      |   5 +
 drivers/misc/mei/pci-me.c                          |   5 +
 drivers/misc/vmw_balloon.c                         |  10 +-
 drivers/misc/vmw_vmci/vmci_doorbell.c              |   6 +-
 drivers/mmc/core/mmc_ops.c                         |   2 +-
 drivers/mmc/core/queue.c                           |   5 +
 drivers/mmc/core/sd.c                              |   6 +
 drivers/mmc/host/cavium.c                          |   4 +-
 drivers/mmc/host/dw_mmc.c                          |   3 +-
 drivers/mmc/host/meson-mx-sdio.c                   |   2 +-
 drivers/mmc/host/sdhci-acpi.c                      |   2 +-
 drivers/mmc/host/sdhci-cadence.c                   |   1 +
 drivers/mmc/host/sdhci-esdhc-imx.c                 |   2 +-
 drivers/mmc/host/sdhci-of-at91.c                   |   5 +-
 drivers/mmc/host/sdhci-pci-core.c                  |   4 +-
 drivers/mmc/host/sdhci-pxav3.c                     |   2 +-
 drivers/mmc/host/sdhci-s3c.c                       |   2 +-
 drivers/mmc/host/sdhci-sprd.c                      |  33 +-
 drivers/mmc/host/sdhci-tegra.c                     |  14 +
 drivers/mmc/host/sdhci-xenon.c                     |   2 +-
 drivers/mmc/host/sdhci.c                           |   4 +-
 drivers/mmc/host/sdhci.h                           |   2 +-
 drivers/mtd/hyperbus/Kconfig                       |   4 +-
 drivers/mtd/maps/sa1100-flash.c                    |   1 +
 drivers/mtd/nand/onenand/onenand_base.c            |   1 +
 drivers/mtd/nand/raw/nand_micron.c                 |  14 +-
 drivers/mtd/spi-nor/spi-nor.c                      |   5 +-
 drivers/net/arcnet/arc-rimi.c                      |   3 +
 drivers/net/arcnet/com20020-isa.c                  |   6 +
 drivers/net/arcnet/com90io.c                       |   2 +
 drivers/net/arcnet/com90xx.c                       |   3 +
 drivers/net/bonding/bond_main.c                    |  11 +
 drivers/net/can/at91_can.c                         |   6 +-
 drivers/net/can/dev.c                              |   2 +
 drivers/net/can/flexcan.c                          |  39 +-
 drivers/net/can/peak_canfd/peak_pciefd_main.c      |   2 +-
 drivers/net/can/rcar/rcar_canfd.c                  |   9 +-
 drivers/net/can/sja1000/peak_pcmcia.c              |   2 +-
 drivers/net/can/spi/mcp251x.c                      |  52 +-
 drivers/net/can/usb/peak_usb/pcan_usb.c            |   2 +-
 drivers/net/can/usb/peak_usb/pcan_usb_core.c       |  10 +-
 drivers/net/can/usb/peak_usb/pcan_usb_fd.c         |   2 +-
 drivers/net/can/usb/peak_usb/pcan_usb_pro.c        |   2 +-
 drivers/net/dsa/bcm_sf2.c                          |  10 +-
 drivers/net/dsa/microchip/ksz9477_spi.c            |   1 +
 drivers/net/dsa/microchip/ksz_common.h             |   1 +
 drivers/net/dsa/mv88e6xxx/chip.c                   |  29 +-
 drivers/net/dsa/qca8k.c                            |  10 +-
 drivers/net/dsa/sja1105/sja1105_dynamic_config.c   |  14 +-
 drivers/net/dsa/sja1105/sja1105_main.c             | 147 ++---
 drivers/net/dsa/sja1105/sja1105_ptp.c              |   7 +-
 drivers/net/ethernet/8390/Kconfig                  |   4 +-
 drivers/net/ethernet/agere/et131x.c                |   2 +-
 drivers/net/ethernet/allwinner/sun4i-emac.c        |   4 +-
 drivers/net/ethernet/amd/Kconfig                   |   2 +-
 drivers/net/ethernet/amd/xgbe/xgbe-main.c          |  10 +-
 drivers/net/ethernet/apple/Kconfig                 |   4 +-
 .../net/ethernet/aquantia/atlantic/aq_filters.c    |   5 +-
 drivers/net/ethernet/aquantia/atlantic/aq_main.c   |   4 +
 drivers/net/ethernet/aquantia/atlantic/aq_nic.c    |   2 +-
 drivers/net/ethernet/aquantia/atlantic/aq_vec.c    |   3 +-
 drivers/net/ethernet/atheros/ag71xx.c              |   2 +-
 drivers/net/ethernet/broadcom/Kconfig              |   6 +-
 drivers/net/ethernet/broadcom/bcmsysport.c         |   2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c    |  13 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.h    |   2 +
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c   |  17 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c          |  38 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_devlink.c  |   9 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c  |  12 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c       |   8 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_tc.h       |   6 +-
 drivers/net/ethernet/broadcom/genet/bcmgenet.c     |   3 +-
 drivers/net/ethernet/cadence/macb_main.c           |   2 +-
 drivers/net/ethernet/cavium/common/cavium_ptp.c    |   2 +-
 .../net/ethernet/cavium/liquidio/request_manager.c |   4 +-
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c  |  18 +-
 drivers/net/ethernet/chelsio/cxgb/my3126.c         |   4 +-
 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c    |   5 +-
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c |   4 +-
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c    |   6 +-
 .../net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c   |   3 +-
 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c         |   9 +-
 drivers/net/ethernet/emulex/benet/be_cmds.c        |   6 +-
 drivers/net/ethernet/emulex/benet/be_main.c        |   7 +-
 drivers/net/ethernet/ezchip/nps_enet.h             |   4 +-
 drivers/net/ethernet/freescale/enetc/Kconfig       |   2 +
 drivers/net/ethernet/freescale/enetc/enetc_ptp.c   |   5 +-
 drivers/net/ethernet/freescale/fman/fman.c         |   3 -
 drivers/net/ethernet/google/gve/gve.h              |   8 +-
 drivers/net/ethernet/google/gve/gve_ethtool.c      |   4 +-
 drivers/net/ethernet/google/gve/gve_main.c         |   2 +-
 drivers/net/ethernet/google/gve/gve_rx.c           |  34 +-
 drivers/net/ethernet/hisilicon/hip04_eth.c         |  28 +-
 drivers/net/ethernet/hisilicon/hns3/hclge_mbx.h    |   2 +-
 .../net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c |   2 +-
 .../ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c   |   4 +-
 drivers/net/ethernet/ibm/ehea/ehea_main.c          |   2 +-
 drivers/net/ethernet/ibm/ibmveth.c                 |   9 +-
 drivers/net/ethernet/ibm/ibmvnic.c                 |  17 +-
 drivers/net/ethernet/intel/igc/igc_main.c          |  12 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c      |   5 +-
 drivers/net/ethernet/marvell/mvmdio.c              |  31 +-
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c    |  87 ++-
 drivers/net/ethernet/marvell/sky2.c                |  14 +
 drivers/net/ethernet/mediatek/Kconfig              |   1 -
 drivers/net/ethernet/mellanox/mlx4/en_rx.c         |   3 +-
 drivers/net/ethernet/mellanox/mlx5/core/dev.c      |   2 +-
 drivers/net/ethernet/mellanox/mlx5/core/en.h       |  23 +-
 .../net/ethernet/mellanox/mlx5/core/en/params.h    |   5 +-
 drivers/net/ethernet/mellanox/mlx5/core/en/port.c  |  27 +-
 drivers/net/ethernet/mellanox/mlx5/core/en/port.h  |   6 +-
 .../ethernet/mellanox/mlx5/core/en/reporter_tx.c   |  19 +-
 .../net/ethernet/mellanox/mlx5/core/en/xsk/setup.c |   3 +
 .../ethernet/mellanox/mlx5/core/en_accel/ktls.h    |   6 +-
 .../ethernet/mellanox/mlx5/core/en_accel/ktls_tx.c |  50 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_arfs.c  |  97 +--
 .../net/ethernet/mellanox/mlx5/core/en_ethtool.c   | 115 +++-
 .../ethernet/mellanox/mlx5/core/en_fs_ethtool.c    |   3 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c  |  42 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_rep.c   |   7 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_stats.c |   8 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c    |  37 +-
 drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c  |   4 +-
 drivers/net/ethernet/mellanox/mlx5/core/eswitch.h  |   4 +-
 .../ethernet/mellanox/mlx5/core/eswitch_offloads.c |  12 +-
 drivers/net/ethernet/mellanox/mlx5/core/fs_core.h  |   5 +-
 .../net/ethernet/mellanox/mlx5/core/fs_counters.c  |   5 +
 drivers/net/ethernet/mellanox/mlx5/core/health.c   |  22 +-
 .../ethernet/mellanox/mlx5/core/ipoib/ethtool.c    |   9 +
 .../net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c  |   7 +-
 .../ethernet/mellanox/mlx5/core/ipoib/ipoib_vlan.c |   1 +
 .../net/ethernet/mellanox/mlx5/core/lib/crypto.c   |   1 +
 drivers/net/ethernet/mellanox/mlxsw/spectrum.c     |  17 +-
 drivers/net/ethernet/mellanox/mlxsw/spectrum.h     |   4 +
 drivers/net/ethernet/mellanox/mlxsw/spectrum_acl.c |   2 +-
 .../net/ethernet/mellanox/mlxsw/spectrum_buffers.c |   4 +-
 drivers/net/ethernet/mellanox/mlxsw/spectrum_nve.c |   1 +
 drivers/net/ethernet/mellanox/mlxsw/spectrum_nve.h |   1 +
 .../ethernet/mellanox/mlxsw/spectrum_nve_vxlan.c   |  76 ++-
 drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c | 155 ++---
 drivers/net/ethernet/mscc/ocelot.c                 |   1 +
 drivers/net/ethernet/mscc/ocelot_ace.c             |   2 +-
 drivers/net/ethernet/mscc/ocelot_flower.c          |  23 +-
 drivers/net/ethernet/mscc/ocelot_tc.c              |   6 +-
 drivers/net/ethernet/myricom/myri10ge/myri10ge.c   |   2 +-
 drivers/net/ethernet/netronome/nfp/bpf/jit.c       |  17 +-
 .../net/ethernet/netronome/nfp/flower/offload.c    |  25 +-
 .../net/ethernet/netronome/nfp/flower/qos_conf.c   |   2 +-
 .../ethernet/netronome/nfp/flower/tunnel_conf.c    |   8 +-
 .../net/ethernet/netronome/nfp/nfp_net_ethtool.c   |   4 +-
 drivers/net/ethernet/ni/Kconfig                    |   2 +-
 drivers/net/ethernet/packetengines/Kconfig         |   6 +-
 drivers/net/ethernet/packetengines/Makefile        |   2 +-
 drivers/net/ethernet/qlogic/qed/qed_int.c          |   2 +-
 drivers/net/ethernet/qlogic/qed/qed_main.c         |   4 +-
 drivers/net/ethernet/qlogic/qed/qed_rdma.c         |   7 +-
 .../net/ethernet/qualcomm/rmnet/rmnet_map_data.c   |  13 +-
 drivers/net/ethernet/realtek/r8169_main.c          |  19 +-
 drivers/net/ethernet/renesas/ravb_main.c           |   8 +-
 drivers/net/ethernet/rocker/rocker_main.c          |   2 +
 drivers/net/ethernet/samsung/Kconfig               |   2 +-
 drivers/net/ethernet/seeq/sgiseeq.c                |   7 +-
 drivers/net/ethernet/smsc/smc911x.c                |   1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     |   6 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   4 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |   7 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  87 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  50 +-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |   7 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    |   4 +-
 drivers/net/ethernet/ti/cpsw.c                     |   2 +-
 drivers/net/ethernet/toshiba/spider_net.c          |   1 +
 drivers/net/ethernet/toshiba/tc35815.c             |   2 +-
 drivers/net/ethernet/tundra/tsi108_eth.c           |   5 +-
 drivers/net/ethernet/xscale/Kconfig                |   2 +-
 drivers/net/hamradio/baycom_epp.c                  |   3 +-
 drivers/net/hyperv/netvsc_drv.c                    |  10 +-
 drivers/net/ieee802154/mac802154_hwsim.c           |   8 +-
 drivers/net/netdevsim/dev.c                        |  63 +-
 drivers/net/netdevsim/fib.c                        | 102 +--
 drivers/net/netdevsim/netdev.c                     |   9 +-
 drivers/net/netdevsim/netdevsim.h                  |  10 +-
 drivers/net/phy/at803x.c                           |  32 +-
 drivers/net/phy/fixed_phy.c                        |   6 +-
 drivers/net/phy/mscc.c                             |  16 +-
 drivers/net/phy/phy-c45.c                          |  40 ++
 drivers/net/phy/phy.c                              |   2 +-
 drivers/net/phy/phy_device.c                       |  18 +-
 drivers/net/phy/phy_led_triggers.c                 |   3 +-
 drivers/net/phy/phylink.c                          |  10 +-
 drivers/net/phy/sfp.c                              |   2 +-
 drivers/net/ppp/pppoe.c                            |   3 +
 drivers/net/ppp/pppox.c                            |  13 +
 drivers/net/ppp/pptp.c                             |   3 +
 drivers/net/team/team.c                            |   2 +
 drivers/net/tun.c                                  |   9 +-
 drivers/net/usb/cx82310_eth.c                      |   3 +-
 drivers/net/usb/kalmia.c                           |   6 +-
 drivers/net/usb/lan78xx.c                          |   8 +-
 drivers/net/usb/pegasus.c                          |   2 +-
 drivers/net/usb/qmi_wwan.c                         |   1 +
 drivers/net/usb/r8152.c                            |  22 +-
 drivers/net/virtio_net.c                           |   2 +-
 drivers/net/vrf.c                                  |  58 +-
 drivers/net/wan/sdla.c                             |   1 +
 drivers/net/wimax/i2400m/fw.c                      |   4 +-
 drivers/net/wireless/ath/wil6210/cfg80211.c        |   4 +
 .../wireless/broadcom/brcm80211/brcmfmac/vendor.c  |   1 +
 drivers/net/wireless/intel/iwlwifi/cfg/22000.c     |  24 +
 drivers/net/wireless/intel/iwlwifi/fw/api/rx.h     |   3 +-
 drivers/net/wireless/intel/iwlwifi/fw/dbg.c        |  22 +-
 drivers/net/wireless/intel/iwlwifi/iwl-config.h    |   2 +
 drivers/net/wireless/intel/iwlwifi/iwl-drv.c       |   4 +-
 drivers/net/wireless/intel/iwlwifi/mvm/fw.c        |  29 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c  |  33 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c  |  68 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h       |   8 +-
 drivers/net/wireless/intel/iwlwifi/mvm/nvm.c       |   2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/ops.c       |   4 +-
 drivers/net/wireless/intel/iwlwifi/mvm/rs.c        | 539 ++++++++-------
 drivers/net/wireless/intel/iwlwifi/mvm/rs.h        |   3 +-
 drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c      | 185 ++++--
 drivers/net/wireless/intel/iwlwifi/mvm/sta.c       |   6 +-
 drivers/net/wireless/intel/iwlwifi/mvm/sta.h       |  12 +-
 drivers/net/wireless/intel/iwlwifi/mvm/tx.c        |   3 +-
 drivers/net/wireless/intel/iwlwifi/mvm/utils.c     |   4 +-
 drivers/net/wireless/intel/iwlwifi/pcie/drv.c      |  24 +
 drivers/net/wireless/intel/iwlwifi/pcie/trans.c    |   6 +-
 drivers/net/wireless/intel/iwlwifi/pcie/tx-gen2.c  |  20 +-
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c       |   2 +
 drivers/net/wireless/mac80211_hwsim.c              |   8 +-
 drivers/net/wireless/marvell/mwifiex/main.h        |   1 +
 drivers/net/wireless/marvell/mwifiex/scan.c        |   3 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/usb.c    |   8 +-
 drivers/net/wireless/ralink/rt2x00/rt2800lib.c     |   9 +
 drivers/net/wireless/ralink/rt2x00/rt2x00.h        |   1 +
 drivers/net/wireless/ralink/rt2x00/rt2x00dev.c     |  13 +-
 drivers/net/wireless/ti/wlcore/vendor_cmd.c        |   3 +
 drivers/net/xen-netback/netback.c                  |   2 +
 drivers/nfc/nfcmrvl/main.c                         |   4 +-
 drivers/nfc/nfcmrvl/uart.c                         |   4 +-
 drivers/nfc/nfcmrvl/usb.c                          |   1 +
 drivers/nfc/st-nci/se.c                            |   2 +
 drivers/nfc/st21nfca/se.c                          |   2 +
 drivers/ntb/msi.c                                  |   5 -
 drivers/nvdimm/btt_devs.c                          |  16 +-
 drivers/nvdimm/bus.c                               | 210 ++++--
 drivers/nvdimm/core.c                              |  10 +-
 drivers/nvdimm/dimm_devs.c                         |   4 +-
 drivers/nvdimm/namespace_devs.c                    |  36 +-
 drivers/nvdimm/nd-core.h                           |  71 +-
 drivers/nvdimm/pfn_devs.c                          |  29 +-
 drivers/nvdimm/pmem.c                              |   4 +-
 drivers/nvdimm/region.c                            |  24 +-
 drivers/nvdimm/region_devs.c                       |  12 +-
 drivers/nvme/host/core.c                           |  41 +-
 drivers/nvme/host/multipath.c                      |  79 ++-
 drivers/nvme/host/nvme.h                           |  32 +-
 drivers/nvme/host/pci.c                            |  23 +-
 drivers/nvme/host/rdma.c                           |  16 +-
 drivers/nvme/target/configfs.c                     |   1 +
 drivers/nvme/target/core.c                         |  15 +
 drivers/nvme/target/loop.c                         |   8 +
 drivers/nvme/target/nvmet.h                        |   3 +
 drivers/nvmem/nvmem-sysfs.c                        |  15 +-
 drivers/of/irq.c                                   |   2 +-
 drivers/of/resolver.c                              |  12 +-
 drivers/pci/pci.c                                  |  29 +-
 drivers/pci/pci.h                                  |   1 -
 drivers/pci/pcie/aspm.c                            |  20 +
 drivers/pci/pcie/portdrv_core.c                    |  66 --
 drivers/pci/quirks.c                               |   2 +-
 drivers/pcmcia/db1xxx_ss.c                         |   4 +
 drivers/perf/arm_pmu.c                             |   2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |   2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  92 ++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c            |  12 +-
 drivers/pinctrl/aspeed/pinmux-aspeed.c             |   2 +-
 drivers/pinctrl/aspeed/pinmux-aspeed.h             |   5 +-
 drivers/platform/chrome/cros_ec_ishtp.c            |   4 +-
 drivers/platform/olpc/olpc-xo175-ec.c              |   6 +
 drivers/platform/x86/intel_pmc_core.c              |   1 +
 drivers/platform/x86/pcengines-apuv2.c             |   6 +-
 drivers/power/supply/ab8500_charger.c              |   1 +
 drivers/powercap/intel_rapl_common.c               |   2 +-
 drivers/powercap/powercap_sys.c                    |   2 +-
 drivers/pwm/core.c                                 |   7 +-
 drivers/regulator/axp20x-regulator.c               |  10 +-
 drivers/regulator/lp87565-regulator.c              |   8 +-
 drivers/regulator/of_regulator.c                   |   4 +-
 drivers/s390/block/dasd_alias.c                    |  22 +-
 drivers/s390/char/con3215.c                        |   1 +
 drivers/s390/char/tape_core.c                      |   3 +
 drivers/s390/cio/qdio_main.c                       |  24 +-
 drivers/s390/cio/vfio_ccw_async.c                  |   2 +-
 drivers/s390/cio/vfio_ccw_cp.c                     |  28 +-
 drivers/s390/cio/vfio_ccw_drv.c                    |   2 +-
 drivers/s390/crypto/ap_queue.c                     |   1 +
 drivers/s390/crypto/zcrypt_msgtype6.c              |  17 +-
 drivers/s390/net/ctcm_fsms.c                       |   1 +
 drivers/s390/net/ctcm_mpc.c                        |   3 +
 drivers/s390/net/qeth_core.h                       |   1 +
 drivers/s390/net/qeth_core_main.c                  |  24 +
 drivers/s390/net/qeth_l2_main.c                    |   2 +-
 drivers/s390/virtio/virtio_ccw.c                   |   4 +
 drivers/scsi/Kconfig                               |   4 +-
 drivers/scsi/arm/fas216.c                          |   8 +
 drivers/scsi/device_handler/scsi_dh_alua.c         |   7 +-
 drivers/scsi/fcoe/fcoe_ctlr.c                      | 140 ++--
 drivers/scsi/hpsa.c                                |  18 +-
 drivers/scsi/ibmvscsi/ibmvfc.c                     |   2 +-
 drivers/scsi/libfc/fc_rport.c                      |   5 +-
 drivers/scsi/libsas/sas_discover.c                 |   1 +
 drivers/scsi/lpfc/lpfc.h                           |   1 +
 drivers/scsi/lpfc/lpfc_attr.c                      |  15 +
 drivers/scsi/lpfc/lpfc_init.c                      |  33 +-
 drivers/scsi/lpfc/lpfc_sli4.h                      |   5 +
 drivers/scsi/megaraid/megaraid_sas_base.c          |   5 +-
 drivers/scsi/megaraid/megaraid_sas_fusion.c        |  27 +-
 drivers/scsi/mpt3sas/mpt3sas_base.c                |  12 +-
 drivers/scsi/qla2xxx/qla_attr.c                    |   2 +
 drivers/scsi/qla2xxx/qla_init.c                    |   2 +-
 drivers/scsi/qla2xxx/qla_os.c                      |  11 +-
 drivers/scsi/scsi_lib.c                            |   6 +-
 drivers/scsi/ufs/ufshcd.c                          |   3 +
 drivers/soc/fsl/qe/qe.c                            |   2 +-
 drivers/soc/ixp4xx/Kconfig                         |   4 +
 drivers/soc/qcom/qcom-geni-se.c                    |   6 +
 drivers/soc/ti/pm33xx.c                            |  19 +-
 drivers/soundwire/Kconfig                          |   7 +-
 drivers/soundwire/Makefile                         |   2 +-
 drivers/soundwire/cadence_master.c                 |   8 +-
 drivers/spi/spi-bcm2835.c                          |   3 +-
 drivers/spi/spi-fsl-qspi.c                         |   2 +-
 drivers/spi/spi-gpio.c                             |   6 +
 drivers/spi/spi-pxa2xx.c                           |  14 +-
 drivers/staging/android/ion/ion_page_pool.c        |   3 +
 drivers/staging/comedi/drivers/dt3000.c            |   8 +-
 drivers/staging/fbtft/fb_bd663474.c                |   2 +-
 drivers/staging/fbtft/fb_ili9163.c                 |   2 +-
 drivers/staging/fbtft/fb_ili9325.c                 |   2 +-
 drivers/staging/fbtft/fb_s6d1121.c                 |   2 +-
 drivers/staging/fbtft/fb_ssd1289.c                 |   2 +-
 drivers/staging/fbtft/fb_ssd1331.c                 |   4 +-
 drivers/staging/fbtft/fb_upd161704.c               |   2 +-
 drivers/staging/fbtft/fbtft-bus.c                  |   2 +-
 drivers/staging/fbtft/fbtft-core.c                 |  47 +-
 drivers/staging/gasket/apex_driver.c               |   2 +-
 drivers/staging/unisys/visornic/visornic_main.c    |   3 +-
 drivers/staging/wilc1000/wilc_wfi_cfgoperations.c  |   1 +
 drivers/target/iscsi/cxgbit/cxgbit_cm.c            |   8 +-
 drivers/target/iscsi/cxgbit/cxgbit_main.c          |   3 +-
 drivers/target/target_core_user.c                  |   9 +-
 .../int340x_thermal/processor_thermal_device.c     |   4 +
 drivers/tty/hvc/hvcs.c                             |   2 +-
 drivers/tty/serial/Kconfig                         |  19 -
 drivers/tty/serial/Makefile                        |   1 -
 drivers/tty/serial/kgdboc.c                        |   4 +
 drivers/tty/serial/netx-serial.c                   | 733 ---------------------
 drivers/tty/tty_ldsem.c                            |   5 +-
 drivers/tty/vt/vt.c                                |   6 +-
 drivers/usb/chipidea/ci_hdrc_imx.c                 |  19 +-
 drivers/usb/chipidea/udc.c                         |  32 +-
 drivers/usb/class/cdc-acm.c                        |  12 +-
 drivers/usb/class/cdc-wdm.c                        |  16 +-
 drivers/usb/class/usbtmc.c                         |   3 +
 drivers/usb/core/buffer.c                          |  10 +-
 drivers/usb/core/devio.c                           |   2 -
 drivers/usb/core/file.c                            |  10 +-
 drivers/usb/core/hcd-pci.c                         |  30 +-
 drivers/usb/core/hcd.c                             | 131 +---
 drivers/usb/core/message.c                         |   4 +-
 drivers/usb/core/sysfs.c                           | 121 ++++
 drivers/usb/core/usb.h                             |   5 +
 drivers/usb/dwc2/hcd.c                             |   2 +-
 drivers/usb/gadget/composite.c                     |   1 +
 drivers/usb/gadget/function/f_mass_storage.c       |  28 +-
 drivers/usb/gadget/udc/lpc32xx_udc.c               |   2 +-
 drivers/usb/gadget/udc/renesas_usb3.c              |   5 +-
 drivers/usb/host/ehci-pci.c                        |   4 +-
 drivers/usb/host/fotg210-hcd.c                     |   4 +
 drivers/usb/host/hwa-hc.c                          |   2 +-
 drivers/usb/host/ohci-hcd.c                        |  15 +-
 drivers/usb/host/ohci-pci.c                        |   2 +-
 drivers/usb/host/pci-quirks.c                      |  45 +-
 drivers/usb/host/pci-quirks.h                      |   2 +-
 drivers/usb/host/xhci-pci.c                        |   2 +-
 drivers/usb/host/xhci-rcar.c                       |  11 +-
 drivers/usb/host/xhci-tegra.c                      |  10 +
 drivers/usb/host/xhci.c                            |  10 +
 drivers/usb/host/xhci.h                            |   3 +-
 drivers/usb/misc/iowarrior.c                       |   7 +-
 drivers/usb/misc/rio500.c                          |  43 +-
 drivers/usb/misc/usb251xb.c                        |  15 +-
 drivers/usb/misc/yurex.c                           |   2 +-
 drivers/usb/serial/option.c                        |  10 +
 drivers/usb/storage/realtek_cr.c                   |  15 +-
 drivers/usb/storage/scsiglue.c                     |  11 +
 drivers/usb/storage/unusual_devs.h                 |   2 +-
 drivers/usb/typec/tcpm/tcpm.c                      |  60 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c                  |   2 +-
 drivers/vhost/test.c                               |  13 +-
 drivers/vhost/vhost.c                              | 520 +--------------
 drivers/vhost/vhost.h                              |  41 --
 drivers/video/fbdev/acornfb.c                      |   1 +
 drivers/video/fbdev/omap/omapfb_main.c             |   8 +
 drivers/watchdog/ar7_wdt.c                         |   1 +
 drivers/watchdog/pcwd.c                            |   2 +-
 drivers/watchdog/riowd.c                           |   2 +-
 drivers/watchdog/sb_wdog.c                         |   1 +
 drivers/watchdog/scx200_wdt.c                      |   1 +
 drivers/watchdog/wdt.c                             |   2 +-
 drivers/watchdog/wdt285.c                          |   2 +-
 drivers/watchdog/wdt977.c                          |   2 +-
 drivers/xen/gntdev.c                               |   2 +-
 drivers/xen/privcmd.c                              |  35 +-
 drivers/xen/swiotlb-xen.c                          |  34 +-
 drivers/xen/xen-pciback/conf_space_capability.c    |   3 +-
 drivers/xen/xlate_mmu.c                            |  32 +
 fs/afs/cell.c                                      |   4 +
 fs/afs/cmservice.c                                 |  10 +-
 fs/afs/dir.c                                       |  92 ++-
 fs/afs/file.c                                      |  12 +-
 fs/afs/fsclient.c                                  |  51 +-
 fs/afs/vlclient.c                                  |  11 +-
 fs/afs/yfsclient.c                                 |  56 +-
 fs/block_dev.c                                     |  86 ++-
 fs/btrfs/Kconfig                                   |   1 +
 fs/btrfs/backref.c                                 |   2 +-
 fs/btrfs/ctree.h                                   |   4 -
 fs/btrfs/disk-io.c                                 |   3 +-
 fs/btrfs/extent-tree.c                             |  71 +-
 fs/btrfs/inode.c                                   |  24 +-
 fs/btrfs/locking.c                                 |   9 +-
 fs/btrfs/ordered-data.c                            |  11 +-
 fs/btrfs/send.c                                    |  77 +--
 fs/btrfs/transaction.c                             |  32 +-
 fs/btrfs/transaction.h                             |   3 +
 fs/btrfs/volumes.c                                 |  23 +-
 fs/ceph/addr.c                                     |   5 +-
 fs/ceph/caps.c                                     |   5 +-
 fs/ceph/inode.c                                    |   7 +-
 fs/ceph/locks.c                                    |   3 +-
 fs/ceph/snap.c                                     |   4 +-
 fs/ceph/super.h                                    |   2 +-
 fs/ceph/xattr.c                                    |  19 +-
 fs/cifs/cifsfs.h                                   |   2 +-
 fs/cifs/cifsproto.h                                |   1 +
 fs/cifs/cifssmb.c                                  | 197 ++----
 fs/cifs/connect.c                                  |  30 +-
 fs/cifs/dir.c                                      |   5 +-
 fs/cifs/misc.c                                     |  22 +
 fs/cifs/sess.c                                     |  26 +-
 fs/cifs/smb2ops.c                                  |  39 +-
 fs/cifs/smb2pdu.c                                  |   7 +-
 fs/compat_ioctl.c                                  |   3 -
 fs/configfs/configfs_internal.h                    |  15 +-
 fs/configfs/dir.c                                  | 137 +++-
 fs/configfs/file.c                                 | 280 ++++----
 fs/coredump.c                                      |  44 +-
 fs/dax.c                                           |   4 +-
 fs/exec.c                                          |   2 +-
 fs/f2fs/file.c                                     |  63 +-
 fs/f2fs/gc.c                                       |  70 +-
 fs/f2fs/super.c                                    |  48 +-
 fs/gfs2/bmap.c                                     | 179 +++--
 fs/io_uring.c                                      | 162 +++--
 fs/iomap/Makefile                                  |   2 +-
 fs/namespace.c                                     |   4 +-
 fs/nfs/delegation.c                                |  25 +-
 fs/nfs/delegation.h                                |   2 +-
 fs/nfs/dir.c                                       |   2 +-
 fs/nfs/direct.c                                    |  27 +-
 fs/nfs/flexfilelayout/flexfilelayout.c             |  28 +-
 fs/nfs/fscache.c                                   |   7 +-
 fs/nfs/fscache.h                                   |   2 +-
 fs/nfs/inode.c                                     |  35 +-
 fs/nfs/internal.h                                  |  10 +
 fs/nfs/nfs4_fs.h                                   |   3 +-
 fs/nfs/nfs4client.c                                |   5 +-
 fs/nfs/nfs4file.c                                  |  12 +-
 fs/nfs/nfs4proc.c                                  | 109 +--
 fs/nfs/nfs4state.c                                 |  49 +-
 fs/nfs/pagelist.c                                  |  19 +-
 fs/nfs/pnfs.c                                      |   7 +-
 fs/nfs/pnfs_nfs.c                                  |  15 +-
 fs/nfs/proc.c                                      |   7 +-
 fs/nfs/read.c                                      |  35 +-
 fs/nfs/super.c                                     |   1 +
 fs/nfs/write.c                                     |  38 +-
 fs/nfsd/nfscache.c                                 |   2 +-
 fs/nfsd/nfsctl.c                                   |  19 +-
 fs/ocfs2/xattr.c                                   |   3 -
 fs/open.c                                          |  19 +
 fs/read_write.c                                    |  49 +-
 fs/seq_file.c                                      |   2 +-
 fs/super.c                                         |   5 +-
 fs/ubifs/budget.c                                  |   2 +-
 fs/ubifs/orphan.c                                  |   2 -
 fs/ubifs/super.c                                   |   4 +
 fs/userfaultfd.c                                   |  25 +-
 fs/xfs/libxfs/xfs_bmap.c                           |  29 +-
 fs/xfs/libxfs/xfs_da_btree.c                       |  19 +-
 fs/xfs/libxfs/xfs_dir2_node.c                      |   3 +-
 fs/xfs/scrub/dabtree.c                             |   6 +-
 fs/xfs/xfs_ioctl32.c                               |  56 +-
 fs/xfs/xfs_iops.c                                  |   1 +
 fs/xfs/xfs_itable.c                                |   3 +
 fs/xfs/xfs_log.c                                   |   5 +-
 fs/xfs/xfs_pnfs.c                                  |   2 +-
 fs/xfs/xfs_reflink.c                               |  63 +-
 include/asm-generic/5level-fixup.h                 |  21 +-
 include/asm-generic/futex.h                        |  21 +-
 include/asm-generic/getorder.h                     |  50 +-
 include/drm/drm_client.h                           |   2 +
 include/drm/drm_mode_config.h                      |   7 +
 include/kvm/arm_pmu.h                              |   2 +
 include/kvm/arm_vgic.h                             |   1 +
 include/linux/blk-cgroup.h                         |   1 +
 include/linux/ccp.h                                |   2 +
 include/linux/ceph/buffer.h                        |   3 +-
 include/linux/clk.h                                |   1 +
 include/linux/compiler.h                           |   8 +-
 include/linux/connector.h                          |   1 -
 include/linux/cred.h                               |   8 +-
 include/linux/device.h                             |   6 +
 include/linux/dim.h                                |  56 --
 include/linux/dma-contiguous.h                     |   5 +-
 include/linux/dma-mapping.h                        |   4 +-
 include/linux/dma-noncoherent.h                    |  13 +-
 include/linux/elevator.h                           |   1 -
 include/linux/filter.h                             |  13 +
 include/linux/fs.h                                 |   6 +
 include/linux/gfp.h                                |  12 +-
 include/linux/gpio.h                               |  24 -
 include/linux/gpio/consumer.h                      |  64 +-
 include/linux/hmm.h                                |  54 --
 include/linux/if_pppox.h                           |   3 +
 include/linux/if_rmnet.h                           |   4 +-
 include/linux/input/elan-i2c-ids.h                 |   2 +-
 include/linux/intel-iommu.h                        |   3 -
 include/linux/iova.h                               |   6 +
 include/linux/key.h                                |   8 +-
 include/linux/kvm_host.h                           |   6 +-
 include/linux/logic_pio.h                          |   1 +
 include/linux/memcontrol.h                         |  19 +
 include/linux/mempolicy.h                          |   2 +
 include/linux/mlx5/device.h                        |   4 +-
 include/linux/mlx5/fs.h                            |   1 +
 include/linux/mlx5/mlx5_ifc.h                      |  11 +-
 include/linux/mm_types.h                           |  11 +-
 include/linux/mmzone.h                             |   5 +-
 include/linux/mod_devicetable.h                    |   1 +
 include/linux/netfilter/nf_conntrack_h323_asn1.h   |   3 +-
 include/linux/netfilter/nf_conntrack_h323_types.h  |   5 +
 include/linux/of.h                                 |   2 +-
 include/linux/page-flags-layout.h                  |  18 +-
 include/linux/page-flags.h                         |   4 +
 include/linux/pci.h                                |   2 +
 include/linux/phy.h                                |   1 +
 include/linux/sched.h                              |  10 +-
 include/linux/sched/numa_balancing.h               |   4 +-
 include/linux/signal.h                             |  15 +-
 include/linux/skbuff.h                             |   8 +
 include/linux/skmsg.h                              |   8 +-
 include/linux/socket.h                             |   3 +
 include/linux/sunrpc/sched.h                       |   1 -
 include/linux/timekeeper_internal.h                |   5 +
 include/linux/trace_events.h                       |   1 +
 include/linux/usb.h                                |   2 +-
 include/linux/usb/hcd.h                            |   3 +
 include/linux/wait.h                               |  13 +
 include/math-emu/op-common.h                       |   5 +
 include/net/act_api.h                              |   4 +-
 include/net/addrconf.h                             |   2 +-
 include/net/bluetooth/hci_core.h                   |   1 +
 include/net/cfg80211.h                             |  17 +-
 include/net/flow_offload.h                         |  30 +-
 include/net/inet_frag.h                            |   2 +-
 include/net/net_namespace.h                        |   3 +-
 include/net/netfilter/nf_conntrack_expect.h        |  12 +-
 include/net/netfilter/nf_conntrack_synproxy.h      |   1 +
 include/net/netfilter/nf_tables.h                  |  14 +-
 include/net/netfilter/nf_tables_offload.h          |   2 +
 include/net/netlink.h                              |   5 +-
 include/net/nexthop.h                              |   6 -
 include/net/pkt_cls.h                              |   7 +-
 include/net/psample.h                              |   1 +
 include/net/route.h                                |   2 +-
 include/net/sch_generic.h                          |   8 +-
 include/net/sock.h                                 |  10 +-
 include/net/tc_act/tc_police.h                     |   4 +-
 include/net/tc_act/tc_sample.h                     |   2 +-
 include/net/tcp.h                                  |   8 +
 include/net/tls.h                                  |  13 +-
 include/rdma/ib_verbs.h                            |   4 +-
 include/rdma/rdmavt_qp.h                           |   9 +-
 include/rdma/restrack.h                            |   3 +-
 include/scsi/libfc.h                               |  52 +-
 include/scsi/libfcoe.h                             |   3 +-
 include/soc/arc/mcip.h                             |  11 +
 include/soc/fsl/qe/qe.h                            |   2 +-
 include/sound/compress_driver.h                    |   5 +-
 include/sound/soc-dapm.h                           |   3 +
 include/sound/sof/control.h                        |   2 +-
 include/sound/sof/dai-intel.h                      |   2 +-
 include/sound/sof/dai.h                            |   2 +-
 include/sound/sof/header.h                         |   2 +-
 include/sound/sof/info.h                           |   2 +-
 include/sound/sof/pm.h                             |   2 +-
 include/sound/sof/stream.h                         |   2 +-
 include/sound/sof/topology.h                       |   2 +-
 include/sound/sof/trace.h                          |   2 +-
 include/sound/sof/xtensa.h                         |   2 +-
 include/trace/events/dma_fence.h                   |   2 +-
 include/trace/events/napi.h                        |   4 +-
 include/trace/events/qdisc.h                       |   4 +-
 include/trace/events/rxrpc.h                       |  65 +-
 include/trace/events/tegra_apb_dma.h               |   4 +-
 include/uapi/linux/bpf.h                           |   4 +-
 include/uapi/linux/bpfilter.h                      |   2 +-
 include/uapi/linux/ipmi_bmc.h                      |   2 +-
 include/uapi/linux/isst_if.h                       |   2 +-
 include/uapi/linux/jffs2.h                         |   5 -
 include/uapi/linux/kfd_ioctl.h                     |  20 +-
 include/uapi/linux/kvm.h                           |   4 +-
 include/uapi/linux/netfilter/nf_synproxy.h         |   2 +-
 include/uapi/linux/netfilter/xt_connlabel.h        |   6 +
 include/uapi/linux/netfilter/xt_nfacct.h           |   5 +
 include/uapi/linux/nl80211.h                       |   2 +-
 include/uapi/linux/psp-sev.h                       |   2 +-
 include/uapi/linux/rds.h                           |   2 +
 include/uapi/linux/rxrpc.h                         |   2 +-
 include/uapi/linux/serial_core.h                   |   3 -
 include/uapi/linux/socket.h                        |  19 +-
 include/uapi/linux/usb/g_uvc.h                     |   2 +-
 include/uapi/linux/vbox_vmmdev_types.h             |   2 +-
 include/uapi/linux/vboxguest.h                     |   2 +-
 include/uapi/linux/videodev2.h                     |   8 +-
 include/uapi/linux/virtio_iommu.h                  |  32 +-
 include/uapi/linux/virtio_pmem.h                   |   2 +-
 include/uapi/linux/vmcore.h                        |   2 +-
 include/uapi/linux/wmi.h                           |   2 +-
 include/uapi/misc/fastrpc.h                        |   2 +-
 include/uapi/rdma/rvt-abi.h                        |   2 +-
 include/uapi/rdma/siw-abi.h                        |   5 +-
 include/uapi/scsi/scsi_bsg_ufs.h                   |   2 +-
 include/uapi/sound/skl-tplg-interface.h            |   2 +-
 include/xen/xen-ops.h                              |   3 +
 kernel/Kconfig.preempt                             |   8 +-
 kernel/Makefile                                    |   1 -
 kernel/bpf/core.c                                  |   8 +-
 kernel/bpf/syscall.c                               |  30 +-
 kernel/bpf/verifier.c                              |  13 +-
 kernel/configs.c                                   |  16 +-
 kernel/cred.c                                      |  21 +-
 kernel/dma/contiguous.c                            |  16 +-
 kernel/dma/direct.c                                |  20 +-
 kernel/dma/mapping.c                               |  32 +-
 kernel/dma/remap.c                                 |   2 +-
 kernel/events/core.c                               |   2 +-
 kernel/exit.c                                      |   6 +-
 kernel/fork.c                                      |   2 +-
 kernel/irq/affinity.c                              |   6 +-
 kernel/irq/irqdesc.c                               |  15 +-
 kernel/kallsyms.c                                  |   6 +-
 kernel/kprobes.c                                   |   8 +-
 kernel/locking/lockdep.c                           |  13 +-
 kernel/locking/lockdep_proc.c                      |   3 +-
 kernel/locking/mutex.c                             |  11 +-
 kernel/locking/rwsem.c                             |  28 +-
 kernel/module.c                                    |   4 +-
 kernel/sched/core.c                                |  83 +--
 kernel/sched/cpufreq_schedutil.c                   |  14 +-
 kernel/sched/deadline.c                            |   8 -
 kernel/sched/fair.c                                | 149 +++--
 kernel/sched/psi.c                                 |  12 +-
 kernel/signal.c                                    |   8 +-
 kernel/time/timekeeping.c                          |   5 +
 kernel/time/vsyscall.c                             |  22 +-
 kernel/trace/ftrace.c                              |  17 +
 kernel/trace/trace.c                               |  26 +-
 kernel/trace/trace_events.c                        |   2 +-
 kernel/trace/trace_functions_graph.c               |  17 +-
 kernel/trace/trace_probe.c                         |   3 +-
 lib/Kconfig.kasan                                  |  11 +-
 lib/Makefile                                       |   3 +-
 lib/dim/dim.c                                      |   4 +-
 lib/dim/net_dim.c                                  |  56 ++
 lib/kfifo.c                                        |   3 +-
 lib/logic_pio.c                                    |  73 +-
 lib/raid6/Makefile                                 |   2 +-
 lib/test_firmware.c                                |   5 +-
 lib/test_meminit.c                                 |   2 +-
 lib/vdso/gettimeofday.c                            |  79 ++-
 mm/Makefile                                        |   1 +
 mm/balloon_compaction.c                            |  72 +-
 mm/compaction.c                                    |  11 +-
 mm/hmm.c                                           |  10 +-
 mm/huge_memory.c                                   |  55 +-
 mm/hugetlb.c                                       |  19 +
 mm/kasan/common.c                                  |  10 +-
 mm/kmemleak.c                                      |   4 +-
 mm/memcontrol.c                                    | 146 +++-
 mm/memory_hotplug.c                                |   2 -
 mm/mempolicy.c                                     | 134 ++--
 {kernel => mm}/memremap.c                          |  30 +
 mm/migrate.c                                       |  21 +-
 mm/page_alloc.c                                    |  19 +-
 mm/rmap.c                                          |   8 +
 mm/shmem.c                                         |   2 +-
 mm/slub.c                                          |   8 +-
 mm/usercopy.c                                      |   2 +-
 mm/vmalloc.c                                       |  21 +-
 mm/vmscan.c                                        |  27 +-
 mm/workingset.c                                    |  10 +-
 mm/z3fold.c                                        | 104 ++-
 mm/zsmalloc.c                                      |  80 ++-
 net/batman-adv/bat_iv_ogm.c                        |  20 +-
 net/batman-adv/bat_v_ogm.c                         |  18 +-
 net/batman-adv/multicast.c                         |   8 +-
 net/batman-adv/netlink.c                           |   2 +-
 net/bluetooth/hci_core.c                           |   1 +
 net/bluetooth/hci_debugfs.c                        |  31 +
 net/bluetooth/hidp/core.c                          |   9 +-
 net/bluetooth/l2cap_core.c                         |   2 +-
 net/bridge/br.c                                    |   5 +-
 net/bridge/br_multicast.c                          |   3 +
 net/bridge/br_private.h                            |   9 +-
 net/bridge/br_vlan.c                               |  29 +-
 net/bridge/netfilter/Kconfig                       |   6 +-
 net/bridge/netfilter/ebtables.c                    |  40 +-
 net/bridge/netfilter/nft_meta_bridge.c             |  12 +-
 net/can/gw.c                                       |  48 +-
 net/ceph/crypto.c                                  |   6 +-
 net/ceph/osd_client.c                              |   9 +-
 net/core/dev.c                                     |  17 +-
 net/core/filter.c                                  |  14 +-
 net/core/flow_dissector.c                          |   2 +-
 net/core/flow_offload.c                            |  22 +-
 net/core/netpoll.c                                 |   6 +-
 net/core/skmsg.c                                   |   4 +-
 net/core/sock.c                                    |  50 +-
 net/core/sock_diag.c                               |   3 +-
 net/core/sock_map.c                                |  19 +-
 net/core/stream.c                                  |  16 +-
 net/dsa/slave.c                                    |   6 +-
 net/dsa/switch.c                                   |   3 +
 net/dsa/tag_8021q.c                                |   2 +
 net/dsa/tag_sja1105.c                              |  12 +-
 net/ieee802154/6lowpan/reassembly.c                |   2 +-
 net/ieee802154/socket.c                            |   2 +-
 net/ipv4/fib_trie.c                                |   2 +-
 net/ipv4/icmp.c                                    |  10 +-
 net/ipv4/igmp.c                                    |   4 +-
 net/ipv4/inet_fragment.c                           |  41 +-
 net/ipv4/ip_fragment.c                             |   8 +-
 net/ipv4/ipip.c                                    |   3 +
 net/ipv4/netfilter/ipt_CLUSTERIP.c                 |   4 +-
 net/ipv4/netfilter/ipt_SYNPROXY.c                  |   2 +
 net/ipv4/netfilter/ipt_rpfilter.c                  |   1 +
 net/ipv4/netfilter/nf_nat_h323.c                   |  12 +-
 net/ipv4/route.c                                   |  17 +-
 net/ipv4/tcp.c                                     |  33 +-
 net/ipv4/tcp_bpf.c                                 |   6 +-
 net/ipv4/tcp_output.c                              |  19 +-
 net/ipv4/tcp_ulp.c                                 |  13 +
 net/ipv6/addrconf.c                                |  19 +-
 net/ipv6/ip6_gre.c                                 |   3 +-
 net/ipv6/ip6_tunnel.c                              |   6 +-
 net/ipv6/mcast.c                                   |   5 +-
 net/ipv6/netfilter/ip6t_SYNPROXY.c                 |   2 +
 net/ipv6/netfilter/ip6t_rpfilter.c                 |   8 +-
 net/ipv6/netfilter/nf_conntrack_reasm.c            |   2 +-
 net/ipv6/reassembly.c                              |   2 +-
 net/ipv6/route.c                                   |   2 +-
 net/iucv/af_iucv.c                                 |  14 +-
 net/l2tp/l2tp_ppp.c                                |   3 +
 net/mac80211/cfg.c                                 |  17 +-
 net/mac80211/driver-ops.c                          |  13 +-
 net/mac80211/iface.c                               |   1 -
 net/mac80211/mlme.c                                |  10 +
 net/mac80211/rx.c                                  |   6 +-
 net/mac80211/util.c                                |   7 +-
 net/mpls/mpls_iptunnel.c                           |   8 +-
 net/ncsi/ncsi-cmd.c                                |  13 +-
 net/ncsi/ncsi-rsp.c                                |   9 +-
 net/netfilter/Kconfig                              |   6 +-
 net/netfilter/ipset/ip_set_bitmap_ipmac.c          |   2 +-
 net/netfilter/ipset/ip_set_core.c                  |   2 +-
 net/netfilter/ipset/ip_set_hash_ipmac.c            |   6 +-
 net/netfilter/ipvs/ip_vs_nfct.c                    |   2 +-
 net/netfilter/nf_conntrack_amanda.c                |   2 +-
 net/netfilter/nf_conntrack_broadcast.c             |   2 +-
 net/netfilter/nf_conntrack_core.c                  |  20 +-
 net/netfilter/nf_conntrack_expect.c                |  26 +-
 net/netfilter/nf_conntrack_ftp.c                   |   4 +-
 net/netfilter/nf_conntrack_h323_asn1.c             |   5 +-
 net/netfilter/nf_conntrack_h323_main.c             |  18 +-
 net/netfilter/nf_conntrack_irc.c                   |   2 +-
 net/netfilter/nf_conntrack_netlink.c               |   4 +-
 net/netfilter/nf_conntrack_pptp.c                  |   4 +-
 net/netfilter/nf_conntrack_proto_gre.c             |   2 -
 net/netfilter/nf_conntrack_proto_icmp.c            |   2 +-
 net/netfilter/nf_conntrack_proto_tcp.c             |   8 +-
 net/netfilter/nf_conntrack_sane.c                  |   2 +-
 net/netfilter/nf_conntrack_sip.c                   |  10 +-
 net/netfilter/nf_conntrack_standalone.c            |   5 +
 net/netfilter/nf_conntrack_tftp.c                  |   2 +-
 net/netfilter/nf_flow_table_core.c                 |  43 +-
 net/netfilter/nf_flow_table_ip.c                   |  44 ++
 net/netfilter/nf_nat_amanda.c                      |   2 +-
 net/netfilter/nf_nat_core.c                        |   2 +-
 net/netfilter/nf_nat_ftp.c                         |   2 +-
 net/netfilter/nf_nat_irc.c                         |   2 +-
 net/netfilter/nf_nat_sip.c                         |   8 +-
 net/netfilter/nf_nat_tftp.c                        |   2 +-
 net/netfilter/nf_synproxy_core.c                   |   8 +-
 net/netfilter/nf_tables_api.c                      |  23 +-
 net/netfilter/nf_tables_offload.c                  |  22 +-
 net/netfilter/nfnetlink.c                          |   2 +-
 net/netfilter/nft_chain_filter.c                   |   2 +-
 net/netfilter/nft_chain_nat.c                      |   3 +
 net/netfilter/nft_ct.c                             |   2 +-
 net/netfilter/nft_flow_offload.c                   |  15 +-
 net/netfilter/nft_hash.c                           |   2 +-
 net/netfilter/nft_meta.c                           |  18 +-
 net/netfilter/nft_redir.c                          |   2 +-
 net/netfilter/nft_synproxy.c                       |   2 +
 net/netfilter/xt_nfacct.c                          |  36 +-
 net/netfilter/xt_physdev.c                         |   6 +-
 net/netrom/af_netrom.c                             |   1 +
 net/openvswitch/conntrack.c                        |  20 +-
 net/openvswitch/datapath.c                         |  15 +-
 net/openvswitch/flow.c                             | 168 +++--
 net/openvswitch/flow.h                             |   5 +-
 net/openvswitch/flow_table.c                       |   8 +-
 net/packet/af_packet.c                             |   7 +
 net/psample/psample.c                              |   2 +-
 net/rds/ib.c                                       |  16 +-
 net/rds/ib.h                                       |   1 +
 net/rds/ib_cm.c                                    |   3 +
 net/rds/rdma_transport.c                           |  15 +-
 net/rds/recv.c                                     |   5 +-
 net/rxrpc/af_rxrpc.c                               |   9 +-
 net/rxrpc/ar-internal.h                            |  26 +-
 net/rxrpc/call_event.c                             |  23 +-
 net/rxrpc/call_object.c                            |  33 +-
 net/rxrpc/conn_client.c                            |  44 ++
 net/rxrpc/conn_event.c                             |   6 +-
 net/rxrpc/conn_object.c                            |   2 +-
 net/rxrpc/input.c                                  | 359 +++++-----
 net/rxrpc/local_event.c                            |   4 +-
 net/rxrpc/local_object.c                           | 104 +--
 net/rxrpc/output.c                                 |   9 +-
 net/rxrpc/peer_event.c                             |  12 +-
 net/rxrpc/peer_object.c                            |  18 +
 net/rxrpc/protocol.h                               |   9 +
 net/rxrpc/recvmsg.c                                |  53 +-
 net/rxrpc/rxkad.c                                  |  32 +-
 net/rxrpc/sendmsg.c                                |  14 +-
 net/rxrpc/skbuff.c                                 |  40 +-
 net/sched/act_bpf.c                                |  11 +-
 net/sched/act_connmark.c                           |  11 +-
 net/sched/act_csum.c                               |  11 +-
 net/sched/act_ct.c                                 |  11 +-
 net/sched/act_ctinfo.c                             |  11 +-
 net/sched/act_gact.c                               |  10 +-
 net/sched/act_ife.c                                |  15 +-
 net/sched/act_ipt.c                                |  11 +-
 net/sched/act_mirred.c                             |  15 +-
 net/sched/act_mpls.c                               |  10 +-
 net/sched/act_nat.c                                |  11 +-
 net/sched/act_pedit.c                              |  12 +-
 net/sched/act_police.c                             |  10 +-
 net/sched/act_sample.c                             |  18 +-
 net/sched/act_simple.c                             |  12 +-
 net/sched/act_skbedit.c                            |  25 +-
 net/sched/act_skbmod.c                             |  13 +-
 net/sched/act_tunnel_key.c                         |  10 +-
 net/sched/act_vlan.c                               |  27 +-
 net/sched/cls_api.c                                |  16 +-
 net/sched/cls_bpf.c                                |   2 +-
 net/sched/cls_flower.c                             |   2 +-
 net/sched/cls_matchall.c                           |   2 +-
 net/sched/cls_u32.c                                |   6 +-
 net/sched/sch_cbs.c                                |  19 +-
 net/sched/sch_codel.c                              |   6 +-
 net/sched/sch_generic.c                            |  19 +-
 net/sched/sch_taprio.c                             |  34 +-
 net/sctp/sm_sideeffect.c                           |   2 +-
 net/sctp/socket.c                                  |   4 +-
 net/sctp/stream.c                                  |   1 +
 net/smc/af_smc.c                                   |  15 +-
 net/smc/smc_tx.c                                   |   6 +-
 net/sunrpc/clnt.c                                  |  47 +-
 net/sunrpc/xprt.c                                  |   7 -
 net/tipc/addr.c                                    |   1 +
 net/tipc/link.c                                    |  92 +--
 net/tipc/msg.h                                     |   8 +-
 net/tipc/netlink_compat.c                          |  11 +-
 net/tipc/socket.c                                  |   3 +-
 net/tipc/topsrv.c                                  |   2 +-
 net/tls/tls_device.c                               |   9 +-
 net/tls/tls_main.c                                 |  99 +--
 net/tls/tls_sw.c                                   |  83 ++-
 net/vmw_vsock/hyperv_transport.c                   |   8 +
 net/wireless/core.c                                |   6 +-
 net/wireless/nl80211.c                             |   4 +-
 net/wireless/reg.c                                 |   2 +-
 net/wireless/util.c                                |  50 +-
 net/xdp/xdp_umem.c                                 |   4 +-
 net/xfrm/xfrm_policy.c                             |   4 +-
 samples/auxdisplay/cfag12864b-example.c            |   2 +-
 samples/vfio-mdev/mdpy-defs.h                      |   2 +-
 scripts/Kbuild.include                             |   3 -
 scripts/Kconfig.include                            |   2 +-
 scripts/Makefile.build                             |  11 +-
 scripts/Makefile.lib                               |   2 -
 scripts/Makefile.modpost                           |  86 +--
 scripts/coccinelle/api/atomic_as_refcounter.cocci  |   1 +
 scripts/gen_compile_commands.py                    |   4 +-
 scripts/headers_install.sh                         |   6 +
 scripts/kconfig/confdata.c                         |   4 +
 scripts/link-vmlinux.sh                            |   2 +-
 scripts/sphinx-pre-install                         | 118 +++-
 security/Kconfig.hardening                         |   7 +
 security/keys/request_key.c                        |   2 +-
 security/keys/request_key_auth.c                   |   6 +
 security/keys/trusted.c                            |  13 -
 security/selinux/ss/policydb.c                     |   6 +-
 security/selinux/ss/sidtab.c                       |   5 +
 sound/ac97/bus.c                                   |  13 +-
 sound/core/compress_offload.c                      |  60 +-
 sound/core/pcm_native.c                            |  12 +-
 sound/core/seq/seq_clientmgr.c                     |   3 +-
 sound/core/seq/seq_fifo.c                          |  17 +
 sound/core/seq/seq_fifo.h                          |   2 +
 sound/firewire/oxfw/oxfw-pcm.c                     |   2 +-
 sound/firewire/packets-buffer.c                    |   2 +-
 sound/hda/hdac_i915.c                              |  10 +-
 sound/pci/hda/hda_auto_parser.c                    |   4 +-
 sound/pci/hda/hda_codec.c                          |   2 +-
 sound/pci/hda/hda_controller.c                     |  13 +-
 sound/pci/hda/hda_controller.h                     |   2 +-
 sound/pci/hda/hda_generic.c                        |  24 +-
 sound/pci/hda/hda_generic.h                        |   2 +
 sound/pci/hda/hda_intel.c                          |  71 +-
 sound/pci/hda/patch_ca0132.c                       |   1 +
 sound/pci/hda/patch_conexant.c                     |  33 +-
 sound/pci/hda/patch_realtek.c                      |  29 +-
 sound/soc/amd/Kconfig                              |   2 +-
 sound/soc/atmel/mchp-i2s-mcc.c                     |  41 +-
 sound/soc/codecs/es8316.c                          |   7 +-
 sound/soc/codecs/rt1011.c                          |  27 +-
 sound/soc/codecs/wcd9335.c                         |  24 +-
 sound/soc/fsl/fsl_sai.c                            |  21 +-
 sound/soc/fsl/fsl_sai.h                            |   1 +
 sound/soc/fsl/fsl_ssi.c                            |  18 +-
 sound/soc/intel/baytrail/sst-baytrail-pcm.c        |   1 +
 sound/soc/intel/common/sst-ipc.c                   |   2 +
 sound/soc/intel/skylake/skl-debug.c                |   2 +-
 sound/soc/intel/skylake/skl-nhlt.c                 |   2 +-
 sound/soc/mediatek/common/mtk-afe-fe-dai.c         |   3 +-
 sound/soc/qcom/sdm845.c                            |   2 +-
 sound/soc/soc-generic-dmaengine-pcm.c              |   6 +
 sound/soc/soc-topology.c                           |   6 -
 sound/soc/ti/ams-delta.c                           |  31 +-
 sound/soc/ti/davinci-i2s.c                         |  82 +--
 sound/sound_core.c                                 |   3 +-
 sound/usb/helper.c                                 |   2 +-
 sound/usb/hiface/pcm.c                             |  11 +-
 sound/usb/line6/pcm.c                              |  18 +-
 sound/usb/line6/podhd.c                            |   2 +-
 sound/usb/line6/variax.c                           |   2 +-
 sound/usb/mixer.c                                  |  73 +-
 sound/usb/mixer_quirks.c                           |   8 +-
 sound/usb/pcm.c                                    |   1 +
 sound/usb/stream.c                                 |   1 +
 tools/arch/arm/include/uapi/asm/kvm.h              |  12 +
 tools/arch/arm64/include/uapi/asm/kvm.h            |  10 +
 tools/arch/powerpc/include/uapi/asm/mman.h         |   4 -
 tools/arch/sparc/include/uapi/asm/mman.h           |   4 -
 tools/arch/x86/include/uapi/asm/kvm.h              |  22 +-
 tools/arch/x86/include/uapi/asm/vmx.h              |   1 -
 tools/bpf/bpftool/common.c                         |   8 +-
 tools/bpf/bpftool/prog.c                           |   4 +-
 tools/hv/hv_get_dhcp_info.sh                       |   2 +-
 tools/hv/hv_kvp_daemon.c                           |  10 +-
 tools/hv/hv_set_ifconfig.sh                        |   2 +-
 tools/hv/hv_vss_daemon.c                           |   4 +-
 tools/hv/lsvmbus                                   |  75 ++-
 tools/include/uapi/asm-generic/mman-common.h       |  15 +-
 tools/include/uapi/asm-generic/mman.h              |  10 +-
 tools/include/uapi/asm-generic/unistd.h            |   8 +-
 tools/include/uapi/drm/drm.h                       |   1 +
 tools/include/uapi/drm/i915_drm.h                  | 209 +++++-
 tools/include/uapi/linux/bpf.h                     |  11 +-
 tools/include/uapi/linux/if_link.h                 |   5 +
 tools/include/uapi/linux/kvm.h                     |   7 +-
 tools/include/uapi/linux/sched.h                   |  30 +-
 tools/include/uapi/linux/usbdevice_fs.h            |  26 +
 tools/lib/bpf/btf.c                                |   5 +-
 tools/lib/bpf/hashmap.h                            |   5 +
 tools/lib/bpf/libbpf.c                             |  67 +-
 tools/lib/bpf/xsk.c                                |  11 +-
 tools/objtool/check.c                              |   7 +-
 tools/objtool/check.h                              |   3 +-
 tools/perf/Documentation/Makefile                  |   2 +-
 tools/perf/Documentation/perf-script.txt           |   8 +-
 tools/perf/Documentation/perf.data-file-format.txt |   2 +-
 tools/perf/arch/s390/util/machine.c                |  31 +-
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl  |   2 +
 tools/perf/bench/numa.c                            |   6 +-
 tools/perf/builtin-ftrace.c                        |   2 +-
 tools/perf/builtin-probe.c                         |  10 +
 tools/perf/builtin-script.c                        |   2 +-
 tools/perf/builtin-stat.c                          |   9 +-
 tools/perf/pmu-events/jevents.c                    |   1 +
 tools/perf/trace/beauty/usbdevfs_ioctl.sh          |   9 +-
 tools/perf/ui/browser.c                            |   9 +-
 tools/perf/ui/tui/progress.c                       |   2 +-
 tools/perf/util/annotate.c                         |   2 +-
 tools/perf/util/cpumap.c                           |   5 +-
 tools/perf/util/evsel.c                            |   2 +
 tools/perf/util/header.c                           |  11 +-
 tools/perf/util/machine.c                          |   3 +-
 tools/perf/util/machine.h                          |   2 +-
 tools/perf/util/probe-event.c                      |   1 +
 tools/perf/util/session.c                          |  22 +-
 tools/perf/util/session.h                          |   1 +
 tools/perf/util/stat-shadow.c                      |   3 +-
 tools/perf/util/symbol.c                           |   7 +-
 tools/perf/util/symbol.h                           |   1 +
 tools/perf/util/thread.c                           |  12 +-
 tools/perf/util/zstd.c                             |   4 +-
 tools/power/x86/turbostat/Makefile                 |   3 +-
 tools/power/x86/turbostat/turbostat.c              | 101 ++-
 tools/power/x86/x86_energy_perf_policy/Makefile    |   3 +-
 .../x86_energy_perf_policy.8                       |   2 +-
 .../x86_energy_perf_policy.c                       |  28 +-
 tools/scripts/Makefile.include                     |   9 +-
 tools/testing/ktest/config-bisect.pl               |   4 +-
 tools/testing/selftests/bpf/Makefile               |   9 +-
 tools/testing/selftests/bpf/config                 |   1 +
 tools/testing/selftests/bpf/progs/sendmsg6_prog.c  |   3 +-
 tools/testing/selftests/bpf/test_btf_dump.c        |   7 +
 tools/testing/selftests/bpf/test_cgroup_storage.c  |   6 +-
 tools/testing/selftests/bpf/test_sock.c            |   7 +-
 tools/testing/selftests/bpf/test_xdp_vlan.sh       |  57 +-
 .../selftests/bpf/test_xdp_vlan_mode_generic.sh    |   9 +
 .../selftests/bpf/test_xdp_vlan_mode_native.sh     |   9 +
 tools/testing/selftests/bpf/verifier/ctx_skb.c     |  11 +
 tools/testing/selftests/bpf/verifier/loops1.c      |  28 +
 tools/testing/selftests/cgroup/cgroup_util.c       |   3 +-
 .../selftests/drivers/net/mlxsw/qos_mc_aware.sh    |   4 +-
 tools/testing/selftests/kmod/kmod.sh               |   6 +-
 tools/testing/selftests/kselftest.h                |  15 +
 tools/testing/selftests/kvm/.gitignore             |   3 +-
 tools/testing/selftests/kvm/config                 |   3 +
 tools/testing/selftests/kvm/include/evmcs.h        |   2 +
 tools/testing/selftests/kvm/lib/x86_64/processor.c |  16 +-
 tools/testing/selftests/kvm/lib/x86_64/vmx.c       |  20 +
 tools/testing/selftests/kvm/x86_64/evmcs_test.c    |  15 +-
 tools/testing/selftests/kvm/x86_64/hyperv_cpuid.c  |  12 +-
 .../selftests/kvm/x86_64/platform_info_test.c      |   2 +-
 .../kvm/x86_64/vmx_set_nested_state_test.c         |  32 +-
 tools/testing/selftests/livepatch/functions.sh     |  46 +-
 tools/testing/selftests/net/.gitignore             |   4 +-
 .../selftests/net/forwarding/gre_multipath.sh      |  28 +-
 .../selftests/net/tcp_fastopen_backup_key.sh       |   2 +-
 tools/testing/selftests/net/tls.c                  | 223 +++++++
 tools/testing/selftests/netfilter/nft_flowtable.sh |  48 ++
 tools/testing/selftests/pidfd/pidfd_test.c         |   6 +-
 .../selftests/tc-testing/plugin-lib/nsPlugin.py    |  22 +-
 .../tc-testing/tc-tests/actions/skbedit.json       |  47 ++
 .../tc-testing/tc-tests/actions/vlan.json          |  94 +++
 tools/testing/selftests/x86/test_vsyscall.c        |   2 +-
 usr/include/Makefile                               |   4 -
 virt/kvm/arm/arm.c                                 |  20 +-
 virt/kvm/arm/hyp/vgic-v3-sr.c                      |   8 +
 virt/kvm/arm/mmio.c                                |   7 +
 virt/kvm/arm/pmu.c                                 |  18 +-
 virt/kvm/arm/vgic/vgic-init.c                      |  30 +-
 virt/kvm/arm/vgic/vgic-mmio-v3.c                   |   2 +-
 virt/kvm/arm/vgic/vgic-mmio.c                      |  34 +
 virt/kvm/arm/vgic/vgic-v2.c                        |  14 +-
 virt/kvm/arm/vgic/vgic-v3.c                        |  12 +-
 virt/kvm/arm/vgic/vgic.c                           |  18 +
 virt/kvm/arm/vgic/vgic.h                           |   6 +-
 virt/kvm/kvm_main.c                                |  61 +-
 1934 files changed, 19815 insertions(+), 13832 deletions(-)
 rename Documentation/PCI/{picebus-howto.rst => pciebus-howto.rst} (100%)
 delete mode 100644 Documentation/admin-guide/conf.py
 delete mode 100644 Documentation/core-api/conf.py
 delete mode 100644 Documentation/crypto/conf.py
 delete mode 100644 Documentation/dev-tools/conf.py
 rename Documentation/devicetree/bindings/misc/{intel,ixp4xx-queue-manager.yaml => intel,ixp4xx-ahb-queue-manager.yaml} (95%)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
 create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem.yaml
 delete mode 100644 Documentation/devicetree/bindings/riscv/cpus.txt
 delete mode 100644 Documentation/doc-guide/conf.py
 delete mode 100644 Documentation/driver-api/80211/conf.py
 delete mode 100644 Documentation/driver-api/conf.py
 delete mode 100644 Documentation/driver-api/pm/conf.py
 delete mode 100644 Documentation/filesystems/conf.py
 delete mode 100644 Documentation/gpu/conf.py
 delete mode 100644 Documentation/input/conf.py
 delete mode 100644 Documentation/kernel-hacking/conf.py
 delete mode 100644 Documentation/maintainer/conf.py
 delete mode 100644 Documentation/media/conf.py
 delete mode 100644 Documentation/networking/conf.py
 rename Documentation/powerpc/{bootwrapper.txt => bootwrapper.rst} (93%)
 rename Documentation/powerpc/{cpu_families.txt => cpu_families.rst} (95%)
 rename Documentation/powerpc/{cpu_features.txt => cpu_features.rst} (97%)
 rename Documentation/powerpc/{cxl.txt => cxl.rst} (95%)
 rename Documentation/powerpc/{cxlflash.txt => cxlflash.rst} (98%)
 rename Documentation/powerpc/{DAWR-POWER9.txt => dawr-power9.rst} (95%)
 rename Documentation/powerpc/{dscr.txt => dscr.rst} (91%)
 rename Documentation/powerpc/{eeh-pci-error-recovery.txt => eeh-pci-error-recovery.rst} (82%)
 rename Documentation/powerpc/{firmware-assisted-dump.txt => firmware-assisted-dump.rst} (80%)
 rename Documentation/powerpc/{hvcs.txt => hvcs.rst} (91%)
 create mode 100644 Documentation/powerpc/index.rst
 rename Documentation/powerpc/{mpc52xx.txt => mpc52xx.rst} (91%)
 rename Documentation/powerpc/{pci_iov_resource_on_powernv.txt => pci_iov_resource_on_powernv.rst} (97%)
 rename Documentation/powerpc/{pmu-ebb.txt => pmu-ebb.rst} (99%)
 create mode 100644 Documentation/powerpc/ptrace.rst
 delete mode 100644 Documentation/powerpc/ptrace.txt
 rename Documentation/powerpc/{qe_firmware.txt => qe_firmware.rst} (95%)
 rename Documentation/powerpc/{syscall64-abi.txt => syscall64-abi.rst} (82%)
 rename Documentation/powerpc/{transactional_memory.txt => transactional_memory.rst} (93%)
 delete mode 100644 Documentation/process/conf.py
 create mode 100644 Documentation/process/embargoed-hardware-issues.rst
 delete mode 100644 Documentation/sh/conf.py
 delete mode 100644 Documentation/sound/conf.py
 create mode 100644 Documentation/translations/it_IT/process/programming-language.rst
 delete mode 100644 Documentation/userspace-api/conf.py
 rename Documentation/{virtual => virt}/index.rst (100%)
 rename Documentation/{virtual => virt}/kvm/amd-memory-encryption.rst (100%)
 rename Documentation/{virtual => virt}/kvm/api.txt (99%)
 rename Documentation/{virtual => virt}/kvm/arm/hyp-abi.txt (100%)
 rename Documentation/{virtual => virt}/kvm/arm/psci.txt (100%)
 rename Documentation/{virtual => virt}/kvm/cpuid.rst (100%)
 rename Documentation/{virtual => virt}/kvm/devices/README (100%)
 rename Documentation/{virtual => virt}/kvm/devices/arm-vgic-its.txt (100%)
 rename Documentation/{virtual => virt}/kvm/devices/arm-vgic-v3.txt (100%)
 rename Documentation/{virtual => virt}/kvm/devices/arm-vgic.txt (100%)
 rename Documentation/{virtual => virt}/kvm/devices/mpic.txt (100%)
 rename Documentation/{virtual => virt}/kvm/devices/s390_flic.txt (100%)
 rename Documentation/{virtual => virt}/kvm/devices/vcpu.txt (100%)
 rename Documentation/{virtual => virt}/kvm/devices/vfio.txt (100%)
 rename Documentation/{virtual => virt}/kvm/devices/vm.txt (100%)
 rename Documentation/{virtual => virt}/kvm/devices/xics.txt (100%)
 rename Documentation/{virtual => virt}/kvm/devices/xive.txt (100%)
 rename Documentation/{virtual => virt}/kvm/halt-polling.txt (100%)
 rename Documentation/{virtual => virt}/kvm/hypercalls.txt (97%)
 rename Documentation/{virtual => virt}/kvm/index.rst (87%)
 rename Documentation/{virtual => virt}/kvm/locking.txt (100%)
 rename Documentation/{virtual => virt}/kvm/mmu.txt (99%)
 rename Documentation/{virtual => virt}/kvm/msr.txt (100%)
 rename Documentation/{virtual => virt}/kvm/nested-vmx.txt (100%)
 rename Documentation/{virtual => virt}/kvm/ppc-pv.txt (100%)
 rename Documentation/{virtual => virt}/kvm/review-checklist.txt (95%)
 rename Documentation/{virtual => virt}/kvm/s390-diag.txt (100%)
 rename Documentation/{virtual => virt}/kvm/timekeeping.txt (100%)
 rename Documentation/{virtual => virt}/kvm/vcpu-requests.rst (100%)
 rename Documentation/{virtual => virt}/paravirt_ops.rst (100%)
 rename Documentation/{virtual => virt}/uml/UserModeLinux-HOWTO.txt (100%)
 delete mode 100644 Documentation/vm/conf.py
 delete mode 100644 Documentation/x86/conf.py
 delete mode 100644 arch/arm/mach-netx/Kconfig
 delete mode 100644 arch/arm/mach-netx/Makefile
 delete mode 100644 arch/arm/mach-netx/Makefile.boot
 delete mode 100644 arch/arm/mach-netx/fb.c
 delete mode 100644 arch/arm/mach-netx/fb.h
 delete mode 100644 arch/arm/mach-netx/generic.c
 delete mode 100644 arch/arm/mach-netx/generic.h
 delete mode 100644 arch/arm/mach-netx/include/mach/hardware.h
 delete mode 100644 arch/arm/mach-netx/include/mach/irqs.h
 delete mode 100644 arch/arm/mach-netx/include/mach/netx-regs.h
 delete mode 100644 arch/arm/mach-netx/include/mach/pfifo.h
 delete mode 100644 arch/arm/mach-netx/include/mach/uncompress.h
 delete mode 100644 arch/arm/mach-netx/include/mach/xc.h
 delete mode 100644 arch/arm/mach-netx/nxdb500.c
 delete mode 100644 arch/arm/mach-netx/nxdkn.c
 delete mode 100644 arch/arm/mach-netx/nxeb500hmi.c
 delete mode 100644 arch/arm/mach-netx/pfifo.c
 delete mode 100644 arch/arm/mach-netx/time.c
 delete mode 100644 arch/arm/mach-netx/xc.c
 rename arch/parisc/configs/{default_defconfig => defconfig} (100%)
 delete mode 100644 arch/riscv/lib/udivdi3.S
 create mode 100644 arch/s390/boot/version.c
 delete mode 100644 arch/x86/purgatory/string.c
 rename {include/misc => drivers/auxdisplay}/charlcd.h (94%)
 delete mode 100644 drivers/tty/serial/netx-serial.c
 rename {kernel => mm}/memremap.c (90%)
 create mode 100755 tools/testing/selftests/bpf/test_xdp_vlan_mode_generic.sh
 create mode 100755 tools/testing/selftests/bpf/test_xdp_vlan_mode_native.sh
 create mode 100644 tools/testing/selftests/kvm/config

--4ZQ/M1iA+qg8otEW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1+wC0ACgkQJNaLcl1U
h9Bftgf+MnOPDPVCwn7UAHA0+3Ftfa+SptT/S2QiAKJEsZyerX6m9xgKrxFnBNAA
F9NBRiD/lzUgdGC0xeRXr5ATe3vboZHRGZw9Qwk0njctj6jYtPIH6M6uG65IxV/n
dUVUgPOB5cJ5ZLPnaPVSHoBMDShUYXbLzSP8dPbQBIK4Kwh6b4fj041tRqj4mwLB
Oqj7620wRYy4h+BMy5Q8kdm1ITVv5dTDzXcajyfOM6E9wTW9LpYL5OqLTUrKQhHk
RyObwmBRRXayZfL0IlxjzpVIVYAAQ5MJWWUxdQs08Mug8VQ0AZqO7NHVlfrWzQkQ
rMxyM8YTdzC1DNCRJ59sfHmy7pG0AQ==
=sPCm
-----END PGP SIGNATURE-----

--4ZQ/M1iA+qg8otEW--

--===============8451277013890323712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8451277013890323712==--
