Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D4699710
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 16:41:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1E1A16AC;
	Thu, 22 Aug 2019 16:40:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1E1A16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566484895;
	bh=HPycSdbAPZMmx4k68hm6I8kmL/tchH/8rg9bvCdCcoY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=snjUMNYSTpZPZPndqwvtT0gzcUoohY1rR2H6bXIUwBy1dJnIKdUDt7OyqhXdRoJLf
	 3YS6BQeSWIrEcMR+lwrw0xdEKrUdcR3sn4Wwscd9CSnmJnlAdWoSusE/Z3ozFb3BDN
	 fVxhFExUrR2qO+Tx4Y4G5WgzyYXZVf5Iur3WJjbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6973EF80391;
	Thu, 22 Aug 2019 16:39:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E34C7F8036E; Thu, 22 Aug 2019 16:39:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56C4AF80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 16:39:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56C4AF80112
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id AD8466A9E1BC676579BA;
 Thu, 22 Aug 2019 22:39:37 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Thu, 22 Aug 2019
 22:39:28 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <matthias.bgg@gmail.com>, <yuehaibing@huawei.com>,
 <pihsun@chromium.org>, <swboyd@chromium.org>
Date: Thu, 22 Aug 2019 22:37:47 +0800
Message-ID: <20190822143747.20944-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH -next] ASoC: mediatek: mt2701: Fix
	-Wunused-const-variable warnings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

sound/soc/mediatek/mt2701/mt2701-afe-common.h:66:27: warning:
 mt2701_afe_backup_list defined but not used [-Wunused-const-variable=]

mt2701_afe_backup_list is only used in mt2701-afe-pcm.c,
so just move the definition over there.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/mediatek/mt2701/mt2701-afe-common.h | 21 ---------------------
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c    | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-common.h b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
index d44faba..32bef5e 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-common.h
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
@@ -63,27 +63,6 @@ enum audio_base_clock {
 	MT2701_BASE_CLK_NUM,
 };
 
-static const unsigned int mt2701_afe_backup_list[] = {
-	AUDIO_TOP_CON0,
-	AUDIO_TOP_CON4,
-	AUDIO_TOP_CON5,
-	ASYS_TOP_CON,
-	AFE_CONN0,
-	AFE_CONN1,
-	AFE_CONN2,
-	AFE_CONN3,
-	AFE_CONN15,
-	AFE_CONN16,
-	AFE_CONN17,
-	AFE_CONN18,
-	AFE_CONN19,
-	AFE_CONN20,
-	AFE_CONN21,
-	AFE_CONN22,
-	AFE_DAC_CON0,
-	AFE_MEMIF_PBUF_SIZE,
-};
-
 struct mt2701_i2s_data {
 	int i2s_ctrl_reg;
 	int i2s_asrc_fs_shift;
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index d7f5def..76502ba 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -60,6 +60,27 @@ static const struct mt2701_afe_rate mt2701_afe_i2s_rates[] = {
 	{ .rate = 352800, .regvalue = 24 },
 };
 
+static const unsigned int mt2701_afe_backup_list[] = {
+	AUDIO_TOP_CON0,
+	AUDIO_TOP_CON4,
+	AUDIO_TOP_CON5,
+	ASYS_TOP_CON,
+	AFE_CONN0,
+	AFE_CONN1,
+	AFE_CONN2,
+	AFE_CONN3,
+	AFE_CONN15,
+	AFE_CONN16,
+	AFE_CONN17,
+	AFE_CONN18,
+	AFE_CONN19,
+	AFE_CONN20,
+	AFE_CONN21,
+	AFE_CONN22,
+	AFE_DAC_CON0,
+	AFE_MEMIF_PBUF_SIZE,
+};
+
 static int mt2701_dai_num_to_i2s(struct mtk_base_afe *afe, int num)
 {
 	struct mt2701_afe_private *afe_priv = afe->platform_priv;
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
