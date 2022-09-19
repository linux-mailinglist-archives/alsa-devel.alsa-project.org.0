Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C78B95BCBBA
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:23:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F1AA1669;
	Mon, 19 Sep 2022 14:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F1AA1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663590227;
	bh=2CpnRMIBwheqIQNwxQMpej/NVaa5zxJGTOzID0YwrS8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dnt7Vzapp3H1C0R17YVbDRrET2ewSkuGhhwKNIAM0DU4n2lhMnuESAcR3U2cXHQP9
	 l3KLcWsrn2wal+W0AYJU0XCwjzC+vQ6XEuuRtWh6bp8EjJ+CdgSypoVGPc3M9XMZ1/
	 SY3OwV1uZfjZ66i3GDf9MuJil4McT/RU2P4BDOCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BB7BF80551;
	Mon, 19 Sep 2022 14:22:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 924EAF8054A; Mon, 19 Sep 2022 14:22:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDB47F80539
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDB47F80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YOqgJla5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663590117; x=1695126117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2CpnRMIBwheqIQNwxQMpej/NVaa5zxJGTOzID0YwrS8=;
 b=YOqgJla5RYT6OQUOU4JptSdjjVjKWTws15LRqY/pl14eoCugpp9q94CP
 6zDsQCZGB+I1sRfn78YYXEfraHRamL9+KIrHkydKISyOu3NpzYCncsTPX
 Euj9mRlJVSGf5z6xi0h1cYBzNuQ83NSclhkpYfKEhla6oVSzbJo6BKbyw
 /9OpEvLiZre9boORYnHbnx/+bcaO9Aue5La+gJwTtxdLi2TaFA1rwzq/Z
 yf+zdAfYElJFFGv3wmDDcK2DYhej1+zys4flPw7O3PGjEQmmZdcbqc61h
 QU3HgsOm8XjGrGJnD0lUZG/orkoKYY6Inbhul6ysArhQ6PM3JVhlPU+1C Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="361123268"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="361123268"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:21:53 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="620837679"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:21:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/7] ASoC: SOF: remove unneeded dev_vdbg
Date: Mon, 19 Sep 2022 14:21:05 +0200
Message-Id: <20220919122108.43764-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919122108.43764-1-pierre-louis.bossart@linux.intel.com>
References: <20220919122108.43764-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Noah Klayman <noah.klayman@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
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

From: Noah Klayman <noah.klayman@intel.com>

This patch removes some unneeded dev_vdbg calls.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Noah Klayman <noah.klayman@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-utils.c | 2 --
 sound/soc/sof/topology.c  | 9 ---------
 2 files changed, 11 deletions(-)

diff --git a/sound/soc/sof/sof-utils.c b/sound/soc/sof/sof-utils.c
index a3300ecee0628..b6345a7345af7 100644
--- a/sound/soc/sof/sof-utils.c
+++ b/sound/soc/sof/sof-utils.c
@@ -45,8 +45,6 @@ int snd_sof_create_page_table(struct device *dev,
 		u32 pfn = snd_sgbuf_get_addr(dmab, i * PAGE_SIZE) >> PAGE_SHIFT;
 		u8 *pg_table;
 
-		dev_vdbg(dev, "pfn i %i idx %d pfn %x\n", i, idx, pfn);
-
 		pg_table = (u8 *)(page_table + idx);
 
 		/*
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 9273a70fec25c..6087483deb48e 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1011,9 +1011,6 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 	}
 
 	list_for_each_entry(rtd, &card->rtd_list, list) {
-		dev_vdbg(scomp->dev, "tplg: check widget: %s stream: %s dai stream: %s\n",
-			 w->name,  w->sname, rtd->dai_link->stream_name);
-
 		/* does stream match DAI link ? */
 		if (!rtd->dai_link->stream_name ||
 		    strcmp(w->sname, rtd->dai_link->stream_name))
@@ -1537,9 +1534,6 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 
 	stream = SNDRV_PCM_STREAM_PLAYBACK;
 
-	dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: playback d0i3:%d\n",
-		 spcm->pcm.pcm_name, spcm->stream[stream].d0i3_compatible);
-
 	caps = &spcm->pcm.caps[stream];
 
 	/* allocate playback page table buffer */
@@ -1567,9 +1561,6 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	if (!spcm->pcm.capture)
 		return ret;
 
-	dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: capture d0i3:%d\n",
-		 spcm->pcm.pcm_name, spcm->stream[stream].d0i3_compatible);
-
 	caps = &spcm->pcm.caps[stream];
 
 	/* allocate capture page table buffer */
-- 
2.34.1

