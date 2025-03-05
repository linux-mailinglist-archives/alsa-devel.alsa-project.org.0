Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F32DA4F853
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 08:54:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B697F602C9;
	Wed,  5 Mar 2025 08:54:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B697F602C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741161298;
	bh=K36fAm89X5SrXPwH67TCmdU7lnTx7IUpwd2mFi3bTCc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cEF/aKqLw60s5cFSkKvuJ19NnjbBW2q1upiUCenV5p1Aze2DmuJqCSdndRsOz/jk3
	 UfTJo1tpR7qqkj4J1P6NKfiWcmsQXcbodjDop72HlRyhvxS9i/NXRVyMq3UeUEvBNz
	 s77nI7wZiUTwWbvDv6F+okpEIpI7djrBqTfWQeBw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B16AF805BE; Wed,  5 Mar 2025 08:54:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E33ACF805B5;
	Wed,  5 Mar 2025 08:54:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF715F8011B; Wed,  5 Mar 2025 08:54:00 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BEAB0F80171
	for <alsa-devel@alsa-project.org>; Wed,  5 Mar 2025 08:53:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEAB0F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rV2rbFjY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=T1pGKUT+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=rV2rbFjY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=T1pGKUT+
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9BC3D1F393;
	Wed,  5 Mar 2025 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1741161220;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VTfGV8Bs9nYJ2LUZx1xbZKnrLQsmMhbvJLY4EmDrEcY=;
	b=rV2rbFjYWUw2K1OEqJ+TgsMd8Cu9jrr7Bq+XJ0zpMGVGvLyKULpodikWWb1IDfNH2qdYGD
	NRPp5M4jVDZq47xpSI10XW2Ps6Nqy8EwKpoVdUO0kYsnO6VLfEQMD2BmdTal5njApw5Kta
	QxFEO47MgTlMCyCy6YKlq3nOBCCFJhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741161220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VTfGV8Bs9nYJ2LUZx1xbZKnrLQsmMhbvJLY4EmDrEcY=;
	b=T1pGKUT+3nZVnVcxJXqCPvR56c+xXo0RUTQ0jvVwOhalI2ItPOwh5n4l9+JPQU49i5DRtG
	G3m0cdHbKrInGbCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1741161220;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VTfGV8Bs9nYJ2LUZx1xbZKnrLQsmMhbvJLY4EmDrEcY=;
	b=rV2rbFjYWUw2K1OEqJ+TgsMd8Cu9jrr7Bq+XJ0zpMGVGvLyKULpodikWWb1IDfNH2qdYGD
	NRPp5M4jVDZq47xpSI10XW2Ps6Nqy8EwKpoVdUO0kYsnO6VLfEQMD2BmdTal5njApw5Kta
	QxFEO47MgTlMCyCy6YKlq3nOBCCFJhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741161220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VTfGV8Bs9nYJ2LUZx1xbZKnrLQsmMhbvJLY4EmDrEcY=;
	b=T1pGKUT+3nZVnVcxJXqCPvR56c+xXo0RUTQ0jvVwOhalI2ItPOwh5n4l9+JPQU49i5DRtG
	G3m0cdHbKrInGbCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75A621366F;
	Wed,  5 Mar 2025 07:53:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2v4KGwQDyGcRTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Mar 2025 07:53:40 +0000
Date: Wed, 05 Mar 2025 08:53:39 +0100
Message-ID: <87zfhzud4s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: update ALC222 depop optimize
In-Reply-To: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
References: <81c7f0ec4a2447219c06095e0de4d1d3@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: ZKBVUABKOITHVSCAMB4XNRFYRTFQWT2Z
X-Message-ID-Hash: ZKBVUABKOITHVSCAMB4XNRFYRTFQWT2Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZKBVUABKOITHVSCAMB4XNRFYRTFQWT2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 05 Mar 2025 07:32:00 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Update ALC222 depop optimize as attach.

Could you give a bit more background info why this change is needed?
Is it a mandatory change to fix something, or it improves something?


thanks,

Takashi
