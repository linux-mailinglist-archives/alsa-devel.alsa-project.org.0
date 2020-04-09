Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E2C1A3A1B
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 21:00:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA0A9169F;
	Thu,  9 Apr 2020 20:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA0A9169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586458824;
	bh=+9tSN25SCUtxsvkiCDjyPGFjRceNdh3kdnZ5aUzwvRk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B+zXAFB4bj14e+njuj5jNvFqBW3TEqtWKVUXeMEoSw7JN/7EzWbyBMW9w5WKLF5/h
	 C0xkK9gyNutLVXNfqGPLf7uELffTS6Gsal1YLNSwYOJC8sPJTtraKnYvC5+JpImOjU
	 skLilXxX30p/3hirItz4likWXJOJ+vrradN5ZcLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4D33F80273;
	Thu,  9 Apr 2020 20:58:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14872F801F9; Thu,  9 Apr 2020 20:58:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FEE3F80107
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 20:58:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FEE3F80107
IronPort-SDR: 5MQOp88+RtYQvU+DrfJHOKSphouwQQ7MzriMI+zP3bl94MA9IyY4RNyhE1BYert466ccO2PkxL
 Yg8i6qe3uV/w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 11:58:32 -0700
IronPort-SDR: Mk020IjdAamjiPNl0hO5Iunx2XFJtCT+sZH4x+tfAfOwDbVEK1I2z6CssdwTW3sOe8ToULJ1t0
 TwjKa5/fCAMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="255248796"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by orsmga006.jf.intel.com with ESMTP; 09 Apr 2020 11:58:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/13] ASoC: Intel: machine drivers update for 5.8
Date: Thu,  9 Apr 2020 13:58:14 -0500
Message-Id: <20200409185827.16255-1-pierre-louis.bossart@linux.intel.com>
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

This patchset
a) adds support for the Intel ElkhartLake platforms
b)aligns the HDaudio mic detection with the snd-hda-intel driver
c) correct DMIC missing configurations
d) fixes initialization/compilation problems for SoundWire platforms
d) completes the removal of codec_dais missing in Morimoto-san's series.

Bard Liao (1):
  ASoC: intel: sof_sdw: init all aggregated codecs

Hui Wang (1):
  ASoC: intel/skl/hda - set autosuspend timeout for hda codecs

Keyon Jie (1):
  ASoC: Intel: sof-da7219-max98373: add DMIC widget and route

Libin Yang (3):
  ALSA: hda: Add ElkhartLake HDMI codec vid
  ASoC: SOF: Intel: add PCI ID for ElkhartLake
  ASoC: Intel: boards: support Elkhart Lake with rt5660

Pierre-Louis Bossart (6):
  ASoC: Intel: sof_sdw_hdmi: fix compilation issue in fallback mode
  ASoC: Intel: sof_sdw_hdmi: remove codec_dai use
  ASoC: Intel: sof_sdw_rt1308: remove codec dai use
  ASoC: Intel: sof_sdw_rt5682: remove codec_dai use
  ASoC: Intel: sof_sdw_rt700: remove codec_dai use
  ASoC: Intel: sof_sdw_rt711: remove codec_dai use

Yong Zhi (1):
  ASoC: Intel: sof_da7219_max98373: Add BE dailink for dmic16k

 sound/pci/hda/patch_hdmi.c                    |   1 +
 sound/soc/intel/boards/Kconfig                |  15 +
 sound/soc/intel/boards/Makefile               |   2 +
 sound/soc/intel/boards/ehl_rt5660.c           | 323 ++++++++++++++++++
 sound/soc/intel/boards/skl_hda_dsp_generic.c  |  29 +-
 sound/soc/intel/boards/sof_da7219_max98373.c  |  21 ++
 sound/soc/intel/boards/sof_sdw.c              |  41 ++-
 sound/soc/intel/boards/sof_sdw_hdmi.c         |   4 +-
 sound/soc/intel/boards/sof_sdw_rt1308.c       |   2 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c       |   3 +-
 sound/soc/intel/boards/sof_sdw_rt700.c        |   3 +-
 sound/soc/intel/boards/sof_sdw_rt711.c        |   3 +-
 .../intel/common/soc-acpi-intel-ehl-match.c   |   7 +
 sound/soc/sof/sof-pci-dev.c                   |   2 +
 14 files changed, 434 insertions(+), 22 deletions(-)
 create mode 100644 sound/soc/intel/boards/ehl_rt5660.c


base-commit: dd8e871d4e560eeb8d22af82dde91457ad835a63
-- 
2.20.1

