Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3582C959E92
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 15:24:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE507823;
	Wed, 21 Aug 2024 15:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE507823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724246652;
	bh=KFtZZeysOpPwQD8LLbTxJARdZc2ToQqHVD6VrZ17nEA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hoh+dkFoM5eKXSjX9WAGJ9biQY2Ezo8Hi231jZukKmn5XM5ZMj8kKGaqbjFTQTrWN
	 3sxg7wlNouK2LTK5p1o1bAI1lw2NNhCvzTVshJdtMPgzeqTqOil2zS+30YiQIRn1SX
	 aQ/xpEgMUhcg6o7AnT2dag6HDzQzq5XLkVTwC+0s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C36E1F80589; Wed, 21 Aug 2024 15:23:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFCC6F805B0;
	Wed, 21 Aug 2024 15:23:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C94A8F80496; Wed, 21 Aug 2024 15:23:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30791F800F0
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 15:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30791F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=W7+IgBwk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=isDNqMZ2;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=W7+IgBwk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=isDNqMZ2
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2604A20082;
	Wed, 21 Aug 2024 13:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724246610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ENyx53nwWY4QDIHm9+/8SrdUl3xu7tCqIX8WtYMFeg=;
	b=W7+IgBwkgv+pf7apqqu60mFHZD2WCnlgk1xkN4QHSggmcDxlyQ10n2H5SAXokoNQAd9vyZ
	4rargG0+fSsA9xQJm4gyo0dkkCDKtpQAZ1ShnANxd4hHYcBOvkxPz5UBPrAkUdXuCxzU0F
	ud/FZAnXxa3BrNxGkF1o+CJFXeMx5WI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724246610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ENyx53nwWY4QDIHm9+/8SrdUl3xu7tCqIX8WtYMFeg=;
	b=isDNqMZ2ZRuobvL9j6iy2g81VHSDrT8xBoepg16Blm0aapznOVp4REZuBnGBfOqtKKjlcJ
	1DXcb2HvX1+oIvDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724246610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ENyx53nwWY4QDIHm9+/8SrdUl3xu7tCqIX8WtYMFeg=;
	b=W7+IgBwkgv+pf7apqqu60mFHZD2WCnlgk1xkN4QHSggmcDxlyQ10n2H5SAXokoNQAd9vyZ
	4rargG0+fSsA9xQJm4gyo0dkkCDKtpQAZ1ShnANxd4hHYcBOvkxPz5UBPrAkUdXuCxzU0F
	ud/FZAnXxa3BrNxGkF1o+CJFXeMx5WI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724246610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ENyx53nwWY4QDIHm9+/8SrdUl3xu7tCqIX8WtYMFeg=;
	b=isDNqMZ2ZRuobvL9j6iy2g81VHSDrT8xBoepg16Blm0aapznOVp4REZuBnGBfOqtKKjlcJ
	1DXcb2HvX1+oIvDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9F7013770;
	Wed, 21 Aug 2024 13:23:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kpnYN1HqxWZbIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Aug 2024 13:23:29 +0000
Date: Wed, 21 Aug 2024 15:24:12 +0200
Message-ID: <87r0aiovpf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda: cs35l56: Don't use the device index as a
 calibration index
In-Reply-To: <20240821124711.44325-1-simont@opensource.cirrus.com>
References: <20240821124711.44325-1-simont@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.98%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: ZF2IBH52HTDGUPKXZPN6AKXCVWF7XH5L
X-Message-ID-Hash: ZF2IBH52HTDGUPKXZPN6AKXCVWF7XH5L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZF2IBH52HTDGUPKXZPN6AKXCVWF7XH5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Aug 2024 14:47:11 +0200,
Simon Trimmer wrote:
> 
> The HDA driver cannot assume that the order that the devices are
> specified in the cirrus,dev-index matches the order of calibration
> entries.
> 
> Only a calibration entry with a matching silicon id will be used.
> 
> Fixes: cfa43aaa7948 ("ALSA: hda: cs35l56: Apply amp calibration from EFI data")
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>

Thanks, applied now.


Takashi
