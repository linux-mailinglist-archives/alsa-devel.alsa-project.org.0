Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4825E894B20
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:06:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BED222C9;
	Tue,  2 Apr 2024 08:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BED222C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712037960;
	bh=eiridHwvvbURq+mvxqaO4gwPnk3esqKxdtP2g93Ouao=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=avlkgrBPgDtQjqOaNM1+CQXb5Quad1sVlZbpqAIIgxlX0XPA65bbvGN8+BGSyvX3R
	 u7jI5LYMh9ImnyuCiqmndrzT6Re9Wdml7ri5AnYQ5h1Ki57JQbbSCXmoEtGmmGWhnx
	 MGWNWDdqyiknBOY4B/8LIvHulbrMA9pElBUNYm3Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73092F8020D; Tue,  2 Apr 2024 08:05:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25AA0F8016E;
	Tue,  2 Apr 2024 08:05:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 163FEF8020D; Tue,  2 Apr 2024 08:01:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D2B2F80114
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 08:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D2B2F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=k+A+ZzBr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=AdWEbvUs
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0CD7020C5B;
	Tue,  2 Apr 2024 06:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1712037675;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VvwV/vPDO9C36qfxeYCNdArujqghN+pnO3Hn3P4P7CQ=;
	b=k+A+ZzBrOVaWOyt0Oi6MNmWYlVzMXUqkISZWqPpyXb02vyemWzlBrjaocDD5EEmjuVYc76
	BI8V98eyCHFO1x4tm62W65+Wy3xwLk55484r2WX4i9i5/jyJcv/tziBbGwOXXgWns2FCWc
	7IcK93QCa+90R3aa0Tcws5pVxFrSbmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712037675;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VvwV/vPDO9C36qfxeYCNdArujqghN+pnO3Hn3P4P7CQ=;
	b=AdWEbvUse565Tjr+k0RsTBniaW1JGJapYSPagkXH9RcOMLMojRTnLSbS4EF1fKKYK7IO4I
	ssGV6dl91IL3woAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EF7013A90;
	Tue,  2 Apr 2024 06:01:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id o1uDISqfC2ZBMwAAn2gu4w
	(envelope-from <tiwai@suse.de>); Tue, 02 Apr 2024 06:01:14 +0000
Date: Tue, 02 Apr 2024 08:01:19 +0200
Message-ID: <875xx0tia8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christian Bendiksen <Christian@bendiksen.me>
Cc: james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	kailang@realtek.com,
	luke@ljones.dev,
	shenghao-ding@ti.com,
	foss@athaariq.my.id,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Bendiksen <christian@bendiksen.me>
Subject: Re: [PATCH v3] Add sound quirks for Lenovo Legion slim 7 16ARHA7
 models.
In-Reply-To: <20240401122603.6634-1-christian@bendiksen.me>
References: <20240329185406.9802-1-christian@bendiksen.me>
	<87r0fsnmky.wl-tiwai@suse.de>
	<20240330115554.27895-1-christian@bendiksen.me>
	<87y19x5wfs.wl-tiwai@suse.de>
	<20240401122603.6634-1-christian@bendiksen.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.87 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-0.997];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[16];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.02)[53.06%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0CD7020C5B
Message-ID-Hash: U7UYCNVTGWD5SRTYB6H6Y6665MXTJQFZ
X-Message-ID-Hash: U7UYCNVTGWD5SRTYB6H6Y6665MXTJQFZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7UYCNVTGWD5SRTYB6H6Y6665MXTJQFZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Apr 2024 14:26:10 +0200,
Christian Bendiksen wrote:
> 
> This fixes the sound not working from internal speakers on
> Lenovo Legion Slim 7 16ARHA7 models. The correct subsystem ID
> have been added to cs35l41_hda_property.c and patch_realtek.c.
> 
> Signed-off-by: Christian Bendiksen <christian@bendiksen.me>

Thanks, applied.


Takashi
