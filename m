Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9723030FE6C
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 21:35:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 284C01663;
	Thu,  4 Feb 2021 21:34:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 284C01663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612470923;
	bh=rC3oRI1RdnBZQNUW8V3CD+cYn6Qfeov66Jahy/itFCA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZdKF+1BSxMMC70ORUX59JV47vwCIOaOcAjqGOsQ+2rC6kKVP+4v2Dv7gTekkt//TP
	 zcTcS+YygETSgT7TkfyqyLSX1G4C0nQf5jDzQN4akSCVgCf2uvCY15+fwKu37xuAN/
	 6cPIFf4Z7xFcGrJJ0ADLS3PtA2XH10XgNo1I5FgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 739B9F80171;
	Thu,  4 Feb 2021 21:33:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB37AF8023E; Thu,  4 Feb 2021 21:33:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0791CF80155
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 21:33:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0791CF80155
IronPort-SDR: UGFxH/ADshXQsonUpn8Ag12Cyit1QUx7uaZ8fZ2SfHMBNll4VGfWrkc7L6zAs/XSHO83h0vwoz
 X5DZDEto64UQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="181472429"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="181472429"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:33:39 -0800
IronPort-SDR: l9Wnkr1tXVEUndaIAaHmX+EbbKgutnnfxSXiJWTMlYXueLiXG0FD0d8Ca+3CUAwTKS6f9Pg1q6
 ua/mfJTk/Tgw==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="483700263"
Received: from jdasilva-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.66.22])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:33:36 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/14] ASoC: SOF/Intel/SoundWire: add missing quirks and DMIC
 support
Date: Thu,  4 Feb 2021 14:32:58 -0600
Message-Id: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, broonie@kernel.org,
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

HP Spectre x360 convertible devices rely on a mixed SoundWire+DMIC
configuration which wasn't well supported. This lead to the discovery
that we missed the TGL_HDMI quirk on a number of Dell devices, the
addition of DMIC autodetection (based on NHLT tables), the addition of
new component strings needed by UCM, and work-arounds due to
problematic DSDT tables.

Bard Liao (1):
  ASoC: Intel: sof_sdw: add trace for dai links

Guennadi Liakhovetski (1):
  ASoC: SOF: Intel: HDA: don't keep a temporary variable

Pierre-Louis Bossart (11):
  ASoC: Intel: sof_sdw: add missing TGL_HDMI quirk for Dell SKU 0A3E
  ASoC: Intel: sof_sdw: add missing TGL_HDMI quirk for Dell SKU 0A5E
  ASoC: Intel: sof_sdw: add missing TGL_HDMI quirk for Dell SKU 0A32
  ASoC: Intel: sof_sdw: reorganize quirks by generation
  ASoC: Intel: sof-sdw: indent and add quirks consistently
  ASoC: Intel: sof_sdw: add quirk for HP Spectre x360 convertible
  ASoC: Intel: sof_sdw: add mic:dmic and cfg-mics component strings
  ASoC: Intel: soc-acpi: add ACPI matching table for HP Spectre x360
  ASoC: SOF: Intel: SoundWire: refine ACPI match
  ASoC: SOF: Intel: detect DMIC number in SoundWire mixed config
  ASoC: SOF: Intel: hda: add dev_dbg() when DMIC number is overridden

Rander Wang (1):
  ASoC: Intel: sof_sdw: detect DMIC number based on mach params

 sound/soc/intel/boards/sof_sdw.c              | 131 ++++++-----
 .../intel/common/soc-acpi-intel-tgl-match.c   |  20 ++
 sound/soc/sof/intel/hda.c                     | 208 ++++++++++++------
 3 files changed, 241 insertions(+), 118 deletions(-)

-- 
2.25.1

