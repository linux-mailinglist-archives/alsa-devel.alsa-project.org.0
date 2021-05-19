Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 595E4388C1B
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 12:53:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3B83167D;
	Wed, 19 May 2021 12:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3B83167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621421594;
	bh=E1ll/nGj027BzHPrOVz/VehF+athq088ySz9vfcAdTI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ae5rdXOrCKdw1wQg/Ork9xaFZlQS0RWF5s3WuWIK/VkZkskcEIPvprBThOTP2s+8X
	 MiHK+0PG0Vkbjaq75+BqQWQx6F4UXptV9TK0jksS3zGtnAvu8UM3R+j0PiFNemsqfx
	 4IM0JZSVx935/u0Sf+u/Qkc48uts071aLW7sOr/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDD49F804BD;
	Wed, 19 May 2021 12:50:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36D7FF804B4; Wed, 19 May 2021 12:50:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A1FBF804B0
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 12:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A1FBF804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="0zNcglRo"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1621421404; x=1652957404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E1ll/nGj027BzHPrOVz/VehF+athq088ySz9vfcAdTI=;
 b=0zNcglRoFMw4PSTwadKcE3zhdnP9bhBBrXTnfW5Bu3j5FCYhBwWbsmvL
 +Va/0MMIq/X3l4HIbsk1hgHGPBC4StfPpAsrlP/NYUaqwFUezNIPTGhEO
 tsxv/lGSjZeHm+GplVbKDEugq6giWQzo/j5E2AD2txXxQ+3EbV+EcjzQG
 AKzbtVzDwSOxTGx4Wj+1yIXzyQBwfs1tVpLl726WIK5Twkn3VA8eS3MmP
 Z8OLlIKn6d0TeLWo3eSq3dTiL6hRl7ibothjY1U3twYIgOE/3ghjcl4Uj
 lhN/E8IJiYLB6kBidUB46HXINP16lUzCmHkfVJm/peqt+UkPpTbHBHMYe Q==;
IronPort-SDR: 4hjEbRTQ5JI3IvSn/a04n2tSl1T5ydsC7y/t8UsoCZbHHvTAVvvaHjz3kICi5CoStoEhf28GEn
 Pz/uarb+np3n0jRYkiFzewiyULVsmZstmjWtmfpfZqHFuA/D/G+4BuIfN/wUhYuCkA1AY3BT2g
 g0jp6EkfPKhMbepoBoYhbWPKluNXTQWvejkQjFsHrsnXtyYxquNUAA82hrf/CkA52kjEcvYz23
 F3kLK//Ijk0Jt212ZAX+sGvy2cG7gi+PbkiIIPuJoA7S12BYsBzV3bibNfONqUTzoVa8b4fcZ9
 lK8=
X-IronPort-AV: E=Sophos;i="5.82,312,1613458800"; d="scan'208";a="56105024"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 May 2021 03:50:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 03:50:01 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 19 May 2021 03:49:57 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 6/6] ASoC: dmaengine: Allocate buffer if substream is
 unmanaged
Date: Wed, 19 May 2021 13:48:42 +0300
Message-ID: <20210519104842.977895-7-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519104842.977895-1-codrin.ciubotariu@microchip.com>
References: <20210519104842.977895-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: lars@metafoo.de, kuninori.morimoto.gx@renesas.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org,
 joe@perches.com, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Cristian.Birsan@microchip.com, nicolas.ferre@microchip.com
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

pcm_construct/pcm_destruct callbacks are not called for BE DAIs. This means
that, if the generic dmaengine driver is used, there is no managed buffer
allocation (or pre-allocation). To be able to use the generic dmaengine
driver for BE DAI links, allocate the buffer in the hw_params callback if
there is no managed buffer.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 9ef80a48707e..c915da71e1cd 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -98,6 +98,22 @@ static int dmaengine_pcm_hw_params(struct snd_soc_component *component,
 			return ret;
 	}
 
+	if (!substream->managed_buffer_alloc) {
+		substream->dma_buffer.dev.type = SNDRV_DMA_TYPE_DEV_IRAM;
+		substream->dma_buffer.dev.dev = chan->device->dev;
+		return snd_pcm_lib_malloc_pages(substream,
+						params_buffer_bytes(params));
+	}
+
+	return 0;
+}
+
+static int dmaengine_pcm_hw_free(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream)
+{
+	if (!substream->managed_buffer_alloc)
+		return snd_pcm_lib_free_pages(substream);
+
 	return 0;
 }
 
@@ -332,6 +348,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component = {
 	.open		= dmaengine_pcm_open,
 	.close		= dmaengine_pcm_close,
 	.hw_params	= dmaengine_pcm_hw_params,
+	.hw_free	= dmaengine_pcm_hw_free,
 	.trigger	= dmaengine_pcm_trigger,
 	.pointer	= dmaengine_pcm_pointer,
 	.pcm_construct	= dmaengine_pcm_new,
@@ -343,6 +360,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
 	.open		= dmaengine_pcm_open,
 	.close		= dmaengine_pcm_close,
 	.hw_params	= dmaengine_pcm_hw_params,
+	.hw_free	= dmaengine_pcm_hw_free,
 	.trigger	= dmaengine_pcm_trigger,
 	.pointer	= dmaengine_pcm_pointer,
 	.copy_user	= dmaengine_copy_user,
-- 
2.27.0

