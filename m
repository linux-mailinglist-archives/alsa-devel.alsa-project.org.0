Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 999236E606D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 13:53:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26C8DE88;
	Tue, 18 Apr 2023 13:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26C8DE88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681818797;
	bh=0eVlo6jd0rQ5jcQF9g7wri9bN9+CZolErRabb7snJfc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ke0mcIu2O5oC04BmkRvF1zG2ADOReRF4wZm1a/ZvRRKrKcuMtA1al6IgK26rXCLia
	 hTh+o5HZa75ZLDzDnoResU4rFLj6lwUip6noAvTsdpZLc5isFzIJ282dqY85aei1tH
	 yP1RbELc7P1AR6tzCeRvtY9v9h+SfUm4y/xCXPUI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E3FDF8053D;
	Tue, 18 Apr 2023 13:51:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68DE5F80266; Mon, 17 Apr 2023 15:33:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from exchange.fintech.ru (e10edge.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 831E8F8023A
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 15:32:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 831E8F8023A
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 17 Apr
 2023 16:32:46 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 17 Apr
 2023 16:32:46 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH] ASoC: fsl_asrc_dma: fix potential null-ptr-deref
Date: Mon, 17 Apr 2023 06:32:42 -0700
Message-ID: <20230417133242.53339-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
X-MailFrom: n.zhandarovich@fintech.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5I4LBYLHE7COEOENSLRE5PEMFK2ODS24
X-Message-ID-Hash: 5I4LBYLHE7COEOENSLRE5PEMFK2ODS24
X-Mailman-Approved-At: Tue, 18 Apr 2023 11:51:38 +0000
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Natalia Petrova <n.petrova@fintech.ru>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5I4LBYLHE7COEOENSLRE5PEMFK2ODS24/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dma_request_slave_channel() may return NULL which will lead to
NULL pointer dereference error in 'tmp_chan->private'.

Correct this behaviour by, first, switching from deprecated function
dma_request_slave_channel() to dma_request_chan(). Secondly, enable
sanity check for the resuling value of dma_request_chan().
Also, fix description that follows the enacted changes and that
concerns the use of dma_request_slave_channel().

Fixes: 706e2c881158 ("ASoC: fsl_asrc_dma: Reuse the dma channel if available in Back-End")
Co-developed-by: Natalia Petrova <n.petrova@fintech.ru>
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 sound/soc/fsl/fsl_asrc_dma.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 3b81a465814a..05a7d1588d20 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -209,14 +209,19 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		be_chan = soc_component_to_pcm(component_be)->chan[substream->stream];
 		tmp_chan = be_chan;
 	}
-	if (!tmp_chan)
-		tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
+	if (!tmp_chan) {
+		tmp_chan = dma_request_chan(dev_be, tx ? "tx" : "rx");
+		if (IS_ERR(tmp_chan)) {
+			dev_err(dev, "failed to request DMA channel for Back-End\n");
+			return -EINVAL;
+		}
+	}
 
 	/*
 	 * An EDMA DEV_TO_DEV channel is fixed and bound with DMA event of each
 	 * peripheral, unlike SDMA channel that is allocated dynamically. So no
 	 * need to configure dma_request and dma_request2, but get dma_chan of
-	 * Back-End device directly via dma_request_slave_channel.
+	 * Back-End device directly via dma_request_chan.
 	 */
 	if (!asrc->use_edma) {
 		/* Get DMA request of Back-End */
