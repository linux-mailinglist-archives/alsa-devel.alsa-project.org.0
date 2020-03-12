Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6803E183998
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 20:35:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD3EB1740;
	Thu, 12 Mar 2020 20:35:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD3EB1740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584041750;
	bh=0WUpJUOyqZHlDSBF7abuY5J23vQ+Ccws/uGPli0qGBY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uT4umuakaFZOJmGhgyEHX6BXhGOoq+nk6OWHqhUHcbFqUXJyL3A246RIl1hi/5ZI/
	 jZ/XRgqPO8QAS0QyBvCT1z/G+E8PKhw79fee4oghVAvjvPhhvymRoR/VHD5hki3hY0
	 VC61SC1Fn52z3fGfpI6DO3A6/q4sLczPQrRJ096A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 923E8F80086;
	Thu, 12 Mar 2020 20:34:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 388FEF8020C; Thu, 12 Mar 2020 20:34:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CC81F800BE
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 20:34:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CC81F800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 12:33:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="243142313"
Received: from unknown (HELO pbossart-mobl3.amr.corp.intel.com)
 ([10.251.241.169])
 by orsmga003.jf.intel.com with ESMTP; 12 Mar 2020 12:33:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/10] ASoC: SOF: Intel: add SoundWire support
Date: Thu, 12 Mar 2020 14:33:36 -0500
Message-Id: <20200312193346.3264-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

This patchset provides the support for SoundWire support on Intel
CometLake, IcelLake and TigerLake RVP platforms and form-factor
devices to be released 'soon'.

The bulk of the code is about detecting a valid SoundWire
configuration from ACPI, and implementing the interfaces suggested in
'[PATCH 0/8] soundwire: remove platform devices, add SOF interfaces'
for interrupts, PCI wakes and clock-stop configurations.

Since that SoundWire series is stuck with no resolution, the build
support for SOF w/ SoundWire is not provided for now, and fall-back
functions will be used. This code is tested on a daily basis in the
SOF tree and is not expected to change. If audio maintainers will only
accept functional code, which isn't unreasonable, I would kindly ask
that they reach out to Vinod Koul.

Bard Liao (1):
  ASoC: SOF: Intel: hda: merge IPC, stream and SoundWire interrupt
    handlers

Pierre-Louis Bossart (7):
  ASoC: soc-acpi: expand description of _ADR-based devices
  ASoC: SOF: Intel: add SoundWire configuration interface
  ASoC: SOF: IPC: dai-intel: move ALH declarations in header file
  ASoC: SOF: Intel: hda: add SoundWire stream config/free callbacks
  ASoC: SOF: Intel: hda: initial SoundWire machine driver autodetect
  ASoC: SOF: Intel: hda: disable SoundWire interrupts on suspend
  ASoC: SOF: Intel: hda: add parameter to control SoundWire clock stop
    quirks

Rander Wang (2):
  ASoC: SOF: Intel: hda: add WAKEEN interrupt support for SoundWire
  Asoc: SOF: Intel: hda: check SoundWire wakeen interrupt in irq thread

 include/sound/soc-acpi.h                      |  39 +-
 include/sound/sof/dai-intel.h                 |  18 +-
 .../intel/common/soc-acpi-intel-cml-match.c   |  87 +++-
 .../intel/common/soc-acpi-intel-icl-match.c   |  97 ++++-
 .../intel/common/soc-acpi-intel-tgl-match.c   |  49 ++-
 sound/soc/sof/intel/hda-dsp.c                 |   2 +
 sound/soc/sof/intel/hda-loader.c              |  31 ++
 sound/soc/sof/intel/hda.c                     | 399 ++++++++++++++++++
 sound/soc/sof/intel/hda.h                     |  66 +++
 9 files changed, 728 insertions(+), 60 deletions(-)


base-commit: 101247a3b86e1cc0e382b7e887a56176290fc957
-- 
2.20.1

