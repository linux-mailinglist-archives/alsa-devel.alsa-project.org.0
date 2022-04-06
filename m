Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BD84F6985
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 21:03:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D5431701;
	Wed,  6 Apr 2022 21:02:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D5431701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649271783;
	bh=z46n1V+SALPEkIujB4sbb2f2fZc5Ybo+VbDmf7JWd1g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AUtTJBRiqdy8s1Xia/iRAGQzDaoSZRY9H7WO7DVSr4wE/VpEjHG/E6rjwWfKHPWlw
	 o54QkpKYm3KHnDoxyk2DcBZ23cvUFzV3W8nR7Fp52ZoGmh+3VoNMGGtGzje1rf3UsW
	 RkW8AhnzFrPr/C8I3DbpfdygcwelzdrphfD4FbjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3A81F800D1;
	Wed,  6 Apr 2022 21:01:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81A49F80518; Wed,  6 Apr 2022 21:01:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D696DF800D1
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 21:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D696DF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CKhyRq2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649271681; x=1680807681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z46n1V+SALPEkIujB4sbb2f2fZc5Ybo+VbDmf7JWd1g=;
 b=CKhyRq2Pb1p1jd1J9TiAfwfYAjed+VY0XdozSww6AGy79ueN6BsAvqPm
 78iWNP8XMAtM/MRJIHwmyjZF2CpqkdArnBBnUn4Bd0Nrmf6zWVd6H3e6W
 W5ARqjElzIl+mPjcs9oP4IiuhT5QQ/wS/aJRht96G69Ocd+47Ge8l1WMS
 NqiCby73fS76rcA0JXhGLH+yFd2C2OVxj4llGC4gzPeYU0X8zo+ByTYjQ
 l3MTeVjSwk7XcJ6KnjTxNAuFnSC9S1W5MhYSJYYezX+TLP6HU9vDgRdYf
 +vn1ZlTcJzPGjrcCCO2XUxQQk0qZhG1MYk/I0gmKp/sEgx6EO0X0H9HIf A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="248655786"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="248655786"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:01:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="570700470"
Received: from cbok-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.137.86])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:01:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: soc-pcm: improve BE transition for TRIGGER_START
Date: Wed,  6 Apr 2022 14:00:56 -0500
Message-Id: <20220406190056.233481-3-pierre-louis.bossart@linux.intel.com>
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

When the BE was in PAUSED state, the correct trigger is PAUSE_RELEASE.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/soc-pcm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e8700dd1839f..6f43db35a5c8 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2122,6 +2122,13 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			if (be->dpcm[stream].be_start != 1)
 				goto next;
 
+			if (be->dpcm[stream].state == SND_SOC_DPCM_STATE_PAUSED)
+				ret = soc_pcm_trigger(be_substream,
+						      SNDRV_PCM_TRIGGER_PAUSE_RELEASE);
+			else
+				ret = soc_pcm_trigger(be_substream,
+						      SNDRV_PCM_TRIGGER_START);
+
 			ret = soc_pcm_trigger(be_substream, cmd);
 			if (ret) {
 				be->dpcm[stream].be_start--;
-- 
2.30.2

