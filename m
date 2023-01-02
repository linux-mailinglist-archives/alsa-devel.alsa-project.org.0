Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D172665B56A
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 17:59:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54A27A273;
	Mon,  2 Jan 2023 17:58:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54A27A273
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672678741;
	bh=TS8wucvuOA6PMuC3amtDhr8CEznJvGT3XsTfFJevJOU=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nyH8AhbYB14Ed9Bvvl93g3z6DKUxBuZa3MHPzfg+0N+O1WzZDnQUFnksSq7Opk2Gt
	 TmTax57dU/C3Qu8KNYcMqnuIYZg58lkBgtgxqUBQ0nVhKEBs2D2eOprRj6NTIQW+it
	 zEJbTsYBrNcvvxwr9Ff3qwtbclMfl3AAsETSDqiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8967F800C0;
	Mon,  2 Jan 2023 17:58:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5284F8023A; Mon,  2 Jan 2023 17:57:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2688F800D0
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 17:57:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2688F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=iivcGNyO; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tsubDpmu
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F127C22AF9;
 Mon,  2 Jan 2023 16:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672678676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0VCW7WEglsT1ABMAkatgZnshfT0S6Zhh+nZW33FqOuE=;
 b=iivcGNyOoD3pZGrluOxdlsDme3LHrTVmCi23nZRCqc0CCAZKQ3/KfhMfHnTLAQlgjRB9JK
 yHOsM9q+aTF5vqORk3tHcN7inQ8AN4HvfjQ3pBTRorsbzb94N3Pu3fKqZ9k9rPsVJmJnkW
 zZb+kcGM07i0OYMADq7MxhPiVp8hsQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672678676;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0VCW7WEglsT1ABMAkatgZnshfT0S6Zhh+nZW33FqOuE=;
 b=tsubDpmu+otG9iJm9qL1WacaZrHEV9scMDwYXtulC59gOpfDApvG8Pc3LBYhYmv5ku/uMj
 4bPlZwf9J2AqpYDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C259D139C8;
 Mon,  2 Jan 2023 16:57:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cLYcLhQNs2P/EwAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 02 Jan 2023 16:57:56 +0000
Date: Mon, 02 Jan 2023 17:57:56 +0100
Message-ID: <87lemkswkr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Regression playing 24bit/96kHz audio on USB audio interface
 between 5.10.94 and 5.15.21
In-Reply-To: <87wn67wvyf.wl-tiwai@suse.de>
References: <4e509aea-e563-e592-e652-ba44af6733fe@veniogames.com>
 <9da2f631-4b45-9c5e-4349-488eea9436aa@veniogames.com>
 <Y5ZGw/3GHXSUduEc@geday>
 <99245e87-f970-5660-d2af-82180e7a98d3@leemhuis.info>
 <9d663e28-88fb-aa96-574b-e92d6214aefe@veniogames.com>
 <5ba7868c-5ffd-81fc-778c-a7b5f8db50f7@veniogames.com>
 <47ec3cbb-19d1-ead1-46e8-3558ee7a8bcb@perex.cz>
 <87wn67wvyf.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Takashi Iwai <tiwai@suse.com>, Ruud van Asseldonk <ruud@veniogames.com>,
 Geraldo Nascimento <geraldogabriel@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, 31 Dec 2022 14:20:56 +0100,
Takashi Iwai wrote:
> 
> On Sat, 31 Dec 2022 13:10:18 +0100,
> Jaroslav Kysela wrote:
> > 
> > On 31. 12. 22 12:38, Ruud van Asseldonk wrote:
> > > Hi all,
> > > 
> > > I bisected this and identified e4ea77f8e53f9accb9371fba34c189d0447ecce0
> > > (ALSA: usb-audio: Always apply the hw constraints for implicit fb sync)
> > > as the first commit where it is no longer possible to change the sample
> > > rate. On the parent commit, my sample program successfully changes the
> > > sample rate from 44100 Hz to 96000 Hz, but on e4ea77f8e53f9, the second
> > > call to snd_pcm_hw_params fails.
> > 
> > There is an easy workaround - call snd_pcm_hw_free() between the
> > params setup. This call ensure that the sync ep is freed. I can just
> > confirm that this
> > problem is only for USB hw with the implicit feedback (tested with 6.0.11 kernel).
> > 
> > I will try to debug this when I find a little free time. Perhaps,
> > Takashi may have a straight idea, what's wrong. When only one stream
> > is used, this hw_params call should succeed, too.
> 
> The patch like below might help (note: totally untested).
> 
> My wild guess is that it's an internal stream start for the implicit
> fb case at prepare without actually starting a PCM stream, and it
> wasn't stopped properly before the second hw_params call.

Looking at the problem again, I think this is a different problem from
the patch I've sent.  This is rather the hw_params that becomes too
restrictive once after the implicit sync is set up.  A workaround
patch is below.

The previous patch is still valid, though.  I'm going to submit a
series of fixes.


Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: usb-audio: Relax hw constraints for implicit fb sync

The fix commit the commit e4ea77f8e53f ("ALSA: usb-audio: Always apply
the hw constraints for implicit fb sync") tried to address the bug
where an incorrect PCM parameter is chosen when two (implicit fb)
streams are set up at the same time.  This change had, however, some
side effect: once when the sync endpoint is chosen and set up, this
restriction is applied at the next hw params unless it's freed via hw
free explicitly.

This patch is a workaround for the problem by relaxing the hw
constraints a bit for the implicit fb sync.  We still keep applying
the hw constraints for implicit fb sync, but only when the matching
sync EP is being used by other streams.

Fixes: e4ea77f8e53f ("ALSA: usb-audio: Always apply the hw constraints for implicit fb sync")
Link: https://lore.kernel.org/r/4e509aea-e563-e592-e652-ba44af6733fe@veniogames.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 7fc95ae9b2f0..2fd4ecc1b25a 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -937,8 +937,13 @@ get_sync_ep_from_substream(struct snd_usb_substream *subs)
 			continue;
 		/* for the implicit fb, check the sync ep as well */
 		ep = snd_usb_get_endpoint(chip, fp->sync_ep);
-		if (ep && ep->cur_audiofmt)
-			return ep;
+		if (ep && ep->cur_audiofmt) {
+			/* ditto, if the sync (data) ep is used by others,
+			 * this stream is restricted by the sync ep
+			 */
+			if (ep != subs->sync_endpoint || ep->opened > 1)
+				return ep;
+		}
 	}
 	return NULL;
 }
-- 
2.35.3

