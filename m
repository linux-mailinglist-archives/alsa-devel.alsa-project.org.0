Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B3178261F
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 11:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AC24836;
	Mon, 21 Aug 2023 11:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AC24836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692609360;
	bh=bCRklIdWVM5rqmkeKwWBcvWQLzVCMRg2RA/Is8eHL7A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jyJhP5SMT+5sa3aP3K27V87NdwrmA8ZFh9d3hUQqRhP/F0z0A3krSY4S6kLcFaBJQ
	 Vy6vtft41So6c+DbhwKsKv0K4EwsdLwdvJvAIcIl/IhvEvrX/lI53pE72qLkM3LLNG
	 wV0VSyTEDwLDlv6nB/+L9IIxFF4eEU+P1tzasNTU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6797F80272; Mon, 21 Aug 2023 11:15:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 552B9F8016C;
	Mon, 21 Aug 2023 11:15:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7F3AF80199; Mon, 21 Aug 2023 11:15:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83926F800F8
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 11:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83926F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EF1EJYsE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QIwWoN2v
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AA77F205D1;
	Mon, 21 Aug 2023 09:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692609300;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l8hLfrEfmkYRdElw8Vnuc1F8YeyR+EXUajtCjcvHBUg=;
	b=EF1EJYsEonKlQFeYcgRZxP+lFxb9MGXTIN3ApbeZsK+xRyiPL94m7Eh6veWXzhXUtXCbjF
	lSwUzgVdIRZqgUZQCs+HNtFiolerVLKf0vJAtkz42byw7lpZfZBN12CSb9vjIFzavSjazr
	jevmyudPmxrJJy30glO0DmROvghQyms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692609300;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l8hLfrEfmkYRdElw8Vnuc1F8YeyR+EXUajtCjcvHBUg=;
	b=QIwWoN2vdqVRUjKakqnuINngn/d1tWypJDIyf3bCBH14x8YIVjvfDm0TXlsRHMEoHn4Jv/
	RvhHrf5NYxmiSsBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 485231330D;
	Mon, 21 Aug 2023 09:15:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hGv9DxQr42TYVQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 21 Aug 2023 09:15:00 +0000
Date: Mon, 21 Aug 2023 11:14:59 +0200
Message-ID: <87jzto92p8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	kevin-lu@ti.com,
	13916275206@139.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com,
	mengdong.lin@intel.com,
	baojun.xu@ti.com,
	thomas.gfeller@q-drop.com,
	peeyush@ti.com,
	navada@ti.com,
	broonie@kernel.org,
	gentuser@gmail.com
Subject: Re: [PATCH v3 2/2] ALSA: hda/tas2781: Add tas2781 HDA driver
In-Reply-To: <ZOMpDEZoF8ZK7vU0@smile.fi.intel.com>
References: <20230818085558.1431-1-shenghao-ding@ti.com>
	<20230818085558.1431-2-shenghao-ding@ti.com>
	<4c1b44b5-995a-fac7-a72b-89b8bf816dd2@linux.intel.com>
	<ZN+j3LmfUW2vB+QS@smile.fi.intel.com>
	<87jztq9iqv.wl-tiwai@suse.de>
	<ZOMpDEZoF8ZK7vU0@smile.fi.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 5ELTZT5H6RMIUJZB5MAOBIPHVSCRLOZN
X-Message-ID-Hash: 5ELTZT5H6RMIUJZB5MAOBIPHVSCRLOZN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ELTZT5H6RMIUJZB5MAOBIPHVSCRLOZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 21 Aug 2023 11:06:20 +0200,
Andy Shevchenko wrote:
> 
> On Sun, Aug 20, 2023 at 11:16:08AM +0200, Takashi Iwai wrote:
> > On Fri, 18 Aug 2023 19:01:16 +0200,
> > Andy Shevchenko wrote:
> > > On Fri, Aug 18, 2023 at 11:00:34AM -0500, Pierre-Louis Bossart wrote:
> 
> ...
> 
> > > > > +static void tas2781_fixup_i2c(struct hda_codec *cdc,
> > > > > +	const struct hda_fixup *fix, int action)
> > > > > +{
> > > > > +	 tas2781_generic_fixup(cdc, action, "i2c", "TIAS2781");
> > > > 
> > > > TI ACPI ID is TXNW
> > > > 
> > > > https://uefi.org/ACPI_ID_List?search=TEXAS
> > > > 
> > > > There's also a PNP ID PXN
> > > > 
> > > > https://uefi.org/PNP_ID_List?search=TEXAS
> > > > 
> > > > "TIAS" looks like an invented identifier. It's not uncommon but should
> > > > be recorded with a comment if I am not mistaken.
> > > > 
> > > > > +}
> > > 
> > > Thank you, but actually it's a strong NAK to this even with the comment.
> > > We have to teach people to follow the specification (may be even hard way).
> > > 
> > > So where did you get the ill-formed ACPI ID?
> > > Is Texas Instrument aware of this?
> > > Can we have a confirmation letter from TI for this ID, please?
> > 
> > This is used already for products that have been long in the market,
> > so it's way too late to correct it, I'm afraid.
> > 
> > What we can do is to get the confirmation from TI, complain it, and
> > some verbose comment in the code, indeed.
> 
> Oh, no! Who made that ID, I really want to point that at their faces.
> Look at the Coreboot (successful) case, they created something, but
> in time asked and then actually fixed the ill-formed ID (that was for
> one of RTC chips).
> 
> For this, please make sure that commit message has that summary, explaining that
> - states that ID is ill-formed
> - states that there are products with it (DSDT excerpt is a must)
> - lists (a few?) products where that ID is used
> - ideally explains who invented that and Cc them to the patch, so they will
>   know they made a big mistake

Sure, we should complain further and ask them that such a problem
won't happen again.  I'm 100% for it.

But the fact is that lots of machines have been already shipped with
this ID since long time ago, and 99.99% of them have been running on
Windows.  Hence I expect that the chance to get a corrected ID is very
very low, and waiting for the support on Linux until the correction of
ID actually happens makes little sense; that's my point.


Takashi
