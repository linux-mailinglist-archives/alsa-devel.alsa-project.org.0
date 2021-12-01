Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E50464915
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 08:48:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71DE0251D;
	Wed,  1 Dec 2021 08:37:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71DE0251D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638344279;
	bh=oIs00SwtjDgEgvFTIi0M1vzGmiXcNJMPDvHLXrAfCxs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VdnwQnXTQ9itloqwmhUous1WrGTsno75VI8GJsdwOvjpipMZOLkRCmxB3ysd+cPiM
	 NYAjsZNU8EOzB+zA7zbUOGd7eJ9iWPvxL/Zamev8oaVc00sgCfnl8uw0TgSOReqmta
	 qxro33YkDLmx+DcquLspl0lfsxjQOoqHWXrOvr7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D4A6F80240;
	Wed,  1 Dec 2021 08:36:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B073F804EB; Wed,  1 Dec 2021 08:36:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32D5AF80246
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 08:36:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32D5AF80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ek9plvr6"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ggYeczKi"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 538A221763;
 Wed,  1 Dec 2021 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638344169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Th4mYGEB7rIqidX1COlzDHDuW/cuoC+ZjD8Yfc6FREU=;
 b=ek9plvr6eXjooU071h9EyK6OK2FTmIo1enjVxvl26+gObO+bp7yC9hbLNY4kngP7ROagjv
 5j4ogEDxoBf864aL6f9LwDp3VGWyVQmkDf13+cy41fuV/6O1K3D9U9wKptUwdnKmaUyrdp
 zYBjJ4Y03Rh6J0m49F9jdB2m13SOtxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638344169;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Th4mYGEB7rIqidX1COlzDHDuW/cuoC+ZjD8Yfc6FREU=;
 b=ggYeczKiUliNi92lvqrBjVf1hEDCXnluJf0jkqpRgTd7fKXcAZfPaSTQ4AJElfDMmjp6cK
 SytdC68/whtogYDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 44123A3C04;
 Wed,  1 Dec 2021 07:36:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ALSA: pcm: oss: Handle missing errors in
 snd_pcm_oss_change_params*()
Date: Wed,  1 Dec 2021 08:36:06 +0100
Message-Id: <20211201073606.11660-4-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211201073606.11660-1-tiwai@suse.de>
References: <20211201073606.11660-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Bixuan Cui <cuibixuan@linux.alibaba.com>
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

A couple of calls in snd_pcm_oss_change_params_locked() ignore the
possible errors.  Catch those errors and abort the operation for
avoiding further problems.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_oss.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 89c4910daf02..20a0a4771b9a 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -884,8 +884,15 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 		err = -EINVAL;
 		goto failure;
 	}
-	choose_rate(substream, sparams, runtime->oss.rate);
-	snd_pcm_hw_param_near(substream, sparams, SNDRV_PCM_HW_PARAM_CHANNELS, runtime->oss.channels, NULL);
+
+	err = choose_rate(substream, sparams, runtime->oss.rate);
+	if (err < 0)
+		goto failure;
+	err = snd_pcm_hw_param_near(substream, sparams,
+				    SNDRV_PCM_HW_PARAM_CHANNELS,
+				    runtime->oss.channels, NULL);
+	if (err < 0)
+		goto failure;
 
 	format = snd_pcm_oss_format_from(runtime->oss.format);
 
-- 
2.31.1

