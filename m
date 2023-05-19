Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B18FC7095F2
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 13:06:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1643206;
	Fri, 19 May 2023 13:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1643206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684494360;
	bh=4NhY1rh4hGV7f7rxc1iCcvwlI+Tvn3HO8/DAejygqJc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B6iBP3wxpOUcp6fm0/Sv1dc/ftAkdd+Ei2KIzztTd6WfpQEH+CXW2/PhBn+oUlWtc
	 7Qd1ZDJEUcJCUx4X/Aw+66eVOL4Gjm3YUWREwrGc/wcFaNfFuWuCWVV7kfrPrgJ4po
	 CjWBytoONQQH07rYoke91MhUVQ/UWIw51sb6Q8pQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64036F80272; Fri, 19 May 2023 13:04:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6A55F8025A;
	Fri, 19 May 2023 13:04:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B73EF80272; Fri, 19 May 2023 13:04:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FF71F8024E
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 13:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FF71F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=LQAjmc/p;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GtPPRxMw
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 85C5B1FE3D;
	Fri, 19 May 2023 11:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684494273;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5CXOP/R33OYA8Bs5m2n1NpkSG3VpWev+UL5oVDPOwZ0=;
	b=LQAjmc/pskCzXF6PkJf8bS+Bn+GMNLOSnaIULSxI45jTo84Q29bjZtt6bnAvhaqOsQCfei
	JqFaMYQm1KIKHFf9AjsQmO5xpperjw3tdSX6UJXuwEOTLAGtX+fSb0G/GM2W8fUG5faDru
	Y+f6/vYDAmfYvLTEwrN4FMqX9HChqi0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684494273;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5CXOP/R33OYA8Bs5m2n1NpkSG3VpWev+UL5oVDPOwZ0=;
	b=GtPPRxMwvsDjf0Min2MaezWxa6Pzuf3wkp8IK1i/WCTZ1Gg0pC1PTEZ/MMm6Hg/2x7IfSv
	Z80sO3QEj6aVREDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A27E13A15;
	Fri, 19 May 2023 11:04:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8qX/FMFXZ2TXSQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 11:04:33 +0000
Date: Fri, 19 May 2023 13:04:32 +0200
Message-ID: <87a5y01t1b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 5/7] ALSA: emu10k1: centralize freeing PCM voices
In-Reply-To: <ZGdSzPTMbdRr/FhV@ugly>
References: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
	<20230518140947.3725394-6-oswald.buddenhagen@gmx.de>
	<87ttw9hesg.wl-tiwai@suse.de>
	<ZGdSzPTMbdRr/FhV@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 4A5ZEGQPE4WOXDR2YKHON5AU6SHTD5WW
X-Message-ID-Hash: 4A5ZEGQPE4WOXDR2YKHON5AU6SHTD5WW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4A5ZEGQPE4WOXDR2YKHON5AU6SHTD5WW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 May 2023 12:43:24 +0200,
Oswald Buddenhagen wrote:
> 
> On Thu, May 18, 2023 at 04:53:19PM +0200, Takashi Iwai wrote:
> > On Thu, 18 May 2023 16:09:45 +0200,
> > Oswald Buddenhagen wrote:
> >> -static int snd_emu10k1_pcm_channel_alloc(struct snd_emu10k1_pcm * epcm, int voices)
> >> +static void snd_emu10k1_pcm_free_voices(struct snd_emu10k1_pcm *epcm)
> >>  {
> >> -	int err, i;
> >> -
> >> -	for (i = 0; i < ARRAY_SIZE(epcm->voices); i++) {
> >> +	for (unsigned i = 0; i < ARRAY_SIZE(epcm->voices); i++) {
> > 
> > We don't use this style.  Declare the variable outside the for().
> > 
> ehm ...
> - "we" seems to be mostly true for alsa. but looking at the kernel as
> a   whole, that ship has sailed since the adoption of c11. maybe time
> to   adapt?
> - you're noticing this a bit late, after already merging 8 instances.
> 
> how should i proceed?

I'm not super-strict about it, but as checkpatch complaints, it's
still not so widely adapted.  Unless there is a reason that must be
written in that way, let's avoid it as much as possible.

That said, the already merged stuff, it's OK-ish, and we can correct
only when anyone complains.  For the new stuff, let's be careful from
now on :)

If we want really adapting this style, the coding style rule should be
officially updated at first, followed by the update of tools.


thanks,

Takashi
