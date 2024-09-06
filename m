Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0B496EA45
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 08:28:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A900A4D;
	Fri,  6 Sep 2024 08:28:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A900A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725604097;
	bh=lXnXs489Z9vi5oHNKiTdRdSMZc8di6+/sGk7XrB3fVE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fSz8hiF2DyX/VMYn1XJOyRQ5f4cki83U8f7qw91jEkqHZM8h59oucZW+omB69cJdz
	 uSo/XvThUlv1ynOZ/iBAaevDzp7pDVdXQp7/uto4QaTOYx/ByLridsfgUmrLFacL+1
	 q3j1a7Yb+hRHXrl8qZ9hqTXSKNKQYrQIrfgQKGvQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0681AF805B3; Fri,  6 Sep 2024 08:27:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E488F805B2;
	Fri,  6 Sep 2024 08:27:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60C5EF8016C; Fri,  6 Sep 2024 08:27:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CC55F800E9
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 08:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CC55F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=b/bBn+dv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lrpW7Nec;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=b/bBn+dv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lrpW7Nec
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 935B71F88F;
	Fri,  6 Sep 2024 06:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725604057;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XbRMcJpTWZSMJp2yDN0j5Fk5xunW/9yyv6sbBu0VOqo=;
	b=b/bBn+dvSDB/urV/JPB/wU4q6UFy/zUqJg8mgjmGL8qTuxob2zqfSyBhkqxjS0GS//8f38
	C3xPUU2XWMu+k4YWO589E/9z3cDU14TjmqLBa0816ZY8H/ZidKoDmdT9IRfFzKxBm61kYJ
	5Cz36K7SrGJR8DXqC5g7OSuEtxh5BX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725604057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XbRMcJpTWZSMJp2yDN0j5Fk5xunW/9yyv6sbBu0VOqo=;
	b=lrpW7NecF0WkJkfPPUmER6gSipX/D1VEmFH1TI1swYA//AJriicnpWV5vXSRo5p0VSXQDF
	mCv76VZ7lm+stTDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="b/bBn+dv";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lrpW7Nec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725604057;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XbRMcJpTWZSMJp2yDN0j5Fk5xunW/9yyv6sbBu0VOqo=;
	b=b/bBn+dvSDB/urV/JPB/wU4q6UFy/zUqJg8mgjmGL8qTuxob2zqfSyBhkqxjS0GS//8f38
	C3xPUU2XWMu+k4YWO589E/9z3cDU14TjmqLBa0816ZY8H/ZidKoDmdT9IRfFzKxBm61kYJ
	5Cz36K7SrGJR8DXqC5g7OSuEtxh5BX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725604057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XbRMcJpTWZSMJp2yDN0j5Fk5xunW/9yyv6sbBu0VOqo=;
	b=lrpW7NecF0WkJkfPPUmER6gSipX/D1VEmFH1TI1swYA//AJriicnpWV5vXSRo5p0VSXQDF
	mCv76VZ7lm+stTDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C082136A8;
	Fri,  6 Sep 2024 06:27:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 45q7F9mg2mYDIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Sep 2024 06:27:37 +0000
Date: Fri, 06 Sep 2024 08:28:23 +0200
Message-ID: <87o751fg8o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.11-rc6
In-Reply-To: <47c362275f856d07f7c24f59f4309399.broonie@kernel.org>
References: <47c362275f856d07f7c24f59f4309399.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 935B71F88F
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: WABPCT44WOTP5RSFO2WE3SYG3QKRF4HY
X-Message-ID-Hash: WABPCT44WOTP5RSFO2WE3SYG3QKRF4HY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WABPCT44WOTP5RSFO2WE3SYG3QKRF4HY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 06 Sep 2024 00:09:10 +0200,
Mark Brown wrote:
> 
> The following changes since commit bb4485562f5907708f1c218b5d70dce04165d1e1:
> 
>   ASoC: cs-amp-lib: Ignore empty UEFI calibration entries (2024-08-22 17:52:26 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.11-rc6
> 
> for you to fetch changes up to 77212f300bfd6fb3edaabd1daf863cabb521854a:
> 
>   ASoC: codecs: lpass-va-macro: set the default codec version for sm8250 (2024-08-30 13:54:24 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.11
> 
> A larger set of fixes than I'd like at this point, but mainly due to
> people working on fixing module autoloading by adding missing exports of
> ID tables rather than anything particularly concerning.  There are some
> other runtime fixes and quirks, and a tweak to the ABI definition for
> SOF which ensures that a struct layout doesn't vary depending on the
> architecture of the host.

Pulled now.  Thanks.


Takashi
