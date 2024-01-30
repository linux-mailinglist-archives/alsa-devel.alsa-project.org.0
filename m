Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EABE88425D8
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jan 2024 14:11:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 333B0E0D;
	Tue, 30 Jan 2024 14:10:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 333B0E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706620267;
	bh=ltA7e8nGr0U9It4i6fpE4LYFpjN21uK9zaa7giqc9Ds=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pah/az0jtsZZyCQ3Dw/kPKAsC3dRHzDi4bF7/4k7YGi7W8MgGQ6vue4mh0gun+kVo
	 WQ5hG/UvcqCpIlbtnUnfACg5Ace/5EI2O6uK/QdM6RKtIhWuMVxg9d5NKcDcWp/2I8
	 Pj1xZmUR2Q2Bi+AY1k2++rnp9mk4bcNrBT9p4EMM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F5A9F80588; Tue, 30 Jan 2024 14:10:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DE93F8057D;
	Tue, 30 Jan 2024 14:10:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04343F8055C; Tue, 30 Jan 2024 14:10:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 407D2F80548
	for <alsa-devel@alsa-project.org>; Tue, 30 Jan 2024 14:10:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 407D2F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=AVAVOZ4K;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Y7vzA6YL;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=AVAVOZ4K;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Y7vzA6YL
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ACAF41F84A;
	Tue, 30 Jan 2024 13:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706620222;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QFI+Ahj/j5Y+mc+wVzrHxha1owur218M4+BslNp10oQ=;
	b=AVAVOZ4KbilBT8Gx/HshGA9Fh4CbKYPJM03CnR3xDa7I/YqTWHaXOPgh4Pt2OMa3m/TNq4
	A7NM+JzvSvYf8G6yZCXFQocJfkjVe0UdEzvQeL9H6z1rEP+RRnaqL24OX/1xwI4Bsq10Ve
	5PGj4/z7OaE+Qg27webpUPpLnb5a9dQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706620222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QFI+Ahj/j5Y+mc+wVzrHxha1owur218M4+BslNp10oQ=;
	b=Y7vzA6YL8uBDMsYRsJAAYsiKT/FwXUBAMq3yc6snAmv0iaFVStHND5GEgxD8wPsgS6H0Hn
	N4bx/W3rkOJ+KJCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706620222;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QFI+Ahj/j5Y+mc+wVzrHxha1owur218M4+BslNp10oQ=;
	b=AVAVOZ4KbilBT8Gx/HshGA9Fh4CbKYPJM03CnR3xDa7I/YqTWHaXOPgh4Pt2OMa3m/TNq4
	A7NM+JzvSvYf8G6yZCXFQocJfkjVe0UdEzvQeL9H6z1rEP+RRnaqL24OX/1xwI4Bsq10Ve
	5PGj4/z7OaE+Qg27webpUPpLnb5a9dQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706620222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QFI+Ahj/j5Y+mc+wVzrHxha1owur218M4+BslNp10oQ=;
	b=Y7vzA6YL8uBDMsYRsJAAYsiKT/FwXUBAMq3yc6snAmv0iaFVStHND5GEgxD8wPsgS6H0Hn
	N4bx/W3rkOJ+KJCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C1CC12FF7;
	Tue, 30 Jan 2024 13:10:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nvXPED71uGW1WAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 30 Jan 2024 13:10:22 +0000
Date: Tue, 30 Jan 2024 14:10:21 +0100
Message-ID: <87zfwn2chu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kenzo Gomez <kenzo.sgomez@gmail.com>
Cc: alsa-devel@alsa-project.org,
	david.rhodes@cirrus.com,
	james.schulman@cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	perex@perex.cz,
	rf@opensource.cirrus.com,
	sbinding@opensource.cirrus.com,
	tiwai@suse.com
Subject: Re: [PATCH v3] ALSA: hda: cs35l41: Support additional ASUS Zenbook
 UX3402VA
In-Reply-To: <20240127164621.26431-1-kenzo.sgomez@gmail.com>
References: <874jfdwsfg.wl-tiwai@suse.de>
	<20240127164621.26431-1-kenzo.sgomez@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AVAVOZ4K;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Y7vzA6YL
X-Spamd-Result: default: False [-2.28 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BAYES_HAM(-2.97)[99.87%];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:97:from];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: ACAF41F84A
Message-ID-Hash: BFFBS2OTDAADWEOXPBJM7TQ2HXBQCERJ
X-Message-ID-Hash: BFFBS2OTDAADWEOXPBJM7TQ2HXBQCERJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BFFBS2OTDAADWEOXPBJM7TQ2HXBQCERJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 27 Jan 2024 17:46:21 +0100,
Kenzo Gomez wrote:
> 
> Add new model entry into configuration table.
> 
> Signed-off-by: Kenzo Gomez <kenzo.sgomez@gmail.com>

Applied now.  Thanks.


Takashi
