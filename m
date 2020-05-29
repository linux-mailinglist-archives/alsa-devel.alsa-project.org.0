Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E5C1E87FA
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 21:37:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17B5E179D;
	Fri, 29 May 2020 21:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17B5E179D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590781070;
	bh=CbxaKKS49OZ0Noa3PpjoBQwsZ09v9N+EUq4hV3dHJL8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VAHo8cgLsbaiXSV6CfyLV7NQG0Pg/gBo7/Q6Rm7y3cP/WEVLIOgkgr/S4mYc1GsnB
	 /I6Rul3mAtS6l+2bOgowss12aik5DqbsmPraSVdVIZU2yc14Q743ftOmTQSLMouPxi
	 WXKKIcMkAR5C/ntyGYHM3YRDk1osZhxy0bjYnvjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16717F8021E;
	Fri, 29 May 2020 21:36:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A238FF80227; Fri, 29 May 2020 21:36:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C72AF800FF
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 21:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C72AF800FF
IronPort-SDR: HqwQkFNH2MsKoRUPMPueHZ+CFdkxPj4s73N2jWztK3vKnuM4AmcTJuyr5ERYKhgRSgHbFvLGY4
 GrLit3taUJ7g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 12:35:52 -0700
IronPort-SDR: eEbZtU0jM/vtrg4PR64MbPea654dgfygk6UhQRKGIETKVYV7klIEVGExncecSphE4CPH9oSwzU
 6qeLhnxbL2dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,449,1583222400"; d="scan'208";a="469605864"
Received: from jbrayton-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.97.254])
 by fmsmga006.fm.intel.com with ESMTP; 29 May 2020 12:35:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/3] Kconfig updates for DMIC and SOF HDMI support
Date: Fri, 29 May 2020 14:35:44 -0500
Message-Id: <20200529193547.6077-1-pierre-louis.bossart@linux.intel.com>
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

This series provides the following updates to the Intel machine driver
Kconfig:

1. The first patch adds the explicit dependency on GPIOLIB when
SND_SOC_DMIC is selected.

2. SND_SOC_SOF_HDA_AUDIO_CODEC is required for using the legacy
HDA codec driver for HDMI support in SOF. The last 3 three patches
make the required changes to account for this.

changes since v1:
first patch for DMIC was merged already
rebase for HDMI on top of Arnd's RT5682 changes.

Libin Yang (3):
  ASoC: intel: add depends on SND_SOC_SOF_HDA_AUDIO_CODEC for common
    hdmi
  ASoC: sof-sdw: remove CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC condition
  ASoC: sof_pcm512x: remove CONFIG_SND_HDA_CODEC_HDMI condition

 sound/soc/intel/boards/Kconfig        | 20 ++++++++++----------
 sound/soc/intel/boards/sof_pcm512x.c  |  9 ---------
 sound/soc/intel/boards/sof_sdw.c      |  8 --------
 sound/soc/intel/boards/sof_sdw_hdmi.c |  7 -------
 4 files changed, 10 insertions(+), 34 deletions(-)


base-commit: 89d73ccab20a684d8446cea4d8ac6a2608c8d390
-- 
2.20.1

