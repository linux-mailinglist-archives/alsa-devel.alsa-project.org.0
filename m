Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6310365C382
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 17:04:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E58A2D43;
	Tue,  3 Jan 2023 17:04:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E58A2D43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672761892;
	bh=7F0XncqHHcMafDFS7aMXNJ0zBT0QuCzfk3GZkR6cDqY=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mDMiy10h+U31f/YF1iw9wlOnyyW0Ww2lhcOrDTrvm6MDRog8uhmwWML06UqZlBb+q
	 wRn5tEF9YqbIyWo8ctuFCvr9C6IHwXOjkLiGjG3LGzViEDB7Q/OlmYREj7T428dSfU
	 LDXVvWLn1zMy7bay/sd2X21BDUtGImNdsWUdgXYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E547F803DC;
	Tue,  3 Jan 2023 17:04:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D442F803DC; Tue,  3 Jan 2023 17:03:59 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CB29F8047B
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 17:03:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CB29F8047B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=BW2LgrNh; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QuuooW3Y
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 84561227DF;
 Tue,  3 Jan 2023 16:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672761836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xx94thxYeaPJ0cWVKCcjoVjusmkFByzZznJxWr7hfT4=;
 b=BW2LgrNhYB/ShUvELE79mF0CDNpC/1UxnHuJ5ofyumkB58w07djt2IUZ2T94QxkhKo72WA
 fYhi1FgY4L1WeV4RtzvlCQg1KKO/xxyTLzpzHWGsQRP5O5vosT8CL2F3kTVpPdQObGiXmg
 LEGH0FLzn9UBwdx4WsTFcDI+VTxjMW0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672761836;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xx94thxYeaPJ0cWVKCcjoVjusmkFByzZznJxWr7hfT4=;
 b=QuuooW3Y+yKAIbetYivAGGAoQby9xZ7Vt4VgVLNDHXAkhGW9C/B9AS7Td3xJaMyjz2wMSZ
 LsT7uMnQZ3ZgmuCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B9201390C;
 Tue,  3 Jan 2023 16:03:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VR2MFexRtGP8fgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 03 Jan 2023 16:03:56 +0000
Date: Tue, 03 Jan 2023 17:03:55 +0100
Message-ID: <87zgazppuc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Michael Ralston <michael@ralston.id.au>
Subject: Re: USB-Audio regression on behringer UMC404HD
In-Reply-To: <CAC2975+Ybz2-jyJAwAUEu5S1XKfp0B-p4s-gAsMPfZdD61uNfQ@mail.gmail.com>
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

On Tue, 03 Jan 2023 16:31:13 +0100,
Michael Ralston wrote:
> 
> On Wed, 4 Jan 2023 at 02:21, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > Hrm...  Try to reload snd_usb_audio module with the dyndbg=+p option,
> > e.g.
> >
> >   # modprobe -r snd-usb-audio
> >   # modprobe snd_usb_audio dyndbg=+p
> >
> > Or you can try to put your own debug printk(); we need to make sure
> > whether it's really the right code you're testing at first.
> >
> 
> Ok, it looks like it was ignoring the kernel command line for some
> reason. modprobing it with the option brought up debug messages again.
> 
> I'm still running kernel 6.1.2 vanilla with the revert and the patches.
> 
> aplay hung again when I ran it, the kernel was stuck on:
> Jan 04 02:25:59 leatherback kernel: usb 1-4: 1:1 Start Playback PCM
> 
> and didn't output another line until I ctrl+c aplay.

OK, thanks.  Then it's not about the USB interface reset.
It must be subtle and nasty difference.

Could you apply the change below on the top?
It essentially reverts the hw_params/prepare split again.


Takashi

-- 8< --
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -564,6 +564,21 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	ret = snd_usb_endpoint_set_params(chip, subs->data_endpoint);
+	if (ret < 0)
+		goto unlock;
+
+	if (subs->sync_endpoint) {
+		ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
+		if (ret < 0)
+			goto unlock;
+	}
+
+	ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
+	if (ret < 0)
+		goto unlock;
+	else if (ret > 0)
+		snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
+	ret = 0;
 
  unlock:
 	if (ret < 0)

