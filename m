Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D179965A499
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Dec 2022 14:22:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B25B369F;
	Sat, 31 Dec 2022 14:21:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B25B369F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672492920;
	bh=irTeuKomX1rrV5V+vv7//EulKpHJ9nuukrRTC+lCRvU=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aC3TlWTdZnG/6PhG5DJ4QfB9mWhHhiq5FfNmmcR+fAaRCb9DStY20cn/j9Soko9HR
	 xajXqExwf/X9dT/MMJwlGb/5yOhGStgJsI5u8vQulEl4hHM2ekrJZ9BfiYRRM+WYAb
	 gh9EU2VZYnOxoyuUjzWKtvllAxukvDfE3D3d1vnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C911CF8023B;
	Sat, 31 Dec 2022 14:21:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0978AF804D0; Sat, 31 Dec 2022 14:20:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 591B3F80310
 for <alsa-devel@alsa-project.org>; Sat, 31 Dec 2022 14:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 591B3F80310
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=LtM966I+; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3+cU/NRf
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D76122274E;
 Sat, 31 Dec 2022 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672492856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PjgOVVqBWIiytnfktXI4R90Cg/1spJUYns5YyFxJyLM=;
 b=LtM966I+zvofyVj+jMjOL6ak9kMgE7rVxzwBd6dvEltTnT4BW9pO8DrDucgtLGLyWd6h9j
 Uv4sw1l3ChpRT857MvENPMv3E1yk6ERv5abxwcec/d4hRSE0FY2nk7fRs75OuYGu3nAKz1
 bpYJqIPEoA67X3chKUDlIKr97PNWIjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672492856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PjgOVVqBWIiytnfktXI4R90Cg/1spJUYns5YyFxJyLM=;
 b=3+cU/NRfSJZozaFmNGjd5ThcxT3qiffUlzFtKePv2aa88MNqVMdLkFhHCu4EBC4Ryb/6cj
 rGG1CHN1wHenbUCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B03EA132F9;
 Sat, 31 Dec 2022 13:20:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AaNVKjg3sGOsQAAAMHmgww
 (envelope-from <tiwai@suse.de>); Sat, 31 Dec 2022 13:20:56 +0000
Date: Sat, 31 Dec 2022 14:20:56 +0100
Message-ID: <87wn67wvyf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Regression playing 24bit/96kHz audio on USB audio interface
 between 5.10.94 and 5.15.21
In-Reply-To: <47ec3cbb-19d1-ead1-46e8-3558ee7a8bcb@perex.cz>
References: <4e509aea-e563-e592-e652-ba44af6733fe@veniogames.com>
 <9da2f631-4b45-9c5e-4349-488eea9436aa@veniogames.com>
 <Y5ZGw/3GHXSUduEc@geday>
 <99245e87-f970-5660-d2af-82180e7a98d3@leemhuis.info>
 <9d663e28-88fb-aa96-574b-e92d6214aefe@veniogames.com>
 <5ba7868c-5ffd-81fc-778c-a7b5f8db50f7@veniogames.com>
 <47ec3cbb-19d1-ead1-46e8-3558ee7a8bcb@perex.cz>
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

On Sat, 31 Dec 2022 13:10:18 +0100,
Jaroslav Kysela wrote:
> 
> On 31. 12. 22 12:38, Ruud van Asseldonk wrote:
> > Hi all,
> > 
> > I bisected this and identified e4ea77f8e53f9accb9371fba34c189d0447ecce0
> > (ALSA: usb-audio: Always apply the hw constraints for implicit fb sync)
> > as the first commit where it is no longer possible to change the sample
> > rate. On the parent commit, my sample program successfully changes the
> > sample rate from 44100 Hz to 96000 Hz, but on e4ea77f8e53f9, the second
> > call to snd_pcm_hw_params fails.
> 
> There is an easy workaround - call snd_pcm_hw_free() between the
> params setup. This call ensure that the sync ep is freed. I can just
> confirm that this
> problem is only for USB hw with the implicit feedback (tested with 6.0.11 kernel).
> 
> I will try to debug this when I find a little free time. Perhaps,
> Takashi may have a straight idea, what's wrong. When only one stream
> is used, this hw_params call should succeed, too.

The patch like below might help (note: totally untested).

My wild guess is that it's an internal stream start for the implicit
fb case at prepare without actually starting a PCM stream, and it
wasn't stopped properly before the second hw_params call.


Takashi

-- 8< --
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -525,6 +525,8 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 		if (snd_usb_endpoint_compatible(chip, subs->data_endpoint,
 						fmt, hw_params))
 			goto unlock;
+		if (stop_endpoints(subs, false))
+			sync_pending_stops(subs);
 		close_endpoints(chip, subs);
 	}
 
