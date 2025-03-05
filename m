Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4605DA4F888
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 09:17:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D214C602D2;
	Wed,  5 Mar 2025 09:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D214C602D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741162655;
	bh=vX3vJuDrmqon7c/JqA+YRrayRjfzyMwRAR7y1iFWpG8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qO9BvC0tPl4xOMbgipqFWlwoWkZ7uUf/6HHHDO3WWz8q2ekT/fYIuPq4dzwehyNsU
	 8Mqm+Y3BjD8YRTe0mgLarvXWkOvxgiFj/EdFiKUe45e3DcszXWE0bHyf6qos+qVSEl
	 ofKf8SNCo+ze86sPbkGsDrIQJ1jGcWgbPbPScSfY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07DD0F805B6; Wed,  5 Mar 2025 09:17:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 788CBF805BD;
	Wed,  5 Mar 2025 09:17:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6A40F802BE; Wed,  5 Mar 2025 09:16:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A8DBF80171
	for <alsa-devel@alsa-project.org>; Wed,  5 Mar 2025 09:16:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A8DBF80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=M4/73W/w;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=taojFvO1;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=M4/73W/w;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=taojFvO1
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A73C42118D;
	Wed,  5 Mar 2025 08:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1741162607;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X7wVAqcV88T1LetAygmi/3zVE/1PVMXpx1yLSG2Adqs=;
	b=M4/73W/waaNluRVAmq+4AdDmlyJ5B0t0GJU2h5wWz+I6HV81FoHiiWLySEflfqMpIlL0Tz
	MpRTBLkjalHOYH6ceEGmNxHMHogMWJI6qsVzOI62qNwYsaJuHIWrDdkJ3We3ls4ouzKAXL
	pBu/wHWBrQtT2sQnsapXdswaixHHgsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741162607;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X7wVAqcV88T1LetAygmi/3zVE/1PVMXpx1yLSG2Adqs=;
	b=taojFvO1DCxGkaizPfOmSwoz1Ao6fNTyCRGORpBW09OslIZAY9rL7Np3M5JRcav4ijS90q
	qgJATSqCq7AaGQCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1741162607;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X7wVAqcV88T1LetAygmi/3zVE/1PVMXpx1yLSG2Adqs=;
	b=M4/73W/waaNluRVAmq+4AdDmlyJ5B0t0GJU2h5wWz+I6HV81FoHiiWLySEflfqMpIlL0Tz
	MpRTBLkjalHOYH6ceEGmNxHMHogMWJI6qsVzOI62qNwYsaJuHIWrDdkJ3We3ls4ouzKAXL
	pBu/wHWBrQtT2sQnsapXdswaixHHgsQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741162607;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X7wVAqcV88T1LetAygmi/3zVE/1PVMXpx1yLSG2Adqs=;
	b=taojFvO1DCxGkaizPfOmSwoz1Ao6fNTyCRGORpBW09OslIZAY9rL7Np3M5JRcav4ijS90q
	qgJATSqCq7AaGQCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7966D1366F;
	Wed,  5 Mar 2025 08:16:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dbr9G28IyGf0VQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Mar 2025 08:16:47 +0000
Date: Wed, 05 Mar 2025 09:16:47 +0100
Message-ID: <87wmd3uc28.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: update ALC222 depop optimize
In-Reply-To: <f7fba6fc8d9e4abfb0c89e487e1d5d89@realtek.com>
References: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
	<87zfhzud4s.wl-tiwai@suse.de>
	<f7fba6fc8d9e4abfb0c89e487e1d5d89@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: ETFOWHANJCOUL4LPZORBR4MRAM4CLMJZ
X-Message-ID-Hash: ETFOWHANJCOUL4LPZORBR4MRAM4CLMJZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETFOWHANJCOUL4LPZORBR4MRAM4CLMJZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Mar 2025 08:56:41 +0100,
Kailang wrote:
> 
> 
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Wednesday, March 5, 2025 3:54 PM
> > To: Kailang <kailang@realtek.com>
> > Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>;
> > linux-sound@vger.kernel.org
> > Subject: Re: update ALC222 depop optimize
> > 
> > 
> > External mail : This email originated from outside the organization. Do not
> > reply, click links, or open attachments unless you recognize the sender and
> > know the content is safe.
> > 
> > 
> > 
> > On Wed, 05 Mar 2025 07:32:00 +0100,
> > Kailang wrote:
> > >
> > > Hi Takashi,
> > >
> > > Update ALC222 depop optimize as attach.
> > 
> > Could you give a bit more background info why this change is needed?
> > Is it a mandatory change to fix something, or it improves something?
> > 
> This codec has two headphone design.
> The HP2 was nid 0x14.

Sorry not clear enough: do you mean the patch is to fix the depop
problems on the models with two headphone pins with ALC222?


thanks,

Takashi
