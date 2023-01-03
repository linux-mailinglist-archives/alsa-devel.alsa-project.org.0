Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FD465C2E8
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 16:22:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C12AE41F;
	Tue,  3 Jan 2023 16:21:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C12AE41F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672759326;
	bh=FhbTVQS0VhmPsc0Mr4dpPQTE1SZjTatmdBcAxh3pHnQ=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nlpA4WTudHxOWzwrBObM33E8TQ9QMFH1iD7UoAu5qwoBkqdpT1poZeNCgN2qSIDIy
	 E+UlInoidPkQByHGjrEA0ni4KO0e4k8Zln444y/vXxHqPCZZaKObyczfMr/Pi1p1zU
	 /plJPG6Llisdn8hobEwf9/mQq6NK0aJMzh1d6HY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B4E4F8003C;
	Tue,  3 Jan 2023 16:21:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13D94F804AD; Tue,  3 Jan 2023 16:21:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 511E8F8003C
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 16:21:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 511E8F8003C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ocdLnXHj; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WrCMbReR
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B51F167ABE;
 Tue,  3 Jan 2023 15:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672759272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NtxpHQ7TaTAmosc6jmIS1bPQpzkWk/ISgTElsh2Pu9s=;
 b=ocdLnXHjejl2MiIg3/Zm1xzvA8Q8ZlPJwUvP4LKxDvEwFPHP19yiGC2TeD61HnJPLRBNEj
 LorI5yTwGQpx1/yPDh4WzgrirSADs/EielIP5g8WxiKnyKqlJDpg7p1KfZu7Wr0WzCGmDG
 sD2Xkuz3oXFH3GVrbU0FWv6NE5+J5LI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672759272;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NtxpHQ7TaTAmosc6jmIS1bPQpzkWk/ISgTElsh2Pu9s=;
 b=WrCMbReRpGXHUXRyu+nKoWJbcGqNBCKul00nISjLsPzZMs2IP5TK1okDYfLhjn/4WXSKk7
 1zS6kHP4BRWGRCCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 897C41390C;
 Tue,  3 Jan 2023 15:21:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EUrEIOhHtGM5ZwAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 03 Jan 2023 15:21:12 +0000
Date: Tue, 03 Jan 2023 16:21:12 +0100
Message-ID: <878rijr6dz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Michael Ralston <michael@ralston.id.au>
Subject: Re: USB-Audio regression on behringer UMC404HD
In-Reply-To: <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info>
 <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de>
 <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
 <87bknfr6rd.wl-tiwai@suse.de>
 <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
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

On Tue, 03 Jan 2023 16:14:57 +0100,
Michael Ralston wrote:
> 
> On Wed, 4 Jan 2023 at 02:13, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > That's weird.  Is snd_usb_audio driver bound with the device at all?
> > That is, does it appear in /proc/asound/cards?
> >
> 
> Yes, it's there.
> 
> 0 [V49            ]: USB-Audio - V49
>                      Alesis V49 at usb-0000:08:00.1-3, full speed
> 1 [NVidia         ]: HDA-Intel - HDA NVidia
>                      HDA NVidia at 0xfc080000 irq 154
> 2 [U192k          ]: USB-Audio - UMC404HD 192k
>                      BEHRINGER UMC404HD 192k at usb-0000:08:00.1-4, high speed
> 3 [Generic        ]: HDA-Intel - HD-Audio Generic
>                      HD-Audio Generic at 0xfca00000 irq 156

Hrm...  Try to reload snd_usb_audio module with the dyndbg=+p option,
e.g.

  # modprobe -r snd-usb-audio
  # modprobe snd_usb_audio dyndbg=+p
  
Or you can try to put your own debug printk(); we need to make sure
whether it's really the right code you're testing at first.


Takashi
