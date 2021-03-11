Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05288336941
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 01:52:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8312A1704;
	Thu, 11 Mar 2021 01:51:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8312A1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615423923;
	bh=O5PZ0H43KGyU54JduFVdVlKVcKjE7aAz5R7Edh15h/g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Re20I0uaVw173uJifoddDYUAUxJJemwnkdKUhA9J5+4sRfNp/hUwe+6leQJWHDXnH
	 W0gURcq08UcI2eDzmimY+Hu4nrp3mrReOg/VwFF6AJhAq1ijaX45/G1fr5YpAejhAQ
	 ++6K4g49TU5qKgsDY/jEXLGkDAjpRvorXqCdGxd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5F2EF80482;
	Thu, 11 Mar 2021 01:49:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67B67F80430; Thu, 11 Mar 2021 01:49:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A8C3F8014E
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 01:49:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A8C3F8014E
IronPort-SDR: /fdsvnBupSTNThHlfo23tLOgSepzvEbnCWbFA6d3quMvek2iLGkIE8g0O7Ejo/PPE9+4Bxbjj5
 2r3A5DyrSpNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="167865545"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="167865545"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:25 -0800
IronPort-SDR: FSbU1mY7rxBkyn+H5OVD7Y273ef/naAw+b1hkifbnAIIoIsy6sJoCNqQo/iLmPA3hbZZA4rijd
 rl09/87K6A6Q==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370386809"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:23 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: mediatek: mt8173: rename local irq variable
Date: Wed, 10 Mar 2021 18:49:04 -0600
Message-Id: <20210311004904.121205-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
References: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
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

cppcheck warning:

sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:929:28: style: Local
variable 'irq' shadows outer argument [shadowArgument]
  struct mtk_base_afe_irq *irq;
                           ^
sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:914:47: note: Shadowed
declaration
static irqreturn_t mt8173_afe_irq_handler(int irq, void *dev_id)
                                              ^
sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:929:28: note: Shadow
variable
  struct mtk_base_afe_irq *irq;
                           ^

Not a great idea to have two 'irq' variables in the same function...

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 685f4074b4e0..6350390414d4 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -926,14 +926,14 @@ static irqreturn_t mt8173_afe_irq_handler(int irq, void *dev_id)
 
 	for (i = 0; i < MT8173_AFE_MEMIF_NUM; i++) {
 		struct mtk_base_afe_memif *memif = &afe->memif[i];
-		struct mtk_base_afe_irq *irq;
+		struct mtk_base_afe_irq *irq_p;
 
 		if (memif->irq_usage < 0)
 			continue;
 
-		irq = &afe->irqs[memif->irq_usage];
+		irq_p = &afe->irqs[memif->irq_usage];
 
-		if (!(reg_value & (1 << irq->irq_data->irq_clr_shift)))
+		if (!(reg_value & (1 << irq_p->irq_data->irq_clr_shift)))
 			continue;
 
 		snd_pcm_period_elapsed(memif->substream);
-- 
2.25.1

