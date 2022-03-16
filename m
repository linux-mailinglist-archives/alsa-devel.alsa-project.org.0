Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E04DAD49
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 10:14:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E9A816E5;
	Wed, 16 Mar 2022 10:13:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E9A816E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647422082;
	bh=X11nZMqrdAkjnb1KLo+d2XaAFgRMSr2A4H5YWLilCEw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uyJLO2Z1Ppkj8ukAsecVO3hXmIDz8bkBUddfEGRPEcO3i2qyHFFQmty4JpA6rREcN
	 5CQcjOEjLV7iFBGTRTqqS83YNzcKStlEDdnaI3oDHrPiadrlijpjEvan5Uk7Zcntf0
	 Ta781+P3PQ9qfJPtWlAvAXaeb6ZDesNPXSdGFvNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 973BDF801F5;
	Wed, 16 Mar 2022 10:13:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39678F8019D; Wed, 16 Mar 2022 10:13:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_NONE, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96C5EF80087
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 10:13:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96C5EF80087
X-QQ-mid: bizesmtp91t1647421990t37qmosd
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 16 Mar 2022 17:13:04 +0800 (CST)
X-QQ-SSF: 01400000002000D0H000000A0000000
X-QQ-FEAT: TskX/GkkryCtF3MMUU7WGeLJerz6JGDXThH7VyNE/T3DPVypoS4JBKwYguSjL
 +o/qFTpdpmvQ3QQU3Gz/AceDwgtpxI+JZtqgzzOtVSmIxSSJrqn6tmzQqom790x5nUVNb7M
 ZcSHX6rwVMb+ihYHEpvAulQr2lQLyiPPsL0c9UjaxqDYDLE6nQLLJy2gxife7F3/zTaBIxG
 QAeP+/gFa9KsRCvJMAZj+K8qJcPuRLwnjKRhq2erjDI/x+51xCTLgDDn6UEc4AOwrxAyfov
 gnfnZ2maK3fRBEb1R0zdy2bI4w/aUbKy+J3lGQVtp7IARXgO1stlJ2Huqp8qZB8lRb7olhF
 fkBx8mARx+DLFcYbmfcgG+RoDvTZtHbyENf86t2
X-QQ-GoodBg: 1
From: Meng Tang <tangmeng@uniontech.com>
To: perex@perex.cz, tiwai@suse.com, broonie@kernel.org, lgirdwood@gmail.com,
 Vijendar.Mukunda@amd.com
Subject: [PATCH] ASoC: amd: Fix reference to PCM buffer address
Date: Wed, 16 Mar 2022 17:13:03 +0800
Message-Id: <20220316091303.9745-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign8
X-QQ-Bgrelay: 1
Cc: Meng Tang <tangmeng@uniontech.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

PCM buffers might be allocated dynamically when the buffer
preallocation failed or a larger buffer is requested, and it's not
guaranteed that substream->dma_buffer points to the actually used
buffer.  The driver needs to refer to substream->runtime->dma_addr
instead for the buffer address.

Fixes: cab396d8b22c1 ("ASoC: amd: add ACP5x pcm dma driver ops")
Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 31fa166df98a..d36bb718370f 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -281,7 +281,7 @@ static int acp5x_dma_hw_params(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 	size = params_buffer_bytes(params);
-	rtd->dma_addr = substream->dma_buffer.addr;
+	rtd->dma_addr = substream->runtime->dma_addr;
 	rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
 	config_acp5x_dma(rtd, substream->stream);
 	return 0;
-- 
2.20.1



