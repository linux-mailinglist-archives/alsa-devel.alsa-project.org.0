Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88574283F96
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 21:25:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2026017C0;
	Mon,  5 Oct 2020 21:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2026017C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601925939;
	bh=eMgbeUGSbXqcHSOBCyCgfyl7D9W2B6rYxXmGUI9G1LU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oB0FI+AuvLQPDm3VGFx9zFVQSNlOvrx2dMS1qrgtL4gpLpy4eQVSeLkJQJ7VKNYNj
	 LbkZTLuCc12gOSoZBbtT0DZUTT80XrB6ttEGLeWnDyM5Ezo16nJDjPCUsd1p7hNXOl
	 n6IdRLtmCeKwg3ck98/qkWWB61rBs5njmdLm3swk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C450CF802E2;
	Mon,  5 Oct 2020 21:24:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 612E6F802DC; Mon,  5 Oct 2020 21:23:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0076DF8026A
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 21:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0076DF8026A
IronPort-SDR: E0uxGfgoaa17S5vear84GvtXZTFmNnWHiHfjYUG/vyHk/6WJy5CsjdN3NMmVTQwOa/JyYkgQgK
 IWqk+ucnbZYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="181650143"
X-IronPort-AV: E=Sophos;i="5.77,340,1596524400"; d="scan'208";a="181650143"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 12:19:26 -0700
IronPort-SDR: utzDqmfOJRYOuu4H5wXH3pK14v+WEbOHUbsjD0S/p40f95xPYVH2NdAaz+Flk65v6eYuGhdpqs
 4nBObJyhsEdQ==
X-IronPort-AV: E=Sophos;i="5.77,340,1596524400"; d="scan'208";a="341302299"
Received: from dmert-dev.jf.intel.com ([10.166.241.5])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2020 11:26:11 -0700
From: Dave Ertman <david.m.ertman@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/6] Ancillary bus implementation and SOF multi-client
 support
Date: Mon,  5 Oct 2020 11:24:40 -0700
Message-Id: <20201005182446.977325-1-david.m.ertman@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: parav@mellanox.com, tiwai@suse.de, netdev@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 fred.oh@linux.intel.com, linux-rdma@vger.kernel.org, dledford@redhat.com,
 broonie@kernel.org, jgg@nvidia.com, gregkh@linuxfoundation.org,
 kuba@kernel.org, dan.j.williams@intel.com, shiraz.saleem@intel.com,
 davem@davemloft.net, kiran.patil@intel.com
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

Version 2 of this patchset is being pushed out when there are still
some issues up in the air.  This push, along with the changes in the
change log below, is to fix the broken distribution among mailing lists
and individuals of the first version submission.

At least two items still under discussion are:
Final name for the bus
Documentation of sysfs directories

Brief history of Ancillary Bus
==============================
The ancillary bus code was originally submitted upstream as virtual
bus, and was submitted through the netdev tree.  This process generated
up to v4.  This discussion can be found here:
https://lore.kernel.org/netdev/20191111192219.30259-1-jeffrey.t.kirsher@intel.com/#t

At this point, GregKH requested that we take the review and revision
process to an internal mailing list and garner the buy-in of a respected
kernel contributor.

The ancillary bus (then known as virtual bus) was originally submitted
along with implementation code for the ice driver and irdma drive,
causing the complication of also having dependencies in the rdma tree.
This new submission is utilizing an ancillary bus consumer in only the
sound driver tree to create the initial implementation and a single
user.

Since implementation work has started on this patch set, there have been
multiple inquiries about the time frame of its completion.  It appears
that there will be numerous consumers of this functionality.

The process of internal review and implementation using the sound
drivers generated 19 internal versions.  The changes, including the name
change from virtual bus to ancillary bus, from these versions can be
summarized as the following:

- Fixed compilation and checkpatch errors
- Improved documentation to address the motivation for virtual bus.
- Renamed virtual bus to ancillary bus
- increased maximum device name size
- Correct order in Kconfig and Makefile
- removed the mid-layer adev->release layer for device unregister
- pushed adev->id management to parent driver
- all error paths out of ancillary_device_register return error code
- all error paths out of ancillary_device_register use put_device
- added adev->name element
- modname in register cannot be NULL
- added KBUILD_MODNAME as prefix for match_name
- push adev->id responsibility to registering driver
- uevent now parses adev->dev name
- match_id function now parses adev->dev name
- changed drivers probe function to also take an ancillary_device_id
  param
- split ancillary_device_register into device_initialize and device_add
- adjusted what is done in device_initialize and device_add
- change adev to ancildev and adrv to ancildrv
- change adev to ancildev in documentation

==========================

Introduces the ancillary bus implementation along with the example usage
in the Sound Open Firmware(SOF) audio driver.

