Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F0B6A878
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 14:12:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F404167F;
	Tue, 16 Jul 2019 14:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F404167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563279172;
	bh=+DsXGWi9l/FM6fD1DJPxgExuywN8Jk6DYLH6dTFyAKI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HoVgYUERk62/5/VJWxAxP05JyC2WeVqSjanj2KJRFi6YAUr2Xn5rfpYSJyYGxON9t
	 DocPCF1n3Lx7Flk9oEyOXeJf/TMeI31MV8+1jYLJXoC+gjyld1YIZRd+OxZKe8ycI7
	 rWMQh/h1F09V28skial/2txT5y8FojC9PfLqdbkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FDAAF800C4;
	Tue, 16 Jul 2019 14:11:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 624C3F80376; Tue, 16 Jul 2019 14:11:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CF97F802BC
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 14:11:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CF97F802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="QAAw/LhY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cmrXWeKZex18XPtqOqXe6bsYV64AO68iLYgMsiWQPIg=; b=QAAw/LhYE17kHpcrRzOCn1piW
 wDQhBm1yl/KZ+dj8rCQhgNieg+hhttiHCd56p5QhHz5ASeESwhg4e5NnaVU0xFvaS1lhK+pI34VAH
 U07mMZP9tRQ4deiPKcIy4WDiR29u2hCPogiZhF9Lz2jHXns+8RDa0pzAsZAsHJhW3j3YMjCZIm/+P
 LGpxBBG2lEGO3KMHIzygFcSKKg0GHttc1pRY0pbQBDBk7P+UYDrt1y6b2Q/bZPeVAySSZNi95nOXL
 A9MLC1Mv0VfRw8xgU7fIrVDbMile7MGuQFtM0dQbNTrXk9FcF/xI3aZ/c1Bhe5nAJD6JiU0T0som+
 3cGvhJxcQ==;
Received: from [189.27.46.152] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hnMIL-0004hz-Al; Tue, 16 Jul 2019 12:10:57 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hnMII-0000QW-KI; Tue, 16 Jul 2019 09:10:54 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: 
Date: Tue, 16 Jul 2019 09:10:39 -0300
Message-Id: <cover.1563277838.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-arch@vger.kernel.org, linux-scsi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, esc.storagedev@microsemi.com,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, rcu@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-crypto@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [alsa-devel] [PATCH 00/14] pending doc patches for 5.3-rc
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

Those are the pending documentation patches after my pull request
for this branch:

    git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/docs/v5.3-1

Patches 1 to 13 were already submitted, but got rebased. Patch 14
is a new fixup one.

Patches 1 and 2 weren't submitted before due to merge conflicts
that are now solved upstream;

