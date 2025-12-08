Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47039CAD722
	for <lists+alsa-devel@lfdr.de>; Mon, 08 Dec 2025 15:29:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A9BF601FE;
	Mon,  8 Dec 2025 15:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A9BF601FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765204171;
	bh=41O2RGhzMoDRw79CIKaLm9hYzODNfKspz0LTOYBpu+Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PBZoYmzowV0QSZCFaeQ+ObVOhUCli3BmNP32VvgkHSaHNRSkSWkj3aZpq+t1OvGaN
	 VAiPAJnSGax0JNEWtqm3qJyq1V2iySbeW4Y5dbagDjKEpq5LmPKo9niVDp5a705Vah
	 JS4QlSWaiDesIl+bbQjhzAUGqfiVhAhNwBdg3Lms=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0329DF805D4; Mon,  8 Dec 2025 15:28:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9312DF805D8;
	Mon,  8 Dec 2025 15:28:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42BFAF80525; Mon,  8 Dec 2025 15:28:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D796DF800ED
	for <alsa-devel@alsa-project.org>; Mon,  8 Dec 2025 15:28:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D796DF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=b7T0ejbN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=acBn5h/J;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=b7T0ejbN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=acBn5h/J
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C0D76337F1;
	Mon,  8 Dec 2025 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1765204120;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJ7o5yFokxGKDF1++LqzGxkl5wGif7X6hVbEcbWy9TQ=;
	b=b7T0ejbNzmxrXvJqXJ2JGQlgCBP/9r7oaIqb7RFVe8AfwTVEKzYXuq3wWWm91UZJ5jWgi3
	tIRX1Sabhu2dVQ3WowOzWABoNAKoKOtbAktMOxHpX+aQYhj0Bjg88dMd0ffFEz2Le+oWr2
	0wiKIWSjMLnbeT65Pv0AtaBOJie83yw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765204120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJ7o5yFokxGKDF1++LqzGxkl5wGif7X6hVbEcbWy9TQ=;
	b=acBn5h/J3udZkh8aQ20bMZevShp3sH6RRVf+VdB2ArzRNYHw5jhuv1jPCTmHXa9FJZpiad
	uMZxLMkXWi2q5gDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1765204120;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJ7o5yFokxGKDF1++LqzGxkl5wGif7X6hVbEcbWy9TQ=;
	b=b7T0ejbNzmxrXvJqXJ2JGQlgCBP/9r7oaIqb7RFVe8AfwTVEKzYXuq3wWWm91UZJ5jWgi3
	tIRX1Sabhu2dVQ3WowOzWABoNAKoKOtbAktMOxHpX+aQYhj0Bjg88dMd0ffFEz2Le+oWr2
	0wiKIWSjMLnbeT65Pv0AtaBOJie83yw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765204120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vJ7o5yFokxGKDF1++LqzGxkl5wGif7X6hVbEcbWy9TQ=;
	b=acBn5h/J3udZkh8aQ20bMZevShp3sH6RRVf+VdB2ArzRNYHw5jhuv1jPCTmHXa9FJZpiad
	uMZxLMkXWi2q5gDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 984E53EA63;
	Mon,  8 Dec 2025 14:28:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zJUUJJjgNmlnNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 08 Dec 2025 14:28:40 +0000
Date: Mon, 08 Dec 2025 15:28:40 +0100
Message-ID: <87sedlt5d3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andres J Rosa <andyrosa@gmail.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: uapi: Fix typo in asound.h comment
In-Reply-To: <20251203162509.1822-1-andyrosa@gmail.com>
References: <20251203162509.1822-1-andyrosa@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.931];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: UTPKV4ICP6T5FPWOB3RZPX5L5VGMZEYK
X-Message-ID-Hash: UTPKV4ICP6T5FPWOB3RZPX5L5VGMZEYK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UTPKV4ICP6T5FPWOB3RZPX5L5VGMZEYK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 Dec 2025 17:25:01 +0100,
Andres J Rosa wrote:
> 
> Fix 'level-shit' to 'level-shift' in struct snd_cea_861_aud_if comment.
> 
> Signed-off-by: Andres J Rosa <andyrosa@gmail.com>

Applied now.  Thanks.


Takashi
