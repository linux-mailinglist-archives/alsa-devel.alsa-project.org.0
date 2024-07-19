Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5438937A9C
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2024 18:17:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7448DFA;
	Fri, 19 Jul 2024 18:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7448DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721405835;
	bh=5yJ1aJIFRAYnggNnRm7jwL4IZa1qbw9Jiq7PbL7HYD8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jQ4Ol4iwucG4qtvVfRGi5jjg2k/lozZEaL/vzsQdCiBzirDXZxaG9eGIByElLhvwl
	 8TTjPHqBI+/buROTxjD5TcZv+an2xii7aSajJslgmFZl5cdr2qr30hvDCFAumAloEt
	 KwL86vT8O40hZa5WEoCxSe7VL4ozZs/x8/1XKRG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 245C3F805A0; Fri, 19 Jul 2024 18:16:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DB78F805AE;
	Fri, 19 Jul 2024 18:16:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDC61F80518; Fri, 19 Jul 2024 18:10:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD7B8F8026D
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 18:07:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD7B8F8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hkPwG17Y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=MiIaMDML;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=hkPwG17Y;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=MiIaMDML
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C370121198;
	Fri, 19 Jul 2024 16:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721405235;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o5kDd9HhVtKwrV15n8k1AAZB865njtt6+Ye5ZgRQqDA=;
	b=hkPwG17Yb8b6LqIjT50sH4qRk1G8Ufks0RFuhAotwBdD64P0VW4hwMB0gGuBBzcwTd6ngg
	+RvfGIuiFFsUAKeH47fLFQHwwrSI77yGDeb3cCTz6I0I8ozPh0zd0hJy+RP4l6/kTfNpFq
	ZSeDYADseYCm7A4IWbisWvWpbaRxNgw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721405235;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o5kDd9HhVtKwrV15n8k1AAZB865njtt6+Ye5ZgRQqDA=;
	b=MiIaMDMLj+MHaIuHUqFRCI4vGFmlTYCL8GRU7v+hVKogNOXlL1KMuhC/PQ8CJ0VmIiJZZq
	nroi6cKpwxI53iCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hkPwG17Y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MiIaMDML
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721405235;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o5kDd9HhVtKwrV15n8k1AAZB865njtt6+Ye5ZgRQqDA=;
	b=hkPwG17Yb8b6LqIjT50sH4qRk1G8Ufks0RFuhAotwBdD64P0VW4hwMB0gGuBBzcwTd6ngg
	+RvfGIuiFFsUAKeH47fLFQHwwrSI77yGDeb3cCTz6I0I8ozPh0zd0hJy+RP4l6/kTfNpFq
	ZSeDYADseYCm7A4IWbisWvWpbaRxNgw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721405235;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o5kDd9HhVtKwrV15n8k1AAZB865njtt6+Ye5ZgRQqDA=;
	b=MiIaMDMLj+MHaIuHUqFRCI4vGFmlTYCL8GRU7v+hVKogNOXlL1KMuhC/PQ8CJ0VmIiJZZq
	nroi6cKpwxI53iCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6760513808;
	Fri, 19 Jul 2024 16:07:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GgbEFzOPmmZLEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Jul 2024 16:07:15 +0000
Date: Fri, 19 Jul 2024 18:07:49 +0200
Message-ID: <8734o5s6ui.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Gergo Koteles <soyer@irl.hu>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound: hda: tas2781: mark const variables as
 __maybe_unused
In-Reply-To: <20240719095640.3741247-1-arnd@kernel.org>
References: <20240719095640.3741247-1-arnd@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C370121198
X-Spamd-Result: default: False [-3.31 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
Message-ID-Hash: VJ4XIRY5BGDQTRBIRP4LB4RZDC73AXAP
X-Message-ID-Hash: VJ4XIRY5BGDQTRBIRP4LB4RZDC73AXAP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJ4XIRY5BGDQTRBIRP4LB4RZDC73AXAP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 Jul 2024 11:56:34 +0200,
Arnd Bergmann wrote:
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> An earlier patch changed the DECLARE_TLV_DB_SCALE declaration, but
> now there are additional static const variables that cause
> the same build warnings:
> 
> In file included from sound/pci/hda/tas2781_hda_i2c.c:23:
> include/sound/tas2781-tlv.h:23:28: error: 'tas2563_dvc_table' defined but not used [-Werror=unused-const-variable=]
>    23 | static const unsigned char tas2563_dvc_table[][4] = {
>       |                            ^~~~~~~~~~~~~~~~~
> In file included from include/sound/tlv.h:10,
>                  from sound/pci/hda/tas2781_hda_i2c.c:22:
> include/sound/tas2781-tlv.h:20:35: error: 'tas2563_dvc_tlv' defined but not used [-Werror=unused-const-variable=]
>    20 | static const DECLARE_TLV_DB_SCALE(tas2563_dvc_tlv, -12150, 50, 1);
>       |                                   ^~~~~~~~~~~~~~~
> 
> Mark them all as unused as well.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks, applied now.


Takashi
