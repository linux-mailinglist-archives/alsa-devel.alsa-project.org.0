Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A3B34D34D
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 17:07:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAD0A1682;
	Mon, 29 Mar 2021 17:06:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAD0A1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617030441;
	bh=n8LDgV5aTKIZ48XAw7rlW5PwyoJJjDJKiD1337xnQlA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BOcdk2KO2vmcNotr6B4g5ABRGNgoJdS/x2pM+xb4ScRuSs7sqn0jCWO3PeOQj6bcV
	 rMMHWaodMFI6uW01v9RWxETBfn7xwWh+CN0rzNMKO7OFeJt9TUNIuygBshMNwdCYig
	 +JKfjjU65Dp528c27uU26+1tW7Rv15HJ6m5Yoxd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3655BF800B9;
	Mon, 29 Mar 2021 17:05:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B766AF8015A; Mon, 29 Mar 2021 17:05:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DBAFF80141
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 17:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DBAFF80141
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F8G692hljzPm24;
 Mon, 29 Mar 2021 23:02:57 +0800 (CST)
Received: from localhost (10.174.179.96) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Mon, 29 Mar 2021
 23:05:26 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <yuehaibing@huawei.com>
Subject: [PATCH -next] ASoC: dwc: Fix -Wmissing-prototypes warnings
Date: Mon, 29 Mar 2021 23:05:24 +0800
Message-ID: <20210329150524.18184-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.96]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

while CONFIG_SND_DESIGNWARE_PCM is not set, building with W=1 shows this:

sound/soc/dwc/local.h:127:6: warning: no previous prototype for ‘dw_pcm_push_tx’ [-Wmissing-prototypes]
 void dw_pcm_push_tx(struct dw_i2s_dev *dev) { }
      ^~~~~~~~~~~~~~
sound/soc/dwc/local.h:128:6: warning: no previous prototype for ‘dw_pcm_pop_rx’ [-Wmissing-prototypes]
 void dw_pcm_pop_rx(struct dw_i2s_dev *dev) { }
      ^~~~~~~~~~~~~
sound/soc/dwc/local.h:129:5: warning: no previous prototype for ‘dw_pcm_register’ [-Wmissing-prototypes]
 int dw_pcm_register(struct platform_device *pdev)
     ^~~~~~~~~~~~~~~

Change these to inline functions to fix the warnings.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/dwc/local.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/dwc/local.h b/sound/soc/dwc/local.h
index 91dc70a826f8..1c361eb6127e 100644
--- a/sound/soc/dwc/local.h
+++ b/sound/soc/dwc/local.h
@@ -124,9 +124,9 @@ void dw_pcm_push_tx(struct dw_i2s_dev *dev);
 void dw_pcm_pop_rx(struct dw_i2s_dev *dev);
 int dw_pcm_register(struct platform_device *pdev);
 #else
-void dw_pcm_push_tx(struct dw_i2s_dev *dev) { }
-void dw_pcm_pop_rx(struct dw_i2s_dev *dev) { }
-int dw_pcm_register(struct platform_device *pdev)
+static inline void dw_pcm_push_tx(struct dw_i2s_dev *dev) { }
+static inline void dw_pcm_pop_rx(struct dw_i2s_dev *dev) { }
+static inline int dw_pcm_register(struct platform_device *pdev)
 {
 	return -EINVAL;
 }
-- 
2.17.1

