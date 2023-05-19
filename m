Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ADE709735
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 14:23:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67071200;
	Fri, 19 May 2023 14:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67071200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684499016;
	bh=BoOQaMg+i9QhInKjFsym4V6rREMwxSEcBjzJOOgPecM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UckMHGjpOk+qeaoUtBqMactT0WeNZCEzhrzCqfTr7StJ4tDINi83OblZxBYFVS+Gn
	 HMP4WkgpyVCC7pGOnsTa7R+a7A12I+oR9dVvj7eFDPXQQCnH5++HR8wzjhZtL9bmhS
	 Ux8GwqeRIg/TZtHP+ccO498/zp1JhhokkE5qVgJc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABE6BF80272; Fri, 19 May 2023 14:22:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E547F8025A;
	Fri, 19 May 2023 14:22:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4120F80272; Fri, 19 May 2023 14:22:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5854F8016D
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 14:22:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5854F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ozSjPyUT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mu1/dYY6
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 73B721F8B0;
	Fri, 19 May 2023 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684498958;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UnSDDnNAIAIkoAwDBj8SXBWEBNbyBr2nim5cfFIELO0=;
	b=ozSjPyUTZ66QSFN0cSa7LeHPTedgAYVHBGCVtIisxHOI/+dCRtkdrsEu/F1ssD3d/d2z0y
	lHa1gZEKI+s2BAuDcWDvGGnn9TR8/O8kHVMb+sQM1/lkTiF+mpVRRU9U8v9S/EeayHlK/N
	j9BmueLda8HReM5NB+gfw2r1aUeA+0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684498958;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UnSDDnNAIAIkoAwDBj8SXBWEBNbyBr2nim5cfFIELO0=;
	b=mu1/dYY6r9cRtZZ+SxhExhaP0sLP/eUWBs3ezzeELIP+J6RRcD1WRVGvR/6L5Kv4Zo/iKO
	jsMHXZjVBqJMRIDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 23C6413A12;
	Fri, 19 May 2023 12:22:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +mh0AQ5qZ2QJawAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 12:22:38 +0000
Date: Fri, 19 May 2023 14:22:37 +0200
Message-ID: <875y8o1pf6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 5/7] ALSA: emu10k1: centralize freeing PCM voices
In-Reply-To: <ZGdjHROPsjZ9QpUe@ugly>
References: <20230518140947.3725394-1-oswald.buddenhagen@gmx.de>
	<20230518140947.3725394-6-oswald.buddenhagen@gmx.de>
	<87ttw9hesg.wl-tiwai@suse.de>
	<ZGdSzPTMbdRr/FhV@ugly>
	<87a5y01t1b.wl-tiwai@suse.de>
	<ZGdjHROPsjZ9QpUe@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: FDTVGL52CNQ2MPPN3IFGKPYGIXOF5D2D
X-Message-ID-Hash: FDTVGL52CNQ2MPPN3IFGKPYGIXOF5D2D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FDTVGL52CNQ2MPPN3IFGKPYGIXOF5D2D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 May 2023 13:53:01 +0200,
Oswald Buddenhagen wrote:
> 
> On Fri, May 19, 2023 at 01:04:32PM +0200, Takashi Iwai wrote:
> > On Fri, 19 May 2023 12:43:24 +0200,
> > Oswald Buddenhagen wrote:
> >> 
> >> On Thu, May 18, 2023 at 04:53:19PM +0200, Takashi Iwai wrote:
> >> > On Thu, 18 May 2023 16:09:45 +0200,
> >> > Oswald Buddenhagen wrote:
> >> >> -static int snd_emu10k1_pcm_channel_alloc(struct snd_emu10k1_pcm * epcm, int voices)
> >> >> +static void snd_emu10k1_pcm_free_voices(struct snd_emu10k1_pcm *epcm)
> >> >>  {
> >> >> -	int err, i;
> >> >> -
> >> >> -	for (i = 0; i < ARRAY_SIZE(epcm->voices); i++) {
> >> >> +	for (unsigned i = 0; i < ARRAY_SIZE(epcm->voices); i++) {
> >> > 
> > I'm not super-strict about it, but
> 
> > as checkpatch complaints,
> > 
> it doesn't, so from that side it's settled. it's really just about the
> alsa-local policy.
> 
> what it actually *does* complain about is the use of bare
> "unsigned".

Ah that's OK, then.

> i don't like the excessively verbose "unsigned int", so
> i'll switch my uses over to "uint", which already has some use in
> alsa. ok?

I don't mind much about the use of unsigned without int.  Or it could
be a simple int there, as that's nothing but a counter that is used
locally that can't over 31bit.

But the patch description could be still improved.


thanks,

Takashi
