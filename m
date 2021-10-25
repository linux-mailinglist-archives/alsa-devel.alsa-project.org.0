Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DB2439EED
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 21:03:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 618EA16DD;
	Mon, 25 Oct 2021 21:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 618EA16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635188623;
	bh=b9+6wLK7bxQGnPiCRhk86UZ1yzShDGUPdgD888WlJTg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n7iK00d5941U/GOM9SS0NAXUfScAoSJicfMQ3Ji2kGRXrdycMS0OFESQWAj2mmFNG
	 hErsQu7Xko3baAYvVuIefbE+QgilZLl69s9Vw47gbKKLZyJ84WTHGPK7BiGP6+1UIc
	 w3O7h9fRkkrjSGwYauYWWWHF87ZjbSNu5qdHve/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 942E1F80511;
	Mon, 25 Oct 2021 21:00:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FF35F804EC; Mon, 25 Oct 2021 21:00:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6188FF804AF
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 21:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6188FF804AF
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="216908176"
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="216908176"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 11:59:57 -0700
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="554318484"
Received: from ssubbar1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.118.197])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 11:59:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/8] ASoC: mediatek: mt8195: rename shadowed array
Date: Mon, 25 Oct 2021 13:59:31 -0500
Message-Id: <20211025185933.144327-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025185933.144327-1-pierre-louis.bossart@linux.intel.com>
References: <20211025185933.144327-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

cppcheck warning:

Checking sound/soc/mediatek/mt8195/mt8195-afe-pcm.c ...
sound/soc/mediatek/mt8195/mt8195-afe-pcm.c:2884:35: style: Local
variable 'irq_data' shadows outer variable [shadowVariable]
  struct mtk_base_irq_data const *irq_data;
                                  ^
sound/soc/mediatek/mt8195/mt8195-afe-pcm.c:2235:39: note: Shadowed declaration
static const struct mtk_base_irq_data irq_data[MT8195_AFE_IRQ_NUM] = {
                                      ^
sound/soc/mediatek/mt8195/mt8195-afe-pcm.c:2884:35: note: Shadow variable
  struct mtk_base_irq_data const *irq_data;
                                  ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index df8b90baf981..2bb05a828e8d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -2232,7 +2232,7 @@ static const struct mtk_base_memif_data memif_data[MT8195_AFE_MEMIF_NUM] = {
 	},
 };
 
-static const struct mtk_base_irq_data irq_data[MT8195_AFE_IRQ_NUM] = {
+static const struct mtk_base_irq_data irq_data_array[MT8195_AFE_IRQ_NUM] = {
 	[MT8195_AFE_IRQ_1] = {
 		.id = MT8195_AFE_IRQ_1,
 		.irq_cnt_reg = -1,
@@ -3100,7 +3100,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < afe->irqs_size; i++)
-		afe->irqs[i].irq_data = &irq_data[i];
+		afe->irqs[i].irq_data = &irq_data_array[i];
 
 	/* init memif */
 	afe->memif_size = MT8195_AFE_MEMIF_NUM;
-- 
2.25.1

