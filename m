Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83431AE2F0B
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Jun 2025 11:25:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 145F5601EE;
	Sun, 22 Jun 2025 11:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 145F5601EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750584353;
	bh=z006TtCVvVF5BXu/NhnjMYU312V/D+gCXZPmcHtRVRI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sY5XyAzHI9yYIeqRAPuzXG1u0/FFHFr8tAb+yJEzy9cZqh6+mYL0JG4F1umwobR7I
	 Z4Y0pyFp3fNfSiUTML2NLP5SDcnN+x27ufJkRDNHiH90l7GodZqSWV8eloxUdSKjgm
	 Z6Ch1KFoLyu3x4o6QeSM8ktDESect+BKTQGHSpQ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4943CF805C5; Sun, 22 Jun 2025 11:25:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37F17F805C6;
	Sun, 22 Jun 2025 11:25:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98E02F804FF; Sun, 22 Jun 2025 11:25:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6359DF80087
	for <alsa-devel@alsa-project.org>; Sun, 22 Jun 2025 11:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6359DF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BbdWmymw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+uH1gZhY;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=BbdWmymw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+uH1gZhY
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2787F1F38A;
	Sun, 22 Jun 2025 09:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1750584310;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+g5kR2uakhJALAF3FMrBpwhCgLAJC4sr5y4ImI6fsFk=;
	b=BbdWmymwjHhA6yYsAh0IklzFlErm64hs5qDPN8bikTvj9pK6XK1xBAP3gjsuioBdacUH9a
	EOdRkQEeyw9k2zBHK4+fx6uLgSSVHtXF99U++FWkyrdfmkqMZimP0TDv17W5FaDV2E7Eso
	nRt6rUTeNlzpDcUC6lPhInSvqoV1qbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750584310;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+g5kR2uakhJALAF3FMrBpwhCgLAJC4sr5y4ImI6fsFk=;
	b=+uH1gZhY+YmvYcC7U0fEpXVocAaQvuxKOSa8JGkdwNSGEgi3qdIPsOiJ/9D8rS3J/Bc9RY
	OOC9QAMI1amoZZCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1750584310;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+g5kR2uakhJALAF3FMrBpwhCgLAJC4sr5y4ImI6fsFk=;
	b=BbdWmymwjHhA6yYsAh0IklzFlErm64hs5qDPN8bikTvj9pK6XK1xBAP3gjsuioBdacUH9a
	EOdRkQEeyw9k2zBHK4+fx6uLgSSVHtXF99U++FWkyrdfmkqMZimP0TDv17W5FaDV2E7Eso
	nRt6rUTeNlzpDcUC6lPhInSvqoV1qbw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750584310;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+g5kR2uakhJALAF3FMrBpwhCgLAJC4sr5y4ImI6fsFk=;
	b=+uH1gZhY+YmvYcC7U0fEpXVocAaQvuxKOSa8JGkdwNSGEgi3qdIPsOiJ/9D8rS3J/Bc9RY
	OOC9QAMI1amoZZCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3E5013A69;
	Sun, 22 Jun 2025 09:25:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pu/NOfXLV2jlKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 22 Jun 2025 09:25:09 +0000
Date: Sun, 22 Jun 2025 11:25:09 +0200
Message-ID: <87pleww2kq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tim Crawford <tcrawford@system76.com>
Cc: alsa-devel@alsa-project.org,
	productdev@system76.com
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirks for some Clevo laptops
In-Reply-To: <20250620204329.35878-1-tcrawford@system76.com>
References: <20250620204329.35878-1-tcrawford@system76.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: OHH47MLYC5XITYH3YTPEGX6QNQCBQOO3
X-Message-ID-Hash: OHH47MLYC5XITYH3YTPEGX6QNQCBQOO3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OHH47MLYC5XITYH3YTPEGX6QNQCBQOO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 20 Jun 2025 22:43:29 +0200,
Tim Crawford wrote:
> 
> Add audio quirks to fix speaker output and headset detection on the
> following Clevo models:
> 
> - V350ENC
> - V350WNPQ
> - V540TU
> - X560WNR
> - X580WNS
> 
> Signed-off-by: Tim Crawford <tcrawford@system76.com>

Applied now.  Thanks.


Takashi
