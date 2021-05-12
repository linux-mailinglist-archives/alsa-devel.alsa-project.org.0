Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C9637C096
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 16:46:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E354C18C7;
	Wed, 12 May 2021 16:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E354C18C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620830812;
	bh=L+E/N8mtA2/+iSqhjhIyKk7M7RrC5qMfkQmRh4SXqOM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vkim2+osY1l3TQwVTqq5gr5gX3CE2tTqGe31CEh0mmLTwoIkuiEjFZP+jhshG+hTv
	 62mWunpHdI2SYghVFVhcK3mOQDt+xMNTf5Tmyng9S8xkc5qTLA2ME19pU1fJ7EMrVA
	 ycFm7NiWG66w60wV98tfYjnKkIxvsvBo2ZypAMQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B08CF804AE;
	Wed, 12 May 2021 16:43:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2731F8026B; Wed, 12 May 2021 14:51:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_1,PRX_BODY_13,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B230EF8012E
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 14:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B230EF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ucNSAhXY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B11D61175;
 Wed, 12 May 2021 12:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620823902;
 bh=L+E/N8mtA2/+iSqhjhIyKk7M7RrC5qMfkQmRh4SXqOM=;
 h=From:To:Cc:Subject:Date:From;
 b=ucNSAhXYlF3Szz7W2irBTsvcIq33u1CrsW3ughaZJQqP+LrxpB0KjDChNaWylRCiA
 8uidMvIFPObFZ6akJiKIQ1n/loNfn6hx8yVucw2xWZ73EfgNRibzOSlugYBt51kwpz
 sdmRPA3LdwD45uYQTpj7XZoENUjgUxwJTlI1qlwGCNWZNWI+BkaJBNQJYsI68pIF0d
 fXOa2Wzs1nudr171bvqR7b67LC1CF/NPtlR0c90fFeyu9TgllD9P44UMzmzYncl5FJ
 KVeCETjMQ0hlqHZjf6TbTaK//D282G036gFoleiqqZjAOauHQnBlpoCUvLp2Ls+ug5
 bNkKFQYHSRskA==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1lgoKy-0018go-1r; Wed, 12 May 2021 14:51:40 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 00/40] Use ASCII subset instead of UTF-8 alternate symbols
Date: Wed, 12 May 2021 14:50:04 +0200
Message-Id: <cover.1620823573.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 May 2021 16:43:39 +0200
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 keyrings@vger.kernel.org, linux-sgx@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-acpi@vger.kernel.org,
 Mali DP Maintainers <malidp@foss.arm.com>, linux-input@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-ext4@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-rdma@vger.kernel.org, linux-integrity@vger.kernel.org
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

This series contain basically a cleanup from all those years of converting
files to ReST.

During the conversion period, several tools like LaTeX, pandoc, DocBook
and some specially-written scripts were used in order to convert
existing documents.

Such conversion tools - plus some text editor like LibreOffice  or similar  - have
a set of rules that turns some typed ASCII characters into UTF-8 alternatives,
for instance converting commas into curly commas and adding non-breakable
spaces. All of those are meant to produce better results when the text is
displayed in HTML or PDF formats.

While it is perfectly fine to use UTF-8 characters in Linux, and specially at
the documentation,  it is better to  stick to the ASCII subset  on such
particular case,  due to a couple of reasons:

1. it makes life easier for tools like grep;
2. they easier to edit with the some commonly used text/source
   code editors.
    
Also, Sphinx already do such conversion automatically outside 
literal blocks, as described at:

       https://docutils.sourceforge.io/docs/user/smartquotes.html

In this series, the following UTF-8 symbols are replaced:

            - U+00a0 (' '): NO-BREAK SPACE
            - U+00ad ('­'): SOFT HYPHEN
            - U+00b4 ('´'): ACUTE ACCENT
            - U+00d7 ('×'): MULTIPLICATION SIGN
            - U+2010 ('‐'): HYPHEN
            - U+2018 ('‘'): LEFT SINGLE QUOTATION MARK
            - U+2019 ('’'): RIGHT SINGLE QUOTATION MARK
            - U+201c ('“'): LEFT DOUBLE QUOTATION MARK
            - U+201d ('”'): RIGHT DOUBLE QUOTATION MARK
            - U+2212 ('−'): MINUS SIGN
            - U+2217 ('∗'): ASTERISK OPERATOR
            - U+feff ('﻿'): ZERO WIDTH NO-BREAK SPACE (BOM)

---

v2:
- removed EM/EN DASH conversion from this patchset;
- removed a few fixes, as those were addressed on a separate series.
 
PS.:
   The first version of this series was posted with a different name:

	https://lore.kernel.org/lkml/cover.1620641727.git.mchehab+huawei@kernel.org/

   I also changed the patch texts, in order to better describe the patches goals.

