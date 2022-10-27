Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C9260EE62
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 05:13:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0542329C3;
	Thu, 27 Oct 2022 05:12:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0542329C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666840407;
	bh=OMa5RWyGoyY5W5FiEMbVFPVX/1+fddvZsx/DZmQb04Y=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G2HziMNHjBBCtKOhzeqfhdQsVKJPovyB0eWER4TatX7Aa8DRSNVifKGeKhayNYdpP
	 ip3PnftXU+lq/ecGxye2sQ+8ywfJlROOxkqaDSyoHfxEEojG1Ua+RUWxoc6KM1EeCS
	 b9SPPM5rgd45/mdbkf+7toW3rzTV9w1wIcg06gWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72F14F80496;
	Thu, 27 Oct 2022 05:12:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D320DF8025E; Thu, 27 Oct 2022 05:12:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED, 
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A534CF80100
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 05:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A534CF80100
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 33A40B8245E;
 Thu, 27 Oct 2022 03:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC712C433D6;
 Thu, 27 Oct 2022 03:12:22 +0000 (UTC)
Date: Wed, 26 Oct 2022 23:12:36 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: Use del_timer_sync() before freeing timer
Message-ID: <20221026231236.6834b551@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Stephen Boyd <sboyd@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
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

The current code for freeing the emux timer is extremely dangerous:

  CPU0				CPU1
  ----				----
snd_emux_timer_callback()
			    snd_emux_free()
			      spin_lock(&emu->voice_lock)
			      del_timer(&emu->tlist); <-- returns immediately
			      spin_unlock(&emu->voice_lock);
			      [..]
			      kfree(emu);

  spin_lock(&emu->voice_lock);

 [BOOM!]

Instead just use del_timer_sync() which will wait for the timer to finish
before continuing. No need to check if the timer is active or not when
doing so.

This doesn't fix the race of a possible re-arming of the timer, but at
least it won't use the data that has just been freed.

Cc: stable@vger.kernel.org
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 sound/synth/emux/emux.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/synth/emux/emux.c b/sound/synth/emux/emux.c
index 5ed8e36d2e04..a2ee78809cfb 100644
--- a/sound/synth/emux/emux.c
+++ b/sound/synth/emux/emux.c
@@ -131,10 +131,7 @@ int snd_emux_free(struct snd_emux *emu)
 	if (! emu)
 		return -EINVAL;
 
-	spin_lock_irqsave(&emu->voice_lock, flags);
-	if (emu->timer_active)
-		del_timer(&emu->tlist);
-	spin_unlock_irqrestore(&emu->voice_lock, flags);
+	del_timer_sync(&emu->tlist);
 
 	snd_emux_proc_free(emu);
 	snd_emux_delete_virmidi(emu);
-- 
2.35.1

