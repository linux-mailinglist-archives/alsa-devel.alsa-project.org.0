Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E52D75CC6A
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 17:49:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 630F01EC;
	Fri, 21 Jul 2023 17:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 630F01EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689954539;
	bh=j70yMBA0aQAl+9ho644tkDEktfP8JaZfPMGE57gZqzc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TP1UhIxu2Pt9b1nHThy0ykitCu7jbZ4MuI99UqxXEF++Va9IOdzU2MJqSt0jHXmK9
	 lnbzOtU2SuR1TiJnIflnl+SyjEJWU2DTivoiXDw5qNh3aXEVPFybwbcftuApmuSn0W
	 gLwoRZk5RF4EZGTXAg7rDYjHXPRHZkAowaBZj8U4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D91C5F80535; Fri, 21 Jul 2023 17:47:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 112CCF8032D;
	Fri, 21 Jul 2023 17:47:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7799CF8047D; Fri, 21 Jul 2023 17:47:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 571F9F8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 17:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 571F9F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=VU10g+c2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jUCaqqDC
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B7109218B1;
	Fri, 21 Jul 2023 15:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689954448;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kOpyg3IM40uiz74pTLIHtmENbyn0/bbfA502MQOu+/g=;
	b=VU10g+c2oOqS6tEoHGRiMAUZQaf6f5AwK0KQaHPwKk0ISDNTSCPAqe4jIVtXjR10MDt8MK
	WHrB50Pz/KdzLKQs/8GBlpXxkUN/y5D5fYiJrO78orZk2kEHsznqoi7RmtWF0G1/9o2sP9
	rynzj9nn/I5Gro7yz4FhKJsKbvgd7SI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689954448;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kOpyg3IM40uiz74pTLIHtmENbyn0/bbfA502MQOu+/g=;
	b=jUCaqqDCq+1JlmE8qV1C9fWVxzezEb62PVfR8MwpMTIxZeJJ2YBoVAyXd50BA4GtA+2GB0
	49Hes6qmPgp9fxDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D860134B0;
	Fri, 21 Jul 2023 15:47:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id rzLTIZCoumSiNAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 21 Jul 2023 15:47:28 +0000
Date: Fri, 21 Jul 2023 17:47:28 +0200
Message-ID: <871qh1z2pb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	tiwai@suse.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v5 00/11] ALSA: hda: Adding support for CS35L56 on HDA
 systems
In-Reply-To: <878rb9z4ou.wl-tiwai@suse.de>
References: <20230721132120.5523-1-rf@opensource.cirrus.com>
	<87bkg5z5c4.wl-tiwai@suse.de>
	<d7f96ecc-3900-4149-94b4-8bf96dc0728c@sirena.org.uk>
	<878rb9z4ou.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: IZ7QKXJBDQJA7WNREX4WSM3EGMADO535
X-Message-ID-Hash: IZ7QKXJBDQJA7WNREX4WSM3EGMADO535
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IZ7QKXJBDQJA7WNREX4WSM3EGMADO535/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023 17:04:33 +0200,
Takashi Iwai wrote:
> 
> On Fri, 21 Jul 2023 16:52:52 +0200,
> Mark Brown wrote:
> > 
> > On Fri, Jul 21, 2023 at 04:50:35PM +0200, Takashi Iwai wrote:
> > > Richard Fitzgerald wrote:
> > 
> > > > Changes are trivial so I have carried forward Mark's and Takashi's acks.
> > 
> > > Mark, I suppose it's fine to take all of those to my sound.git tree?
> > 
> > Should be.  Might be handy to have a branch to pull from in case of
> > conflicts I guess but probably not essential?
> 
> That's fine, I'll put a signed tag.

... and it turned out that it's not cleanly applicable, presumably
it's based on some more stuff of the latest asoc.

So, Mark, feel free to apply through yours.


Takashi
