Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E47920A57F
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 21:14:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 390541A3C;
	Thu, 25 Jun 2020 21:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 390541A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593112493;
	bh=jXoM1LOipa+LeTqxrWgxUwvuwDhYjvBTkhMPBUKE3DQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cv0bP2jx8mPXT7xi5KEN+4pAenMDb9j4ebjzYxLOewsx3fCxgQPHOPIg9/UrR+cJI
	 fLXTuaSREHRTxFMzICUs3SHkoK8mb1j9UeuVKjYCmbB+7oR+/+5uMlAajnYmOubqaF
	 q66h6pheJFNjAPzoqvcXj9igYaM5ZjT66krep+Qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33EE6F802A8;
	Thu, 25 Jun 2020 21:13:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1527F802A2; Thu, 25 Jun 2020 21:13:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD6B7F80218
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 21:13:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD6B7F80218
IronPort-SDR: mkT9tLU6ej8fxVgOrB30y70y+Z0+JFV5Pcz+PwJcK7DbRLJ9pHg0r9I1YX2Z0aOOM3kLdZQD4u
 KAn0hRTFYx1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="144120811"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="144120811"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:32 -0700
IronPort-SDR: Pt2+MZ2iPRa3OWpxehQozcYodxcz+LrW95wMY3WpKrL7mz1XHoLBQZCftI+qw4a3nB7kNVZqVL
 ROG0IftXjgKA==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="354559462"
Received: from zeqimao-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.109.39])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/17] ASoC: Intel: machine driver updates for 5.9
Date: Thu, 25 Jun 2020 14:12:51 -0500
Message-Id: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
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

This patchset adds:

a) fixes for missing .owner = THIS_MODULE initializations for
snd_soc_card structures

b) extensions for TigerLake and JasperLake reusing the same machine
drivers.

c) Max98373 support for SoundWire machine driver.

d) cleanups (use-after-free, quirks, etc).

Bard Liao (1):
  ASoC: intel: cml_rt1011_rt5682: use for_each_card_prelinks

Dharageswari R (3):
  ASoC: Intel: Boards: tgl_max98373: add dai_trigger function
  ASoC: Intel: Boards: tgl_max98373: Fix the comment for
    max_98373_components
  ASoC: Intel: Boards: tgl_max98373: Update TDM configuration in
    hw_params

Fred Oh (3):
  ASoC: Intel: Boards: cml_rt1011_rt5682: reduce log level for printing
    quirk
  ASoC: Intel: Boards: cml_rt1011_rt5682: use statically define codec
    config
  ASoc: Intel: cml_rt1011_rt5682: explicitly access first codec

Naveen Manohar (2):
  ASoC: Intel: sof_sdw: Add MAX98373 support
  ASoC: Intel: common: add match table for TGL MAX98373 + RT5682
    SoundWire driver

Pierre-Louis Bossart (6):
  ASoC: SOF: nocodec: add missing .owner field
  ASoC: Intel: cml_rt1011_rt5682: add missing .owner field
  ASoC: Intel: sof_sdw: add missing .owner field
  ASoC: Intel: bxt_rt298: add missing .owner field
  ASoC: Intel: sof_sdw: add quirk override with kernel parameter
  ASoC: Intel: boards: byt*.c: remove cast in dev_info quirk log

Yong Zhi (1):
  ASoC: intel: sof_rt5682: Add support for jsl-max98360a-rt5682

randerwang (1):
  ASoC: Intel: sdw_max98373: add card_late_probe support

 sound/soc/intel/boards/Kconfig                |  3 +-
 sound/soc/intel/boards/Makefile               |  2 +
 sound/soc/intel/boards/bxt_rt298.c            |  2 +
 sound/soc/intel/boards/bytcht_es8316.c        |  5 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |  4 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |  4 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c    | 90 ++++++-------------
 sound/soc/intel/boards/sof_maxim_common.c     | 55 ++++++++++--
 sound/soc/intel/boards/sof_maxim_common.h     |  3 +
 sound/soc/intel/boards/sof_rt5682.c           | 32 +++++++
 sound/soc/intel/boards/sof_sdw.c              | 72 ++++++++++++++-
 sound/soc/intel/boards/sof_sdw_common.h       | 15 ++++
 sound/soc/intel/boards/sof_sdw_max98373.c     | 86 ++++++++++++++++++
 .../intel/common/soc-acpi-intel-jsl-match.c   | 13 +++
 .../intel/common/soc-acpi-intel-tgl-match.c   | 25 ++++++
 sound/soc/sof/nocodec.c                       |  1 +
 16 files changed, 332 insertions(+), 80 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_max98373.c


base-commit: 6f81e520b2906258a063f09b8d1dd9d0cc6a3172
-- 
2.20.1

