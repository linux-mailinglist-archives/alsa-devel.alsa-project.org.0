Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5D12E0C83
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Dec 2020 16:13:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18FAA1790;
	Tue, 22 Dec 2020 16:12:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18FAA1790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608650014;
	bh=3v4FR8gdXVOW9oUvGs2RYXbvkHQvUUjThcwM1pp33nM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RZwZKa9eggOypfXjxhkAIChD/aTIBupXNI9SLaYcE9KSiUo/4nf6NEtRMMOLMtg8X
	 zbZ7zWlu2vsDNGAoIFnFlvkx1M2ivY3dEnYjN1ZJQeIqf10ctB8FdG+YI1Qtnfeh8T
	 sfxLWEN4lb5bcwAasWmmi+yMgJESyoxGE8ibWtNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B688DF80264;
	Tue, 22 Dec 2020 16:12:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95098F8023E; Tue, 22 Dec 2020 16:12:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53E40F8021D
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 16:12:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53E40F8021D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14225AD5C;
 Tue, 22 Dec 2020 15:12:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] pcm: Fix a typo in SND_PCM_AUDIO_TSTAMP_TYPE_LAST definition
Date: Tue, 22 Dec 2020 16:12:23 +0100
Message-Id: <20201222151223.14476-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Henningsson <coding@diwic.se>
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

It was wrongly defined with SNDRV_ prefix.  Fix it.

Fixes: ea02dbd20a53 ("pcm: Add snd_pcm_audio_tstamp_type_t constants")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/pcm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/pcm.h b/include/pcm.h
index cf1eea8bbc9b..e300b951c076 100644
--- a/include/pcm.h
+++ b/include/pcm.h
@@ -361,7 +361,7 @@ typedef enum _snd_pcm_audio_tstamp_type {
 	SND_PCM_AUDIO_TSTAMP_TYPE_LINK_ABSOLUTE = 3,	   /**< link time reported by sample or wallclock counter, not reset on startup */
 	SND_PCM_AUDIO_TSTAMP_TYPE_LINK_ESTIMATED = 4,    /**< link time estimated indirectly */
 	SND_PCM_AUDIO_TSTAMP_TYPE_LINK_SYNCHRONIZED = 5, /**< link time synchronized with system time */
-	SND_PCM_AUDIO_TSTAMP_TYPE_LAST = SNDRV_PCM_AUDIO_TSTAMP_TYPE_LINK_SYNCHRONIZED
+	SND_PCM_AUDIO_TSTAMP_TYPE_LAST = SND_PCM_AUDIO_TSTAMP_TYPE_LINK_SYNCHRONIZED
 } snd_pcm_audio_tstamp_type_t;
 
 typedef struct _snd_pcm_audio_tstamp_config {
-- 
2.26.2

