Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E283756352
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 14:54:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 045F8AE9;
	Mon, 17 Jul 2023 14:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 045F8AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689598460;
	bh=ASq9pEXClLSACaryCnEVd4nfyxbSUrJ12nM/xZQavDE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XnLjT5kXrUEcm59PXGt4EJ5hfYBWd5PPpjMOrf22CUD0GTSaNSszE8AWnSZRlahkn
	 e2ixtunu9+Uc9+OIAf3tbsMMpE9Ql8Rpc+fQGxsiOFerBQbW4SXX2a6eUmzv68SnOc
	 HW2WPMysdyfRonRbGOGrY1rHOYtFsbg9SfYlQl3Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F4BFF80535; Mon, 17 Jul 2023 14:53:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBD1FF8032D;
	Mon, 17 Jul 2023 14:53:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D656F8047D; Mon, 17 Jul 2023 14:53:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C8E92F8027B
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 14:53:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8E92F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=cXHhQlD0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jfa67C4N
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1AE1321864;
	Mon, 17 Jul 2023 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689598400;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lnxzGA+xurPnHxWc03f4KouW3Va50opja+auAvQZlBI=;
	b=cXHhQlD0v/IF4E/QZkgURUbu5SyfF2PJlpOmABRZCA9Hw8j/kUzB0d7GZX8omm87s3sp7D
	Mr4KAUUK0gtRuhJHhheCTW+1WP+xDndXjkpakt3GbPSo2Gwl7/XEzEze3OHeqGqwHiubUh
	8AR+YkeND2O7d7VyErqy6l8m6yi9+fA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689598400;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lnxzGA+xurPnHxWc03f4KouW3Va50opja+auAvQZlBI=;
	b=jfa67C4N7irq9wE8zeu9puREwwzcfOiM4om9D7g7RvW3I5KUX761qjx9+/pRzhG1Z5vfYG
	H9DzpmIUIRjoG4BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F09B813276;
	Mon, 17 Jul 2023 12:53:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +dTkOb85tWTROgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 17 Jul 2023 12:53:19 +0000
Date: Mon, 17 Jul 2023 14:53:19 +0200
Message-ID: <87ilaiwvgg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 0/8] ALSA: emu10k1: add support for high-bitrate modes
 of E-MU cards
In-Reply-To: <ZLUVxVUHtUJvcuZQ@ugly>
References: <20230630144542.664190-1-oswald.buddenhagen@gmx.de>
	<87sf9vyfer.wl-tiwai@suse.de>
	<ZK0rw5j5BbyppXZ/@ugly>
	<87mt02wvsa.wl-tiwai@suse.de>
	<ZLUVxVUHtUJvcuZQ@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: YBA7YLRVWMHIZRIBZESFIJ7B7SUPUUAV
X-Message-ID-Hash: YBA7YLRVWMHIZRIBZESFIJ7B7SUPUUAV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YBA7YLRVWMHIZRIBZESFIJ7B7SUPUUAV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Jul 2023 12:19:49 +0200,
Oswald Buddenhagen wrote:
> 
> On Tue, Jul 11, 2023 at 01:08:05PM +0200, Takashi Iwai wrote:
> > On Tue, 11 Jul 2023 12:15:31 +0200,
> > Oswald Buddenhagen wrote:
> >> 
> >> On Mon, Jul 10, 2023 at 05:06:36PM +0200, Takashi Iwai wrote:
> >> > I still can't agree with the basic design using the dynamic kctl
> >> > addition / deletion in kcontrol's put action.
> >> > you are not being constructive. please provide specific,
> >> actionable
> >> responses to _all_ challenges/questions.
> > 
> > The fundamental idea to add / delete the kctls from the put callback
> > is unacceptable; as repeated many times, this is known to break
> > existing applications.  As long as you are sticking with this idea, it
> > can go [no] further.  Please avoid it and use the (more or less) static
> > configuration instead.
> > 
> to put the implications of this in clear words:
> you want me to spend additional time
> on a driver barely anyone still cares about
> to actively degrade the (my!) user experience
> to avoid hypothetical / likely obsolete crashes
> that would happen upon a rare user-controlled event
> in unspecified buggy (mixer? (!)) applications,
> while a known-good fallback exists (alsamixer).

Simply put, YES.  It's breaking applications pretty easily.  This
already happened in the past, so it's no hypothesis.

If you've ever programmed applications that deal with ALSA
mixer/control stuff by yourself, you'll notice that it's really tough
to deal with the dynamic deletion/addition.  alsamixer can accept it
in the limited manner, but it's no fallback for everything, of
course.


Takashi
