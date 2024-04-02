Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F63A894B2B
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:16:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9ABB2366;
	Tue,  2 Apr 2024 08:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9ABB2366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712038589;
	bh=vSgNDpsIqNdwM2q7pzpW0xs896tER/hVFCAn9jhArbI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gH4/kzbX5JYIgvJ5v49N1jfFT8V5Njqzy8xkosH3fexu87wJrquU6KyV6fx+somhc
	 CuOvU02tcksmTF8mJo8qF/DTJ+zG7jJ+dNzqgfnfGV5cbfUtkstXbstPd4UITcKu4a
	 C4rQM9ZfQkKLmoBRW7J4etP9/2yC+yqC7mU76S/A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E231F805CB; Tue,  2 Apr 2024 08:15:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D26B6F805C3;
	Tue,  2 Apr 2024 08:15:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E43EF8020D; Tue,  2 Apr 2024 08:14:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CE5EF8016E
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 08:14:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CE5EF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1J8e8PZL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=m+428NSt
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2244E20C84;
	Tue,  2 Apr 2024 06:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1712038444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LIxXxoXIP4P9PQwM12nxsuvm0JoqTs4mYkXj4iPdTUE=;
	b=1J8e8PZL5eo04xLvrqY8xT7NqpOHcBgHU++atEwlkh59FjFuOpc7aBeKB6kE49p0ikAvR9
	iJqdJScdmxwTE2ITGvdU8Pj5lBkwHFiUyYVmFWGONTM14bzDsxQ6Uw9PWaYqYYTyxjCCam
	xiOeVTS4eJBgYyTALklF8OdwbRhjAug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712038444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LIxXxoXIP4P9PQwM12nxsuvm0JoqTs4mYkXj4iPdTUE=;
	b=m+428NStka2t9gXdn0XODGeHN68oCWA6DR4VlqVSGsghx9GzD0k33uMM3AXsJYL7AmABHB
	uEEcj0Xob1ivYzDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id B742013A90;
	Tue,  2 Apr 2024 06:14:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id trhaKyuiC2bwNgAAn2gu4w
	(envelope-from <tiwai@suse.de>); Tue, 02 Apr 2024 06:14:03 +0000
Date: Tue, 02 Apr 2024 08:14:08 +0200
Message-ID: <87zfucs34f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Luke D. Jones" <luke@ljones.dev>
Cc: tiwai@suse.com,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kailang@realtek.com,
	shenghao-ding@ti.com,
	foss@athaariq.my.id
Subject: Re: [PATCH] ALSA: hda/realtek: cs35l41: Support ASUS ROG G634JYR
In-Reply-To: <20240402015126.21115-1-luke@ljones.dev>
References: <20240402015126.21115-1-luke@ljones.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 2244E20C84
X-Spamd-Result: default: False [-1.24 / 50.00];
	BAYES_HAM(-1.95)[94.78%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.18)[-0.899];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:rdns,imap2.dmz-prg2.suse.org:helo]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
Message-ID-Hash: 4URKB2KX2BRPXVAFSOZNDDICLWB7G3CP
X-Message-ID-Hash: 4URKB2KX2BRPXVAFSOZNDDICLWB7G3CP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4URKB2KX2BRPXVAFSOZNDDICLWB7G3CP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 02 Apr 2024 03:51:26 +0200,
Luke D. Jones wrote:
> 
> Fixes the realtek quirk to initialise the Cirrus amp correctly and adds
> related quirk for missing DSD properties. This model laptop has slightly
> updated internals compared to the previous version with Realtek Codec
> ID of 0x1caf.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Applied now.  Thanks.


Takashi
