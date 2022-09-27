Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E125EED91
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 08:08:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDB6415CC;
	Thu, 29 Sep 2022 08:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDB6415CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664431708;
	bh=GoDznqcTbZqflYOorF2AJmh7OjACaWByDTfPnm1F7dE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TaS4hS3Bnkk9ENjqm6F7/4OVne2COEqAO74vVWgNTStWtHbpqpQoT/mfc53k/L/+v
	 ARL9DlOQDEVKhVZDl+2BJzLGzi1SV+JhSKyJETbx3STQJHzHkqJbp7hRWwMUSDJszK
	 es6cOQ0tWr0OfvC8nq3cezCZcKuq4iMnsP+mKG2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70CE5F80542;
	Thu, 29 Sep 2022 08:06:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEC9FF80496; Tue, 27 Sep 2022 15:35:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92C13F80496
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 15:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92C13F80496
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4McLBB5Pxvz1P6lt;
 Tue, 27 Sep 2022 21:31:30 +0800 (CST)
Received: from kwepemm600008.china.huawei.com (7.193.23.88) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 21:35:45 +0800
Received: from huawei.com (10.175.100.227) by kwepemm600008.china.huawei.com
 (7.193.23.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 21:35:44 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
 <tanureal@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <christophe.jaillet@wanadoo.fr>,
 <peter.ujfalusi@gmail.com>, <alsa-devel@alsa-project.org>,
 <patches@opensource.cirrus.com>
Subject: [PATCH -next 4/4] ASoC: ti: davinci-mcasp: Use DIV_ROUND_UP() instead
 of open-coding it
Date: Tue, 27 Sep 2022 22:09:48 +0800
Message-ID: <20220927140948.17696-5-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220927140948.17696-1-shangxiaojing@huawei.com>
References: <20220927140948.17696-1-shangxiaojing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600008.china.huawei.com (7.193.23.88)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 29 Sep 2022 08:06:37 +0200
Cc: shangxiaojing@huawei.com
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

Use DIV_ROUND_UP() instead of open-coding it, which intents and makes it
more clear what is going on for the casual reviewer.

The Coccinelle references Commit e4d8aef21403 ("ALSA: usb: Use
DIV_ROUND_UP() instead of open-coding it").

Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 sound/soc/ti/davinci-mcasp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index ca5d1bb6ac59..f5ac2ab77f5b 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -869,7 +869,7 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
 	if (mcasp->op_mode == DAVINCI_MCASP_DIT_MODE)
 		max_active_serializers = 1;
 	else
-		max_active_serializers = (channels + slots - 1) / slots;
+		max_active_serializers = DIV_ROUND_UP(channels, slots);
 
 	/* Default configuration */
 	if (mcasp->version < MCASP_VERSION_3)
@@ -1002,8 +1002,7 @@ static int mcasp_i2s_hw_param(struct davinci_mcasp *mcasp, int stream,
 	 */
 	if (mcasp->tdm_mask[stream]) {
 		active_slots = hweight32(mcasp->tdm_mask[stream]);
-		active_serializers = (channels + active_slots - 1) /
-			active_slots;
+		active_serializers = DIV_ROUND_UP(channels, active_slots);
 		if (active_serializers == 1)
 			active_slots = channels;
 		for (i = 0; i < total_slots; i++) {
@@ -1014,7 +1013,7 @@ static int mcasp_i2s_hw_param(struct davinci_mcasp *mcasp, int stream,
 			}
 		}
 	} else {
-		active_serializers = (channels + total_slots - 1) / total_slots;
+		active_serializers = DIV_ROUND_UP(channels, total_slots);
 		if (active_serializers == 1)
 			active_slots = channels;
 		else
-- 
2.17.1

