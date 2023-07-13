Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 820AD752094
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 13:57:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4DB21E7;
	Thu, 13 Jul 2023 13:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4DB21E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689249452;
	bh=YiMtYq26dtrbt1hBCJLjHY2fvou2kzH71WjWT72BQSs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q25VXTzmDAPtbLuBoCF9M4ENIhi1X9GtbrE2jqxN2RqA1z6y2oqGw41lmH9dX77p7
	 5pZFd12eTZV6h/YGSa/040uLVuNzgXwTTfbq5N9R+dgC3iabg3ByY4Se3sINbAJaxZ
	 rEhWjqJrEYsX2WLOMJwGxbj2WhPcXX6eT5u2fqIA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0782F80153; Thu, 13 Jul 2023 13:56:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 595E2F80236;
	Thu, 13 Jul 2023 13:56:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59446F80249; Thu, 13 Jul 2023 13:56:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DF53F80153
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 13:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DF53F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=zgzory//;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Y2E+ZzVV
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9889422190;
	Thu, 13 Jul 2023 11:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689249389;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T4kap58PkB+UFk95aiVPyuch3sQhhFIdVe/Lj3ksTQ0=;
	b=zgzory//TCw6Ac69+EyjtafSIeGSCysrQEicChb/mBMN2i6lRc1mov0oCFPtOEEA1Nel9k
	a0DZfaNEg6xfHN3Cuos+8utz3IwtV9/mgkcyFzAtnW+F0jIDvFxCbWyugaL9XuneC3Ioj+
	P7sQoVSR+CNtI9dbbwGYdKoclM/FqZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689249389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T4kap58PkB+UFk95aiVPyuch3sQhhFIdVe/Lj3ksTQ0=;
	b=Y2E+ZzVVVHSK/PMN3Bcsyr6m8Bdx5U0qNZT53NSWSpbvMYovqfAyPGPLPOLkgdv0mNz3p5
	+IbGf1NO8i4VmQDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C389133D6;
	Thu, 13 Jul 2023 11:56:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IR94HW3mr2SRGwAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 13 Jul 2023 11:56:29 +0000
Date: Thu, 13 Jul 2023 13:56:28 +0200
Message-ID: <87y1jkdnyr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 3/3] ALSA: emu10k1: (re-)add mixer locking
In-Reply-To: <ZK/X07ZfVZ+geigm@ugly>
References: <20230712145750.125086-1-oswald.buddenhagen@gmx.de>
	<20230712145750.125086-3-oswald.buddenhagen@gmx.de>
	<87jzv4fbxl.wl-tiwai@suse.de>
	<ZK++wAP6zYFFWvq6@ugly>
	<87edlcf9p9.wl-tiwai@suse.de>
	<ZK/LhwAr+uMMTFZZ@ugly>
	<875y6of6sj.wl-tiwai@suse.de>
	<ZK/X07ZfVZ+geigm@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: K6XJXYJD73GQW537DSZIHNI2KGJJS43V
X-Message-ID-Hash: K6XJXYJD73GQW537DSZIHNI2KGJJS43V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6XJXYJD73GQW537DSZIHNI2KGJJS43V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jul 2023 12:54:11 +0200,
Oswald Buddenhagen wrote:
> 
> On Thu, Jul 13, 2023 at 12:24:28PM +0200, Takashi Iwai wrote:
> > Well, I took your patch 3 just because you wanted to have a protection
> > of your data from both get/put callback and from another code path in
> > another patch.  It was an (ab)use of controls->rwsem that couldn't be
> > accepted, so the patch 3 was taken as an alternative.
> > 
> > If this isn't the scenario, let me know: I'd rather drop the patch
> > again, as it's superfluous.
> > 
> ok, then please drop it.
> 
> you're quite right that this is the scenario, but i can do that
> selectively just as well, like it already is the case in some other
> callbacks. i just wanted to have this patch first if it was to be
> applied at all, because it seemed cleaner.

OK, dropped now.


thanks,

Takashi
