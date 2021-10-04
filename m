Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC6B421947
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 23:29:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0611166A;
	Mon,  4 Oct 2021 23:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0611166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633382949;
	bh=a3h0Gtfj44lmSBVx2sbxZX4x5As5nA3ZIV0kdbxGGj0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CN9+W3LuGwzG5sQOhCs6P5FTcu+ejWZTE8gr2uBgdfqoUb/YTRMyigNozNPhXJX0K
	 2HPIZBKfiCY4GyR9WpusZEmus3OXf8tJe2f28IxpTWXz4qivp3Oh0Ptu/qmJF0pXTC
	 Lnba/8nwZxerRSyeCJ7/3dP4+OqidkVnCUpaHtc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAFE4F802D2;
	Mon,  4 Oct 2021 23:27:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1391EF802D2; Mon,  4 Oct 2021 23:27:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F54BF8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 23:27:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F54BF8010B
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="206410595"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="206410595"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 14:27:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="521586227"
Received: from ksgonzal-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.181.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 14:27:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: SOF: topology: show clks_control value in dynamic
 debug
Date: Mon,  4 Oct 2021 16:27:27 -0500
Message-Id: <20211004212729.199550-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004212729.199550-1-pierre-louis.bossart@linux.intel.com>
References: <20211004212729.199550-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <bard.liao@intel.com>
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

We log most of the SSP configurations except the clks_control. This
will be used to enable bclk/mclk early start so it's useful to show
the information to the user.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 43bd2f18c1c2..bd0d82b91465 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2827,12 +2827,12 @@ static int sof_link_ssp_load(struct snd_soc_component *scomp, int index,
 		config[i].ssp.rx_slots = le32_to_cpu(hw_config[i].rx_slots);
 		config[i].ssp.tx_slots = le32_to_cpu(hw_config[i].tx_slots);
 
-		dev_dbg(scomp->dev, "tplg: config SSP%d fmt 0x%x mclk %d bclk %d fclk %d width (%d)%d slots %d mclk id %d quirks %d\n",
+		dev_dbg(scomp->dev, "tplg: config SSP%d fmt %#x mclk %d bclk %d fclk %d width (%d)%d slots %d mclk id %d quirks %d clks_control %#x\n",
 			config[i].dai_index, config[i].format,
 			config[i].ssp.mclk_rate, config[i].ssp.bclk_rate,
 			config[i].ssp.fsync_rate, config[i].ssp.sample_valid_bits,
 			config[i].ssp.tdm_slot_width, config[i].ssp.tdm_slots,
-			config[i].ssp.mclk_id, config[i].ssp.quirks);
+			config[i].ssp.mclk_id, config[i].ssp.quirks, config[i].ssp.clks_control);
 
 		/* validate SSP fsync rate and channel count */
 		if (config[i].ssp.fsync_rate < 8000 || config[i].ssp.fsync_rate > 192000) {
-- 
2.25.1

