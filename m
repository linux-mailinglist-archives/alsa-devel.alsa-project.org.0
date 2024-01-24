Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B962D83AB12
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 14:43:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE0D1852;
	Wed, 24 Jan 2024 14:43:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE0D1852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706103806;
	bh=L8niDdYvyq6Sr7i5GZjuTcHfkLDJLuy9oHm1l2V6eoo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rrLYHZMCtgHWBZorV0e+gTEikblQE2/q8EVWt1MO9N0xuX1HOgFAK2iaXBzQc3OLM
	 Bslp2Ys76fY9VswwhmgjLLiUzwqt1NC7Y9OcIaxxy5V1FTmde/7eQJ7OdFcSEkbfJ2
	 2pID223m6YOONo+qnLCdVkum0e/4ZCcPkTaR/YGI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3377BF802E8; Wed, 24 Jan 2024 14:42:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 043DDF804E7;
	Wed, 24 Jan 2024 14:42:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60B40F8028D; Wed, 24 Jan 2024 14:42:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0837F8003A
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 14:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0837F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=kWNkCC5+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+Us7D7mk;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=kWNkCC5+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+Us7D7mk
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A5ACE22093;
	Wed, 24 Jan 2024 13:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706103762;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5GUiaE8gOO6k9hUgfzzmP9QNAbNphguHmsGGeRdM5+4=;
	b=kWNkCC5+zIuNkcDSa4fDl9eiUMOyUjAUVkM0m5+CtLowGpkQZV2bcuoI/7s92p5tzWxSyx
	O6AZfhJbFXJP5J4tv5vyNjqIEXhITCRb3Q9qnm4RyXldHypmCOhuZZ+1dAIFNXqeKBB+wo
	MKzwkEBJR2G9n/8rC1V2wmV+EM6w7ws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706103762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5GUiaE8gOO6k9hUgfzzmP9QNAbNphguHmsGGeRdM5+4=;
	b=+Us7D7mkwxS0p2ZsTAwDM9eBRnIThzV+YtDJYalDs5zUTkXeHgqq1bv3mDHnO5+It4BfS9
	ix1QraUG/UBN8aCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706103762;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5GUiaE8gOO6k9hUgfzzmP9QNAbNphguHmsGGeRdM5+4=;
	b=kWNkCC5+zIuNkcDSa4fDl9eiUMOyUjAUVkM0m5+CtLowGpkQZV2bcuoI/7s92p5tzWxSyx
	O6AZfhJbFXJP5J4tv5vyNjqIEXhITCRb3Q9qnm4RyXldHypmCOhuZZ+1dAIFNXqeKBB+wo
	MKzwkEBJR2G9n/8rC1V2wmV+EM6w7ws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706103762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5GUiaE8gOO6k9hUgfzzmP9QNAbNphguHmsGGeRdM5+4=;
	b=+Us7D7mkwxS0p2ZsTAwDM9eBRnIThzV+YtDJYalDs5zUTkXeHgqq1bv3mDHnO5+It4BfS9
	ix1QraUG/UBN8aCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 764D713786;
	Wed, 24 Jan 2024 13:42:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nAGOG9ITsWXoSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 24 Jan 2024 13:42:42 +0000
Date: Wed, 24 Jan 2024 14:42:42 +0100
Message-ID: <87ttn2luel.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Tsoy <alexander@tsoy.me>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: usb-audio: Add delay quirk for MOTU M Series 2nd
 revision
In-Reply-To: <20240124130239.358298-1-alexander@tsoy.me>
References: <20240124130239.358298-1-alexander@tsoy.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kWNkCC5+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+Us7D7mk
X-Spamd-Result: default: False [-4.15 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.34)[90.42%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A5ACE22093
Message-ID-Hash: 67VLN766K2GHSPGYMPJKADDFULAQBMFD
X-Message-ID-Hash: 67VLN766K2GHSPGYMPJKADDFULAQBMFD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/67VLN766K2GHSPGYMPJKADDFULAQBMFD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 24 Jan 2024 14:02:39 +0100,
Alexander Tsoy wrote:
> 
> Audio control requests that sets sampling frequency sometimes fail on
> this card. Adding delay between control messages eliminates that problem.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217601
> Signed-off-by: Alexander Tsoy <alexander@tsoy.me>

Thanks, applied.


Takashi
