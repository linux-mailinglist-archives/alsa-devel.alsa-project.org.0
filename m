Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7448740FD4
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 13:13:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 599903E8;
	Wed, 28 Jun 2023 13:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 599903E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687950795;
	bh=P+XkCnS8DEZXpOW/5EPlRO5GUlsMlEjXL4xip20RWNI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X9LmUHLSm54OrvXJouIxLZARU2T2Pg9BXCdLM7CIUAVqmkqZPE2B4oYoWLo8/bVs9
	 jrFEDnDkghxPGFnQRiii2wJL02IvMJ/U1vSbu5o4zjNrjiow9vWuAnqBu1XxjHE4pz
	 S+xPuby0vubeOMIrHcJmEvqK+0jaQdQdeGtGumRw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94F69F80212; Wed, 28 Jun 2023 13:12:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42CD4F80212;
	Wed, 28 Jun 2023 13:12:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 738B5F80246; Wed, 28 Jun 2023 13:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF8A6F80169
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 13:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF8A6F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Q99ZNaop;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4U2NkYgy
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 25F8E1F8BE;
	Wed, 28 Jun 2023 11:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687950734;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jagDbahqfqEDmtHXNdeXf3ZJh1+EYHuxeMz7wmu5nN0=;
	b=Q99ZNaopnrfrAOJAlr+c6F6I3JgHJtsF0UBxM/Rrf/BQFJGx/rqozkWeKji47yD/L2G035
	uQNJvUzYnYSeNYpJm+5LFYL1KIQB5iuqvrU85nrhwxGKGRv6is9+bnY06PDcjByuCZqxvD
	L5wM8Cq6T1av22Fj4rUcfDXvk5QBHco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687950734;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jagDbahqfqEDmtHXNdeXf3ZJh1+EYHuxeMz7wmu5nN0=;
	b=4U2NkYgyAQ9JGNC8WLwHoZ9lCuAPPSdjZliX1Y7TixYxGyw6SXLOefre+yjGYhdosdcJIr
	MtHCVJtjQhe+j4Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0CA66138E8;
	Wed, 28 Jun 2023 11:12:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ixZKAo4VnGTQMgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 28 Jun 2023 11:12:14 +0000
Date: Wed, 28 Jun 2023 13:12:13 +0200
Message-ID: <87r0pvet82.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Symbolic Debugger" <happy.debugging@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
In-Reply-To: 
 <168793514562.22.9016848490888615032@mailman-web.alsa-project.org>
References: <168726778987.22.3291129206408701069@mailman-web.alsa-project.org>
	<168793514562.22.9016848490888615032@mailman-web.alsa-project.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: WMXZOWOB6GRFORIWERSS53Y2H3TPGHVI
X-Message-ID-Hash: WMXZOWOB6GRFORIWERSS53Y2H3TPGHVI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WMXZOWOB6GRFORIWERSS53Y2H3TPGHVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 28 Jun 2023 08:52:25 +0200,
Symbolic Debugger wrote:
> 
> I have a few question on the implementation
> 
> 1. As stated above:  So the driver may support multiple UMP Endpoints in theory, although most devices are supposed to have a single UMP EP that can contain up
> to 16 groups -- which should be large enough.
> 
> I read (forgot where)  that Windows will  only supports 1 endpoint) . This would results in maximum 16 I/O ports when using one group terminal block per endpoint. Correct ? In that case manufacturers may not create  devices with multiple endpoints ... :-) ?

Yes, that's my point in the above.  It's not much expected that there
will be multiple (UMP) Endpoints on a single device.  In theory it's
still possible, and the Linux driver supports it, but for now, it's
supposed to be exceptional.  Other OS don't seem supporting multiple
EPs, in anyway.

> Per USB spec, One endpoint can support maximum 16 terminal blocks with each 16 groups so one endpoint in theory could support 256 (bi directional) groups and thus 512 ports (256 in/ 256 out)

One UMP EP can have up to 32 Function Blocks.  But the actual
limitation is rather the max number of UMP Groups (16) contained in a
single EP.

> 2. If there is  one in and and out terminal  in an endpoint, then this will be presented as one in and one output port (in ALSA) ? Correct ?

Not really, GTB or FB are merely meta data representing the
associations of UMP Groups on a UMP Endpoint.  The Groups included in
a FB can be even changed dynamically during the runtime, too.
The actual input and output entities are UMP Groups, which correspond
to the former MIDI ports.  GTB and FB indicate how those are tied.

BTW, a UMP Endpoint represents the bidirectional I/O by itself, so
it's a pair of USB Endpoints.

> 3.  bGrpTrmBlkType: are 0x00, 0x01 and 0x02 all supported ?

Yes.

> 4. At the MIDI device, should OUT endpoints be BULK,  and IN endpoints be INTERRUPT or BOTH BULK ? Page 21 of MIDI spec shows BULK for in and out but the descriptor example shows interrupt for IN. Page 19 states: MIDI Streaming Data Endpoints use bulk or interrupt transfers to exchange data with the Host

AFAIK, in most cases, INT is used for MIDI 2.0 USB Input Endpoint,
while BULK is used for USB Output Endpoint.  (On USB MIDI 1.0 spec,
both are BULK, although there have been a few vendor-specific
variants, too).  But the driver can work in ether way.  It just
depends on the USB descriptor.

> 5. Are more than 1 Group Terminal Blocks supported by the driver for one endpoint ?

Yes, and that's the very key point of MIDI 2.0.

> 6. The current driver already uses the Group Terminal Blocks Descriptors Request ?

Yes and no.  On Linux driver, GTBs are referred at first only to find
out a MIDI Endpoint pair.  Then, the driver tries to issue the new UMP
1.1 Stream message to obtain the UMP Endpoint and Function Block
information.  On older devices that don't under those UMP 1.1
messages, the driver falls back and uses GTBs as the primary source
for building a topology.


Takashi
