Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9EE96B993
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 13:03:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7195C93A;
	Wed,  4 Sep 2024 13:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7195C93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725447826;
	bh=POSHEmmMPiFWkRNS4R1ne1iS6VUgUqN337nJAH3tPfk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ri+G5cHnshr36fNW/IUS6+1DltCHeJ8cD+hiYW5U1Nki30Md+JeBr6zCtdnntFxZx
	 YVQUvsnsJZiOBHIuq+G3adYhMSfPQaktm0AiKrmc7SSN9LBkarZzV8LpnAcw5alv6W
	 WcW66weO9gCtzbWHPzvykFvlDc8eeOcbg0DBONeg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25206F805AE; Wed,  4 Sep 2024 13:03:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F523F8032D;
	Wed,  4 Sep 2024 13:03:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 804D0F80199; Wed,  4 Sep 2024 13:03:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A601AF80107
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 13:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A601AF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EaQjexoj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=SB7B020P;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=EaQjexoj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=SB7B020P
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B7A3221995;
	Wed,  4 Sep 2024 11:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725447787;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hjluhCFBVupjaHaDoFi7MHz9yC3FhdBQwXb+BEUEuWc=;
	b=EaQjexojlE6mJkLWU/m7U1W7IeDaTk8eDsVgGTytHvFAHouaqYEPJjYab8teVnhxrDL70R
	STB1x1djsU1MJ5ssnIxSRPjQB0vbrUqELeo4ftoiIt95oyxa+o4/CN2d5WEbi5UzTStETu
	uXlQpD6n57oQkFYWSS8Q1vdv7dPNG1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725447787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hjluhCFBVupjaHaDoFi7MHz9yC3FhdBQwXb+BEUEuWc=;
	b=SB7B020P1QZ3sz54U+D+5l1b8quWB0/YVYUbd0nynvO7PftKORtyN5DWTLuDga7lwq/oVW
	vPrzyEe2l/IOKVAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725447787;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hjluhCFBVupjaHaDoFi7MHz9yC3FhdBQwXb+BEUEuWc=;
	b=EaQjexojlE6mJkLWU/m7U1W7IeDaTk8eDsVgGTytHvFAHouaqYEPJjYab8teVnhxrDL70R
	STB1x1djsU1MJ5ssnIxSRPjQB0vbrUqELeo4ftoiIt95oyxa+o4/CN2d5WEbi5UzTStETu
	uXlQpD6n57oQkFYWSS8Q1vdv7dPNG1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725447787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hjluhCFBVupjaHaDoFi7MHz9yC3FhdBQwXb+BEUEuWc=;
	b=SB7B020P1QZ3sz54U+D+5l1b8quWB0/YVYUbd0nynvO7PftKORtyN5DWTLuDga7lwq/oVW
	vPrzyEe2l/IOKVAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89481139E2;
	Wed,  4 Sep 2024 11:03:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pEdWIGs+2GZNNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Sep 2024 11:03:07 +0000
Date: Wed, 04 Sep 2024 13:03:53 +0200
Message-ID: <87y147isti.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maximilien Perreault <maximilienperreault@gmail.com>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Support mute LED on HP Laptop
 14-dq2xxx
In-Reply-To: <20240904031013.21220-1-maximilienperreault@gmail.com>
References: <20240904031013.21220-1-maximilienperreault@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.972];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: MFERM354M7LP5PZ2HBDRXLJPSELVN7PN
X-Message-ID-Hash: MFERM354M7LP5PZ2HBDRXLJPSELVN7PN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MFERM354M7LP5PZ2HBDRXLJPSELVN7PN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 04 Sep 2024 05:10:13 +0200,
Maximilien Perreault wrote:
> 
> The mute LED on this HP laptop uses ALC236 and requires a quirk to function. This patch enables the existing quirk for the device.
> 
> Signed-off-by: Maximilien Perreault <maximilienperreault@gmail.com>

Applied now.  Thanks.


Takashi
