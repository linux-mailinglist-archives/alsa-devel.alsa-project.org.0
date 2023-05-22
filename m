Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED3470BA22
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 12:28:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA88920C;
	Mon, 22 May 2023 12:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA88920C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684751294;
	bh=KKPgchiS4a46qG4+z2CO56Op+CcoRWrnNH3B5eBNAsk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BCzgn6BL9Tk9PtrBtcCqWM06gFkNdVeTCkRKdNdDwt8Vjvlv/ip6gfr3keLi/aSt8
	 1p8bdhhP/ES65QeNybMgeVRzweacnnkkI0qdh8mPx9U3nDc+tawsBNEg+8feEZpjp0
	 z+AcuBu5eQON9UxCZoK7JuocrVcsx5veGX15eIPg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20C15F8016A; Mon, 22 May 2023 12:27:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF96DF80249;
	Mon, 22 May 2023 12:27:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71CFEF8024E; Mon, 22 May 2023 12:27:20 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 620E3F8016A
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 12:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 620E3F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EjP7mnWB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nRJqUgeb
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DF5EC1FE00;
	Mon, 22 May 2023 10:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684751231;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VjtVY7dCXFLsQ4vXA2cYWDQA4mVD+s3RdAjIabsfsrA=;
	b=EjP7mnWBd12lvL/j9CQUHdhvUYiUDK7MFPYhCk5kweodbUW0ctQ9xH8SukinuPdHl9Ca/N
	asUXW4cxLbERicMNjFzDUWLgl5WqTgKMWpWCkBWBLrGD5v7oSUZH/l04xeI43KAmgWVcHd
	Gf2lP/ND3ofruPvfj0YdSJrW3ac9WYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684751231;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VjtVY7dCXFLsQ4vXA2cYWDQA4mVD+s3RdAjIabsfsrA=;
	b=nRJqUgebWUT5/YrZIkJgDhQM1IbPB69p7KAgNpWdpuLysTRYq764NyMw+VDyjzwhCEjiLb
	qPqmiI4QP7RloZDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C2C8113776;
	Mon, 22 May 2023 10:27:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id pZ6nLn9Da2TYEwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 22 May 2023 10:27:11 +0000
Date: Mon, 22 May 2023 12:27:11 +0200
Message-ID: <87ilcky83k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH 03/36] ALSA: rawmidi: UMP support
In-Reply-To: <6736e86b-f6bb-fc6f-ebc2-cb0c5f1d36fb@perex.cz>
References: <20230519093114.28813-1-tiwai@suse.de>
	<20230519093114.28813-4-tiwai@suse.de>
	<d22c2686-9b36-40b7-f284-17e8b78a04ac@perex.cz>
	<87mt1wygoz.wl-tiwai@suse.de>
	<6736e86b-f6bb-fc6f-ebc2-cb0c5f1d36fb@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: RYGF5FZWI33TXPTQJWRZHKTW46EB7BHU
X-Message-ID-Hash: RYGF5FZWI33TXPTQJWRZHKTW46EB7BHU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYGF5FZWI33TXPTQJWRZHKTW46EB7BHU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 22 May 2023 10:08:24 +0200,
Jaroslav Kysela wrote:
> 
> On 22. 05. 23 9:21, Takashi Iwai wrote:
> > On Mon, 22 May 2023 08:34:20 +0200,
> > Jaroslav Kysela wrote:
> >> 
> >> On 19. 05. 23 11:30, Takashi Iwai wrote:
> >>> This patch adds the support helpers for UMP (Universal MIDI Packet) in
> >>> ALSA core.
> >>> 
> >>> The basic design is that a rawmidi instance is assigned to each UMP
> >>> Endpoint.  A UMP Endpoint provides a UMP stream, typically
> >>> bidirectional (but can be also uni-directional, too), which may hold
> >>> up to 16 UMP Groups, where each UMP (input/output) Group corresponds
> >>> to the traditional MIDI I/O Endpoint.
> >>> 
> >>> Additionally, the ALSA UMP abstraction provides the multiple UMP
> >>> Blocks that can be assigned to each UMP Endpoint.  A UMP Block is a
> >>> metadata to hold the UMP Group clusters, and can represent the
> >>> functions assigned to each UMP Group.  A typical implementation of UMP
> >>> Block is the Group Terminal Blocks of USB MIDI 2.0 specification.
> >>> 
> >>> For distinguishing from the legacy byte-stream MIDI device, a new
> >>> device "umpC*D*" will be created, instead of the standard (MIDI 1.0)
> >>> devices "midiC*D*".  The UMP instance can be identified by the new
> >>> rawmidi info bit SNDRV_RAWMIDI_INFO_UMP, too.
> >>> 
> >>> A UMP rawmidi device reads/writes only in 4-bytes words alignment,
> >>> stored in CPU native endianness.
> >>> 
> >>> The transmit and receive functions take care of the input/out data
> >>> alignment, and may return zero or aligned size, and the params ioctl
> >>> may return -EINVAL when the given input/output buffer size isn't
> >>> aligned.
> >>> 
> >>> A few new UMP-specific ioctls are added for obtaining the new UMP
> >>> endpoint and block information.
> >>> 
> >>> As of this commit, no ALSA sequencer instance is attached to UMP
> >>> devices yet.  They will be supported by later patches.
> >>> 
> >>> Along with those changes, the protocol version for rawmidi is bumped
> >>> to 2.0.3.
> >>> 
> >>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> >> 
> >> Reviewed-by: Jaroslav Kysela
> >> 
> >> except:
> >> 
> >>> +/* UMP Endpoint information */
> >>> +struct snd_ump_endpoint_info {
> >>> +	int card;			/* card number */
> >>> +	int device;			/* device number */
> >> 
> >> I suspect that those two fields were added to enumerate devices in the
> >> control API. But this extension seems to be missing in your
> >> patches. There is only SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE
> >> implemented. Otherwise those two fields are not useful.
> > 
> > The SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE is looping over rawmidi, and
> > snd_rawmidi_info is provided for (kernel) UMP implementation.
> 
> Right. My point was that an application may be able to evaluate the
> other UMP specific information from those new structures before the
> rawmidi device is opened. So the CTL API extension may make sense.

Point taken, and indeed it might make more sense to change the ioctl
for looking at snd_ump_endpoint_info.  Will try to cook with it.

> > I took over those fields from snd_rawmidi_info, and they are supposed
> > to be referred rather from sequencer clients/ports (as well as from
> > the UMP rawmidi).  Then it could be useful when a user-space sequencer
> > client implements the UMP in future, and distinguish its identity.
> > 
> > But, it's no big deal to drop those, too.
> 
> Ok, keep them. Although this information seems to be redundant, it's
> harmless for now.

OK.


Takashi
