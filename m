Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B0678FE0
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 17:53:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 723B81824;
	Mon, 29 Jul 2019 17:52:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 723B81824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564415628;
	bh=qz1+0Ist6b7ipO6hpJl9N1I66L2OtfOM8qo/kx1KWNA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A6Z1KC4sM2ndpdVP7NINZ/93/uGPIvlJKzubPiDMMujW39XtfFXja+zj0yIf4mKnY
	 h+2XWqL2Bce+btwUup227Kil+s73C1RkX8zr+zcKXIrOHVUKVaUVQ+PMM3Dbk7MupL
	 2W06DrUwxBQyWXfCwoXpVPp2qOs9J4iWiWgqZi4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D3DDF800BF;
	Mon, 29 Jul 2019 17:52:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5C4BF8048D; Mon, 29 Jul 2019 17:52:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE19DF800BF
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 17:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE19DF800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 08:51:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,323,1559545200"; d="scan'208";a="165534149"
Received: from lquinn-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.252.130.206])
 by orsmga008.jf.intel.com with ESMTP; 29 Jul 2019 08:51:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 29 Jul 2019 10:51:46 -0500
Message-Id: <20190729155151.14055-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org
Subject: [alsa-devel] [PATCH v4 0/5] ALSA/HDA: abort probe when DMICs are
	detected
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

This is the second take on same problem of detecting when the HDaudio
legacy driver can be used and when the SST or SOF drivers are
required.

The previous attempt based on a the PCI Class information was a
resounding failure and broke audio on Linus' laptop, so we need
additional information to avoid enabling a DSP-based driver without a
good reason to do so.

This patchset suggests the use of the NHLT information which *in
theory* exposes DMIC endpoints. The legacy HDaudio driver cannot
handle DMICs and will not provide any capture capabilities. Since it's
typically the first one to probe due to the Makefile order, aborting
the probe will let the PCI subsystem look for the next driver which
hopefully will support this capability.

I tested this patch on 5 devices (SKL, KBL, APL, GLK, WHL), three
without DMICs and two with, and the detection seems to work as
planned. Additional testing by Canonical and Endless folks did not
expose any issues.

Changes since v3 (Feedback from Cezary)
Code cleanups (spaces and unnecessary inits)
Flipped test statement to return on errors and reduce indentation
Removed ACPI leak by adding missing ACPI_FREE()

Changes since v2 (Feedback from Takahi and Cezary)
Added comment in Kconfig to alert the user to the dependency on ACPI

Changes since v1 (Feedback from Takashi):
Squashed patch3 in patch2
Changed log to dbg_info
Fixed module parameter handling

Changes since RFC:
Cosmetic code improvements
Moved intel-nhlt.h to include/sound
Moved intel-nhlt.c to sound/hda
Removed SOC prefixes
Added full-support for vendor-defined geometries
Added Kconfig and kernel module parameter to opt-in

Pierre-Louis Bossart (5):
  ASoC: Intel: Skylake: move NHLT header to common directory
  ALSA: hda: move parts of NHLT code to new module
  ALSA: hda: intel-nhlt: handle NHLT VENDOR_DEFINED DMIC geometry
  ASoC: Intel: Skylake: use common NHLT module
  ALSA: hda/intel: stop probe if DMICS are detected on Skylake+
    platforms

 .../skl-nhlt.h => include/sound/intel-nhlt.h  |  51 +++++++--
 sound/hda/Kconfig                             |   5 +
 sound/hda/Makefile                            |   3 +
 sound/hda/intel-nhlt.c                        | 107 ++++++++++++++++++
 sound/pci/hda/Kconfig                         |  10 ++
 sound/pci/hda/hda_intel.c                     |  34 ++++++
 sound/soc/intel/Kconfig                       |   1 +
 sound/soc/intel/skylake/skl-nhlt.c            |  91 +--------------
 sound/soc/intel/skylake/skl-ssp-clk.c         |   1 +
 sound/soc/intel/skylake/skl-topology.c        |   1 +
 sound/soc/intel/skylake/skl.c                 |  12 +-
 sound/soc/intel/skylake/skl.h                 |   4 -
 12 files changed, 212 insertions(+), 108 deletions(-)
 rename sound/soc/intel/skylake/skl-nhlt.h => include/sound/intel-nhlt.h (65%)
 create mode 100644 sound/hda/intel-nhlt.c

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