Patch 3 fixes a series of random Documentation/* references that
are pointing to the wrong places.

Patch 4 fix a longstanding issue: every time a new book is added,
conf.py need changes, in order to allow generating a PDF file.
After the patch, conf.py will automatically recognize new books,
saving the trouble of keeping adding documents to it.

Patches 5 to 11 are due to fonts support when building translations.pdf.
The main focus is to add xeCJK support. While doing it, I discovered
some bugs at sphinx-pre-install script after running it with 7 different
distributions.

Patch 12 improves support for partial doc building. Currently, each
subdir needs to have its own conf.py, in order to support partial
doc build. After it, any Documentation subdir can be used to 
roduce html/pdf docs with:

	make SPHINXDIRS="foo bar" htmldocs
	(or pdfdocs, latexdocs, epubdocs, ...)

Patch 13 is a cleanup patch: it simply get rid of all those extra
conf.py files that  aren't needed anymore. The only extra config
file after it is this one:

	Documentation/media/conf_nitpick.py

With enables some extra optional Sphinx features.

Patch 14 adds Documentation/virtual to the main index.rst file
and add a new *.rst file that was orphaned there.

-

After this series, there's just one more patch meant to be applied
for 5.3, with is still waiting for some patches to be merged from
linux-next:

    https://git.linuxtv.org/mchehab/experimental.git/commit/?id=b1b5dc7d7bbfbbfdace2a248c6458301c6e34100


Mauro Carvalho Chehab (14):
  docs: powerpc: convert docs to ReST and rename to *.rst
  docs: power: add it to to the main documentation index
  docs: fix broken doc references due to renames
  docs: pdf: add all Documentation/*/index.rst to PDF output
  docs: conf.py: add CJK package needed by translations
  docs: conf.py: only use CJK if the font is available
  scripts/sphinx-pre-install: fix script for RHEL/CentOS
  scripts/sphinx-pre-install: don't use LaTeX with CentOS 7
  scripts/sphinx-pre-install: fix latexmk dependencies
  scripts/sphinx-pre-install: cleanup Gentoo checks
  scripts/sphinx-pre-install: seek for Noto CJK fonts for pdf output
  docs: load_config.py: avoid needing a conf.py just due to LaTeX docs
  docs: remove extra conf.py files
  docs: virtual: add it to the documentation body

 Documentation/PCI/pci-error-recovery.rst      |   5 +-
 Documentation/RCU/rculist_nulls.txt           |   2 +-
 Documentation/admin-guide/conf.py             |  10 --
 Documentation/conf.py                         |  30 +++-
 Documentation/core-api/conf.py                |  10 --
 Documentation/crypto/conf.py                  |  10 --
 Documentation/dev-tools/conf.py               |  10 --
 .../devicetree/bindings/arm/idle-states.txt   |   2 +-
 Documentation/doc-guide/conf.py               |  10 --
 Documentation/driver-api/80211/conf.py        |  10 --
 Documentation/driver-api/conf.py              |  10 --
 Documentation/driver-api/pm/conf.py           |  10 --
 Documentation/filesystems/conf.py             |  10 --
 Documentation/gpu/conf.py                     |  10 --
 Documentation/index.rst                       |   3 +
 Documentation/input/conf.py                   |  10 --
 Documentation/kernel-hacking/conf.py          |  10 --
 Documentation/locking/spinlocks.rst           |   4 +-
 Documentation/maintainer/conf.py              |  10 --
 Documentation/media/conf.py                   |  12 --
 Documentation/memory-barriers.txt             |   2 +-
 Documentation/networking/conf.py              |  10 --
 Documentation/power/index.rst                 |   2 +-
 .../{bootwrapper.txt => bootwrapper.rst}      |  28 +++-
 .../{cpu_families.txt => cpu_families.rst}    |  23 +--
 .../{cpu_features.txt => cpu_features.rst}    |   6 +-
 Documentation/powerpc/{cxl.txt => cxl.rst}    |  46 ++++--
 .../powerpc/{cxlflash.txt => cxlflash.rst}    |  10 +-
 .../{DAWR-POWER9.txt => dawr-power9.rst}      |  15 +-
 Documentation/powerpc/{dscr.txt => dscr.rst}  |  18 +-
 ...ecovery.txt => eeh-pci-error-recovery.rst} | 108 ++++++------
 ...ed-dump.txt => firmware-assisted-dump.rst} | 117 +++++++------
 Documentation/powerpc/{hvcs.txt => hvcs.rst}  | 108 ++++++------
 Documentation/powerpc/index.rst               |  34 ++++
 Documentation/powerpc/isa-versions.rst        |  15 +-
 .../powerpc/{mpc52xx.txt => mpc52xx.rst}      |  12 +-
 ...nv.txt => pci_iov_resource_on_powernv.rst} |  15 +-
 .../powerpc/{pmu-ebb.txt => pmu-ebb.rst}      |   1 +
 Documentation/powerpc/ptrace.rst              | 156 ++++++++++++++++++
 Documentation/powerpc/ptrace.txt              | 151 -----------------
 .../{qe_firmware.txt => qe_firmware.rst}      |  37 +++--
 .../{syscall64-abi.txt => syscall64-abi.rst}  |  29 ++--
 ...al_memory.txt => transactional_memory.rst} |  45 ++---
 Documentation/process/conf.py                 |  10 --
 Documentation/sh/conf.py                      |  10 --
 Documentation/sound/conf.py                   |  10 --
 Documentation/sphinx/load_config.py           |  27 ++-
 .../translations/ko_KR/memory-barriers.txt    |   2 +-
 Documentation/userspace-api/conf.py           |  10 --
 Documentation/virtual/kvm/index.rst           |   1 +
 Documentation/vm/conf.py                      |  10 --
 Documentation/watchdog/hpwdt.rst              |   2 +-
 Documentation/x86/conf.py                     |  10 --
 MAINTAINERS                                   |  14 +-
 arch/powerpc/kernel/exceptions-64s.S          |   2 +-
 drivers/gpu/drm/drm_modes.c                   |   2 +-
 drivers/i2c/busses/i2c-nvidia-gpu.c           |   2 +-
 drivers/scsi/hpsa.c                           |   4 +-
 drivers/soc/fsl/qe/qe.c                       |   2 +-
 drivers/tty/hvc/hvcs.c                        |   2 +-
 include/soc/fsl/qe/qe.h                       |   2 +-
 scripts/sphinx-pre-install                    | 118 ++++++++++---
 62 files changed, 738 insertions(+), 678 deletions(-)
 delete mode 100644 Documentation/admin-guide/conf.py
 delete mode 100644 Documentation/core-api/conf.py
 delete mode 100644 Documentation/crypto/conf.py
 delete mode 100644 Documentation/dev-tools/conf.py
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
 delete mode 100644 Documentation/sh/conf.py
 delete mode 100644 Documentation/sound/conf.py
 delete mode 100644 Documentation/userspace-api/conf.py
 delete mode 100644 Documentation/vm/conf.py
 delete mode 100644 Documentation/x86/conf.py

-- 
2.21.0


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
