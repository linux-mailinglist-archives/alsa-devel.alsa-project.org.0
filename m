Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE22832E4EC
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 10:34:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D33117B4;
	Fri,  5 Mar 2021 10:33:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D33117B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614936845;
	bh=CAwgxRhqj/wZ3ZajVuZqRUpbYXF3c6QMuOmVQfKw/0o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TLKnXoOc0oH/4VqjhKvZ+aTxdx9yM6XeBUccna7QU8KFUD19i/lk/dos47V9mH2re
	 a6DApZr3DvDFhUEVLxO/jGTu9A76V/y0fxBuVpZiRZokGwVqmOSVFea4QGV8pTtFHS
	 1AsRVk0zTggqq1bSVCKu1MoK+ZOQDZHaRYBVw52s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 103D8F8026A;
	Fri,  5 Mar 2021 10:32:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C1A0F80121; Fri,  5 Mar 2021 10:32:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B89BAF80121
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 10:32:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B89BAF80121
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DBC7D2013FB;
 Fri,  5 Mar 2021 10:32:18 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9FCB62013FE;
 Fri,  5 Mar 2021 10:32:13 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 72E5A40249;
 Fri,  5 Mar 2021 10:32:07 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_asrc_dma: request dma channel from specific
 controller
Date: Fri,  5 Mar 2021 17:19:37 +0800
Message-Id: <1614935977-21638-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

From: Robin Gong <yibin.gong@nxp.com>

Request dma channel from specific dma controller instead of generic
dma controller list, otherwise, may get the wrong dma controller
if there are multi dma controllers such as i.MX8MP.

Signed-off-by: Robin Gong <yibin.gong@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 29f91cdecbc3..c313a26c8f95 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -141,6 +141,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	struct dma_slave_config config_fe, config_be;
 	enum asrc_pair_index index = pair->index;
 	struct device *dev = component->dev;
+	struct device_node *of_dma_node;
 	int stream = substream->stream;
 	struct imx_dma_data *tmp_data;
 	struct snd_soc_dpcm *dpcm;
@@ -231,8 +232,10 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		pair->dma_data.priority = tmp_data->priority;
 		dma_release_channel(tmp_chan);
 
+		of_dma_node = pair->dma_chan[!dir]->device->dev->of_node;
 		pair->dma_chan[dir] =
-			dma_request_channel(mask, filter, &pair->dma_data);
+			__dma_request_channel(&mask, filter, &pair->dma_data,
+					      of_dma_node);
 		pair->req_dma_chan = true;
 	} else {
 		pair->dma_chan[dir] = tmp_chan;
-- 
2.27.0

