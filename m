Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0AC315D3
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 22:09:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C8281667;
	Fri, 31 May 2019 22:08:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C8281667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559333340;
	bh=mqjvE3i1SIZ3+6m1jILNZOZEo6Z3mamwsQZotlJeA1U=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e77gwvjFLqUhGch/gxSLrPL16JqE5rHXmhHaPa/PA3Y+Nf5AMZoz7PU2zlB8a8n1a
	 zOOSGkYQuXzNiVu9YBAXhfbga6ogKRyn9FVnfKXQag4M4oiHiMsQ9ewZbe8rO9P2js
	 Qt7G7+PzI/Fl1VDFuTY3IAA6Aosn1woEYsD7Z/NU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EF77F896F7;
	Fri, 31 May 2019 22:06:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA793F806E5; Thu, 30 May 2019 01:24:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6303F896E0
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 01:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6303F896E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="V2B9Vgs8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=StJ6LM8sQHkYI5UThzShneAjra5wi5bo/RYRsdxPQsA=; b=V2B9Vgs83dRLjIuQnd2C2vgYZ
 +JgyOXeO1GKHOK9c4tRnNUqThik6tzysID2WPnKRr+36Nqy1H2ECRX9ShWnHkjcDarRRE36sMjLp8
 rMBiNxdP14bOP1wi/jaweQN4P3parh4up8rfOPsYIJGMzClSMcNhqm2YUZ7FfQaCciCjPJlpLJJ9c
 aeXT61eHnnOWKaxRn+HXRc3LwC2Y8Shpt7KozKcXuJxu6PITTqtbQgKa7rv4JBRtqJqIYr0SPtFcn
 /5RDAzsKEfsB7oXgNPBlX7TDbPq/0Xg+hPhZkg4J+5oeanlc8QNxz2G9sF0j0yZAp7oTlogcPh66P
 SAaTMxt+g==;
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW7vL-0005Rx-II; Wed, 29 May 2019 23:23:59 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hW7vI-0007wg-Fn; Wed, 29 May 2019 20:23:56 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Wed, 29 May 2019 20:23:31 -0300
Message-Id: <cover.1559171394.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 May 2019 22:06:35 +0200
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, devel@driverdev.osuosl.org,
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, linux-acpi@vger.kernel.org,
 xen-devel@lists.xenproject.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 bpf@vger.kernel.org, devel@acpica.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 netdev@vger.kernel.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [alsa-devel] [PATCH 00/22] Some documentation fixes
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

Fix several warnings and broken links.

This series was generated against linux-next, but was rebased to be applied at
docs-next. It should apply cleanly on either tree.

There's a git tree with all of them applied on the top of docs/docs-next
at:

https://git.linuxtv.org/mchehab/experimental.git/log/?h=fix_doc_links_v2


Mauro Carvalho Chehab (21):
  ABI: sysfs-devices-system-cpu: point to the right docs
  isdn: mISDN: remove a bogus reference to a non-existing doc
  dt: fix broken references to nand.txt
  docs: zh_CN: get rid of basic_profiling.txt
  doc: it_IT: fix reference to magic-number.rst
  docs: mm: numaperf.rst: get rid of a build warning
  docs: bpf: get rid of two warnings
  docs: mark orphan documents as such
  docs: amd-memory-encryption.rst get rid of warnings
  gpu: amdgpu: fix broken amdgpu_dma_buf.c references
  gpu: i915.rst: Fix references to renamed files
  docs: zh_CN: avoid duplicate citation references
  docs: vm: hmm.rst: fix some warnings
  docs: it: license-rules.rst: get rid of warnings
  docs: gpio: driver.rst: fix a bad tag
  docs: soundwire: locking: fix tags for a code-block
  docs: security: trusted-encrypted.rst: fix code-block tag
  docs: security: core.rst: Fix several warnings
  docs: net: dpio-driver.rst: fix two codeblock warnings
  docs: net: sja1105.rst: fix table format
  docs: fix broken documentation links

