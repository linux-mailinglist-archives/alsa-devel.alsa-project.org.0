Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2E64ECDD4
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 22:24:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF1151AD1;
	Wed, 30 Mar 2022 22:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF1151AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648671849;
	bh=q3y09Q4+2MYqqMm3rWuuzbvhMnK3N+8P3Skff+My+Cw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ahRl7vR1uKIAnpmkYW/q93ryzBi4zU+cFuMai84qdyyBiXq48wrmNokz2B2l6C1Oo
	 AHx6k8VeTPElOXnihMySIEXAbcPCyAntaYx9XPk8x1UXp9QZGsckR0qRRDZFhDSQre
	 v6BHFCz9KUttyGUjvwJnIf8pZTFHYy8KHbc0kgZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FC7FF80552;
	Wed, 30 Mar 2022 22:20:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1826F80537; Wed, 30 Mar 2022 22:19:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AF0AF8051B
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 22:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AF0AF8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gte5sARB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648671588; x=1680207588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q3y09Q4+2MYqqMm3rWuuzbvhMnK3N+8P3Skff+My+Cw=;
 b=gte5sARBmBeIcU/DXPSvU7Od8Do0mlPWmLSeJOxevVqpKhCmjw/1JGX5
 HpA/7FYjj688O2h+ob3KKwo+C1eyUNF8V20vm7eZKQtKTrL1Uq+J3y22z
 wkPgH+YTACfRunjHGU2hfB/dVRxaeYKyjRknBnQU65QFmYsOo9y57tf8j
 WtwEIl2TzTUJGuRond8subpujcVrQ2v+rR1ITtP6WOrFXJSner31N6Ccr
 N4p2ATVDodqNHUSTSw/AkLStWOwAszWm5wkcf4ebQwdLDPA763PJX/Xh2
 f8utv8iJ1z0KaOPSK23sGYc3UDfxZAsnRfvSkWNvl5YGuVqlyUPjuvPMD g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322819836"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="322819836"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="522045049"
Received: from ggunnam-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.195])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:39 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/11] ASoC: SOF: Remove redundant return statements
Date: Wed, 30 Mar 2022 13:19:26 -0700
Message-Id: <20220330201926.1330402-12-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
References: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, tangmeng <tangmeng@uniontech.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: tangmeng <tangmeng@uniontech.com>

After the free PCM action is executed, no matter what
the return result is, it will return directly in sof_pcm_trigger.
So the return statement here is redundant.

Signed-off-by: tangmeng <tangmeng@uniontech.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/pcm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 658cd8966c9a..b5cbc8b5c0ee 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -347,12 +347,9 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 		snd_sof_pcm_platform_trigger(sdev, substream, cmd);
 
 	/* free PCM if reset_hw_params is set and the STOP IPC is successful */
-	if (!ret && reset_hw_params) {
+	if (!ret && reset_hw_params)
 		ret = sof_pcm_stream_free(sdev, substream, spcm, substream->stream,
 					  free_widget_list);
-		if (ret < 0)
-			return ret;
-	}
 
 	return ret;
 }
-- 
2.25.1

