Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E40F2388C15
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 12:52:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61ED41694;
	Wed, 19 May 2021 12:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61ED41694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621421533;
	bh=OvmW6tVCbjyO+IvIX2whfPUPyiGN4DEv2pSti3uCZ0w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UeRyVqhg/D4NLDLLqGgYjhZkbR5qo5gb/VdAKUevrRSb2xfUrPR78zTINHPCa6vOt
	 Yj2NCLwwhFTLuO7RDNEezglsOODEH3f65fCGBioOvv4FNxOT6Dum6PZbjPpCd6oIoq
	 p041D4G/tliI2XhWAw47TPjp9YhiKBH3lVJ41Ks4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D28A8F80425;
	Wed, 19 May 2021 12:49:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA1DBF8042F; Wed, 19 May 2021 12:49:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35FFAF8014C
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 12:49:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35FFAF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="HWqCQ+Rv"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1621421391; x=1652957391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OvmW6tVCbjyO+IvIX2whfPUPyiGN4DEv2pSti3uCZ0w=;
 b=HWqCQ+Rvod6jNKqjV3KFZSJ9MB+tUVyl3zWN6NHmMKPxupc3I67xhJ+h
 GS9pKsybkKesDBdyPjkZRQ6tnvcw4iwQt9kMw5O7zrx0ATLa2aizy7bHX
 udSCUfKEMO7d+AmnHJk6hbtnL1taAnKQdCUT5L04cxwwVyZPhQMnBybd2
 SD7FTohXwWnf6teGZwnIgIHhHXSPrbyYS0+tIuLCWHc7iYgQ5YC9dTuMZ
 F0lVQiBl+OKTs9RntT/OWpQRUn3Nq1rwzxG1MO/DYlBnIdvDYdkPU/B1y
 hlQFHzlufqbYfID365F5Cx6QJq4KpFxQawY9BOa9f8lrdItXXuu7Wm8BM w==;
IronPort-SDR: 4Rxd1+63VuICe/o5nrpWV3F60GHyMgupHOg+jLGRmvzBc1gDLbKyknOL/X+Vq+ApEbnUEvN9b5
 y0E4zH7AIZGW5JsWxMU6MO6ivNSEN7N8OrrvQlF7K7Ok4Sf4hC6upLvYq2feJKx5nEhVD2Lpwh
 QoD6ot/EeBKB/+KZrg68lXbatln7uvLoyrKnFs5csFhyShJwG3JpXAdoRl5s++q3SImvRgxRj5
 HXITP1DS6DyBDlsU3dThzUDXgCCIQOldHTpoDZVz1oUUp0xCa4cvS9nAIXe6V5lwSo/3TZaVth
 Apc=
X-IronPort-AV: E=Sophos;i="5.82,312,1613458800"; d="scan'208";a="56105002"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 May 2021 03:49:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 03:49:47 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 19 May 2021 03:49:43 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 3/6] ALSA: pcm: Check for substream->ops before
 substream->ops->mmap
Date: Wed, 19 May 2021 13:48:39 +0300
Message-ID: <20210519104842.977895-4-codrin.ciubotariu@microchip.com>
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

substreams, like the internal ones, might not have ops set. Check it,
before looking at substream->ops->mmap.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/core/pcm_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 54e0eab2a57e..cb0164d55593 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -246,7 +246,7 @@ static bool hw_support_mmap(struct snd_pcm_substream *substream)
 	if (!(substream->runtime->hw.info & SNDRV_PCM_INFO_MMAP))
 		return false;
 
-	if (substream->ops->mmap ||
+	if ((substream->ops && substream->ops->mmap) ||
 	    (substream->dma_buffer.dev.type != SNDRV_DMA_TYPE_DEV &&
 	     substream->dma_buffer.dev.type != SNDRV_DMA_TYPE_DEV_UC))
 		return true;
-- 
2.27.0