Otto Sabart (1):
  mfd: madera: Fix bad reference to pinctrl.txt file

 .../ABI/testing/sysfs-devices-system-cpu      |  3 +-
 Documentation/accelerators/ocxl.rst           |  2 +
 Documentation/acpi/dsd/leds.txt               |  2 +-
 .../admin-guide/kernel-parameters.rst         |  6 +-
 .../admin-guide/kernel-parameters.txt         | 16 ++---
 Documentation/admin-guide/mm/numaperf.rst     |  5 +-
 Documentation/admin-guide/ras.rst             |  2 +-
 Documentation/arm/stm32/overview.rst          |  2 +
 .../arm/stm32/stm32f429-overview.rst          |  2 +
 .../arm/stm32/stm32f746-overview.rst          |  2 +
 .../arm/stm32/stm32f769-overview.rst          |  2 +
 .../arm/stm32/stm32h743-overview.rst          |  2 +
 .../arm/stm32/stm32mp157-overview.rst         |  2 +
 Documentation/bpf/btf.rst                     |  2 +
 .../bindings/mtd/amlogic,meson-nand.txt       |  2 +-
 .../devicetree/bindings/mtd/gpmc-nand.txt     |  2 +-
 .../devicetree/bindings/mtd/marvell-nand.txt  |  2 +-
 .../devicetree/bindings/mtd/tango-nand.txt    |  2 +-
 .../devicetree/bindings/net/fsl-enetc.txt     |  7 +-
 .../bindings/pci/amlogic,meson-pcie.txt       |  2 +-
 .../regulator/qcom,rpmh-regulator.txt         |  2 +-
 .../devicetree/booting-without-of.txt         |  2 +-
 Documentation/driver-api/gpio/board.rst       |  2 +-
 Documentation/driver-api/gpio/consumer.rst    |  2 +-
 Documentation/driver-api/gpio/driver.rst      |  2 +-
 .../driver-api/soundwire/locking.rst          |  4 +-
 .../firmware-guide/acpi/enumeration.rst       |  2 +-
 .../firmware-guide/acpi/method-tracing.rst    |  2 +-
 Documentation/gpu/amdgpu.rst                  |  4 +-
 Documentation/gpu/i915.rst                    |  6 +-
 Documentation/gpu/msm-crash-dump.rst          |  2 +
 Documentation/i2c/instantiating-devices       |  2 +-
 Documentation/interconnect/interconnect.rst   |  2 +
 Documentation/laptops/lg-laptop.rst           |  2 +
 .../freescale/dpaa2/dpio-driver.rst           |  4 +-
 Documentation/networking/dsa/sja1105.rst      |  6 +-
 Documentation/powerpc/isa-versions.rst        |  2 +
 Documentation/security/keys/core.rst          | 16 +++--
 .../security/keys/trusted-encrypted.rst       |  4 +-
 Documentation/sysctl/kernel.txt               |  4 +-
 .../translations/it_IT/process/howto.rst      |  2 +-
 .../it_IT/process/license-rules.rst           | 28 ++++----
 .../it_IT/process/magic-number.rst            |  2 +-
 .../it_IT/process/stable-kernel-rules.rst     |  4 +-
 .../translations/zh_CN/basic_profiling.txt    | 71 -------------------
 .../translations/zh_CN/process/4.Coding.rst   |  2 +-
 .../zh_CN/process/management-style.rst        |  4 +-
 .../zh_CN/process/programming-language.rst    | 28 ++++----
 .../virtual/kvm/amd-memory-encryption.rst     |  5 ++
 Documentation/virtual/kvm/vcpu-requests.rst   |  2 +
 Documentation/vm/hmm.rst                      |  9 ++-
 Documentation/x86/x86_64/5level-paging.rst    |  2 +-
 Documentation/x86/x86_64/boot-options.rst     |  4 +-
 .../x86/x86_64/fake-numa-for-cpusets.rst      |  2 +-
 MAINTAINERS                                   |  6 +-
 arch/arm/Kconfig                              |  2 +-
 arch/arm64/kernel/kexec_image.c               |  2 +-
 arch/powerpc/Kconfig                          |  2 +-
 arch/x86/Kconfig                              | 16 ++---
 arch/x86/Kconfig.debug                        |  2 +-
 arch/x86/boot/header.S                        |  2 +-
 arch/x86/entry/entry_64.S                     |  2 +-
 arch/x86/include/asm/bootparam_utils.h        |  2 +-
 arch/x86/include/asm/page_64_types.h          |  2 +-
 arch/x86/include/asm/pgtable_64_types.h       |  2 +-
 arch/x86/kernel/cpu/microcode/amd.c           |  2 +-
 arch/x86/kernel/kexec-bzimage64.c             |  2 +-
 arch/x86/kernel/pci-dma.c                     |  2 +-
 arch/x86/mm/tlb.c                             |  2 +-
 arch/x86/platform/pvh/enlighten.c             |  2 +-
 drivers/acpi/Kconfig                          | 10 +--
 drivers/isdn/mISDN/dsp_core.c                 |  2 -
 drivers/net/ethernet/faraday/ftgmac100.c      |  2 +-
 .../fieldbus/Documentation/fieldbus_dev.txt   |  4 +-
 drivers/vhost/vhost.c                         |  2 +-
 include/acpi/acpi_drivers.h                   |  2 +-
 include/linux/fs_context.h                    |  2 +-
 include/linux/lsm_hooks.h                     |  2 +-
 include/linux/mfd/madera/pdata.h              |  3 +-
 mm/Kconfig                                    |  2 +-
 security/Kconfig                              |  2 +-
 tools/include/linux/err.h                     |  2 +-
 .../Documentation/stack-validation.txt        |  4 +-
 tools/testing/selftests/x86/protection_keys.c |  2 +-
 84 files changed, 183 insertions(+), 212 deletions(-)
 delete mode 100644 Documentation/translations/zh_CN/basic_profiling.txt

-- 
2.21.0


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
