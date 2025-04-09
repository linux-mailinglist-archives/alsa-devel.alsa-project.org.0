Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FBFA8258D
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Apr 2025 15:04:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 602E4689E5;
	Wed,  9 Apr 2025 15:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 602E4689E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744203855;
	bh=dxvNXxLCMG1EYU/8RyX90iaxECFYJ+Zv7qBpEBfqlzw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K+gSmnXmwkVrTSYrTsVElXjr25p75JD7um4JI0EWwxNdYGiQNyqHCbhfVm+SbXlqJ
	 gWh2u7lq2APwqq0O9I6vGdWczMMhl05NFFY9rAA+qFOYfBANxwU5KPt58IzwBr8Dei
	 Q+l/YB7pou3mejcCjwHVkKF9kdblIFqN2XkUTcZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B142F805B1; Wed,  9 Apr 2025 15:03:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68BE4F805B2;
	Wed,  9 Apr 2025 15:03:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 150C8F804FF; Wed,  9 Apr 2025 15:03:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F853F8028B
	for <alsa-devel@alsa-project.org>; Wed,  9 Apr 2025 15:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F853F8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HOvFLNl2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NLVIlKRZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=HOvFLNl2;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NLVIlKRZ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 673A721172;
	Wed,  9 Apr 2025 13:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1744203815;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6RLOpaSXhx8ugWtyt2xdGoSlzCCi0e0X6L+dmYrK50=;
	b=HOvFLNl2SYOTrErOyRvzSTMsNl3diqS1hK9B9QnFEjrkKWmA05ek+safbvUaZ6LW4G4XuQ
	xNNju6fbmydON5Nix5PFMXjxiKsvwavHtwc/2/Ol8ESVllg78XPRzvI9zOBjcCujkfR47u
	UAmwMiO992yp47RlyhnMlU7R8MdXRkw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744203815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6RLOpaSXhx8ugWtyt2xdGoSlzCCi0e0X6L+dmYrK50=;
	b=NLVIlKRZ6IQWs/WIgkrrfVP2SI+gsGxvt4xWJ9r4OwZjoZqyLub45mDn8AHS1NHxfeigpz
	I/Y9A5O3gnti/6AQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HOvFLNl2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NLVIlKRZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1744203815;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6RLOpaSXhx8ugWtyt2xdGoSlzCCi0e0X6L+dmYrK50=;
	b=HOvFLNl2SYOTrErOyRvzSTMsNl3diqS1hK9B9QnFEjrkKWmA05ek+safbvUaZ6LW4G4XuQ
	xNNju6fbmydON5Nix5PFMXjxiKsvwavHtwc/2/Ol8ESVllg78XPRzvI9zOBjcCujkfR47u
	UAmwMiO992yp47RlyhnMlU7R8MdXRkw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744203815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R6RLOpaSXhx8ugWtyt2xdGoSlzCCi0e0X6L+dmYrK50=;
	b=NLVIlKRZ6IQWs/WIgkrrfVP2SI+gsGxvt4xWJ9r4OwZjoZqyLub45mDn8AHS1NHxfeigpz
	I/Y9A5O3gnti/6AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3FF1713691;
	Wed,  9 Apr 2025 13:03:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Iu5kDidw9mfqNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Apr 2025 13:03:35 +0000
Date: Wed, 09 Apr 2025 15:03:34 +0200
Message-ID: <87ecy1zduh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Enable Headset Mic for ASUS platform
In-Reply-To: <0fe3421a6850461fb0b7012cb28ef71d@realtek.com>
References: <0fe3421a6850461fb0b7012cb28ef71d@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 673A721172
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 6VD4QO57AZDKKFCTDY4USZAKBEML6Z3N
X-Message-ID-Hash: 6VD4QO57AZDKKFCTDY4USZAKBEML6Z3N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6VD4QO57AZDKKFCTDY4USZAKBEML6Z3N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 09 Apr 2025 09:20:03 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach patch was fixed headset Mic issue for Asus platform.
> Many Thanks.
> 
> Kailang.

Thanks, applied now with Fixes tags to 7ab61d0a9a35 and c86dd79a7c33.


Takashi
