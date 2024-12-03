Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DE29E1C32
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2024 13:31:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9A12F53;
	Tue,  3 Dec 2024 13:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9A12F53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733229115;
	bh=U3eYCA+ZJKJW0zY8lFu1yJoHq0fqisPUAk1w46zMu+E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t18pHdm1Nsq+ICO4P8rFC31GpGDw5hmI9ECiQG1J0/ZpdGgg4dcvG3gEqV/MRgfNN
	 60roLKIjquGKMrwMS50eDjB1HfQZfPO5YemQDS4EMcR/Zw0Ir4YPCCa/2Yjui5Jujc
	 dA1C2G54Kil3GK9YzK6hsLhPBzgySqmPca/X6bmM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9771EF805BA; Tue,  3 Dec 2024 13:31:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D93ABF805B2;
	Tue,  3 Dec 2024 13:31:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F1EBF80272; Tue,  3 Dec 2024 13:31:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87FEEF80073
	for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2024 13:31:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87FEEF80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Stm+Inqd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NP4Ovi1H;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Stm+Inqd;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NP4Ovi1H
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 54AA11F453;
	Tue,  3 Dec 2024 12:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1733229068;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VxCL2Pt6mwo8HGHMXxJk9tqnyVqfXKeY6XQ0ThkihS4=;
	b=Stm+InqdsbLPbOKRvIwRMpizcx877jIOQ9pepnvvcttNwdJtiMSVG6k8zamB08hiqN1z4c
	1f+OE2XHqGrk9PPlEd/sPIqyQkGGzzgE5zrTE+kXoku8XhkZvfca67IFpBmEpzzEITB49o
	/7Hwmi0TRi12Rf8QBJqqefTtKi6293U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733229068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VxCL2Pt6mwo8HGHMXxJk9tqnyVqfXKeY6XQ0ThkihS4=;
	b=NP4Ovi1Hzm61oZ9CuP5PRFM+7KMQnksvubZ7qQ48t1qZK5rXqsjJsZYrlRCrkQ5OhTcTxX
	vZRVs/5JKwPxxmAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Stm+Inqd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NP4Ovi1H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1733229068;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VxCL2Pt6mwo8HGHMXxJk9tqnyVqfXKeY6XQ0ThkihS4=;
	b=Stm+InqdsbLPbOKRvIwRMpizcx877jIOQ9pepnvvcttNwdJtiMSVG6k8zamB08hiqN1z4c
	1f+OE2XHqGrk9PPlEd/sPIqyQkGGzzgE5zrTE+kXoku8XhkZvfca67IFpBmEpzzEITB49o
	/7Hwmi0TRi12Rf8QBJqqefTtKi6293U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733229068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VxCL2Pt6mwo8HGHMXxJk9tqnyVqfXKeY6XQ0ThkihS4=;
	b=NP4Ovi1Hzm61oZ9CuP5PRFM+7KMQnksvubZ7qQ48t1qZK5rXqsjJsZYrlRCrkQ5OhTcTxX
	vZRVs/5JKwPxxmAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45B08139C2;
	Tue,  3 Dec 2024 12:31:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5QFyEAz6TmebDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Dec 2024 12:31:08 +0000
Date: Tue, 03 Dec 2024 13:31:03 +0100
Message-ID: <871pypymm0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Filip Van Lunteren <filip.pinkfaun@outlook.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"perex@perex.cz" <perex@perex.cz>
Subject: Re: native DSD on PCI linux driver
In-Reply-To: 
 <AS4P189MB20372D46254D6425C820FC9C882F2@AS4P189MB2037.EURP189.PROD.OUTLOOK.COM>
References: 
 <AS4P189MB20372D46254D6425C820FC9C882F2@AS4P189MB2037.EURP189.PROD.OUTLOOK.COM>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 54AA11F453
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: LS5HTFSPPUCVXQDP5HQNQSUMKYPHAOAH
X-Message-ID-Hash: LS5HTFSPPUCVXQDP5HQNQSUMKYPHAOAH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LS5HTFSPPUCVXQDP5HQNQSUMKYPHAOAH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 26 Nov 2024 10:41:21 +0100,
Filip Van Lunteren wrote:
> 
> 
> Hello,
> 
> I am currently developing PCI audio output hardware and driver and want to
> integrate native DSD playback. I am struggling to find documentation on this.
> Is there DSD native support in ALSA? And how do I incorporate it? PCM is
> already set up and works.

AFAIK, in the driver side, there is not much special; it assumes that
DSD samples are passed over the standard PCM stream, and the driver
uses special formats SNDRV_PCM_FORMAT_DSD_U8, *_U16 and *_U32 (with
_LE and _BE suffix) for 8, 16 and 32bit, instead of the standard
SNDRV_PCM_FORMAT_U8, *_S16, etc.  For those formats, the silence data
is assumed to be 0x69, 0x6969, etc.


Takashi
