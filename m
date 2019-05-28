Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA6C2CBF7
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 18:30:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01894183A;
	Tue, 28 May 2019 18:29:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01894183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559061034;
	bh=xqrhI7eoeJRE5jyTH7xJCRrf+nX8XcDgxFluCQ/WsXU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vBNQ+woQv04vF3erJzkOraBYDnGmslwhVr+DDgZrU16LI8PSs5C84CQXHuUBH20Xj
	 LHaBGWFo0waoCQnEID4BVqdNlGzSr/5FIlmu1ju5zUFgPPGxxQJ402LHn0FTcBqrsk
	 UaYSarHB6/2nJin/O+N3F3mGUtatoyfp/FRxKaks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CC5BF896EB;
	Tue, 28 May 2019 18:28:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1314F8065A; Tue, 28 May 2019 18:28:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6719F8065A
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 18:28:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6719F8065A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 09:28:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,523,1549958400"; d="scan'208";a="179257009"
Received: from ngnagark-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.104.129])
 by fmsmga002.fm.intel.com with ESMTP; 28 May 2019 09:28:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 28 May 2019 11:28:22 -0500
Message-Id: <20190528162822.9178-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 kbuild test robot <lkp@intel.com>
Subject: [alsa-devel] [PATCH] ASoC: Intel: sof-rt5682: fix undefined
	references with Baytrail-only support
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

The sof-rt5682 machine driver supports both legacy Baytrail devices
and more recent ApolloLake/CometLake platforms. When only Baytrail is
selected, the compilation fails with the following errors:

ERROR: "hdac_hdmi_jack_port_init"
[sound/soc/intel/boards/snd-soc-sof_rt5682.ko] undefined!

ERROR: "hdac_hdmi_jack_init"
[sound/soc/intel/boards/snd-soc-sof_rt5682.ko] undefined!

Fix by selecting SND_SOC_HDAC_HDMI unconditionally. The code for HDMI
support is not reachable on Baytrail so this change has no functional
impact.

Fixes: f70abd75b7c6 ("ASoC: Intel: add sof-rt5682 machine driver")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 59e366edc16b..317ee1e8c8c6 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -402,7 +402,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 		   (SND_SOC_SOF_BAYTRAIL && X86_INTEL_LPSS)
 	select SND_SOC_RT5682
 	select SND_SOC_DMIC
-	select SND_SOC_HDAC_HDMI if SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_HDAC_HDMI
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with rt5682 codec.
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
