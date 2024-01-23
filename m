Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E96838845
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 08:51:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92141852;
	Tue, 23 Jan 2024 08:51:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92141852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705996285;
	bh=ApE1ymyjSp/9bjKw4vll3u4WRE8oc+K7pME/hV/KA8Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nPW380zVqH7FQTI+pj162hVqSiuR1z7YkcYwv8JDX24kt7Z1brBdRXPloMmD6XROW
	 BtSaGS1tqbRJSgwiK3fpteOf/c0vusx7Y89XFasGaM3ZeVAe7m5isaB9zBVOuDosgE
	 L2TiFSzeKmATem/YEFfmvUHxtDOsUNeQCwlUpKAo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25590F8057B; Tue, 23 Jan 2024 08:50:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8E20F8003A;
	Tue, 23 Jan 2024 08:50:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F4E9F8003A; Tue, 23 Jan 2024 08:47:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC830F8003A
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 08:45:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC830F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=lt1xBQlD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=sHAG/Yjo;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=lt1xBQlD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=sHAG/Yjo
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 17EBD22229;
	Tue, 23 Jan 2024 07:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1705995930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aa5L+mUFMi725X5M5MIPd+dHF2d9EcLTIcmYjrS3ceE=;
	b=lt1xBQlD8JmKMNxo7npxk1xElyE1A3/03nUIwq3XOWUSVPh97WZvESx2sW654taWagJ0RT
	6ZQ4wOvzpUfR8saJZVGI/S0mnbBmCSaMquMaeTLg6d7PQwDjLsmg0TOfww52MK6rdQNwyj
	fSFd7TzQZrFxJ3b3bgLqL3MwZbxZNiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705995930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aa5L+mUFMi725X5M5MIPd+dHF2d9EcLTIcmYjrS3ceE=;
	b=sHAG/YjoByK5Ln5BTRKlgGqmPvcusqS3QbqVN6F03BBKSRai/73qMnOANDZiNvIGItN4UH
	jtTBXLZvUZKBi4Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1705995930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aa5L+mUFMi725X5M5MIPd+dHF2d9EcLTIcmYjrS3ceE=;
	b=lt1xBQlD8JmKMNxo7npxk1xElyE1A3/03nUIwq3XOWUSVPh97WZvESx2sW654taWagJ0RT
	6ZQ4wOvzpUfR8saJZVGI/S0mnbBmCSaMquMaeTLg6d7PQwDjLsmg0TOfww52MK6rdQNwyj
	fSFd7TzQZrFxJ3b3bgLqL3MwZbxZNiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705995930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aa5L+mUFMi725X5M5MIPd+dHF2d9EcLTIcmYjrS3ceE=;
	b=sHAG/YjoByK5Ln5BTRKlgGqmPvcusqS3QbqVN6F03BBKSRai/73qMnOANDZiNvIGItN4UH
	jtTBXLZvUZKBi4Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D996F136A4;
	Tue, 23 Jan 2024 07:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y0deM5lur2XVYwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 23 Jan 2024 07:45:29 +0000
Date: Tue, 23 Jan 2024 08:45:29 +0100
Message-ID: <871qa8o5ly.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Julian Sikorski <belegdol@gmail.com>
Cc: alsa-devel@alsa-project.org,
	Julian Sikorski <belegdol+github@gmail.com>
Subject: Re: [PATCH] Add a quirk for Yamaha YIT-W12TX transmitter
In-Reply-To: <0cc1ed1a-10d6-4c78-a955-ca0f2435d538@gmail.com>
References: <20231127221552.19087-1-belegdol+github@gmail.com>
	<0cc1ed1a-10d6-4c78-a955-ca0f2435d538@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-1.14 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[github];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 TO_MATCH_ENVRCPT_SOME(0.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[alsa-project.org,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.04)[95.27%]
Message-ID-Hash: NSWBOS3YEDGIDMGDGVIVKCUB7AXJZH5O
X-Message-ID-Hash: NSWBOS3YEDGIDMGDGVIVKCUB7AXJZH5O
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSWBOS3YEDGIDMGDGVIVKCUB7AXJZH5O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 22 Jan 2024 14:58:14 +0100,
Julian Sikorski wrote:
> 
> Am 27.11.23 um 23:15 schrieb Julian Sikorski:
> > The device fails to initialize otherwise, giving the following error:
> > [ 3676.671641] usb 2-1.1: 1:1: cannot get freq at ep 0x1
> > 
> > Signed-off-by: Julian Sikorski <belegdol+github@gmail.com>
> > ---
> >   sound/usb/quirks.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> > index ab2b938502eb..bf0a7cca90d0 100644
> > --- a/sound/usb/quirks.c
> > +++ b/sound/usb/quirks.c
> > @@ -2031,6 +2031,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
> >   		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_IGNORE_CTL_ERROR),
> >   	DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */
> >   		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
> > +	DEVICE_FLG(0x0499, 0x3108, /* Yamaha YIT-W12TX */
> > +		   QUIRK_FLAG_GET_SAMPLE_RATE),
> >   	DEVICE_FLG(0x04d8, 0xfeea, /* Benchmark DAC1 Pre */
> >   		   QUIRK_FLAG_GET_SAMPLE_RATE),
> >   	DEVICE_FLG(0x04e8, 0xa051, /* Samsung USBC Headset (AKG) */
> 
> 
> 
> Hi all,
> 
> is there something missing? It does not look like this got merged.

I seem to have overlooked or it didn't reach to me properly.
Care to resubmit?  Don't forget to put subsystem maintainers to Cc.


thanks,

Takashi
