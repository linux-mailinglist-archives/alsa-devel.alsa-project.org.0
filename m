Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D3DB436D
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 23:44:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DB401672;
	Mon, 16 Sep 2019 23:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DB401672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568670291;
	bh=99irtEXCuUT4iiWs4fvmNjZw5iBR7jI6jJ4j/vuS/68=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SzNcewHUYWsFNxpUx0j6GnPf1aTM6OqAOU2+yxWA/r3jF0NSAqBbjmaFq+ixuKiJ7
	 QsCf8UxDeVkgthXRjobE8IHDEa7mofHqgBi14gdpvVrNzza7fNi1CnyV/eLQZJ89HV
	 b2NgBEjNQSnYOs12l7fNJX+el2PvVJIviiqQ0RqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52D34F804FF;
	Mon, 16 Sep 2019 23:43:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35CAFF80535; Mon, 16 Sep 2019 23:43:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E84FF801DA
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 23:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E84FF801DA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 14:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,514,1559545200"; d="scan'208";a="198479862"
Received: from dgitin-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.142.45])
 by orsmga002.jf.intel.com with ESMTP; 16 Sep 2019 14:42:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 16 Sep 2019 16:42:39 -0500
Message-Id: <20190916214251.13130-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [RFC PATCH 00/12] soundwire/SOF: updated interfaces,
	functional integration
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

This series builds on the 'soundwire: add Master device support,
GreyBus style' RFC'. It provides enhancements to the stream callbacks,
a split initialization. Most of the SOF patches were already submitted
in an earlier RFC, and feedback on the parameters was taken into
account. The main change here are the API changes with a split between
ACPI scan, probe, startup steps.


Known limits:
a) Power management (regular suspend/resume and pm_runtime) is not
supported for now as we need to run additional checks on
hardware. This will be provided as a separate series.
b) during validation checks on CML/ICL, initialization and
playback/capture worked fine, but we observed a reproducible system
freeze while doing load/unload tests, so likely an initialization
missing or a leak to be fixed.

Comments and feedback welcome.

Pierre-Louis Bossart (7):
  ASoC: soc-acpi: add link_mask field
  ASoC: SOF: support alternate list of machines
  ASoC: SOF: Intel: add SoundWire configuration interface
  ASoC: SOF: Intel: add build support for SoundWire
  ASoC: SOF: IPC: dai-intel: move ALH declarations in header file
  ASoC: SOF: Intel: hda: add SoundWire stream config/free callbacks
  ASoC: SOF: Intel: hda: initial SoundWire machine driver autodetect

Rander Wang (5):
  soundwire: intel: update stream callbacks for hwparams/free stream
    operations
  soundwire: intel: add prepare support in sdw dai driver
  soundwire: intel: add trigger support in sdw dai driver
  soundwire: intel: add sdw_stream_setup helper for .startup callback
  soundwire: intel: free all resources on hw_free()

 drivers/soundwire/intel.c           | 181 ++++++++++++++++++-
 drivers/soundwire/intel_init.c      |   2 +-
 include/linux/soundwire/sdw_intel.h |  40 ++++-
 include/sound/soc-acpi.h            |   2 +
 include/sound/sof.h                 |   3 +
 include/sound/sof/dai-intel.h       |  18 +-
 sound/soc/sof/intel/Kconfig         |  23 +++
 sound/soc/sof/intel/hda-loader.c    |   9 +
 sound/soc/sof/intel/hda.c           | 261 +++++++++++++++++++++++++++-
 sound/soc/sof/intel/hda.h           |  36 ++++
 10 files changed, 546 insertions(+), 29 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
