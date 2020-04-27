Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 058721BAA7B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 18:54:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE0661689;
	Mon, 27 Apr 2020 18:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE0661689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588006441;
	bh=QVtzjeEH+FjT1Xk5fMn1gE179l6cVVtmm9zG/y3+24U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hw4O35PGAr1T6TlanN0v4dVD4V3/NxuPLnvci491PUYeGOqwMIE4q73NI4dZIsLJ3
	 m0AP5xK6OZz/BFtRKz6PA18UmmZpz5uD2mrO1EBa8F6XghPDRL7dDeNAC6mRz+mgtR
	 RAUwqv1q+YkXJlpawtwOoMRw0K0g7IcNWalGmpIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E21A2F80245;
	Mon, 27 Apr 2020 18:52:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BCB0F80112; Mon, 27 Apr 2020 18:52:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D7C8F80112
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 18:52:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D7C8F80112
IronPort-SDR: I4/mTYb7pDBiB+qCXBWBx3DWab5cynprtXY5uqxKfD1BCEq/zy8B//vzMXMtmAcekFb5JVLDaF
 UuCCtWMeZD+g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 09:52:11 -0700
IronPort-SDR: 7mbiFekdJ30bCfO51BZL+5GIDFB0uZWY8dEF+njlG13GxNPqFGg2Rfnt7Xs2aNZNb1lQt0oB2D
 9snN7FlYbolQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="248925565"
Received: from dbombien-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.51.189])
 by fmsmga008.fm.intel.com with ESMTP; 27 Apr 2020 09:52:11 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] Kconfig updates for DMIC and SOF HDMI support
Date: Mon, 27 Apr 2020 09:52:07 -0700
Message-Id: <20200427165211.23463-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

This series provides the following updtes to the Intel machine driver
Kconfig:

1. The first patch adds the explicit dependency on GPIOLIB when
SND_SOC_DMIC is selected.

2. SND_SOC_SOF_HDA_AUDIO_CODEC is required for using the legacy
HDA codec driver for HDMI support in SOF. The last 3 three patches
make the required changes to account for this.

Libin Yang (3):
  ASoC: intel: add depends on SND_SOC_SOF_HDA_AUDIO_CODEC for common
    hdmi
  ASoC: sof-sdw: remove CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC condition
  ASoC: sof_pcm512x: remove CONFIG_SND_HDA_CODEC_HDMI condition

Pierre-Louis Bossart (1):
  ASoC: Intel: boards: add explicit dependency on GPIOLIB when DMIC is
    used

 sound/soc/intel/boards/Kconfig        | 51 ++++++++++++++-------------
 sound/soc/intel/boards/sof_pcm512x.c  |  9 -----
 sound/soc/intel/boards/sof_sdw.c      |  8 -----
 sound/soc/intel/boards/sof_sdw_hdmi.c |  7 ----
 4 files changed, 26 insertions(+), 49 deletions(-)

-- 
2.17.1

