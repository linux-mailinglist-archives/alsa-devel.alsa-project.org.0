Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FE665D650
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 15:44:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38475B421;
	Wed,  4 Jan 2023 15:43:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38475B421
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672843440;
	bh=BQW7Htecs3IiVAJrcSyCfNAZilJaVze/9CvAhJDdHwc=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZcfQfKGjFjImvB/155QmapEgpSMW9jSYmfXcZy8A6z4LhtLKq3wW9wwcyVps220D9
	 gWfJbmFQ/PjTS1/ETvQWzVc+AaiDq06dQkaFNBncn5o0VhV6RuV/NsMnmXdNQnvKeT
	 uItoraicaR4NZ9jZtTs/YB4Zo2+Uj4OvwCqZQZJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03215F80238;
	Wed,  4 Jan 2023 15:43:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90FEBF8023A; Wed,  4 Jan 2023 15:42:58 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 40AB4F800C0
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 15:42:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40AB4F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=BLje2iFi; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bsYeVPBl
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9513E22A27;
 Wed,  4 Jan 2023 14:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672843375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nzFJhvcAaKtNtLi2BW4RFffLilfovnSQqWRntsot2xQ=;
 b=BLje2iFi5z3ZJpw2bVVq7TX5D828u/Yf04qd3XTrYrBEcTzE4y/dQjYz4kRIJ2+uyFgce7
 YEl1dFh1f03IC74OgL916COO6Baug0OUn6Ka2AhAFhxplkJRL4ikDb5raeJhuF6YqTBcmU
 wv3KW+/ut39kLG/4CoVqYJkyfdrItfk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672843375;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nzFJhvcAaKtNtLi2BW4RFffLilfovnSQqWRntsot2xQ=;
 b=bsYeVPBlSfNLrAOgc9giOEjBc5UgpmE2RhFy1SPTJxvW2rwcgyMZ/Yd/JI+58F7Gn/qXFe
 JbPnMxZ7HBKc4tAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A134133D1;
 Wed,  4 Jan 2023 14:42:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EmlAFW+QtWPWWgAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 04 Jan 2023 14:42:55 +0000
Date: Wed, 04 Jan 2023 15:42:54 +0100
Message-ID: <87zgaymkcx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Michael Ralston <michael@ralston.id.au>
Subject: Re: USB-Audio regression on behringer UMC404HD
In-Reply-To: <CAC2975LFWnK6f05j5my4=ebmhS0bVhigz8VH6cbaUtVT+ADxbA@mail.gmail.com>
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info>
 <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de>
 <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
 <87bknfr6rd.wl-tiwai@suse.de>
 <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
 <878rijr6dz.wl-tiwai@suse.de>
 <CAC2975+Ybz2-jyJAwAUEu5S1XKfp0B-p4s-gAsMPfZdD61uNfQ@mail.gmail.com>
 <87zgazppuc.wl-tiwai@suse.de>
 <CAC2975+476CHDL3YM=uExHu96UB2rodAng9PVYHX+vGnSCppGA@mail.gmail.com>
 <CAC2975Ja-o6-qCWv2bUkt3ps7BcKvb96rao_De4SGVW1v8uE=A@mail.gmail.com>
 <CAC2975KFqvTitbJHJZ6a4Tuxsq=nPGvW3vjAAtkQxw=sBgeDqw@mail.gmail.com>
 <CAC2975Jw63j26DhvDjiLc7dXwaRz=eK0aWNuErQ8dkEn_Gemjg@mail.gmail.com>
 <87ilhmpvdt.wl-tiwai@suse.de>
 <CAC2975LFWnK6f05j5my4=ebmhS0bVhigz8VH6cbaUtVT+ADxbA@mail.gmail.com>
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
Cc: alsa-devel@alsa-project.org, regressions@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Thorsten Leemhuis <regressions@leemhuis.info>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 04 Jan 2023 15:22:13 +0100,
Michael Ralston wrote:
> 
> On Wed, 4 Jan 2023 at 19:16, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > I believe it's time to check which commit broke things.
> > Assume that the bug is USB audio core changes, the following 8 commits
> > are relevant:
> >
> 
> Reverting 1045f5f1ff0751423aeb65648e5e1abd7a7a8672 resulted in this
> compiler error:
> 
> sound/usb/endpoint.c: In function 'snd_usb_endpoint_stop':
> sound/usb/endpoint.c:1672:27: error: 'struct snd_usb_endpoint' has no
> member named 'need_prepare'
> 1672 |                         ep->need_prepare = true;
>      |                           ^~
> 
> I did git annotate on endpoint.c and found line 1672 was added by commit:
> 3759ae6600e40
> 
> Reverting this commit has allowed me to compile a kernel again.
> 
> 3759ae6600e40
> 1045f5f1ff0751423aeb65648e5e1abd7a7a8672
> 9355b60e401d825590d37f04ea873c58efe9b7bf
> a74f8d0aa902ca494676b79226e0b5a1747b81d4
> 9902b303b5ade208b58f0dd38a09831813582211
> 9a737e7f8b371e97eb649904276407cee2c9cf30
> 
> I reverted these six commits, testing each one independently, then
> adding the next on top of the others, and it didn't fix the issue.
> Then the next commit wouldn't revert cleanly.
> 
> CONFLICT (content): Merge conflict in sound/usb/pcm.c
> error: could not revert 2be79d586454... ALSA: usb-audio: Split
> endpoint setups for hw_params and prepare (take#2)
> 
> ++<<<<<<< HEAD
> + again:
> +      if (subs->sync_endpoint) {
> +              ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
> +              if (ret < 0)
> +                      goto unlock;
> +      }
> +
> +      ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
> ++=======
> +       ret = configure_endpoints(chip, subs);
> ++>>>>>>> parent of 2be79d586454 (ALSA: usb-audio: Split endpoint
> setups for hw_params and prepare (take#2))
>        if (ret < 0)
>                goto unlock;
> -       else if (ret > 0)
> -               snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
> -       ret = 0;
> 
> 
> Again, I did a git annotate and found I needed to also revert
> 67fd112b4b040 to get 2be79d58645465351af5320eb14c70a94724c5ef to
> revert.
> 
> This one also didn't fix the issue.
> 
> ac5e2fb425e1121ceef2b9d1b3ffccc195d55707
> This final revert on top of all the others fixed the issue.
> 
> These are the reverts I made:
> 3759ae6600e40
> 1045f5f1ff0751423aeb65648e5e1abd7a7a8672
> 9355b60e401d825590d37f04ea873c58efe9b7bf
> a74f8d0aa902ca494676b79226e0b5a1747b81d4
> 9902b303b5ade208b58f0dd38a09831813582211
> 9a737e7f8b371e97eb649904276407cee2c9cf30
> 67fd112b4b040
> 2be79d58645465351af5320eb14c70a94724c5ef
> ac5e2fb425e1121ceef2b9d1b3ffccc195d55707

Oh, did you test with 6.2-rc?  I checked the reverts only on top of
the 6.1.0.  From there, you can revert all mentioned commits cleanly
and should build.

In anyway, do I understand correctly that the bug still persists at
the revert of the commit 2be79d58645465351af5320eb14c70a94724c5ef, and
it's fixed by the revert of ac5e2fb425e1121ceef2b9d1b3ffccc195d55707?

If so, what happens if you revert only
ac5e2fb425e1121ceef2b9d1b3ffccc195d55707?


Takashi
