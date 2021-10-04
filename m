Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 353F242192F
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 23:23:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A76EF166A;
	Mon,  4 Oct 2021 23:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A76EF166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633382602;
	bh=3Kfi2Qx7jXk78ciHWk6W1665NCMC9sDhawHqihhx/gU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mwpD68Ly99pOGG9QVtTk37u64UwGCLS5hexeEU9hLtZBtsSYFq2ZSkekBiNshfMtk
	 BQuYtk0Nrv0OSeGen+SFsZ+cqT3YwwhV/5FIR5RiMDeb6QnBXVCPuQ9AhSD4EXFDOB
	 g9nLwvmjILz5npe9Q2RSIS4L99KbniN0Ieiu+rhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43AF3F80229;
	Mon,  4 Oct 2021 23:22:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A747CF800BA; Mon,  4 Oct 2021 23:22:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A6ABF800BA
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 23:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A6ABF800BA
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="225905358"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="225905358"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 14:21:51 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="558949061"
Received: from ksgonzal-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.181.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 14:21:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: soc-pcm: restore mixer functionality
Date: Mon,  4 Oct 2021 16:21:41 -0500
Message-Id: <20211004212141.193136-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Sameer Pujar <spujar@nvidia.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Recent changes in soc-pcm completely broke basic support for mixers on
Intel systems: the filters on BE states prevent the connection of a
second mixer input while the back-end is already active.

Rather than reverting the changes, which would be problematic for
Tegra systems, this patch suggests an additional filter which will
only apply to Tegra systems. This is a temporary solution which will
have to be revisited - additional issues have been reported with DPCM.

Fixes: 0c25db3f7621 ('ASoC: soc-pcm: Don't reconnect an already active BE')
Suggested-by: Sameer Pujar <spujar@nvidia.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/soc-pcm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b5825d8d6caa..0aa0ae9703d1 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1395,7 +1395,13 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 		if (!fe->dpcm[stream].runtime && !fe->fe_compr)
 			continue;
 
-		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_NEW) &&
+		/*
+		 * Filter for systems with 'component_chaining' enabled.
+		 * This helps to avoid unnecessary re-configuration of an
+		 * already active BE on such systems.
+		 */
+		if (fe->card->component_chaining &&
+		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_NEW) &&
 		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_CLOSE))
 			continue;
 
-- 
2.25.1

