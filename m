Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2747338EA12
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 16:51:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C25F1686;
	Mon, 24 May 2021 16:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C25F1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621867890;
	bh=m8pxgX3jyd09QtonB3c6BbI83zDGq8E496xVR/zB8OQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Atp60lmJmVwi3kmfREcuF1t3WSCDcXFCkQZZnzovkghfxw6a6YTMlZV9x7eM2EUZZ
	 zv2fS/LEJS8T/EhjM8jmEROrzAYSIV2EUNAIpBBVH+fEWamOsRUULyRWCZTHwsBXsG
	 LfMO8ME6N88RHr4cFH8Lez5WmwUh71/de1GlI78o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FC6EF804E4;
	Mon, 24 May 2021 16:48:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51CF8F804E3; Mon, 24 May 2021 16:47:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F103F804E1
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 16:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F103F804E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eu3EZtpc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1FAD7613CC;
 Mon, 24 May 2021 14:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621867670;
 bh=m8pxgX3jyd09QtonB3c6BbI83zDGq8E496xVR/zB8OQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eu3EZtpcJKM3v2wYtiTt47GPeZ786DEIgktfy/hEeOxL3P1FOwmTzXq0qt7RYSaF1
 PkTu1wUTHDzKBEv/MSXNmi5e2cdyPp29MW+QlRjN4mRgkSQsEEbP4CdTO/a/1SCZ8R
 6J2TS2CRpbt3ua/Nk9+nHDd3a862U57fMYaitkLDwBuwTPYcPvdeWeaACv+Ui/Szvy
 41UnAi1N/3v1xrMNFrwOHyt3Ex0J6ZASdbIVM4rHsWRHs42dpbi6ZY7Y1pAN0B2X51
 A05Ar81YthZET7Lw9GNH01NthLt1zxyg733rEnbffw8CwG3VxXJXJrg4Z7a2NKFY5L
 XwS3v4Kd+WUxQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 05/62] Revert "ALSA: sb: fix a missing check of
 snd_ctl_add"
Date: Mon, 24 May 2021 10:46:46 -0400
Message-Id: <20210524144744.2497894-5-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524144744.2497894-1-sashal@kernel.org>
References: <20210524144744.2497894-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org,
 Sasha Levin <sashal@kernel.org>, Aditya Pakki <pakki001@umn.edu>
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

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

[ Upstream commit 4b059ce1f4b368208c2310925f49be77f15e527b ]

This reverts commit beae77170c60aa786f3e4599c18ead2854d8694d.

Because of recent interactions with developers from @umn.edu, all
commits from them have been recently re-reviewed to ensure if they were
correct or not.

Upon review, this commit was found to be incorrect for the reasons
below, so it must be reverted.  It is safe to ignore this error as the
mixer element is optional, and the driver is very legacy.

Cc: Aditya Pakki <pakki001@umn.edu>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20210503115736.2104747-8-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/isa/sb/sb16_main.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/isa/sb/sb16_main.c b/sound/isa/sb/sb16_main.c
index 38dc1fde25f3..aa4870531023 100644
--- a/sound/isa/sb/sb16_main.c
+++ b/sound/isa/sb/sb16_main.c
@@ -846,14 +846,10 @@ int snd_sb16dsp_pcm(struct snd_sb *chip, int device)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_sb16_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_sb16_capture_ops);
 
-	if (chip->dma16 >= 0 && chip->dma8 != chip->dma16) {
-		err = snd_ctl_add(card, snd_ctl_new1(
-					&snd_sb16_dma_control, chip));
-		if (err)
-			return err;
-	} else {
+	if (chip->dma16 >= 0 && chip->dma8 != chip->dma16)
+		snd_ctl_add(card, snd_ctl_new1(&snd_sb16_dma_control, chip));
+	else
 		pcm->info_flags = SNDRV_PCM_INFO_HALF_DUPLEX;
-	}
 
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 				       card->dev, 64*1024, 128*1024);
-- 
2.30.2

