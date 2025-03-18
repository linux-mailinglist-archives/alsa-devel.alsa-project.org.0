Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 854F1A67553
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Mar 2025 14:40:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB1D860372;
	Tue, 18 Mar 2025 14:39:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB1D860372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742305203;
	bh=e6Iecen2x/gTSzKICRv2kVg99HJC1SBEbQqWo23A+VQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fqcqgVm0AIETeCLJZS9eSfGvpweBJ3Y7norKRaWEAJdmGS7Kkh1GsWHpa7FpsEx+F
	 tjW+jyQ+LVIc4nTB3dBK9m+A4+pctWHKNkcdiRBRB5H6YkKA1yzKgklAMR0Gt4phb4
	 1xRKtSeq51N7XAmLhyUIYszTmMUANw+knBxBUs0Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1117F805AC; Tue, 18 Mar 2025 14:39:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 728B0F805AC;
	Tue, 18 Mar 2025 14:39:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25FF9F80587; Tue, 18 Mar 2025 14:38:47 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D189F80093
	for <alsa-devel@alsa-project.org>; Tue, 18 Mar 2025 14:38:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D189F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1JEWC58N;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Csc1dsu4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=eqWo4XYh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/Ls62ugT
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BF7EB21D47;
	Tue, 18 Mar 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1742305124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jb0lbqRygb1rD3kRgymhcNThcTC6tdgHNUFptp5h+sE=;
	b=1JEWC58N7Qfnf18AImSWFuZZrMsoq80xRN4TrzEvPnHG92SbnmDA8wwu2h8HzTfaaU+a8E
	P58XoqjS/A03NEf1lJN84RYFkjzBjpkmDrRG2RuYlOjTJYksDN2EAmDPIcvOt+mDm9Tp2L
	II4aFLsKW3RNX/cxHddXk9wOx+HwXDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742305124;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jb0lbqRygb1rD3kRgymhcNThcTC6tdgHNUFptp5h+sE=;
	b=Csc1dsu4ULvzEWGwth5NVtux9XNnLw9HTTY+Gax2T+ve0bdDbX/6oK4sJGENZk6j4g8S6z
	BaBHolFv91VGGCBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1742305122;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jb0lbqRygb1rD3kRgymhcNThcTC6tdgHNUFptp5h+sE=;
	b=eqWo4XYhpaV6ZE7KrhIOWtMml3LEVsRm0b3N9MEWtM47o8GxIMF7gWnO+67MvS4YSr2RET
	KWc84OfbnpP+Td/nRQwB41hBkhOe5pbooIPcLIgAdgUTvWcXaPBnCO1gKypCS+f8bYh8yD
	pG0bvzQGxJJkZ39zS474YzqDtdqFIQ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742305122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jb0lbqRygb1rD3kRgymhcNThcTC6tdgHNUFptp5h+sE=;
	b=/Ls62ugTs8RIARAH3igx1tschnaDtrWhwXa8ZhC0t9sGHCmEhIJHhRhda9Q0k/0TtMdKBi
	nicAuRwSc9POABAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7A06139D2;
	Tue, 18 Mar 2025 13:38:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HHWwJ2J32WdmdAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 18 Mar 2025 13:38:42 +0000
Date: Tue, 18 Mar 2025 14:38:42 +0100
Message-ID: <87a59i1msd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Olivia Mackintosh <livvy@base.nu>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: separate DJM-A9 cap lvl options
In-Reply-To: <20250316153323.16381-1-livvy@base.nu>
References: <20250316153323.16381-1-livvy@base.nu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,base.nu:email,suse.de:mid]
Message-ID-Hash: J32YLTKOB6NMPJXZOYPQH64XSR5HE7UF
X-Message-ID-Hash: J32YLTKOB6NMPJXZOYPQH64XSR5HE7UF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J32YLTKOB6NMPJXZOYPQH64XSR5HE7UF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 16 Mar 2025 16:33:23 +0100,
Olivia Mackintosh wrote:
> 
> Mixer quicks for the Pioneer DJM-A9 mixer was added in 5289d00 with
> additional capture level values added to the common DJM array of values.
> 
> This breaks the existing DJM mixers however as alsa-utils relies on
> enumeration of the actual mixer options based on the value array which
> results in error when storing state.
> 
> This commit just separates the A9 values into a separate array and
> references them in the corresponding mixer control.
> 
> Signed-off-by: Olivia Mackintosh <livvy@base.nu>

Applied with Fixes tag now.

At the next time, however, please submit to linux-sound ML instead of
alsa-devel ML, and put maintainers to Cc.


thanks,

Takashi
