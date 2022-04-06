Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 571FD4F6983
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 21:02:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E86DF16D9;
	Wed,  6 Apr 2022 21:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E86DF16D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649271773;
	bh=O93XkqJWj1bVUOBqkfz/Mrf6rX7jNUdpY+DBzkrYIIY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GL2GxKnCybC45w3XxbIHjwKvYzdkkoW5wAkohFvtA4mHadrwhNTfKQVcXEQst+pVV
	 7u0096bfRX+76V/9Cs5SLZogR+B5lVZHf3zimyGwGJc4QMHZMJenGqISNlgHAzdPPz
	 8u9bPrVhhstQR7tJ9z6q/w2yKbCun3/HXxeRtKJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 230D9F804C3;
	Wed,  6 Apr 2022 21:01:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77355F80475; Wed,  6 Apr 2022 21:01:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C064CF80141
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 21:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C064CF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mgi6wzCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649271679; x=1680807679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O93XkqJWj1bVUOBqkfz/Mrf6rX7jNUdpY+DBzkrYIIY=;
 b=mgi6wzCqlTGOnvD0dAwXaEO+q7zrxTdbHnfED3UPjCvmPvyK7ycq/cM5
 wwKMnP9PXGJe/zDIMHmQnOA1DphMC950jl4nLeHw4igkJQL38IlFBak1j
 MH/jN9x4aeCWTltHhcxYO//QPmJ3j54g7whT3DT20wThhBOw/TtjwJyRb
 nP9WDbr2uxq73RYW85L8lLep8oXqJ3mRQHRejnuyvE1Zxs1jrJDNXIo0c
 dub/0vhnxDrsnFWEW8tm8+yzwEKppYxqNIfMSa7QGjfkhp6dg/mPG1V2k
 fFXAIU6HP+uTmPzRfKI2IXMNpADwS9dJMwjNLzH4YFfybVDcmQ7rZPIe+ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="248655769"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="248655769"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:01:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="570700449"
Received: from cbok-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.137.86])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:01:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: soc-pcm: improve BE transition for PAUSE_RELEASE
Date: Wed,  6 Apr 2022 14:00:55 -0500
Message-Id: <20220406190056.233481-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406190056.233481-1-pierre-louis.bossart@linux.intel.com>
References: <20220406190056.233481-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@intel.com>,
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

Commit 3aa1e96a2b95 ("ASoC: soc-pcm: fix BE handling of PAUSE_RELEASE")
did not modify the existing logic and kept the same logic for the following
transition

    play FE1    -> BE state is START
    pause FE1   -> BE state is PAUSED
    play FE2    -> BE state is START
    stop FE2    -> BE state is STOP <<< !!
    release FE1 -> BE state is START
    stop FE1    -> BE state is STOP

At the time it was identified by reviewers that a better solution
might consist in

    play FE1    -> BE state is START
    pause FE1   -> BE state is PAUSED
    play FE2    -> BE state is START
    stop FE2    -> BE state is PAUSE <<< !!
    release FE1 -> BE state is START
    stop FE1    -> BE state is STOP

This patch suggest a transition to PAUSE when all the 'active' streams
are paused. This would allow for a more consistent resource management
for platforms where PAUSE and STOP are handled differently.

To track the special case of an FE going from PAUSE_PUSH to STOP, we
add a state variable for each FE context. This 'fe_pause' boolean is
set on PAUSE_PUSH and cleared on either PAUSE_RELEASE and STOP
triggers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc-dpcm.h |  2 ++
 sound/soc/soc-pcm.c      | 31 ++++++++++++++++++++++++++++---
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index 75b92d883976..5b689c663290 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -103,6 +103,8 @@ struct snd_soc_dpcm_runtime {
 	int trigger_pending; /* trigger cmd + 1 if pending, 0 if not */
 
 	int be_start; /* refcount protected by BE stream pcm lock */
+	int be_pause; /* refcount protected by BE stream pcm lock */
+	bool fe_pause; /* used to track STOP after PAUSE */
 };
 
 #define for_each_dpcm_fe(be, stream, _dpcm)				\
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 11c9853e9e80..e8700dd1839f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2090,6 +2090,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			       int cmd)
 {
 	struct snd_soc_pcm_runtime *be;
+	bool pause_stop_transition;
 	struct snd_soc_dpcm *dpcm;
 	unsigned long flags;
 	int ret = 0;
@@ -2148,10 +2149,12 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 			if (!be->dpcm[stream].be_start &&
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START) &&
-			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
 			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				goto next;
 
+			fe->dpcm[stream].fe_pause = false;
+			be->dpcm[stream].be_pause--;
+
 			be->dpcm[stream].be_start++;
 			if (be->dpcm[stream].be_start != 1)
 				goto next;
@@ -2175,14 +2178,33 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if (be->dpcm[stream].be_start != 0)
 				goto next;
 
-			ret = soc_pcm_trigger(be_substream, cmd);
+			pause_stop_transition = false;
+			if (fe->dpcm[stream].fe_pause) {
+				pause_stop_transition = true;
+				fe->dpcm[stream].fe_pause = false;
+				be->dpcm[stream].be_pause--;
+			}
+
+			if (be->dpcm[stream].be_pause != 0)
+				ret = soc_pcm_trigger(be_substream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
+			else
+				ret = soc_pcm_trigger(be_substream, SNDRV_PCM_TRIGGER_STOP);
+
 			if (ret) {
 				if (be->dpcm[stream].state == SND_SOC_DPCM_STATE_START)
 					be->dpcm[stream].be_start++;
+				if (pause_stop_transition) {
+					fe->dpcm[stream].fe_pause = true;
+					be->dpcm[stream].be_pause++;
+				}
 				goto next;
 			}
 
-			be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
+			if (be->dpcm[stream].be_pause != 0)
+				be->dpcm[stream].state = SND_SOC_DPCM_STATE_PAUSED;
+			else
+				be->dpcm[stream].state = SND_SOC_DPCM_STATE_STOP;
+
 			break;
 		case SNDRV_PCM_TRIGGER_SUSPEND:
 			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
@@ -2204,6 +2226,9 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
 				goto next;
 
+			fe->dpcm[stream].fe_pause = true;
+			be->dpcm[stream].be_pause++;
+
 			be->dpcm[stream].be_start--;
 			if (be->dpcm[stream].be_start != 0)
 				goto next;
-- 
2.30.2

