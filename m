Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3AE605FCD
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:13:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 658F1414D;
	Thu, 20 Oct 2022 14:12:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 658F1414D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268000;
	bh=xfdYC6+Lo+pmn1soc4VrmIj2za9HOWQxX8cYHPdwJO4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T7iViL5hDIuBz8rs+fCmGsv5HUUZ5igSt40ywFXmedhwv23lI4ANIxmA5xLo5Sp91
	 pkx49dgYI1VyRYPneS4XWSqZBdlDLrWyg/1leK30MkkuVcWlo4RbdpBN+BmEJ5OyTy
	 /MHjgm4VxwStTUYqJmTEzx4Hravw6exepwsxBgXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E997AF804FA;
	Thu, 20 Oct 2022 14:12:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16CCEF804E5; Thu, 20 Oct 2022 14:12:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 867EEF80137
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 867EEF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eLd5rKHp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267940; x=1697803940;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xfdYC6+Lo+pmn1soc4VrmIj2za9HOWQxX8cYHPdwJO4=;
 b=eLd5rKHpc75W8rJ5vRj188vK5pBGtRGZNwZ/1I0FRgzX4zYryhICg470
 aXwijWPaoDfq4hXKApv/r6j0+eVdW/5QblRqrIZ1WTdNXWlNukNRMjvgN
 I+2UAlsmXsDK9wJ6chOfqDnPS7kzDVM2VtHYB9DhoW/1tr3YEZY4h5DPV
 RoTjFwuvl5zoBo7tkbctznb1V1dZjbZPVKDrZuhRjuqOsil7Z9VduAAJ0
 bmOUacC9nXXhqMQluNeEbad0KgSrDU8toGyEU5t5BMqBMBHod7TSC0e/V
 oLf+afJlAqydSsC7zD1GB0gJ/H0cIaFVw1jSSOnjryTONtA1WeJXfconr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333256270"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333256270"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:17 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="663009809"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="663009809"
Received: from awrynn-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:14 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 00/19] ASoC: SOF: Intel/IPC4: Support for external firmware
 libraries
Date: Thu, 20 Oct 2022 15:12:19 +0300
Message-Id: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 chao.song@intel.com
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

Hi,

Changes since v1:
- rebased on "[PATCH v2] ASoC: SOF: Intel: pci-tgl: fix ADL-N descriptor"

Cover letter:

In IPC4 all DSP loadable executable is a 'library' containing modules. The main
or basefw is also a library which contains multiple modules.
IPC4 allows to use loadable libraries to extend the functionality of the booted
basefw.

This series adds support for loading external libraries in case they are needed
by the loaded topology file.

The libraries must be placed to a specific firmware directory (fw_lib_prefix),
which is:
intel/avs-lib|sof-ipc4-lib/ followed by the platform name and in case of
community key use a 'community' directory.

For example for upx-i11 (community key): intel/avs-lib/tgl/community is the
default path.

The name of the library should be the UUID of the module it contains since the
library loading is going to look for the file as <module_UUID>.bin
In case there is a need to bundle multiple modules into single library, symlinks
can be used to point to the file:

module_boundle.bin
<UUID1>.bin -> module_boundle.bin
<UUID2>.bin -> module_boundle.bin
<UUID3>.bin -> module_boundle.bin

But note that in this case all modules will be loaded to the DSP since only the
whole library can be loaded, not individual modules.

Regards,
Peter
---
Peter Ujfalusi (18):
  ASoC: SOF: Introduce container struct for SOF firmware
  ASoC: SOF: amd: Use the basefw firmware container directly
  ASoC: SOF: Intel: hda-loader: Use the basefw firmware container
    directly
  ASoC: SOF: Intel: hda-loader-skl: Use the basefw firmware container
    directly
  ASoC: SOF: Drop the firmware and fw_offset from snd_sof_pdata
  ASoC: SOF: ipc: ops: Add support for optional init and exit callbacks
  ASoC: SOF: ipc4-loader: Save the maximum number of libraries supported
  ASoC: SOF: ipc4: Convert the firmware handling (loader) to library
    convention
  ASoC: SOF: IPC4: Add helper for looking up module by UUID
  ASoC: SOF: Add path definition for external firmware libraries
  ASoC: SOF: Intel: Set the default firmware library path for IPC4
  ASoC: SOF: ipc4: Define platform dependent library loading callback
  ASoC: SOF: Intel: hda: Add flag to indicate that the firmware is IMR
    booted
  ASoC: SOF: Intel: Add ipc4 library loading implementation
  ASoC: SOF: loader: Add support for IPC dependent post firmware boot
    ops
  ASoC: SOF: ipc4: Stop using the query_fw_configuration fw_loader ops
  ASoC: SOF: loader: Remove the query_fw_configuration ops
  ASoC: SOF: ipc4-loader: Support for loading external libraries

Ranjani Sridharan (1):
  ASoC: SOF: loader: Set complete state before post_fw_run op

 include/sound/sof.h                  |  10 +-
 include/sound/sof/ipc4/header.h      |   4 +
 sound/soc/sof/amd/acp-loader.c       |   6 +-
 sound/soc/sof/intel/apl.c            |   3 +
 sound/soc/sof/intel/cnl.c            |   3 +
 sound/soc/sof/intel/hda-loader-skl.c |   7 +-
 sound/soc/sof/intel/hda-loader.c     |  83 +++++++++-
 sound/soc/sof/intel/hda.h            |   4 +
 sound/soc/sof/intel/icl.c            |   3 +
 sound/soc/sof/intel/mtl.c            |   3 +
 sound/soc/sof/intel/pci-apl.c        |   6 +
 sound/soc/sof/intel/pci-cnl.c        |   9 ++
 sound/soc/sof/intel/pci-icl.c        |   6 +
 sound/soc/sof/intel/pci-mtl.c        |   3 +
 sound/soc/sof/intel/pci-tgl.c        |  24 +++
 sound/soc/sof/intel/tgl.c            |   3 +
 sound/soc/sof/ipc.c                  |   6 +
 sound/soc/sof/ipc3-loader.c          |  26 ++-
 sound/soc/sof/ipc4-loader.c          | 233 ++++++++++++++++++++++++---
 sound/soc/sof/ipc4-priv.h            |  65 ++++++--
 sound/soc/sof/ipc4-topology.c        |  17 +-
 sound/soc/sof/ipc4.c                 |  41 +++++
 sound/soc/sof/loader.c               |  25 ++-
 sound/soc/sof/sof-pci-dev.c          |  26 +++
 sound/soc/sof/sof-priv.h             |  27 +++-
 25 files changed, 543 insertions(+), 100 deletions(-)

-- 
2.38.1

