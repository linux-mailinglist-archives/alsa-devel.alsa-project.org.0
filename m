Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B77FF759085
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 10:44:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69A121F7;
	Wed, 19 Jul 2023 10:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69A121F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689756266;
	bh=wb3ZJIKRO3I1IC9B0qNMxT18AfFdZj2SzNZcSWNZZTk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c/+MySud8eCRQ688302Gw31OJn++Q7fwHqJZixStofpgncVOU2oiVLKNhsjXB193c
	 ZG2kHnwn2pAEcij+IRTmlrH+MMiFM7caehpR/SKDot/YjyR+xwlUAqoyx9U7LNyjIj
	 BtY0Mj4GwKYb6cfezx5trmRaziGx7pvFi4rUoFyk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74260F804DA; Wed, 19 Jul 2023 10:43:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 159C6F8032D;
	Wed, 19 Jul 2023 10:43:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B12F9F8047D; Wed, 19 Jul 2023 10:43:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9294FF800D2
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 10:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9294FF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=thyUnjWW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=srHYmZhs
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CB0E61FD6C;
	Wed, 19 Jul 2023 08:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689756202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vvc5kdPqlVi6elOqQ/AkBycnfOHbHukWEB5/Lp3RNUo=;
	b=thyUnjWWKT2CH2cptX1yIvH4Fk3u2rTNxCuvxQryYFH95FYRGmSVWfcxrLFrLeZme8KEWw
	jSzrxZw7nhbUIT+0aykKfxKQlcB3Jex01Pk5ZIj0Bfqkwl+fYaoh4WG5RVvdm2ckZDJ2Fd
	rctKkLhL3lU+kXN13X0H/3+bkKw8zxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689756202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vvc5kdPqlVi6elOqQ/AkBycnfOHbHukWEB5/Lp3RNUo=;
	b=srHYmZhsyqoSfUGkYsoml9/8eWFqW6jakUkX+zYxPeR9odb0h2DJQqMDlMTkr0CoF0LuHC
	L9bJgo2W7v9J/wBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA1AF1361C;
	Wed, 19 Jul 2023 08:43:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ED+2KCqit2R0BgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 19 Jul 2023 08:43:22 +0000
Date: Wed, 19 Jul 2023 10:43:22 +0200
Message-ID: <87mszsl2ad.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Carl Klemm <carl@uvos.xyz>
Cc: alsa-devel@alsa-project.org,
    Takashi Iwai <tiwai@suse.de>
Subject: Re: [BUG REPORT] sound: pci: ctxfi: htimestamp dose not work on
 EMU20k during recording
In-Reply-To: <f9387d7455ed16cd59b24482a5f9ac5fdf274796.camel@uvos.xyz>
References: <dde0a305793ad7ddbd9e001e463207a84c2afcc9.camel@uvos.xyz>
	<87y1jcl5sj.wl-tiwai@suse.de>
	<f9387d7455ed16cd59b24482a5f9ac5fdf274796.camel@uvos.xyz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZP736GJOWE6ACHJCYENWRCJL3OAGCFYJ
X-Message-ID-Hash: ZP736GJOWE6ACHJCYENWRCJL3OAGCFYJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZP736GJOWE6ACHJCYENWRCJL3OAGCFYJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[Please keep ML in Cc.]

On Wed, 19 Jul 2023 10:10:47 +0200,
Carl Klemm wrote:
> 
> Hi,
> 
> The values only seam nonsensical if playback and record is active at
> the same time, otherwise eatch on its own is fine

That's an interesting point.  You mean "values" as the PCM positions?
That is, when running in full-duplex mode, only the capture stream
shows strange PCM positions, while PCM playback shows correctly?
Or are both screwed up?

And, how strange they are?  They jump up/down, random values, or any
patterns?


thanks,

Takashi

> 
> Carl Klemm
> 
> On Wed, 2023-07-19 at 09:27 +0200, Takashi Iwai wrote:
> > On Wed, 19 Jul 2023 09:10:12 +0200,
> > Carl Klemm wrote:
> > > 
> > > Hi,
> > > 
> > > see https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3352
> > > htimestamp returns nonesensical values when recording is active on
> > > a
> > > EMU20k device
> > 
> > The driver doesn't provide any own implementation of PCM tstamp,
> > hence
> > it must be the standard values.  That said, the incorrect values are
> > rather the "avail", that is the PCM position, not the timestamp
> > itself, I suppose.
> > 
> > Is it only about recording, i.e. playback doesn't show any wrong
> > values?
> > 
> > In anyway, try to enable the tracing for snd_pcm, get the position
> > and
> > the system timestamp during recording, and verify whether the
> > reported
> > values are reasonable or not.
> > 
> > 
> > Takashi
> 
