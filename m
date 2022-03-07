Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD994D061B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 19:14:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0008217A0;
	Mon,  7 Mar 2022 19:13:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0008217A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646676867;
	bh=OJ6GNJI5FJMmgTVuJ2vlGnKxlLNPjXO7cBU1IXOuRq8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JQvMAdLIEywsubrdHhHeiZO5GQUaFW+0EZHqJmTL5QMA+DeiZgWeuvlivFi99lkwJ
	 G9k339W6Gy6zrNVMPBBJbYFznGtuvCggENIh31ql1EHwP+MWHZa3Xd08aab5VPuBlu
	 UAHuWcU/zU6B444cHLeJlZRccLFY8lByChs1hQk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8BF5F80132;
	Mon,  7 Mar 2022 19:11:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5A44F80536; Mon,  7 Mar 2022 19:11:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3F86F8013F
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 19:11:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3F86F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DlRAN/Cu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646676692; x=1678212692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OJ6GNJI5FJMmgTVuJ2vlGnKxlLNPjXO7cBU1IXOuRq8=;
 b=DlRAN/CulSxbcB5fC3t7fng+5Y7HiNmqfVOWHrnJ8sXOfkS0BEI4zYHr
 4q6JOpGMhXPC/N5cY+lm9C87SpuCREgy7tdKLgliOxolh3hQnd16cvrjr
 DfbW7GkzX92U1Wjs5gyQ74iA6d0qo67bktneFsbXN97d9adimY884/tvB
 wTEo06lWKJgZgIC4BWvpOBSDo+T4B9mq+onvGHQUAC9dI8Xos9mGkJeX6
 Wew27ijiwIULkJFFTX6LsCq8fEcv+FdMTuh6EhnDdWSOkK67FYbqPmv6M
 TEGeRf7Ajmtxk8+XaMey2Cd7yTKoGdV2sX3KpKh09oNGAO/H6ndOEJ/TX g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254401317"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254401317"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:26 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="495146665"
Received: from echun1-mobl.amr.corp.intel.com (HELO rsridh2-mobl1.localdomain)
 ([10.251.130.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:26 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/18] ASoC: SOF: topology: remove redundant code in
 sof_link_afe_load()
Date: Mon,  7 Mar 2022 10:10:59 -0800
Message-Id: <20220307181111.49392-7-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
References: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

Looks like a copy-paste error. The CPU DAI is never used.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 15ec59596300..c31358aa8a75 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3014,7 +3014,6 @@ static int sof_link_afe_load(struct snd_soc_component *scomp, int index,
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &cfg->priv;
-	struct snd_soc_dai *dai;
 	u32 size = sizeof(*config);
 	int ret;
 
@@ -3033,12 +3032,6 @@ static int sof_link_afe_load(struct snd_soc_component *scomp, int index,
 	dev_dbg(scomp->dev, "AFE config rate %d channels %d format:%d\n",
 		config->afe.rate, config->afe.channels, config->afe.format);
 
-	dai = snd_soc_find_dai(link->cpus);
-	if (!dai) {
-		dev_err(scomp->dev, "%s: failed to find dai %s", __func__, link->cpus->dai_name);
-		return -EINVAL;
-	}
-
 	config->afe.stream_id = DMA_CHAN_INVALID;
 
 	ret = sof_set_dai_config(sdev, size, link, config);
-- 
2.25.1

