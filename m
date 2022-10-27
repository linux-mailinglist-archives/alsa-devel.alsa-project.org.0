Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7FB60FB69
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 17:10:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBB9E2FBF;
	Thu, 27 Oct 2022 17:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBB9E2FBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666883420;
	bh=9OhRiUCkD0dEfvVlkwWG20B6/jErcKAbr+bW0OxHlyk=;
	h=Date:From:To:Subject:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Gxpiis0X48IWYHo8h46OwiEKxlVtRRqPUgJnR+3RapsSTaGwljfipXPnslxh8eWGD
	 lJrWJip3S8FQGePgiwMeLfASU4TlCixeQsMMMjM71chv1o5E5EofI1zhGkrGORv6wW
	 Ew9bwFZVPpGiO0/PO4GFlMbraVRQ88hbp5FMZf0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BE3CF80496;
	Thu, 27 Oct 2022 17:09:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B242AF8025A; Thu, 27 Oct 2022 17:09:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, T_SCC_BODY_TEXT_LINE, URIBL_BLOCKED,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0728EF80100
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 17:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0728EF80100
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C1A1E623BC;
 Thu, 27 Oct 2022 15:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E617C433D7;
 Thu, 27 Oct 2022 15:09:15 +0000 (UTC)
Received: from rostedt by gandalf.local.home with local (Exim 4.96)
 (envelope-from <rostedt@goodmis.org>) id 1oo4Ve-00Bvhr-2p;
 Thu, 27 Oct 2022 11:09:30 -0400
Message-ID: <20221027150930.702028779@goodmis.org>
User-Agent: quilt/0.66
Date: Thu, 27 Oct 2022 11:05:54 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Subject: [RFC][PATCH v2 29/31] timers: ALSA: Use del_timer_shutdown() before
 freeing timer
References: <20221027150525.753064657@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: alsa-devel@alsa-project.org, Stephen Boyd <sboyd@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Austin Kim <austin.kim@lge.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>
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

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Before a timer is freed, del_timer_shutdown() must be called.

Link: https://lore.kernel.org/all/20220407161745.7d6754b3@gandalf.local.home/

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Austin Kim <austin.kim@lge.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 sound/i2c/other/ak4117.c | 2 +-
 sound/synth/emux/emux.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/i2c/other/ak4117.c b/sound/i2c/other/ak4117.c
index 1bc43e927d82..5269ab7321a4 100644
--- a/sound/i2c/other/ak4117.c
+++ b/sound/i2c/other/ak4117.c
@@ -47,7 +47,7 @@ static void reg_dump(struct ak4117 *ak4117)
 
 static void snd_ak4117_free(struct ak4117 *chip)
 {
-	del_timer_sync(&chip->timer);
+	del_timer_shutdown(&chip->timer);
 	kfree(chip);
 }
 
diff --git a/sound/synth/emux/emux.c b/sound/synth/emux/emux.c
index a870759d179e..a43025f466bb 100644
--- a/sound/synth/emux/emux.c
+++ b/sound/synth/emux/emux.c
@@ -129,7 +129,7 @@ int snd_emux_free(struct snd_emux *emu)
 	if (! emu)
 		return -EINVAL;
 
-	del_timer_sync(&emu->tlist);
+	del_timer_shutdown(&emu->tlist);
 
 	snd_emux_proc_free(emu);
 	snd_emux_delete_virmidi(emu);
-- 
2.35.1
