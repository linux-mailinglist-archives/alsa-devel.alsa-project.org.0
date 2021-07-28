Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E113D8CB9
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 13:26:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5174A181C;
	Wed, 28 Jul 2021 13:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5174A181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627471598;
	bh=Ucl0fKfims3RyAGQ3tuC9Xq4BXGazWJ+U5dneELOdd4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KhCi2DiS39bUqVtr/dLU51EZBOvK9STKRAdEu/yYyVt1sSOar3u7NX6hCQRf+g8Oy
	 8IImn6lLMHT0MBSdmpc8b2jyft2hpAX/Qx2cnCsEYciSb7Vzx1P2DwKCKVCtv+GtgK
	 O3uAWsp3gaaesbzPCdyXVCBI9u7jz0S8bUD1J47A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BCABF804E3;
	Wed, 28 Jul 2021 13:24:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCDA0F8028B; Wed, 28 Jul 2021 13:24:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF3BDF80253
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 13:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF3BDF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="HZMUzbYX"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="y37h0CWF"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 90B2322317;
 Wed, 28 Jul 2021 11:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627471434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxZSXYV2Z8DNKyoSP3gHfHG8rbc/74gGdkpASn+huMw=;
 b=HZMUzbYX0ojh0n0PkiFWpOUE8F/jTuAu4NfftFiCmXeh9jLalVFbCR2T9/LyqIcdAuQy+9
 VvqXqHBXx+nVx/JBxcwAr57aLAW0nZt3iz3o/qUdPRoT9zPM57hPr3iyp38txtsJbaZcVJ
 Zn5o6zf6zHjmbbayqmb/NGLxuDhrlKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627471434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxZSXYV2Z8DNKyoSP3gHfHG8rbc/74gGdkpASn+huMw=;
 b=y37h0CWFkS8T2Wz0LLWXnZ5IQpme04sEKqk6jI4m2pX4c7jCVUUkMPvQ4CoaqdawGcXfa1
 XVAokszAJLQ1LmBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 816C9A3B8B;
 Wed, 28 Jul 2021 11:23:54 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: xilinx: Fix reference to PCM buffer address
Date: Wed, 28 Jul 2021 13:23:51 +0200
Message-Id: <20210728112353.6675-4-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210728112353.6675-1-tiwai@suse.de>
References: <20210728112353.6675-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
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

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 1d59fb668c77..91afea9d5de6 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -452,8 +452,8 @@ static int xlnx_formatter_pcm_hw_params(struct snd_soc_component *component,
 
 	stream_data->buffer_size = size;
 
-	low = lower_32_bits(substream->dma_buffer.addr);
-	high = upper_32_bits(substream->dma_buffer.addr);
+	low = lower_32_bits(runtime->dma_addr);
+	high = upper_32_bits(runtime->dma_addr);
 	writel(low, stream_data->mmio + XLNX_AUD_BUFF_ADDR_LSB);
 	writel(high, stream_data->mmio + XLNX_AUD_BUFF_ADDR_MSB);
 
-- 
2.26.2