In some subsystems, the functionality of the core device
(PCI/ACPI/other) may be too complex for a single device to be managed as
a monolithic block or a part of the functionality might need to be
exposed to a different subsystem.  Splitting the functionality into
smaller orthogonal devices makes it easier to manage data, power
management and domain-specific communication with the hardware.  Also,
common ancillary_device functionality across primary devices can be
handled by a common ancillary_device. A key requirement for such a split
is that there is no dependency on a physical bus, device, register
accesses or regmap support. These individual devices split from the core
cannot live on the platform bus as they are not physical devices that
are controlled by DT/ACPI. The same argument applies for not using MFD
in this scenario as it relies on individual function devices being
physical devices that are DT enumerated.

An example for this kind of requirement is the audio subsystem where a
single IP handles multiple entities such as HDMI, Soundwire, local
devices such as mics/speakers etc. The split for the core's
functionality can be arbitrary or be defined by the DSP firmware
topology and include hooks for test/debug. This allows for the audio
core device to be minimal and tightly coupled with handling the
hardware-specific logic and communication.

The ancillary bus is intended to be minimal, generic and avoid
domain-specific assumptions. Each ancillary bus device represents a part
of its parent functionality. The generic behavior can be extended and
specialized as needed by encapsulating an ancillary bus device within
other domain-specific structures and the use of .ops callbacks.

The SOF driver adopts the ancillary bus for implementing the
multi-client support. A client in the context of the SOF driver
represents a part of the core device's functionality. It is not a
physical device but rather an ancillary device that needs to communicate
with the DSP via IPCs. With multi-client support,the sound card can be
separated into multiple orthogonal ancillary devices for local devices
(mic/speakers etc), HDMI, sensing, probes, debug etc.  In this series,
we demonstrate the usage of the ancillary bus with the help of the IPC
test client which is used for testing the serialization of IPCs when
multiple clients talk to the DSP at the same time.

v2 changes:
defined pr_fmt for kernel messages
replaced WARN_ON calls in registration with pr_err calls
adding kernel-doc function comments for device_initialize and device_add
fix typo in documentation
removed inaccurate line in documentation
fixed formatting in drivers/bus/Makefile
changed unwind path for sof_client_dev_alloc()
improved comments for client list and mem freeing during client unreg
removed debugfs entries in sof_ipc_test_client_drv during remove
changed the signature of sof_debug_ipc_flood_test()
fix a looping error in ancillary_match_id
updated error value in sof_client_dev_register()
mutex held while traversing client list when unregistering clients
updated includes in sof-client.h

Dave Ertman (1):
  Add ancillary bus support

Fred Oh (1):
  ASoC: SOF: debug: Remove IPC flood test support in SOF core

Ranjani Sridharan (4):
  ASoC: SOF: Introduce descriptors for SOF client
  ASoC: SOF: Create client driver for IPC test
  ASoC: SOF: ops: Add ops for client registration
  ASoC: SOF: Intel: Define ops for client registration

 Documentation/driver-api/ancillary_bus.rst | 229 ++++++++++++++
 Documentation/driver-api/index.rst         |   1 +
 drivers/bus/Kconfig                        |   3 +
 drivers/bus/Makefile                       |   3 +
 drivers/bus/ancillary.c                    | 225 ++++++++++++++
 include/linux/ancillary_bus.h              |  69 +++++
 include/linux/mod_devicetable.h            |   8 +
 scripts/mod/devicetable-offsets.c          |   3 +
 scripts/mod/file2alias.c                   |   8 +
 sound/soc/sof/Kconfig                      |  29 +-
 sound/soc/sof/Makefile                     |   7 +
 sound/soc/sof/core.c                       |  12 +
 sound/soc/sof/debug.c                      | 230 --------------
 sound/soc/sof/intel/Kconfig                |   9 +
 sound/soc/sof/intel/Makefile               |   3 +
 sound/soc/sof/intel/apl.c                  |  18 ++
 sound/soc/sof/intel/bdw.c                  |  18 ++
 sound/soc/sof/intel/byt.c                  |  22 ++
 sound/soc/sof/intel/cnl.c                  |  18 ++
 sound/soc/sof/intel/intel-client.c         |  53 ++++
 sound/soc/sof/intel/intel-client.h         |  26 ++
 sound/soc/sof/ops.h                        |  14 +
 sound/soc/sof/sof-client.c                 | 119 ++++++++
 sound/soc/sof/sof-client.h                 |  69 +++++
 sound/soc/sof/sof-ipc-test-client.c        | 332 +++++++++++++++++++++
 sound/soc/sof/sof-priv.h                   |  19 +-
 26 files changed, 1308 insertions(+), 239 deletions(-)
 create mode 100644 Documentation/driver-api/ancillary_bus.rst
 create mode 100644 drivers/bus/ancillary.c
 create mode 100644 include/linux/ancillary_bus.h
 create mode 100644 sound/soc/sof/intel/intel-client.c
 create mode 100644 sound/soc/sof/intel/intel-client.h
 create mode 100644 sound/soc/sof/sof-client.c
 create mode 100644 sound/soc/sof/sof-client.h
 create mode 100644 sound/soc/sof/sof-ipc-test-client.c

-- 
2.26.2

