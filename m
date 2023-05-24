Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 936D670F3EF
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 12:17:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 796781EC;
	Wed, 24 May 2023 12:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 796781EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684923473;
	bh=TequyAXaZIqXk5MniZFq3VOFCQDmgcnMit5ri6emVTw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TOHi/GiVkdA1i4q+E7CuUAoqzLsCiTXhDSVlh+pUNd/nk4uCY1TnbWvMFtz+KMbDC
	 gqW0T6Xv2RVaLwKi6vkwSKlBUkyduDmsIuNqNZtLKZNTEiG5MgKrwOwH2aUuclJu0g
	 cy5o6KrJiVPOYnbhxheUmp7hjq4DwTFohd0sNeSM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46B51F80053; Wed, 24 May 2023 12:17:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02AF5F80249;
	Wed, 24 May 2023 12:17:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9859FF8024E; Wed, 24 May 2023 12:16:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A8BCF80053
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 12:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A8BCF80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QN104DB2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=arA3ctFd
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9606B1F45F;
	Wed, 24 May 2023 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684923410;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zttj4265y2tK/w+ymfGwU9nqseVLNqS6aHowZnIqk18=;
	b=QN104DB2Qo5wHo5pITkMoFrwIDNDS/CJBBddwmJbaRh63aj4f5/esqTq0fzrkJc4Epdsia
	IYbS8ovt9rRCqJjrOCTKrQoY0WGpi4kn5h7/YxOb3o2S82Zj/7cQRJh4r3IiTCAzzBXylo
	OOmkUbLnZ7K9hlLiORTZxyGtTsPLDEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684923410;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zttj4265y2tK/w+ymfGwU9nqseVLNqS6aHowZnIqk18=;
	b=arA3ctFdkWhFtKl81yuRmcLg3pAxTETekhLKmrFjpemmNbnDjufyhnoEh8EXV8MrbDH8CT
	pBESrN/tdXXjZsAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6821613425;
	Wed, 24 May 2023 10:16:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id bl95GBLkbWTvHAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 24 May 2023 10:16:50 +0000
Date: Wed, 24 May 2023 12:16:49 +0200
Message-ID: <87fs7mdofi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: "Joseph C. Sible" <josephcsible@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	"regressions@lists.linux.dev"
	<regressions@lists.linux.dev>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
In-Reply-To: <415d4bc84aa74c74af913048f28b42a9@realtek.com>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
	<CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
	<ZGB0cVVI7OgaJU6t@debian.me>
	<CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
	<87cz338ix4.wl-tiwai@suse.de>
	<CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
	<874jodlnmi.wl-tiwai@suse.de>
	<415d4bc84aa74c74af913048f28b42a9@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: ZUVO5RXXLMSCGC27G7SAVTTOW22YAJRX
X-Message-ID-Hash: ZUVO5RXXLMSCGC27G7SAVTTOW22YAJRX
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZUVO5RXXLMSCGC27G7SAVTTOW22YAJRX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 18 May 2023 07:44:23 +0200,
Kailang wrote:
> 
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Monday, May 15, 2023 9:40 PM
> > To: Joseph C. Sible <josephcsible@gmail.com>
> > Cc: Bagas Sanjaya <bagasdotme@gmail.com>; regressions@lists.linux.dev;
> > Kailang <kailang@realtek.com>; perex@perex.cz; tiwai@suse.com;
> > alsa-devel@alsa-project.org
> > Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP
> > 15z-fc000 on warm boot
> > 
> > 
> > External mail.
> > 
> > 
> > 
> > On Sun, 14 May 2023 23:48:55 +0200,
> > Joseph C. Sible wrote:
> > >
> > > On 5/14/23, Takashi Iwai wrote:
> > > > The patch changes two places (the change in alc_shutup_pins() and
> > > > alc256_shutup()), and I guess the latter is the culprit.  Could you
> > > > verify that only reverting the latter fixes the problem?
> > >
> > > Yes, only reverting the latter fixes the problem. I just tried a
> > > kernel consisting of 6.3.2 plus the below change, and it works fine:
> > >
> > > --- a/sound/pci/hda/patch_realtek.c
> > > +++ b/sound/pci/hda/patch_realtek.c
> > > @@ -3638,8 +3638,7 @@ static void alc256_shutup(struct hda_codec
> > *codec)
> > >         /* If disable 3k pulldown control for alc257, the Mic
> > > detection will not work correctly
> > >          * when booting with headset plugged. So skip setting it for
> > > the codec alc257
> > >          */
> > > -       if (codec->core.vendor_id != 0x10ec0236 &&
> > > -           codec->core.vendor_id != 0x10ec0257)
> > > +       if (codec->core.vendor_id != 0x10ec0257)
> > >                 alc_update_coef_idx(codec, 0x46, 0, 3 << 12);
> > >
> > >         if (!spec->no_shutup_pins)
> > 
> > OK, thanks for confirmation.
> > 
> > Kailang, could you check this issue?
> 
> OK. I will take it a look for these days.

Kailang, any chance to get this fixed?
Otherwise I'll revert the commit as a temporary solution at first.
You can re-apply the change (with the proper workaround for this
problem) later, too.


thanks,

Takashi
