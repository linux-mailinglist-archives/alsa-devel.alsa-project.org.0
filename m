Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2842D51F73D
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 10:49:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD0AB18AE;
	Mon,  9 May 2022 10:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD0AB18AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652086185;
	bh=jHvEqnYPNNljzsEFzbU38+XlL5/lYYeVv1qTWVkcuB8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p2Ntrbn3xc+ofTorSEDiawe2zkzkBkXdzbXheHuvKPTjm8t193qkk3TgqmomD0LiF
	 bwHQenAWocfOXpbDyNiFwWhDtkbqf814Ieehhp3gcqblFEWFHqJ9yw26aSUWDc+wWM
	 Ql5xcvq82ITKhDDgEkPuTj74fqNg9V7uS7nkwaHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 487BDF804FF;
	Mon,  9 May 2022 10:48:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A897F8014C; Mon,  9 May 2022 10:48:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2937F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 10:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2937F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iaVFnpgZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652086122; x=1683622122;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jHvEqnYPNNljzsEFzbU38+XlL5/lYYeVv1qTWVkcuB8=;
 b=iaVFnpgZOeH11HSotFf1LzGFWx61W3YyD2A0HjTXlcKzpS00qK0y3AvD
 HeyY6YJm/dWVE5dX5OIdQtLtEtXZUXRJnuJCS4a6hrHOYBCNb/lWvXzIT
 ySEqekuzCHehgm1ezHiIr2k1G2i2Vk/mHgihA8osxipYFrQAKxgPg9q2w
 /jNOzpRlRx0l2tKG5Rwd+aB6fmmbZdvSE5T+SqBRl4MpAepVKMz2yUmWc
 f3M0Cczp8vb99l7EU7qrXsqbNm62zCG/YrkS2Vy6ztaDfCC2QPUEd2rB9
 EHrryK7mHQejNFpGiBwYffC1DlqduElAO4/Iu5sNvuJhSR46N5SmbgtWJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="294208491"
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; d="scan'208";a="294208491"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 01:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; d="scan'208";a="738068080"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 09 May 2022 01:48:29 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 00/15] ASoC: Intel: avs: Driver core and PCM operations
Date: Mon,  9 May 2022 10:58:06 +0200
Message-Id: <20220509085821.3852259-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Part three of main AVS driver series. This series was originally part of
the initial series which was later divided [1] into smaller,
easier-to-review chunks. Thus, many patches found here were already
present on the list.

This series consists of code typical to many drivers - PCI driver
operations, trace ability, PM operations - as well as PCM handlers for
all standard audio interfaces, that is, HDA, I2S and DMIC are found
here.

Series starts with updating firmware boot flow - libraries are no longer
ignored. This change is dependent on already merged topology code [2]
and because of that could not be part of the initial series [1].

PCM operations are split into four changes. First component operations
alone i.e. operations which are usually agnostic towards path position
(FE/BE). Then it continues with "generic" FE operations - there is no
interface split here as from Intel ADSP point of view, FE, or HOST side
as it's called in the specs, involves HD-Audio operations only.
BE (also known as LINK) side on the other hand is divided into
"non-HD-Audio" and HD-Audio part. The former represents transfer over
DMIC and I2S interfaces both.

While patches implementing standard PCI driver operations along (again
standard) HD-Audio initialization routines followed up by power
management handlers are two major ones, series covers also other
important subjects such as:

While patches implementing standard PCI driver operations along (again
standard) HD-Audio initialization routines followed up by power
management handlers are two major ones, series covers also other
important subjects such as:

- event tracing
- preparation for firmware tracing (debugability)
- coredump (debugability)
- recovery flow (attempt recovery after IPC timeout or exception)
- D0ix (D0 device substate, complements standard power management)

Series is finalized by actual addition of supported platforms: SKL and
APL-based. Platform-specific files are limited to firmware-specific
bits, that is, bits that are specific to given firmware generation.
Everything else is shared and is part of already upstream messaging
code found in ipc.c, messages.c and messages.h files.