Mauro Carvalho Chehab (40):
  docs: hwmon: Use ASCII subset instead of UTF-8 alternate symbols
  docs: admin-guide: Use ASCII subset instead of UTF-8 alternate symbols
  docs: admin-guide: media: ipu3.rst: Use ASCII subset instead of UTF-8
    alternate symbols
  docs: admin-guide: perf: imx-ddr.rst: Use ASCII subset instead of
    UTF-8 alternate symbols
  docs: admin-guide: pm: Use ASCII subset instead of UTF-8 alternate
    symbols
  docs: trace: coresight: coresight-etm4x-reference.rst: Use ASCII
    subset instead of UTF-8 alternate symbols
  docs: driver-api: ioctl.rst: Use ASCII subset instead of UTF-8
    alternate symbols
  docs: driver-api: thermal: Use ASCII subset instead of UTF-8 alternate
    symbols
  docs: driver-api: media: drivers: Use ASCII subset instead of UTF-8
    alternate symbols
  docs: driver-api: firmware: other_interfaces.rst: Use ASCII subset
    instead of UTF-8 alternate symbols
  docs: fault-injection: nvme-fault-injection.rst: Use ASCII subset
    instead of UTF-8 alternate symbols
  docs: usb: Use ASCII subset instead of UTF-8 alternate symbols
  docs: process: code-of-conduct.rst: Use ASCII subset instead of UTF-8
    alternate symbols
  docs: userspace-api: media: fdl-appendix.rst: Use ASCII subset instead
    of UTF-8 alternate symbols
  docs: userspace-api: media: v4l: Use ASCII subset instead of UTF-8
    alternate symbols
  docs: userspace-api: media: dvb: Use ASCII subset instead of UTF-8
    alternate symbols
  docs: vm: zswap.rst: Use ASCII subset instead of UTF-8 alternate
    symbols
  docs: filesystems: f2fs.rst: Use ASCII subset instead of UTF-8
    alternate symbols
  docs: filesystems: ext4: Use ASCII subset instead of UTF-8 alternate
    symbols
  docs: kernel-hacking: Use ASCII subset instead of UTF-8 alternate
    symbols
  docs: hid: Use ASCII subset instead of UTF-8 alternate symbols
  docs: security: tpm: tpm_event_log.rst: Use ASCII subset instead of
    UTF-8 alternate symbols
  docs: security: keys: trusted-encrypted.rst: Use ASCII subset instead
    of UTF-8 alternate symbols
  docs: networking: scaling.rst: Use ASCII subset instead of UTF-8
    alternate symbols
  docs: networking: devlink: devlink-dpipe.rst: Use ASCII subset instead
    of UTF-8 alternate symbols
  docs: networking: device_drivers: Use ASCII subset instead of UTF-8
    alternate symbols
  docs: x86: Use ASCII subset instead of UTF-8 alternate symbols
  docs: scheduler: sched-deadline.rst: Use ASCII subset instead of UTF-8
    alternate symbols
  docs: power: powercap: powercap.rst: Use ASCII subset instead of UTF-8
    alternate symbols
  docs: ABI: Use ASCII subset instead of UTF-8 alternate symbols
  docs: PCI: acpi-info.rst: Use ASCII subset instead of UTF-8 alternate
    symbols
  docs: gpu: Use ASCII subset instead of UTF-8 alternate symbols
  docs: sound: kernel-api: writing-an-alsa-driver.rst: Use ASCII subset
    instead of UTF-8 alternate symbols
  docs: arm64: arm-acpi.rst: Use ASCII subset instead of UTF-8 alternate
    symbols
  docs: infiniband: tag_matching.rst: Use ASCII subset instead of UTF-8
    alternate symbols
  docs: misc-devices: ibmvmc.rst: Use ASCII subset instead of UTF-8
    alternate symbols
  docs: firmware-guide: acpi: lpit.rst: Use ASCII subset instead of
    UTF-8 alternate symbols
  docs: firmware-guide: acpi: dsd: graph.rst: Use ASCII subset instead
    of UTF-8 alternate symbols
  docs: virt: kvm: api.rst: Use ASCII subset instead of UTF-8 alternate
    symbols
  docs: RCU: Use ASCII subset instead of UTF-8 alternate symbols

 ...sfs-class-chromeos-driver-cros-ec-lightbar |   2 +-
 .../ABI/testing/sysfs-devices-platform-ipmi   |   2 +-
 .../testing/sysfs-devices-platform-trackpoint |   2 +-
 Documentation/ABI/testing/sysfs-devices-soc   |   4 +-
 Documentation/PCI/acpi-info.rst               |  22 +-
 .../Data-Structures/Data-Structures.rst       |  52 ++--
 .../Expedited-Grace-Periods.rst               |  40 +--
 .../Tree-RCU-Memory-Ordering.rst              |  10 +-
 .../RCU/Design/Requirements/Requirements.rst  | 122 ++++-----
 Documentation/admin-guide/media/ipu3.rst      |   2 +-
 Documentation/admin-guide/perf/imx-ddr.rst    |   2 +-
 Documentation/admin-guide/pm/intel_idle.rst   |   4 +-
 Documentation/admin-guide/pm/intel_pstate.rst |   4 +-
 Documentation/admin-guide/ras.rst             |  86 +++---
 .../admin-guide/reporting-issues.rst          |   2 +-
 Documentation/arm64/arm-acpi.rst              |   8 +-
 .../driver-api/firmware/other_interfaces.rst  |   2 +-
 Documentation/driver-api/ioctl.rst            |   8 +-
 .../media/drivers/sh_mobile_ceu_camera.rst    |   8 +-
 .../driver-api/media/drivers/zoran.rst        |   2 +-
 .../driver-api/thermal/cpu-idle-cooling.rst   |  14 +-
 .../driver-api/thermal/intel_powerclamp.rst   |   6 +-
 .../thermal/x86_pkg_temperature_thermal.rst   |   2 +-
 .../fault-injection/nvme-fault-injection.rst  |   2 +-
 Documentation/filesystems/ext4/attributes.rst |  20 +-
 Documentation/filesystems/ext4/bigalloc.rst   |   6 +-
 Documentation/filesystems/ext4/blockgroup.rst |   8 +-
 Documentation/filesystems/ext4/blocks.rst     |   2 +-
 Documentation/filesystems/ext4/directory.rst  |  16 +-
 Documentation/filesystems/ext4/eainode.rst    |   2 +-
 Documentation/filesystems/ext4/inlinedata.rst |   6 +-
 Documentation/filesystems/ext4/inodes.rst     |   6 +-
 Documentation/filesystems/ext4/journal.rst    |   8 +-
 Documentation/filesystems/ext4/mmp.rst        |   2 +-
 .../filesystems/ext4/special_inodes.rst       |   4 +-
 Documentation/filesystems/ext4/super.rst      |  10 +-
 Documentation/filesystems/f2fs.rst            |   4 +-
 .../firmware-guide/acpi/dsd/graph.rst         |   2 +-
 Documentation/firmware-guide/acpi/lpit.rst    |   2 +-
 Documentation/gpu/i915.rst                    |   2 +-
 Documentation/gpu/komeda-kms.rst              |   2 +-
 Documentation/hid/hid-sensor.rst              |  70 ++---
 Documentation/hid/intel-ish-hid.rst           | 246 +++++++++---------
 Documentation/hwmon/ir36021.rst               |   2 +-
 Documentation/hwmon/ltc2992.rst               |   2 +-
 Documentation/hwmon/pm6764tr.rst              |   2 +-
 Documentation/infiniband/tag_matching.rst     |   4 +-
 Documentation/kernel-hacking/hacking.rst      |   2 +-
 Documentation/kernel-hacking/locking.rst      |   2 +-
 Documentation/misc-devices/ibmvmc.rst         |   8 +-
 .../device_drivers/ethernet/intel/i40e.rst    |   8 +-
 .../device_drivers/ethernet/intel/iavf.rst    |   4 +-
 .../device_drivers/ethernet/netronome/nfp.rst |  12 +-
 .../networking/devlink/devlink-dpipe.rst      |   2 +-
 Documentation/networking/scaling.rst          |  18 +-
 Documentation/power/powercap/powercap.rst     | 210 +++++++--------
 Documentation/process/code-of-conduct.rst     |   2 +-
 Documentation/scheduler/sched-deadline.rst    |   2 +-
 .../security/keys/trusted-encrypted.rst       |   4 +-
 Documentation/security/tpm/tpm_event_log.rst  |   2 +-
 .../kernel-api/writing-an-alsa-driver.rst     |  68 ++---
 .../coresight/coresight-etm4x-reference.rst   |  16 +-
 Documentation/usb/ehci.rst                    |   2 +-
 Documentation/usb/gadget_printer.rst          |   2 +-
 Documentation/usb/mass-storage.rst            |  36 +--
 .../media/dvb/audio-set-bypass-mode.rst       |   2 +-
 .../userspace-api/media/dvb/audio.rst         |   2 +-
 .../userspace-api/media/dvb/dmx-fopen.rst     |   2 +-
 .../userspace-api/media/dvb/dmx-fread.rst     |   2 +-
 .../media/dvb/dmx-set-filter.rst              |   2 +-
 .../userspace-api/media/dvb/intro.rst         |   6 +-
 .../userspace-api/media/dvb/video.rst         |   2 +-
 .../userspace-api/media/fdl-appendix.rst      |  64 ++---
 .../userspace-api/media/v4l/crop.rst          |  16 +-
 .../userspace-api/media/v4l/dev-decoder.rst   |   6 +-
 .../userspace-api/media/v4l/diff-v4l.rst      |   2 +-
 .../userspace-api/media/v4l/open.rst          |   2 +-
 .../media/v4l/vidioc-cropcap.rst              |   4 +-
 Documentation/virt/kvm/api.rst                |  28 +-
 Documentation/vm/zswap.rst                    |   4 +-
 Documentation/x86/resctrl.rst                 |   2 +-
 Documentation/x86/sgx.rst                     |   4 +-
 82 files changed, 693 insertions(+), 693 deletions(-)

-- 
2.30.2


