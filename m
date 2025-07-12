Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CF1B02A19
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Jul 2025 10:29:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E1006019D;
	Sat, 12 Jul 2025 10:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E1006019D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752308992;
	bh=o5OSowyX0g2NZm20gpmAfN8NRzD6c4FUxrFvjquJBdw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b5KHQPn7RPfQrCG9vN640wTgwem36ZijyjvnAxfrCgjr348mJwvzGZzb+pb3tqLpP
	 oeTMoCrHGzOGqHHtIa/3Bu61SfvWI9oH2Fp7RCT5Tt6SBbipFesJ1/Y7xXvxYM/pit
	 nVVdipPHjPdlPzexGZNl/nNP00eP/xbzZqNcl7jQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFEA5F805BB; Sat, 12 Jul 2025 10:29:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BADF5F805BB;
	Sat, 12 Jul 2025 10:29:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE2B8F80510; Sat, 12 Jul 2025 10:29:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E366EF800F3
	for <alsa-devel@alsa-project.org>; Sat, 12 Jul 2025 10:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E366EF800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=2UQI6HGo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=sY3Nf1/k;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=HhzT0oVm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=g8dpR2tz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F1DC51F388;
	Sat, 12 Jul 2025 08:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1752308948;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBVbV/Lie/jK+I+MUg0l6hv/MvUm9iT369FmLVySVqc=;
	b=2UQI6HGoRfa+2uWYxrcF77ASgzK4yIF8V/tOK/BvLpu1pZ/pci7AzVDUnDTTqFKuEPiiNd
	KTfXJAneuCHdoWJtQE9ETeehwam5kguzAHg4P2AXg2iGGnAHl8cSxPeRXaJny68/Rm6h1N
	ddvYivLf3UbDnDF8iGwsMkzHXyXFH+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752308948;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBVbV/Lie/jK+I+MUg0l6hv/MvUm9iT369FmLVySVqc=;
	b=sY3Nf1/kR84u03nBJvFIYQNAUdvBTtSWv/yzHbAGmk3g6zUO3dGeXSXc+2Hfmd54Fy8TL1
	GG3edwuurp3LBABw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1752308946;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBVbV/Lie/jK+I+MUg0l6hv/MvUm9iT369FmLVySVqc=;
	b=HhzT0oVmj+AxKCW0yVg2W+QMtIIwokFrRQrx/ZfCNT3q/idp7lB/LvEuRsPVq2dMV2Pnvl
	pDveQ8EwOIQk+DeZHrmGq7tSRaIpk7MDE5YZXwMpzsweNpKUbP67Lh+jlF6xYwfBzN8KfK
	SDAGJhqQM0nvG0apfhlH8+9WiKbHi28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752308946;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eBVbV/Lie/jK+I+MUg0l6hv/MvUm9iT369FmLVySVqc=;
	b=g8dpR2tzIkAyQGmyA9V8uTCyh7OnDxN+BncBzKLnDQVhuwtKfx8cp7hUaevvfqaG7+Obkk
	A4eSA3uHoT5J/HBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A20EA138A1;
	Sat, 12 Jul 2025 08:29:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T2KyJdIccmiWcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 12 Jul 2025 08:29:06 +0000
Date: Sat, 12 Jul 2025 10:29:06 +0200
Message-ID: <87ple5olrh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>,
	<navada@ti.com>,
	<13916275206@139.com>,
	<v-hampiholi@ti.com>,
	<v-po@ti.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add TAS2770 support
In-Reply-To: <20250712081733.12881-1-baojun.xu@ti.com>
References: <20250712081733.12881-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,alsa-project.org,ti.com,139.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,ti.com:email]
Message-ID-Hash: IV5QEJVPGXOAXD42TXENL5WKDU3UA43S
X-Message-ID-Hash: IV5QEJVPGXOAXD42TXENL5WKDU3UA43S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IV5QEJVPGXOAXD42TXENL5WKDU3UA43S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 12 Jul 2025 10:17:33 +0200,
Baojun Xu wrote:
> 
> Add TAS2770 support in HDA.
> Create a header file include/sound/tas2770-tlv.h,
> Set chip_id in i2c probe, check it while sound control is created,
> and the DSP firmware binary file parser.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
>  include/sound/tas2770-tlv.h     | 20 ++++++++++++
>  include/sound/tas2781.h         |  4 +++
>  sound/pci/hda/tas2781_hda_i2c.c | 58 +++++++++++++++++++++++++--------

The whole HD-audio stuff has been moved under sound/hda recently.
Please create a patch based on for-next branch of sound git tree.


thanks,

Takashi
