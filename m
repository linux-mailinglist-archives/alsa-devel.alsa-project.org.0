Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C728D89A96E
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 08:53:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 035482CF3;
	Sat,  6 Apr 2024 08:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 035482CF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712386402;
	bh=C2NgITu0l9qaQbRqHLuuVXCjkvrLNmq1GDZRbl52qWA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i9VLvjtMwkZc5ArTsDH5RtoLDomBbEjaRd50ztosML1gbwZDoZf+2+9HT0HD+gNod
	 /bGFfLcH4C8CAGFBGqwbvA8CF8O27gYXZ1WyXqHNrRwteAX5p7rTv6D1rX0iHRvCOL
	 /TpuD013viZnijhWFtAgMSGPeOdJFVArknmWQD74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 287D1F80238; Sat,  6 Apr 2024 08:52:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4989FF8058C;
	Sat,  6 Apr 2024 08:52:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3E0AF8020D; Sat,  6 Apr 2024 08:40:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1E5BF8015B
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 08:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1E5BF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=O5sfR+UL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=oFS74DHM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=O5sfR+UL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=oFS74DHM
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 555CD21AF0;
	Sat,  6 Apr 2024 06:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1712385607;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iHNTJ9pWqueerMcDv6FMSUrIGJncPuN8KrhU7yg5Bls=;
	b=O5sfR+UL43Hqq+f82JNFZhX2CvYxiAMvPKtvfr6WSbuuouwIt2eKglU42vnsSsWkIKMdn0
	moPdWXUWJrTQg06YedXHL8TPbkVHqPTIfNgelMLRSAWG9E0RR58BlsWf9z/pIIcVIXJ94Y
	9h/YZF2BzHVUjlh4mIMR7+fNBvnjNpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712385607;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iHNTJ9pWqueerMcDv6FMSUrIGJncPuN8KrhU7yg5Bls=;
	b=oFS74DHMOTbWizV9wbzUPPIK3tP4uTqMI3eEicDo1jqdEF+PJ6TS72GOi3GMdaAf0lLd18
	pLogi+fadD6WYPAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1712385607;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iHNTJ9pWqueerMcDv6FMSUrIGJncPuN8KrhU7yg5Bls=;
	b=O5sfR+UL43Hqq+f82JNFZhX2CvYxiAMvPKtvfr6WSbuuouwIt2eKglU42vnsSsWkIKMdn0
	moPdWXUWJrTQg06YedXHL8TPbkVHqPTIfNgelMLRSAWG9E0RR58BlsWf9z/pIIcVIXJ94Y
	9h/YZF2BzHVUjlh4mIMR7+fNBvnjNpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712385607;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iHNTJ9pWqueerMcDv6FMSUrIGJncPuN8KrhU7yg5Bls=;
	b=oFS74DHMOTbWizV9wbzUPPIK3tP4uTqMI3eEicDo1jqdEF+PJ6TS72GOi3GMdaAf0lLd18
	pLogi+fadD6WYPAw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 31025139E8;
	Sat,  6 Apr 2024 06:40:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id pfFrCkfuEGYKTAAAn2gu4w
	(envelope-from <tiwai@suse.de>); Sat, 06 Apr 2024 06:40:07 +0000
Date: Sat, 06 Apr 2024 08:40:13 +0200
Message-ID: <87edbjm1te.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 00/17] ALSA: emu10k1 & emux: fixes related to wavetable
 playback
In-Reply-To: <ZhBFHmw/AGXvBULl@ugly>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
	<875xwwnp27.wl-tiwai@suse.de>
	<Zg/NfajQ3gdsmbUb@ugly>
	<87zfu8m7ay.wl-tiwai@suse.de>
	<ZhBFHmw/AGXvBULl@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.13 / 50.00];
	BAYES_HAM(-1.83)[94.03%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmx.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns]
Message-ID-Hash: Y5XCIKNDE6TMEDNNGJO3S5NRQA2XP5PH
X-Message-ID-Hash: Y5XCIKNDE6TMEDNNGJO3S5NRQA2XP5PH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y5XCIKNDE6TMEDNNGJO3S5NRQA2XP5PH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 05 Apr 2024 20:38:22 +0200,
Oswald Buddenhagen wrote:
> 
> On Fri, Apr 05, 2024 at 12:29:25PM +0200, Takashi Iwai wrote:
> > Try by yourself to apply the submitted patch mails with git-am on the
> > latest for-linus (or master) branch.
> > 
> ok, the problem is indeed patch corruption, but it's not your fault.
> trailing tabs got stripped from the patches in flight.
> 
> while my reading of
> https://www.rfc-editor.org/rfc/rfc5321#section-2.3.10 is that MTAs may
> not just strip trailing whitespace, the ones i tried apparently do.
> somebody may want to verify that ...
> 
> anyway, you can still apply the patches by adding --ignore-whitespace to
> git-am's command line.
> 
> if the process doesn't permit that, i'll re-post after convincing
> git-send-email to apply quoted-printable content-transfer-encoding to
> ensure preservation of trailing whitespace.

Yes, please resubmit with the correct content.
All the original posts are archived and may be used to check for the
correctness of the patches later.


thanks,

Takashi
