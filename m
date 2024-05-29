Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 766268D397A
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2024 16:38:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36B69822;
	Wed, 29 May 2024 16:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36B69822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716993509;
	bh=D/JzpsPyWrwIPHjmMRoXwD1E32CNeYH+Dw6gnvEHSCI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A6yOZmXS0UkHOUBVVPKgrTzeiJ8VtfEgt8xpnZe2FmtfPZ2/7R5UqyxrY1vbR6Hch
	 GPr+c/H5Rh7XugX9mY1VqR1i4kJP1nQ1DrKwR7Iisa3AuLz6m+Zmto5gLIK+JjZUEX
	 UPos5ABq2a24LT5X9xfLXB+kuGSC4R1p/2IEuCXQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81B94F805AF; Wed, 29 May 2024 16:37:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D21D7F80579;
	Wed, 29 May 2024 16:37:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B94CF80149; Wed, 29 May 2024 16:35:03 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 02908F80051
	for <alsa-devel@alsa-project.org>; Wed, 29 May 2024 16:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02908F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=jjKj2PbO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4/nOokGV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=RaGT+9OT;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Oq54kbCB
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CFDCF20577;
	Wed, 29 May 2024 14:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1716993154;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RTMBQbMQ8Jc5+Ha6V50GQlTXA5Q8hKBenzKHHIlh9tE=;
	b=jjKj2PbOnwHHa34pWqJFAvHVfGkBGuH9Wc2WADyUUA4rQ7m3qu1nQSBi4pNWR2lw7xOS07
	1LjMfNk7Xt4RMCrfnmJoh/glL1IyVGmZa2gIFvv+PzeDRHHuT636K+y9vzj5ldSBIVps+0
	L6FTkAjwGXQD4rfzf7jyBbgbLCbJhps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716993154;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RTMBQbMQ8Jc5+Ha6V50GQlTXA5Q8hKBenzKHHIlh9tE=;
	b=4/nOokGVt/T/B+YciXOJNJbSDbS+lXSuvUJc9Yj2Nxbzhj7/NP1L99LwcnutzToW9TRiJB
	i4vAUvGkTXJ2ZaAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1716993153;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RTMBQbMQ8Jc5+Ha6V50GQlTXA5Q8hKBenzKHHIlh9tE=;
	b=RaGT+9OTE5a3eXYMwxiMsbDqBQ3m6vdx70wnjAulhY4P6LpTCsleZK9IQGqCylNL3MlZ7H
	iZacUenRMWnMVemLjSah+MU3s7g/ci9ueisBsj8p7TgbzWryzrz0Sgb5Macl6ekvZ6Nno8
	XLdBUdhEbnbFV1AQDpqudjmtA0lNfTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716993153;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RTMBQbMQ8Jc5+Ha6V50GQlTXA5Q8hKBenzKHHIlh9tE=;
	b=Oq54kbCBi9N90D1BHPVfluamU2BuO6UmVDu+xTvTKgZd9sCijzKzru1A2jP5KTPaCdkfi+
	a4Tymi8BtfSSYuAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99F4A1372E;
	Wed, 29 May 2024 14:32:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oO5LJIE8V2Y3YQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 May 2024 14:32:33 +0000
Date: Wed, 29 May 2024 16:32:54 +0200
Message-ID: <87fru04rjd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	broonie@kernel.org,
	rafael@kernel.org,
	vkoul@kernel.org,
	andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH 0/3] ACPI/ALSA/soundwire: add acpi_get_local_u64_address()
 helper
In-Reply-To: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
References: <20240528192936.16180-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.98%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
Message-ID-Hash: 7DORPSZH6FSMUNAICNAV5GZZLCEDPOCZ
X-Message-ID-Hash: 7DORPSZH6FSMUNAICNAV5GZZLCEDPOCZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7DORPSZH6FSMUNAICNAV5GZZLCEDPOCZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 May 2024 21:29:32 +0200,
Pierre-Louis Bossart wrote:
> 
> The acpi_get_local_address() helper assumes a 32-bit ADR is used. If
> we want to use this helper for SoundWire/SDCA ASoC codecs, we need an
> extension where the native 64-bits are used. This patchset suggests a
> new helper, acpi_get_local_address() may be renamed if desired in a
> folow-up patch.
> 
> The path of least resistance would be to merge this patchset in the
> ASoC tree, since I have additional changes for ASoC/SDCA (SoundWire
> Device Class) that depend on the new helper.
> 
> Pierre-Louis Bossart (3):
>   ACPI: utils: introduce acpi_get_local_u64_address()
>   soundwire: slave: simplify code with acpi_get_local_u64_address()
>   ALSA: hda: intel-sdw-acpi: use acpi_get_local_u64_address()

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
