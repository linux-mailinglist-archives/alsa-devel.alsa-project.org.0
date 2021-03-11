Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2410933693D
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 01:51:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8AE916FD;
	Thu, 11 Mar 2021 01:50:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8AE916FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615423876;
	bh=i7lWhACUHiy2rItuu95HGQz6kFc0bK891k89kQFL0zQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vVlB05xqGI1Ng81WniS4ucrPoh5qY26YG4jdx8gd4NIep+NN161DNRRXNvQdBJYMK
	 g7zLznnDLBOEET/TraXR35kTAnqgMblcrVv+Ca04cc5eUy345FfO9Jqa4GxWYZnAOz
	 WsG0Z+MpryefIyRNNpZaYTFpalj72nejjR0VSvU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B77A7F8032C;
	Thu, 11 Mar 2021 01:49:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A070F802E7; Thu, 11 Mar 2021 01:49:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F31FF8012F
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 01:49:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F31FF8012F
IronPort-SDR: ahPHGzlJ5cS9tISqxbRqrUtw5ve5Md8k0V/hQeyNK/1MsVpZIqCFxOZvqcRQo4Dbt1hODjer9H
 4gDLsNbTS9IQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="167865533"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="167865533"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:18 -0800
IronPort-SDR: J9Y1cPxBOqkMSqBlXVxAyMKHdXz3bOTZ6QWhFCYOJFXIkotC51XUhFBTXSIS5uELwiYy1VkrGk
 BC79uQFsu+/g==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370386789"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:16 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: mediatek: mtk-btcvsd: remove useless assignment
Date: Wed, 10 Mar 2021 18:49:01 -0600
Message-Id: <20210311004904.121205-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
References: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lumi Lee <lumi.lee@mediatek.com>,
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

sound/soc/mediatek/common/mtk-btcvsd.c:783:34: style: Variable 'avail'
is assigned a value that is never used. [unreadVariable]
 int written_size = count, avail = 0, cur_write_idx, write_size, cont;
                                 ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/mediatek/common/mtk-btcvsd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index a554c57b6460..f85b5ea180ec 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -780,7 +780,7 @@ static ssize_t mtk_btcvsd_snd_write(struct mtk_btcvsd_snd *bt,
 				    char __user *buf,
 				    size_t count)
 {
-	int written_size = count, avail = 0, cur_write_idx, write_size, cont;
+	int written_size = count, avail, cur_write_idx, write_size, cont;
 	unsigned int cur_buf_ofs = 0;
 	unsigned long flags;
 	unsigned int packet_size = bt->tx->packet_size;
-- 
2.25.1

