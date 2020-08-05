Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B8623C8DD
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 11:14:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54AD3166C;
	Wed,  5 Aug 2020 11:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54AD3166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596618855;
	bh=kjaGM7w5jgbwqUCx0d1MEQFjQCuRZ8w8yPMhEhn4LEE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TD6SbjXxoQ5koBQeUz2dNwO9mLF5FWVDL5de+D1kfbKKlUTkgfYzLFxy+I0l2SdQp
	 iA0QYYr+rvdaE5JlQcAJxatwLsK21AOvaUPTYTHIS3DCSFas2z1gCwKlNQHstxfDWo
	 jgIdY2BxAxdIy8r144pvQQJfZVnixPOdF3NDTmRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C11A3F802A2;
	Wed,  5 Aug 2020 11:11:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35525F80290; Wed,  5 Aug 2020 11:11:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30DE8F80112
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 11:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30DE8F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="l+zjdVaR"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f2a779a0000>; Wed, 05 Aug 2020 02:10:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 05 Aug 2020 02:11:40 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 05 Aug 2020 02:11:40 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 09:11:40 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 5 Aug 2020 09:11:39 +0000
Received: from mkumard.nvidia.com (Not Verified[10.24.34.162]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f2a77c90001>; Wed, 05 Aug 2020 02:11:39 -0700
From: Mohan Kumar <mkumard@nvidia.com>
To: <tiwai@suse.com>, <perex@perex.cz>
Subject: [PATCH 2/3] ALSA: hda: Add behaviour flag for dma stop delay
Date: Wed, 5 Aug 2020 14:41:15 +0530
Message-ID: <20200805091116.2314-3-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200805091116.2314-1-mkumard@nvidia.com>
References: <20200805091116.2314-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596618651; bh=QLQa3HPgpMXlrNU8auTJWV6It11YYRpHfIV3i5lWL0w=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=l+zjdVaRctQu6Q/Ngsw+CZUQ20tPUzcDQr/TFoEegJYfm/uwSk2wktT7g/VC9zJ6n
 6NGouZlhJm32TbOrt2MnVCJFbztMSjVXMbjK03oWLu6jzZUUvxwKM4+ZfuIF6uZP93
 QzXuAS5R1m5BFAbf6xcs/aQiKMBLTTbkzgTNq3JoiYUMC0hcQc4IbqgW59E0791PKg
 X+8NiH4WtH46dta3HIZ7anH8Z3sISiIdWyyNdKSB6O/SbPA9tfSP7taqLv8FRrZhEL
 Ji645ECbTws+8gQCe6OI7hfGn8f1J/2k2Y+N6o6rBXNR7m4OGGSluy/sPHZK02m1Tw
 X7oBlTRHq2P2Q==
Cc: alsa-devel@alsa-project.org, spujar@nvidia.com, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, treding@nvidia.com,
 Mohan Kumar <mkumard@nvidia.com>
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

Behaviour flag dma_stop_delay is added as a new member in hdac_bus
structure to avoid memory decode error incase DMA RUN bit is not
disabled in the given timeout from snd_hdac_stream_sync function and
followed by stream reset which results in memory decode error between
reset set and clear operation.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 include/sound/hdaudio.h | 2 ++
 sound/hda/hdac_stream.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index c1f78d9a6e47..cf77c6b83016 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -347,6 +347,8 @@ struct hdac_bus {
 
 	int bdl_pos_adj;		/* BDL position adjustment */
 
+	unsigned int dma_stop_delay;
+
 	/* locks */
 	spinlock_t reg_lock;
 	struct mutex cmd_mutex;
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index a38a2af1654f..abe7a1b16fe1 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -150,9 +150,12 @@ void snd_hdac_stream_reset(struct hdac_stream *azx_dev)
 {
 	unsigned char val;
 	int timeout;
+	int dma_run_state;
 
 	snd_hdac_stream_clear(azx_dev);
 
+	dma_run_state = snd_hdac_stream_readb(azx_dev, SD_CTL) & SD_CTL_DMA_START;
+
 	snd_hdac_stream_updateb(azx_dev, SD_CTL, 0, SD_CTL_STREAM_RESET);
 	udelay(3);
 	timeout = 300;
@@ -162,6 +165,10 @@ void snd_hdac_stream_reset(struct hdac_stream *azx_dev)
 		if (val)
 			break;
 	} while (--timeout);
+
+	if (azx_dev->bus->dma_stop_delay && dma_run_state)
+		udelay(azx_dev->bus->dma_stop_delay);
+
 	val &= ~SD_CTL_STREAM_RESET;
 	snd_hdac_stream_writeb(azx_dev, SD_CTL, val);
 	udelay(3);
-- 
2.17.1

