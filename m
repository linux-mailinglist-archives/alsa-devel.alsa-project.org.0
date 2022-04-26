Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAF851050C
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:15:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35AEE1856;
	Tue, 26 Apr 2022 19:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35AEE1856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993355;
	bh=xaIYsyruQprLavUnvtWY/Dl7mqLpXJJcqsvdA01eVqs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lblrmuzc2vSyqiTEWMXO7jZMx7iU10LSaxGWVssYaQfO3iSItD/zKcUSAw4Tb3VPj
	 Uspq2bRkIBg6V2L7GxUpwfTyoOZwp1U77ed/1V7iGL0vPE1H/597efgeadLNf1y/nN
	 HSdXsuDlJ3rjk87Ywa59m3C+QPAqrk/WTkZ2tbQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCAF7F8027D;
	Tue, 26 Apr 2022 19:14:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BCE5F80105; Tue, 26 Apr 2022 19:14:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ECEFF80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ECEFF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="R7jmQLQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650993288; x=1682529288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xaIYsyruQprLavUnvtWY/Dl7mqLpXJJcqsvdA01eVqs=;
 b=R7jmQLQCjD0y6tK5cVi4erpxaoUBSqYMRdNeZoATXowMShFzcIFp2/cK
 A2WmGNOiDPoBNRG+o2/mPPAbp2tOtUhvMon9ff8sjJtrTU6/i4621OaG1
 tBnFrEU7+aZbH2sOKH6OhSimIQBt30SrC7xWR+fiLmX3Q0XTO1zz/b8Bv
 4RSNK2fGHLM3PgM1eU4qN6DtgDDaDboKLWP5sOU3S3XNfSIEwqED3J55C
 wASg9UuE3/6GTYpvIXNtvJBuAYi7KUtOIcyBZnNjEZBTmSWWuqMRAB1u2
 FMoVtpvlJUQVA/mZfwXoe7VG5v6NgGx01okWqkgQ/i8dLaoU64CVstZjM A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="326148986"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="326148986"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:14:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="650305078"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Apr 2022 10:14:32 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 00/14] ASoC: Intel: avs: Driver core and PCM operations
Date: Tue, 26 Apr 2022 19:23:32 +0200
Message-Id: <20220426172346.3508411-1-cezary.rojewski@intel.com>
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

 include/sound/soc-acpi.h              |    2 +
 sound/soc/intel/Kconfig               |    4 +-
 sound/soc/intel/avs/Makefile          |    7 +-
 sound/soc/intel/avs/apl.c             |  250 ++++++
 sound/soc/intel/avs/avs.h             |   79 ++
 sound/soc/intel/avs/board_selection.c |  463 ++++++++++
 sound/soc/intel/avs/core.c            |  655 ++++++++++++++
 sound/soc/intel/avs/dsp.c             |   27 +-
 sound/soc/intel/avs/ipc.c             |  249 +++++-
 sound/soc/intel/avs/loader.c          |   83 ++
 sound/soc/intel/avs/messages.c        |   35 +-
 sound/soc/intel/avs/messages.h        |   51 ++
 sound/soc/intel/avs/pcm.c             | 1182 +++++++++++++++++++++++++
 sound/soc/intel/avs/registers.h       |    8 +
 sound/soc/intel/avs/skl.c             |  125 +++
 sound/soc/intel/avs/topology.c        |    2 -
 sound/soc/intel/avs/trace.c           |   33 +
 sound/soc/intel/avs/trace.h           |  158 ++++
 sound/soc/intel/avs/utils.c           |   23 +
 19 files changed, 3421 insertions(+), 15 deletions(-)
 create mode 100644 sound/soc/intel/avs/apl.c
 create mode 100644 sound/soc/intel/avs/board_selection.c
 create mode 100644 sound/soc/intel/avs/pcm.c
 create mode 100644 sound/soc/intel/avs/skl.c
 create mode 100644 sound/soc/intel/avs/trace.c
 create mode 100644 sound/soc/intel/avs/trace.h

-- 
2.25.1

