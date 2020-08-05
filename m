Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F03523C8E3
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 11:15:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61E631669;
	Wed,  5 Aug 2020 11:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61E631669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596618921;
	bh=iEfDjZSWYicHuAC0JQbWEM3wyxjAk8YOwPrCH0sSzBY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uy4NmcE7aoYPBBKWsAy6YZYnOhwYRaJwht5EzHjrlQg8KhQiF0aUhQ+GjhJ9So5oR
	 Rh/mAO6B05apCy7LnGIQz0kRoUqp1hKYNyI50bcQWBPPB/TtXAk7JCJCxUGeAyuO42
	 ou8k0RxBoeOsFBHWMtjS8lWs5RGEhZp4QB3Ltd4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9102DF802DB;
	Wed,  5 Aug 2020 11:11:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40C89F802D2; Wed,  5 Aug 2020 11:11:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 119E1F80112
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 11:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 119E1F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="SCUCtsZj"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f2a779d0001>; Wed, 05 Aug 2020 02:10:53 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 05 Aug 2020 02:11:43 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 05 Aug 2020 02:11:43 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 09:11:42 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 5 Aug 2020 09:11:42 +0000
Received: from mkumard.nvidia.com (Not Verified[10.24.34.162]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f2a77cc0000>; Wed, 05 Aug 2020 02:11:41 -0700
From: Mohan Kumar <mkumard@nvidia.com>
To: <tiwai@suse.com>, <perex@perex.cz>
Subject: [PATCH 3/3] ALSA: hda/tegra: Add 100us dma stop delay
Date: Wed, 5 Aug 2020 14:41:16 +0530
Message-ID: <20200805091116.2314-4-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200805091116.2314-1-mkumard@nvidia.com>
References: <20200805091116.2314-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596618653; bh=uZF+fL32kiXr/FFhU7XFb0VNeNdMUglasynYmIpWkSs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=SCUCtsZj/zyCN0eJx6ccBmjzvkvz51vk6bicoRkWPk7y0gCB85QxgDU2s33Qtdir1
 Q4wM/ECwEXRm4PlKMf4L786Lo3EJ7jdF44Fl3GySa2q+o/Xv5uRoJriXx5CBWjW9y2
 pVq9zFmrWlAWa4bsV+TjnJ5gKgI3WkGq19mGBY0iIju9KBvjI/8BfyuyTQbPxcBXXQ
 m7cVVoUuLjnE9srwBfDtCoqH4VQomMe2a1wogiB6cvKyeA+KTmPUUVi03gxXEMjDA1
 ViS12XznCyn9ew+g6/O5gUpueQDBdL4EBcidQqyIVCwrNUeCPysOZ0QvGuAO83Zkjt
 Mq/ET4Dd0OVWA==
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

Tegra HDA has audio data buffer for upto tens of frames, this buffer
can help to avoid underflow. HW will keep issuing new data fetch
request when buffers are not full and current BDL is not done. When SW
disable DMA RUN bit for a stream, HW can't cancel the already issued data
fetch request and hence it can't stop DMA. HW has to wait for all issued
data fetch request get data returned before it stops DMA.

This HW behavior is not in sync with HDA spec which says DMA RUN bit
should be cleared within 1 audio frame. For Tegra, DMA RUN bit was
active for more than one audio frame, due to this the timeout in
snd_hdac_stream_sync function is not helping. When Stream reset set
and clear happens during DMA RUN bit active state it results in Memory
Decode error.

Unfortunately, there is no way to detect when these data accesses have
completed, but testing has shown that a 100us delay between Stream reset
set and clear operation for Tegra avoids the memory decode error.
Therefore, adding a 100us dma stop delay.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index ecf98eb9df36..c94553bcca88 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -308,6 +308,7 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 		return err;
 	}
 	bus->irq = irq_id;
+	bus->dma_stop_delay = 100;
 	card->sync_irq = bus->irq;
 
 	/*
-- 
2.17.1

