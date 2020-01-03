Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D22812F573
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:29:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F0AC173F;
	Fri,  3 Jan 2020 09:29:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F0AC173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578040198;
	bh=teqsTpECef2w6r4yN6XkOEQCS0YOBfyWGq2RSC4Xx2E=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PZrki/BBhvnFsFOfSUJ3bfpW0P0bcknb3/IYS6xlrpHtitOvqx62ck2PW97dQXGOU
	 IioPOcD444Po8CYzmxDJvmlowOfO032lldDl7BiTXpiiR16poBZZGjiWuy3xdIIea3
	 7xrEfg8iWNQsSjLipGOTQ0LL0SWJQV1opk4CB6nQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E7D7F8029B;
	Fri,  3 Jan 2020 09:18:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C01F8F80331; Fri,  3 Jan 2020 09:17:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76207F80278
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76207F80278
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 84AB0B269
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:36 +0100
Message-Id: <20200103081714.9560-21-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 20/58] ALSA: timer: Constify snd_timer_hardware
	definitions
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Most of snd_timer_hardware definitions do simply copying to another
struct as-is.  Mark them as const for further optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_timer.c | 2 +-
 sound/core/timer.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_timer.c b/sound/core/pcm_timer.c
index 7928bda235c1..c43484b22b34 100644
--- a/sound/core/pcm_timer.c
+++ b/sound/core/pcm_timer.c
@@ -75,7 +75,7 @@ static int snd_pcm_timer_stop(struct snd_timer * timer)
 	return 0;
 }
 
-static struct snd_timer_hardware snd_pcm_timer =
+static const struct snd_timer_hardware snd_pcm_timer =
 {
 	.flags =	SNDRV_TIMER_HW_AUTO | SNDRV_TIMER_HW_SLAVE,
 	.resolution =	0,
diff --git a/sound/core/timer.c b/sound/core/timer.c
index d53bc1f3a48a..8835ff91a893 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1199,7 +1199,7 @@ static int snd_timer_s_close(struct snd_timer *timer)
 	return 0;
 }
 
-static struct snd_timer_hardware snd_timer_system =
+static const struct snd_timer_hardware snd_timer_system =
 {
 	.flags =	SNDRV_TIMER_HW_FIRST | SNDRV_TIMER_HW_TASKLET,
 	.resolution =	1000000000L / HZ,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
