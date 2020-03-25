Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D92193317
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 22:54:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D2AF1669;
	Wed, 25 Mar 2020 22:53:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D2AF1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585173245;
	bh=5Li2SueCYsVzJ5dpiYty8miLkDfuUzvaU0rU82ynQVY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XPvCcAPhgvddbFQg7lR/eovMdgKGHoK6HiAU4gL+s8T0xZTViJYJVIhk43AIpVDhG
	 n9TG7vLW2YEtUszxABzGp21PEdMsQd4U+ySc/FwWuuxbsWVd0BUQgiDiZUvyCqycih
	 hLoR4L9AIVL1DugJlS3fLqnDfpe8wTo/iOBsePl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA12FF8029A;
	Wed, 25 Mar 2020 22:50:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D47FF8011E; Wed, 25 Mar 2020 22:50:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41529F8011E
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:50:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41529F8011E
IronPort-SDR: E/9jM6cBmG/YbV6Ixw//rRwJzl3YcKzYYuPENsyJJ5v60uQK35ziXTgiDjby2pS0WimmeK2vvh
 qEN5j13ngIXw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 14:50:37 -0700
IronPort-SDR: sL7Pvor4WX6kKvEiLpfjqtE/Cxe4TkCzvN8TiYd8qVHdTfOuFcDdRGZFkCLu3h5d8BBUVRqvoF
 pEXN+RgeoFnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="265666141"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by orsmga002.jf.intel.com with ESMTP; 25 Mar 2020 14:50:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 00/11] ASoC: SOF: Intel: add SoundWire support
Date: Wed, 25 Mar 2020 16:50:16 -0500
Message-Id: <20200325215027.28716-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Since that SoundWire series will not be in 5.7, the build support for
SOF w/ SoundWire is not provided for now, and fall-back functions will
be used. This code is tested on a daily basis in the SOF tree and is
not expected to change in significant ways.

Changes since v2:
Corrected error in ACPI table (thanks Amadeusz)
Added patch 11 to add reset cycle required on some SoundWire platforms

Bard Liao (1):
  ASoC: SOF: Intel: hda: merge IPC, stream and SoundWire interrupt
    handlers

Pierre-Louis Bossart (8):
  ASoC: soc-acpi: expand description of _ADR-based devices
  ASoC: SOF: Intel: add SoundWire configuration interface
  ASoC: SOF: IPC: dai-intel: move ALH declarations in header file
  ASoC: SOF: Intel: hda: add SoundWire stream config/free callbacks
  ASoC: SOF: Intel: hda: initial SoundWire machine driver autodetect
  ASoC: SOF: Intel: hda: disable SoundWire interrupts on suspend
  ASoC: SOF: Intel: hda: add parameter to control SoundWire clock stop
    quirks
  ASoC: SOF: Intel: hda-ctrl: add reset cycle before parsing
    capabilities

Rander Wang (2):
  ASoC: SOF: Intel: hda: add WAKEEN interrupt support for SoundWire
  Asoc: SOF: Intel: hda: check SoundWire wakeen interrupt in irq thread

 include/sound/soc-acpi.h                      |  39 +-
 include/sound/sof/dai-intel.h                 |  18 +-
 .../intel/common/soc-acpi-intel-cml-match.c   |  87 +++-
 .../intel/common/soc-acpi-intel-icl-match.c   |  97 ++++-
 .../intel/common/soc-acpi-intel-tgl-match.c   |  49 ++-
 sound/soc/sof/intel/hda-ctrl.c                |  25 +-
 sound/soc/sof/intel/hda-dsp.c                 |   2 +
 sound/soc/sof/intel/hda-loader.c              |  31 ++
 sound/soc/sof/intel/hda.c                     | 400 ++++++++++++++++++
 sound/soc/sof/intel/hda.h                     |  66 +++
 10 files changed, 750 insertions(+), 64 deletions(-)

-- 
2.20.1

