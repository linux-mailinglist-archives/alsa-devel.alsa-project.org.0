Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 480E63AF665
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 21:45:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0E711672;
	Mon, 21 Jun 2021 21:45:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0E711672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624304755;
	bh=44OsWvZdy0J3kbj30Em7hjJLSjPHmSPV3BXSQQZGftQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jE0QldoDAEfUOr8WST9BVewTvW/LJmJBJl0DA3+mknC5VLzZpI3UqPzrDa2UUB7RW
	 fJx/gRPhgasrDLxp5GyMeDWlSzX9PoYF+XlSFvV0TzoRQquPs50TeqARiK+z0zVn7W
	 Qzc2bZa5NU/PBxQi7ctN+jWvuOEm9C7x071R1C60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E809FF80511;
	Mon, 21 Jun 2021 21:41:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84D82F804E2; Mon, 21 Jun 2021 21:41:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 574FAF804DA
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 21:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 574FAF804DA
IronPort-SDR: ShC/nMDU/I6AZY2CoHeaFFfvUHYOVP1QMghRtKlHk4d5tfI0bVhJPpgW8Q/HnHZGCXvcRg0zil
 y3TV1n1MYjIQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="203903345"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="203903345"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:41:26 -0700
IronPort-SDR: 7YWgFvMXGKiWAxENAbjR2t63i1rHGsTVydr4SHt1cGhYliHzkCN9fAKnPHAvzZH+et6avwTWQQ
 b7EfAi1j/41w==
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="486619095"
Received: from gwhaugh-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.175.53])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 12:41:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 10/10] ASoC: Intel: skl_hda_dsp_generic: Update Kconfig
 documentation
Date: Mon, 21 Jun 2021 14:40:57 -0500
Message-Id: <20210621194057.21711-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621194057.21711-1-pierre-louis.bossart@linux.intel.com>
References: <20210621194057.21711-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

The Kconfig documentation for SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
is a bit misleading as it refers to a set of older platforms,
while in practise this machine driver supports all modern
Intel systems with Smart Sound Technology based DSP and HDA codecs.

Modify the Kconfig text to reflect current state.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index eef5f4ac87c5..7e29b0d911e2 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -442,7 +442,7 @@ endif ## SND_SOC_SOF_GEMINILAKE
 if SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC || SND_SOC_SOF_HDA_AUDIO_CODEC
 
 config SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
-	tristate "SKL/KBL/BXT/APL with HDA Codecs"
+	tristate "Skylake+ with HDA Codecs"
 	depends on SND_HDA_CODEC_HDMI
 	depends on GPIOLIB
 	select SND_SOC_HDAC_HDMI
@@ -450,8 +450,9 @@ config SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
 	select SND_SOC_DMIC
 	# SND_SOC_HDAC_HDA is already selected
 	help
-	  This adds support for ASoC machine driver for Intel platforms
-	  SKL/KBL/BXT/APL with iDisp, HDA audio codecs.
+	  This adds support for ASoC machine driver for Intel Skylake+
+	  platforms with display (HDMI/DP) and HDA audio codecs, and
+	  Smart Sound Technology (SST) integrated audio DSP.
 	  Say Y or m if you have such a device. This is a recommended option.
 	  If unsure select "N".
 
-- 
2.25.1

