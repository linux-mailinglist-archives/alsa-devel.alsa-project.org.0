Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E36A9B07D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 15:13:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D20C167A;
	Fri, 23 Aug 2019 15:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D20C167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566566024;
	bh=jUFg4gEKh2wpByrdt9XTj5fyIqUA2hdcp5TuotixxEs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E7kT4IAUGlATI0zSo7DbfpRrT3/vgm7ddWMYCOrkcoD1Wepu33nMgo3/Kmr7jfYu+
	 LehFv8tcnVx/x95scoZvhiuRzd8gH+p3PRP/gjZqMND3tLbfCJ03bljnSHSFB6trJy
	 egMX+buveka4u7QOWJnCWXntNTY+BsFUcjm3bE0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16141F80308;
	Fri, 23 Aug 2019 15:12:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9908CF80306; Fri, 23 Aug 2019 15:11:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BD08F80147
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 15:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BD08F80147
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 318783CD6D96C5C7B307;
 Fri, 23 Aug 2019 21:11:48 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Fri, 23 Aug 2019
 21:11:37 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
 <yuehaibing@huawei.com>, <daniel.baluta@nxp.com>,
 <pierre-louis.bossart@linux.intel.com>
Date: Fri, 23 Aug 2019 20:59:39 +0800
Message-ID: <20190823125939.30012-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH -next] ASoC: SOF: imx8: Make some functions
	static
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

Fix sparse warnings:

sound/soc/sof/imx/imx8.c:104:6: warning: symbol 'imx8_dsp_handle_reply' was not declared. Should it be static?
sound/soc/sof/imx/imx8.c:115:6: warning: symbol 'imx8_dsp_handle_request' was not declared. Should it be static?
sound/soc/sof/imx/imx8.c:336:5: warning: symbol 'imx8_get_bar_index' was not declared. Should it be static?
sound/soc/sof/imx/imx8.c:341:6: warning: symbol 'imx8_ipc_msg_data' was not declared. Should it be static?
sound/soc/sof/imx/imx8.c:348:5: warning: symbol 'imx8_ipc_pcm_params' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/sof/imx/imx8.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index e502f58..6404724 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -101,7 +101,7 @@ static int imx8_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 	return MBOX_OFFSET;
 }
 
-void imx8_dsp_handle_reply(struct imx_dsp_ipc *ipc)
+static void imx8_dsp_handle_reply(struct imx_dsp_ipc *ipc)
 {
 	struct imx8_priv *priv = imx_dsp_get_data(ipc);
 	unsigned long flags;
@@ -112,7 +112,7 @@ void imx8_dsp_handle_reply(struct imx_dsp_ipc *ipc)
 	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
 }
 
-void imx8_dsp_handle_request(struct imx_dsp_ipc *ipc)
+static void imx8_dsp_handle_request(struct imx_dsp_ipc *ipc)
 {
 	struct imx8_priv *priv = imx_dsp_get_data(ipc);
 
@@ -333,21 +333,21 @@ static int imx8_remove(struct snd_sof_dev *sdev)
 }
 
 /* on i.MX8 there is 1 to 1 match between type and BAR idx */
-int imx8_get_bar_index(struct snd_sof_dev *sdev, u32 type)
+static int imx8_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 {
 	return type;
 }
 
-void imx8_ipc_msg_data(struct snd_sof_dev *sdev,
-		       struct snd_pcm_substream *substream,
-		       void *p, size_t sz)
+static void imx8_ipc_msg_data(struct snd_sof_dev *sdev,
+			      struct snd_pcm_substream *substream,
+			      void *p, size_t sz)
 {
 	sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
 }
 
-int imx8_ipc_pcm_params(struct snd_sof_dev *sdev,
-			struct snd_pcm_substream *substream,
-			const struct sof_ipc_pcm_params_reply *reply)
+static int imx8_ipc_pcm_params(struct snd_sof_dev *sdev,
+			       struct snd_pcm_substream *substream,
+			       const struct sof_ipc_pcm_params_reply *reply)
 {
 	return 0;
 }
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
