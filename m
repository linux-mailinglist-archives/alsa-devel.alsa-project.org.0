Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A1F83AB0A
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 14:39:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A62977F8;
	Wed, 24 Jan 2024 14:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A62977F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706103595;
	bh=NTv12fRt6YCYw7CVzibeDKVqHb9qKBVJjzsIN63s5qg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L422rhmoIMspxC7HRR0hN7n44k+Y1Yin1eSkbUjWsAml7mZVvU/2dem3Iqn8X+qRk
	 VQXJw3TQKBnNGLQ2uaj3F5yJ7iXX4z5jTA1Z7XaQ3hrQlP+d/wjuE32GPDuZRMqR6n
	 RBmCPvJxewImjw00jZc8J2qwZ9+MUMmyi1qOD9Q8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81032F80587; Wed, 24 Jan 2024 14:39:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD16CF80520;
	Wed, 24 Jan 2024 14:39:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A199F8028D; Wed, 24 Jan 2024 14:39:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AD41F8003A
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 14:39:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AD41F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nP16hIoH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GlSXeJh0;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=nP16hIoH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GlSXeJh0
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 63B2E1FD60;
	Wed, 24 Jan 2024 13:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706103542;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BB2nDjyeLYfs7N8EqjwzuuNj9cfoALZGhl7su0GjPuI=;
	b=nP16hIoHTuvi2GA3wuaBA9IgIk2GChArObzAi+BIf/eyuJZc9XxOlh/WyXVDRx/0uVfTIW
	ss6rHr7o5/hjimbJbsMJJPbB94xvR8Cqe09qkOVAZuH+/g4yvkbGzFgrzxK8IKdjQ7nxUT
	R+2UVWlkcQ5UzHMAiHBA7AZCRD+AAxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706103542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BB2nDjyeLYfs7N8EqjwzuuNj9cfoALZGhl7su0GjPuI=;
	b=GlSXeJh0az46LcfjclNupNhNWVBZF1DjA/ZWiKoetkjyprLz3+J7aaYXsmznSxeacZFYjc
	OJd//omIPTJVg7BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706103542;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BB2nDjyeLYfs7N8EqjwzuuNj9cfoALZGhl7su0GjPuI=;
	b=nP16hIoHTuvi2GA3wuaBA9IgIk2GChArObzAi+BIf/eyuJZc9XxOlh/WyXVDRx/0uVfTIW
	ss6rHr7o5/hjimbJbsMJJPbB94xvR8Cqe09qkOVAZuH+/g4yvkbGzFgrzxK8IKdjQ7nxUT
	R+2UVWlkcQ5UzHMAiHBA7AZCRD+AAxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706103542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BB2nDjyeLYfs7N8EqjwzuuNj9cfoALZGhl7su0GjPuI=;
	b=GlSXeJh0az46LcfjclNupNhNWVBZF1DjA/ZWiKoetkjyprLz3+J7aaYXsmznSxeacZFYjc
	OJd//omIPTJVg7BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CDC713786;
	Wed, 24 Jan 2024 13:39:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VjeLDfYSsWWbSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 24 Jan 2024 13:39:02 +0000
Date: Wed, 24 Jan 2024 14:39:01 +0100
Message-ID: <87v87ilukq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: Speaker can't mute when HP was plugged
In-Reply-To: <38b82976a875451d833d514cee34ff6a@realtek.com>
References: <38b82976a875451d833d514cee34ff6a@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nP16hIoH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GlSXeJh0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.85 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 RCPT_COUNT_TWO(0.00)[2];
	 TO_DN_ALL(0.00)[];
	 MID_CONTAINS_FROM(1.00)[];
	 MX_GOOD(-0.01)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.84)[99.30%]
X-Rspamd-Queue-Id: 63B2E1FD60
Message-ID-Hash: FTVWBHE3UP4SLDNT2HKNDRHJ2RSDEUMD
X-Message-ID-Hash: FTVWBHE3UP4SLDNT2HKNDRHJ2RSDEUMD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FTVWBHE3UP4SLDNT2HKNDRHJ2RSDEUMD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 24 Jan 2024 07:35:11 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Speaker can't mute when HP was plugged for Dell platform.
> I did disable speaker pass through and add verb to speaker pin.

Thanks, applied.


Takashi
