Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C17A7D09AE
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 09:45:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BB9A741;
	Fri, 20 Oct 2023 09:45:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BB9A741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697787955;
	bh=XlRuAaRXQFJpCTXmuecVz9r+KnT075bhDE2gkNrO9Kw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mSnPtFk2o1I+53nLmTGrHONB5GrlJwDt3ZqYhNaBF/c9oMdzkpUuXwZlTFYfkNgfq
	 ok3ivPkW8XV/1afweU5OjQkR41ooeiMgJb0kleiVnnXNtms53HGG+j9Uk6tpgvjG55
	 gejxlOz+O+K3pr6+CQuGK2b34u8wFS69v+nVPGWY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4273F80536; Fri, 20 Oct 2023 09:45:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DE68F8024E;
	Fri, 20 Oct 2023 09:45:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30C37F8025F; Fri, 20 Oct 2023 09:44:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55C6AF800C9
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 09:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55C6AF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=K/8QwbTr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cGBEzHKJ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1101D1F45B;
	Fri, 20 Oct 2023 07:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1697787889;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GhEd2/fmt9Cew3Moyr6KducdAVK+b7EMkVBZkL8MDXA=;
	b=K/8QwbTrC4CWRvJS1K/7n2K1tUl+Cf0eALwZwOYXDLnfpyqUHwdC27nmwfkDdiiffPSVhj
	/eoJpLiisxz2MK4dD/NMxi4vKn7ts58HcsUi2uSXjYq5XfkRE18a4h5o7++ZuqHHRC5Cjh
	lwZ+CIf7kbStu9UCUSihKZlqJuf3IK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1697787889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GhEd2/fmt9Cew3Moyr6KducdAVK+b7EMkVBZkL8MDXA=;
	b=cGBEzHKJGyvRPl7Xq41mcw5zVrLJsRSE+ciWMg5qMUHaKWmAP+SPDRysXduMXhWPJ9YIQH
	IGe46ots4ca8WHDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB2D813584;
	Fri, 20 Oct 2023 07:44:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CrqLNPAvMmWVEQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 20 Oct 2023 07:44:48 +0000
Date: Fri, 20 Oct 2023 09:44:48 +0200
Message-ID: <874jilloun.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org
Subject: Re: Migrating this list to a different platform (take 2)
In-Reply-To: <003be6b3-63eb-d850-2805-0a8ed6cf5b18@perex.cz>
References: <20231017-coroner-blurt-edffe8@meerkat>
	<8f62db8c-b10c-0256-a56c-28b998d1a3bc@perex.cz>
	<20231019-posture-cache-fe060b@meerkat>
	<9879e427-5dd0-43ee-bacb-0b0b452ea348@sirena.org.uk>
	<20231019-extinct-importer-8e3fce@meerkat>
	<003be6b3-63eb-d850-2805-0a8ed6cf5b18@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-9.82 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.72)[98.79%]
Message-ID-Hash: GKFSHA4J235BUW2QZ767XLAQDYCZVG6B
X-Message-ID-Hash: GKFSHA4J235BUW2QZ767XLAQDYCZVG6B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKFSHA4J235BUW2QZ767XLAQDYCZVG6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 20 Oct 2023 09:00:24 +0200,
Jaroslav Kysela wrote:
> 
> On 19. 10. 23 18:25, Konstantin Ryabitsev wrote:
> > On Thu, Oct 19, 2023 at 03:34:18PM +0100, Mark Brown wrote:
> >>> There's a third option -- instead of migrating the alsa-devel list, we can
> >>> migrate all activity to linux-sound@vger.kernel.org. It's an existing list
> >>> that currently sees about 5 messages a year (and most of them are cc'd to
> >>> alsa-devel anyway).
> >> 
> >> That would definitely work well from my point of view.
> > 
> > Okay, since it doesn't really affect anything, I've reconfigured the patchwork
> > side of things to accept patches sent both to alsa-devel and linux-sound. If
> > you do want to go down the route of shifting everything towards linux-sound,
> > the next step (once everyone is in agreement), is to make the changes to
> > MAINTAINERS. You don't have to do all subsystems at once, you can start with
> > the SOUND subsystem to trial things out and then shift others if everything is
> > working correctly.
> 
> If it's an overall agreement, we can move the driver related threads
> and the patch handling to linux-sound mailing list and keep alsa-devel
> list for the user space packages and the project related
> discussions. I'll send an initial patch for MAINTAINERS ASAP.

Sounds reasonable.

I'll merge your patch once after getting ACKs, but I suppose it's no
urgent change and OK for 6.7 merge window?


thanks,

Takashi
