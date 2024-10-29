Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 835A99B4540
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2024 10:06:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B721FE85;
	Tue, 29 Oct 2024 10:05:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B721FE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730192767;
	bh=4jFpcSqJTzegiy0RSe9keQPsgyCein6MEzo44QIQEP8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yx0Ux0yzhAJmfpWZ7ZMCsF2OhJc0p9FAxwYduEejzSXD7rcvxjG+5xnopzYZA8sO9
	 i8Cef4Y+FK0GfX+dVvVlTnuGq+AW3xZuFMZx6LbBqpPA/WfBV3qVCJOa7dNBKIDLUx
	 qcJEI4xtq7OtFQ31hYnRys3DBaKH/xThv4I71XpY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B242F805B5; Tue, 29 Oct 2024 10:05:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 710B7F805A8;
	Tue, 29 Oct 2024 10:05:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 858BDF80269; Tue, 29 Oct 2024 10:05:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2B8DF80104
	for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2024 10:05:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2B8DF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=mrZlxJyF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZqKDwr9n;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=mrZlxJyF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZqKDwr9n
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B73D1FE50;
	Tue, 29 Oct 2024 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1730192727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gJCZBP3ANsOc/NOJbZ1YHWXaBtlWBIOwb9TlW+xdM44=;
	b=mrZlxJyFVQxLGRYUSiwgC4SmC3NxZLR0zu52c70aNmWkI9+ggzBIgFlytm9nBn2gL9Xd4g
	tTUQ1FOG9ecUmmc6di0xJZVDkGHTp9t4yRjHLQT2KGeKUUWTNZrBojhVkeuJUFYVbAv0+M
	xyFjVH0PUBXl0cYBVz31mUswqHKdiEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730192727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gJCZBP3ANsOc/NOJbZ1YHWXaBtlWBIOwb9TlW+xdM44=;
	b=ZqKDwr9nG3fTVreRKyyuJGcvrtTiVJntHL2vUMHAWeNJOckCC4y6fQigWxybghDzvjwoyz
	mAW7wwraYc/H5lBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1730192727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gJCZBP3ANsOc/NOJbZ1YHWXaBtlWBIOwb9TlW+xdM44=;
	b=mrZlxJyFVQxLGRYUSiwgC4SmC3NxZLR0zu52c70aNmWkI9+ggzBIgFlytm9nBn2gL9Xd4g
	tTUQ1FOG9ecUmmc6di0xJZVDkGHTp9t4yRjHLQT2KGeKUUWTNZrBojhVkeuJUFYVbAv0+M
	xyFjVH0PUBXl0cYBVz31mUswqHKdiEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730192727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gJCZBP3ANsOc/NOJbZ1YHWXaBtlWBIOwb9TlW+xdM44=;
	b=ZqKDwr9nG3fTVreRKyyuJGcvrtTiVJntHL2vUMHAWeNJOckCC4y6fQigWxybghDzvjwoyz
	mAW7wwraYc/H5lBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D846136A5;
	Tue, 29 Oct 2024 09:05:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CgmpFVelIGdEFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Oct 2024 09:05:27 +0000
Date: Tue, 29 Oct 2024 10:06:30 +0100
Message-ID: <871pzz2s89.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sarah Grant <s@srd.tw>
Cc: alsa-devel@alsa-project.org,
	Olivia Mackintosh <livvy@base.nu>
Subject: Re: [PATCH] ALSA: usb-audio: Add Pioneer DJ/AlphaTheta DJM-A9 Mixer
In-Reply-To: <20241025163927.12662-1-s@srd.tw>
References: <20241025163927.12662-1-s@srd.tw>
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
Message-ID-Hash: 5KQNSIK4T5XX34K2CZM4Y3GCHGLRJAO7
X-Message-ID-Hash: 5KQNSIK4T5XX34K2CZM4Y3GCHGLRJAO7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5KQNSIK4T5XX34K2CZM4Y3GCHGLRJAO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 25 Oct 2024 18:39:28 +0200,
Sarah Grant wrote:
> 
> This also includes a change to the capture level as they differ with
> this device, as well as additional values for prefader channels.
> 
> Acked-by: Olivia Mackintosh <livvy@base.nu>
> Signed-off-by: Sarah Grant <s@srd.tw>

Thanks, applied now.

But at the next time, please submit to linux-sound ML instead of
alsa-devel ML, and put maintainers to Cc.


Takashi
