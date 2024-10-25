Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 289939AFD03
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2024 10:47:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80B35DEC;
	Fri, 25 Oct 2024 10:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80B35DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729846072;
	bh=aTnH+z9CsakHYc2cJkYLYrQHvRysHo9ixduhfvIXf6E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ovsec7kZU7E8RNLrycr4sQG8UTvRO2mtl6X28bldDQIEmYmIjwbwU21yGJwrXt2hH
	 jck7o0MRiYGrSDXC1wIStCdpVyC8/nwfiJgJ/VOvtYSkQIkKB1EzxSZ8ExqJ3XjmXE
	 5tfE4YLE0MPTcNERGKQ2+wa/0mJvvq5XkgF95nnw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0226F805B2; Fri, 25 Oct 2024 10:47:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AB80F805B2;
	Fri, 25 Oct 2024 10:47:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9D90F8016C; Fri, 25 Oct 2024 10:47:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B962AF80104
	for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2024 10:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B962AF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=IYDJ1vT7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lvs+eZHS;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=IYDJ1vT7;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lvs+eZHS
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 179101FD89;
	Fri, 25 Oct 2024 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1729846040;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cSXU69TyX/evy8bIiwUjPx3aUCerVeqd+IHLUPl6RI4=;
	b=IYDJ1vT7hkTJ8GsnUQHxDmQYxEbAh8gicR7JzH6Gq99UIDYVtIGOueZ6aBkNrz/uidhTkH
	fKPIEqTW0bHNUPBf1om2AfW2QFwiKv/xabP2ZD0C5Lb452JdfT3Lpbhy7fA8qJkOEgBlhL
	YmqbN74weYhlXfhh65XOMWKDF9quuOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729846040;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cSXU69TyX/evy8bIiwUjPx3aUCerVeqd+IHLUPl6RI4=;
	b=lvs+eZHSv15s2PD3OE9PSt6+SIzcS/CE1DZjoNJ6uDuACHrY9JCmCoRQsZFpRJMsNLaJkK
	5kgAB9Ym+4gGJECA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1729846040;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cSXU69TyX/evy8bIiwUjPx3aUCerVeqd+IHLUPl6RI4=;
	b=IYDJ1vT7hkTJ8GsnUQHxDmQYxEbAh8gicR7JzH6Gq99UIDYVtIGOueZ6aBkNrz/uidhTkH
	fKPIEqTW0bHNUPBf1om2AfW2QFwiKv/xabP2ZD0C5Lb452JdfT3Lpbhy7fA8qJkOEgBlhL
	YmqbN74weYhlXfhh65XOMWKDF9quuOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729846040;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cSXU69TyX/evy8bIiwUjPx3aUCerVeqd+IHLUPl6RI4=;
	b=lvs+eZHSv15s2PD3OE9PSt6+SIzcS/CE1DZjoNJ6uDuACHrY9JCmCoRQsZFpRJMsNLaJkK
	5kgAB9Ym+4gGJECA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E557A13B18;
	Fri, 25 Oct 2024 08:47:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YXaxNhdbG2fCaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 25 Oct 2024 08:47:19 +0000
Date: Fri, 25 Oct 2024 10:48:21 +0200
Message-ID: <877c9wtvoq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: Limit internal Mic boost on Dell platform
In-Reply-To: <561fc5f5eff04b6cbd79ed173cd1c1db@realtek.com>
References: <561fc5f5eff04b6cbd79ed173cd1c1db@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: 3PQJRJZPH4VQHP75NGVF2575FJJ47TYI
X-Message-ID-Hash: 3PQJRJZPH4VQHP75NGVF2575FJJ47TYI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3PQJRJZPH4VQHP75NGVF2575FJJ47TYI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 25 Oct 2024 09:40:10 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach patch will limit internal Mic boost on all Dell platform.

Applied now.  Thanks.


Takashi
