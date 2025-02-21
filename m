Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F14AA3F626
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2025 14:37:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05D666056D;
	Fri, 21 Feb 2025 14:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05D666056D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740145030;
	bh=JVRVtqpwf0PmO51jd9LTYS8QT31F4kaQoMtbO14uqUA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=olF1tLrzXJf55p0N6iz6GWbxGlztwQMN4kEfB5Paq+Q+NaO6A84DVHrUweJCiRzy1
	 if3DOWen7PmWv6ytJJmfbueSdB9302ndV3yqWrgbRkYMffu6r9xhVMn5lYnCkRTHNV
	 nxI9W28VQFHutNSYHvEyDaOu/+vlsH1McDn/XPG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0663AF805BB; Fri, 21 Feb 2025 14:36:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBC2DF805BD;
	Fri, 21 Feb 2025 14:36:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5B41F80424; Fri, 21 Feb 2025 14:36:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 918F4F8001D
	for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2025 14:36:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 918F4F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=W5HUpkoI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fVyk9YP8;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=W5HUpkoI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fVyk9YP8
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DE91C21D78;
	Fri, 21 Feb 2025 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1740144979;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XqSV5o2DdbluXbIgzzlQaz1ThdTDEdcUZumeHBl4Nn0=;
	b=W5HUpkoIGOqFDPjIr3LqtA19HjR+aguVjs7rHWbXlSUI7LA1/x2Gy/Hx0m8BZvEYug3FWT
	yS+rW+oF8vZaOFvpA29BzYblU2wpuwH06fROCmkTNynp6IjQ7TzNI67aTyLhkKk1KwD9cQ
	FmqdEFPQzzPdAcSyXdvZwq2zaRvzc3g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740144979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XqSV5o2DdbluXbIgzzlQaz1ThdTDEdcUZumeHBl4Nn0=;
	b=fVyk9YP8lmyDPlaPqXKg9mUShZoR+42W4AjB7DXxr9y98UIpDdxAsYtmhYIwdgRXSdfJwg
	TUMSly/E5VIwzsDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=W5HUpkoI;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fVyk9YP8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1740144979;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XqSV5o2DdbluXbIgzzlQaz1ThdTDEdcUZumeHBl4Nn0=;
	b=W5HUpkoIGOqFDPjIr3LqtA19HjR+aguVjs7rHWbXlSUI7LA1/x2Gy/Hx0m8BZvEYug3FWT
	yS+rW+oF8vZaOFvpA29BzYblU2wpuwH06fROCmkTNynp6IjQ7TzNI67aTyLhkKk1KwD9cQ
	FmqdEFPQzzPdAcSyXdvZwq2zaRvzc3g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740144979;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XqSV5o2DdbluXbIgzzlQaz1ThdTDEdcUZumeHBl4Nn0=;
	b=fVyk9YP8lmyDPlaPqXKg9mUShZoR+42W4AjB7DXxr9y98UIpDdxAsYtmhYIwdgRXSdfJwg
	TUMSly/E5VIwzsDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9737B136AD;
	Fri, 21 Feb 2025 13:36:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TfO0IVOBuGfxdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 21 Feb 2025 13:36:19 +0000
Date: Fri, 21 Feb 2025 14:36:18 +0100
Message-ID: <87mseffmi5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.14-rc3
In-Reply-To: <dfd2c1bf9276c12f021c6474d60d71ee.broonie@kernel.org>
References: <dfd2c1bf9276c12f021c6474d60d71ee.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: DE91C21D78
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 5MU44MNLJ2MCW2S3NALS5KR5CCDDEBFA
X-Message-ID-Hash: 5MU44MNLJ2MCW2S3NALS5KR5CCDDEBFA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5MU44MNLJ2MCW2S3NALS5KR5CCDDEBFA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Feb 2025 13:27:18 +0100,
Mark Brown wrote:
> 
> The following changes since commit 571b69f2f9b1ec7cf7d0e9b79e52115a87a869c4:
> 
>   ASoC: imx-audmix: remove cpu_mclk which is from cpu dai device (2025-02-13 11:34:32 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc3
> 
> for you to fetch changes up to f5468beeab1b1adfc63c2717b1f29ef3f49a5fab:
> 
>   ASoC: tas2764: Set the SDOUT polarity correctly (2025-02-18 20:08:43 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.14
> 
> A few fixes I and James Calligero picked out of the Asahi tree.

Thanks, pulled now.


Takashi
