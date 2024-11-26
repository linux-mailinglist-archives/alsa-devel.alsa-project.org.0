Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A90459D92C5
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2024 08:50:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 948181629;
	Tue, 26 Nov 2024 08:49:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 948181629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732607405;
	bh=Zy3aoV2lOS+V2/w9p1/dqpSEHMnh19TZAfUink2F8DM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VrFohU/AJgr0AhbFagrzhSk5TBTohzbux7RoQNQ1xbMkGX/zRUbR9hasotVNkV1SK
	 cFYKdTaW62kLdUxpz2KA01YfRa8dQWJ7nF6cFKhIuVgUvZciGk2kIxBDAyUp1Agzzi
	 W/C75fAnf6BhIHB6oG4pLQmxo4Hzng2ZdckYnIxY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32515F805B6; Tue, 26 Nov 2024 08:49:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29852F805C0;
	Tue, 26 Nov 2024 08:49:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B129F80496; Tue, 26 Nov 2024 08:49:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E8A9F8019B
	for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2024 08:49:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E8A9F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KLetT29u;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RGhdWO/G;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=KLetT29u;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RGhdWO/G
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B09D21158;
	Tue, 26 Nov 2024 07:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1732607369;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6DaMHX20blofpomovnv7qmKQNzHmqHmKfJA5IZMHdgk=;
	b=KLetT29uf/6XiZikihyaGVvvRzTgUgUhGg6BopL1oMlGgDjHik7sxh2lzk444FPl9JcjJj
	el7M8SpmREOQkaYOjbh1xDJd0e8pUzaBV64jadtNvBYCAZAtoTtYQcDn5wG7EtVrnJuK+x
	AVJ68TLAdAv2E+ANW9ixmeSsrIH4ugA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732607369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6DaMHX20blofpomovnv7qmKQNzHmqHmKfJA5IZMHdgk=;
	b=RGhdWO/GLD3WxQhe68k5PSVbj33p/SnVNtZOlQ2un6uq4u4b+lwUFfqmJ+iBTrJQeRnDSC
	lajt98Xb3SlX1LDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1732607369;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6DaMHX20blofpomovnv7qmKQNzHmqHmKfJA5IZMHdgk=;
	b=KLetT29uf/6XiZikihyaGVvvRzTgUgUhGg6BopL1oMlGgDjHik7sxh2lzk444FPl9JcjJj
	el7M8SpmREOQkaYOjbh1xDJd0e8pUzaBV64jadtNvBYCAZAtoTtYQcDn5wG7EtVrnJuK+x
	AVJ68TLAdAv2E+ANW9ixmeSsrIH4ugA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732607369;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6DaMHX20blofpomovnv7qmKQNzHmqHmKfJA5IZMHdgk=;
	b=RGhdWO/GLD3WxQhe68k5PSVbj33p/SnVNtZOlQ2un6uq4u4b+lwUFfqmJ+iBTrJQeRnDSC
	lajt98Xb3SlX1LDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2058713890;
	Tue, 26 Nov 2024 07:49:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OgqKBol9RWeGZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 Nov 2024 07:49:29 +0000
Date: Tue, 26 Nov 2024 08:49:28 +0100
Message-ID: <87y116juyf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: ALC225 update depop procedure
In-Reply-To: <5a27b016ba9d42b4a4e6dadce50a3ba4@realtek.com>
References: <5a27b016ba9d42b4a4e6dadce50a3ba4@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: 34AA7D2NKTRLMJ7XJGQ5Y7ASULPWJNK2
X-Message-ID-Hash: 34AA7D2NKTRLMJ7XJGQ5Y7ASULPWJNK2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/34AA7D2NKTRLMJ7XJGQ5Y7ASULPWJNK2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 26 Nov 2024 07:30:57 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> ALC225 update depop procedure.
> Many Thanks.
> 
> BR,
> Kailang

Applied now.  Thanks.


Takashi