Changes in v2:
- usage of avs_releast_last_firmware() dropped in error path for library
  loading procedure as suggested by Pierre
- 'link_mask' usage replaced with 'i2s_link_mask' as requested by
  Pierre. Existing code addressed with new patch:
  "ASoC: Intel: avs: Replace link_mask usage with i2s_link_mask"
- fixed possible race during recovery flow (->recovering flag is now
  atomic and tested in single location only).
- dropped platform prefixes for basically all i2s board descriptors
- 'ssp_test' renamed to 'i2s_test' to match naming convention of other
  boards
- simplified PM implementation for current series, 'low_power' bits
  moved to future series
- replaced SND_INTEL_DSP_DRIVER_SST with _AVS as suggested by Mark.
  Required changes to intel-dspcfg will be added in future series
- number of typos across commit messages addressed


[1]: https://lore.kernel.org/all/20220311153544.136854-1-cezary.rojewski@intel.com/
[2]: https://lore.kernel.org/all/20220331135246.993089-1-cezary.rojewski@intel.com/


Cezary Rojewski (14):
  ASoC: Intel: avs: Account for libraries when booting basefw
  ASoC: Intel: avs: Generic soc component driver
  ASoC: Intel: avs: Generic PCM FE operations
  ASoC: Intel: avs: non-HDA PCM BE operations
  ASoC: Intel: avs: HDA PCM BE operations
  ASoC: Intel: avs: Coredump and recovery flow
  ASoC: Intel: avs: Prepare for firmware tracing
  ASoC: Intel: avs: D0ix power state support
  ASoC: Intel: avs: Event tracing
  ASoC: Intel: avs: Machine board registration
  ASoC: Intel: avs: PCI driver implementation
  ASoC: Intel: avs: Power management
  ASoC: Intel: avs: SKL-based platforms support
  ASoC: Intel: avs: APL-based platforms support

Piotr Maziarz (1):
  ASoC: Intel: avs: Replace link_mask usage with i2s_link_mask

 include/sound/intel-dsp-config.h      |    3 +-
 include/sound/soc-acpi.h              |    2 +
 sound/soc/intel/Kconfig               |    2 +
 sound/soc/intel/avs/Makefile          |    7 +-
 sound/soc/intel/avs/apl.c             |  250 ++++++
 sound/soc/intel/avs/avs.h             |   79 ++
 sound/soc/intel/avs/board_selection.c |  501 +++++++++++
 sound/soc/intel/avs/core.c            |  631 +++++++++++++
 sound/soc/intel/avs/dsp.c             |   27 +-
 sound/soc/intel/avs/ipc.c             |  253 +++++-
 sound/soc/intel/avs/loader.c          |   84 ++
 sound/soc/intel/avs/messages.c        |   35 +-
 sound/soc/intel/avs/messages.h        |   51 ++
 sound/soc/intel/avs/pcm.c             | 1182 +++++++++++++++++++++++++
 sound/soc/intel/avs/registers.h       |    8 +
 sound/soc/intel/avs/skl.c             |  125 +++
 sound/soc/intel/avs/topology.c        |   14 +-
 sound/soc/intel/avs/trace.c           |   33 +
 sound/soc/intel/avs/trace.h           |  158 ++++
 sound/soc/intel/avs/utils.c           |   23 +
 20 files changed, 3447 insertions(+), 21 deletions(-)
 create mode 100644 sound/soc/intel/avs/apl.c
 create mode 100644 sound/soc/intel/avs/board_selection.c
 create mode 100644 sound/soc/intel/avs/pcm.c
 create mode 100644 sound/soc/intel/avs/skl.c
 create mode 100644 sound/soc/intel/avs/trace.c
 create mode 100644 sound/soc/intel/avs/trace.h

-- 
2.25.1

