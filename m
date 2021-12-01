Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E58E74648F2
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 08:39:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1D592528;
	Wed,  1 Dec 2021 08:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1D592528
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638344343;
	bh=IHCxs7gwvj5hd0hwOmRa8hkYhBtxIEZXKOaetW5lyGQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qaLvEaRuMPGxPRdy/aPnge83RPc14Kt7QdBkgb772eUR2NLyqTKKa5J6kA2lJ/+lA
	 wcDZ3AcxQmaomZLGhXBACD2L8l/uML40uslaAU2aqavv8at12X8hd4ffGSTDdroRuO
	 znnTonqYwusAJnlf9siG/Ob+3IJtIHb7ogogwpS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1220FF804ED;
	Wed,  1 Dec 2021 08:36:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72EABF8028D; Wed,  1 Dec 2021 08:36:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F2F7F80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 08:36:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F2F7F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="rSwXtU5M"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="wFM6LwaW"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 463332170E;
 Wed,  1 Dec 2021 07:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638344169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6wRRmZozN7nIs9vg88h6g3DAbkPqi58UgRwMzvOteg=;
 b=rSwXtU5MCvqcv3eV8N+0wNZG4b2YDKEPzdaAyiSRts4B+OET4GaG96oaRbH2v7tLyUgWG5
 X1FuHts4+rHaFzmxz71KBSjTIb7vB5MFGf1mK7uSkBp15fGcgrlfi5v21Xg+hqU9MC2w0K
 hzmsVIVgXCJQ8Spu8mBdisC1DKGc3aA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638344169;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6wRRmZozN7nIs9vg88h6g3DAbkPqi58UgRwMzvOteg=;
 b=wFM6LwaWs8nK5EPhLH5P0Kc636BdMu/wxQC8Kl21PMXo3GUIjbb3ip8cIBSRSiYxCNZyd3
 /5yBEzEg0Rze5UAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 3585FA3E65;
 Wed,  1 Dec 2021 07:36:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: pcm: oss: Limit the period size to 16MB
Date: Wed,  1 Dec 2021 08:36:05 +0100
Message-Id: <20211201073606.11660-3-tiwai@suse.de>
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

Set the practical limit to the period size (the fragment shift in OSS)
instead of a full 31bit; a too large value could lead to the exhaust
of memory as we allocate temporary buffers of the period size, too.

As of this patch, we set to 16MB limit, which should cover all use
cases.

Reported-by: syzbot+bb348e9f9a954d42746f@syzkaller.appspotmail.com
Reported-by: Bixuan Cui <cuibixuan@linux.alibaba.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/1638270978-42412-1-git-send-email-cuibixuan@linux.alibaba.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_oss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index bec7590bc84b..89c4910daf02 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -1962,7 +1962,7 @@ static int snd_pcm_oss_set_fragment1(struct snd_pcm_substream *substream, unsign
 	if (runtime->oss.subdivision || runtime->oss.fragshift)
 		return -EINVAL;
 	fragshift = val & 0xffff;
-	if (fragshift >= 31)
+	if (fragshift >= 25) /* should be large enough */
 		return -EINVAL;
 	runtime->oss.fragshift = fragshift;
 	runtime->oss.maxfrags = (val >> 16) & 0xffff;
-- 
2.31.1

