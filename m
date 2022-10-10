Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B9E5F9E4D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 14:04:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B91FA2961;
	Mon, 10 Oct 2022 14:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B91FA2961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665403489;
	bh=L4+QO1k7KuXEyEsjLGM+P/4NWQ1K85eefvbwwXuB4jg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f+b0QfMX+xuldVJzOCdEpraz9ob7c6NPovPHoNqKvCSyU5EeZ9K9Gxs8l25OgsmSB
	 Ql4BRRp9/aT33YGoTwgaRxEfxzdAZseECJkjTSG190FxEQuG5zBSrNwRvhBwoojnY4
	 rjyhUbYKj7NQtoxrLFJx56B0n5Pc9HxfHdAmZDok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 361B9F804D8;
	Mon, 10 Oct 2022 14:03:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EF7AF800B8; Mon, 10 Oct 2022 14:03:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F28FF800B8
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 14:03:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F28FF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TTl+ggbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665403430; x=1696939430;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L4+QO1k7KuXEyEsjLGM+P/4NWQ1K85eefvbwwXuB4jg=;
 b=TTl+ggbQNKhatnUglWhFZj7JjyOj9QzGAn8WiBTmMP7owMnLhtBj4rh2
 /eo3vjKDTzyDOFj1oPcZ6q6EoB1PpgzGreH87psooDCl1ov142VwY8myE
 Y0WbTGaodqKgyrXRlybGiiNtmYDHqmGtZBkNvw6sbmWB0zYjuQ+e/g7Hg
 WipgIH5oUDiX8MiRXOJUovoiqIpt8gLIRBHtSVg/76crJ8Efecm8rS6Ww
 Z+TH8dd/D2t8w3J/7QaNv+f/YHMBzdLHhR4F87a3uH7uqqwwtwjA8FH4e
 AaX251mnHyY1UpTOOP5TBYHMFabl+lAQIir7gEDOKl28VX6amj/N2Php2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="368346057"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="368346057"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 05:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="871078852"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="871078852"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2022 05:03:45 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 00/15] ASoC: Intel: avs: Fixes and new boards support
Date: Mon, 10 Oct 2022 14:19:40 +0200
Message-Id: <20221010121955.718168-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Two fixes are leading the way - one addresses the incorrect DMA mask
assignment (typo) at driver probe. The other, fixes a potential buffer
overflow when copying data received from firmware to kernel buffer.
However unlikely, the fix should still be there.

Then a range of patches providing the support for:
- AML with rt286 (machine board)
- KBL-R for rt298 (codec)
- KBL-R with rt298 (machine board)
- APL/KBL with da7219 (machine board)
- Addition of all the missing SKL-based PCI ids to core.c

Of the remaining changes, only one stands out - special case is provided
for "unsupported" IPCs. The driver supports a range of platforms,
however, on some generations given IPC may not be supported. Such call
shall not be treated as "invalid" - those are two different scenarios.

Everything else in the patchset is mostly a readability improvement:
spelling fixes and log messages issues, code simplification.


Changes in v2:
- no code changes, just added missing signed-off-by tags

Amadeusz Sławiński (4):
  ASoC: codecs: rt298: Add quirk for KBL-R RVP platform
  ASoC: Intel: avs: Add quirk for KBL-R RVP platform
  ASoC: Intel: avs: Support da7219 on both KBL and APL
  ASoC: Intel: avs: Add missing include to HDA board

Cezary Rojewski (11):
  ASoC: Intel: avs: Fix DMA mask assignment
  ASoC: Intel: avs: Fix potential RX buffer overflow
  ASoC: Intel: avs: Support AML with rt286 configuration
  ASoC: Intel: avs: Add missing SKL-based device IDs
  ASoC: Intel: avs: Simplify d0ix disabling routine
  ASoC: Intel: avs: Do not reuse msg between different IPC handlers
  ASoC: Intel: avs: Do not treat unsupported IPCs as invalid
  ASoC: Intel: avs: Do not print IPC error message twice
  ASoC: Intel: avs: Simplify ignore_fw_version description
  ASoC: Intel: avs: Simplify log control for SKL
  ASoC: codecs: hda: Fix spelling error in log message

 sound/soc/codecs/hda.c                |  2 +-
 sound/soc/codecs/rt298.c              |  7 +++++++
 sound/soc/intel/avs/apl.c             |  6 ++++--
 sound/soc/intel/avs/avs.h             |  4 +++-
 sound/soc/intel/avs/board_selection.c |  6 ++++++
 sound/soc/intel/avs/boards/da7219.c   |  6 +++++-
 sound/soc/intel/avs/boards/hdaudio.c  |  1 +
 sound/soc/intel/avs/boards/rt298.c    | 24 ++++++++++++++++++++++--
 sound/soc/intel/avs/core.c            |  6 +++++-
 sound/soc/intel/avs/ipc.c             |  5 +++--
 sound/soc/intel/avs/loader.c          |  2 +-
 sound/soc/intel/avs/messages.c        | 19 ++++---------------
 sound/soc/intel/avs/messages.h        |  2 ++
 sound/soc/intel/avs/skl.c             |  4 ++--
 14 files changed, 66 insertions(+), 28 deletions(-)

-- 
2.25.1

