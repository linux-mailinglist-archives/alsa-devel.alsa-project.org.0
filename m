Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F11E6823DFC
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 09:57:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC5B6E96;
	Thu,  4 Jan 2024 09:57:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC5B6E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704358652;
	bh=38UrEx4/DcK3POMtsRao/k5J696fWVIlS3Ar3xeANT8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sdbx+qWs0B48nDQPOwX2Oid3mTxLDQCJreXXmOmrVTNfD1FNMTjNlixazXIxtxY+7
	 s4k/9xV8FnVyfmA07rJ20/I0hu2FnovRP2Fa/M5DAR+mF824MD+ldjwP+8szqOTzRO
	 93hBCQE5Y+h/k/S0NRZnVseeWoSTHecvlLwCXxEc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B718AF80224; Thu,  4 Jan 2024 09:56:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F3CBF80589;
	Thu,  4 Jan 2024 09:56:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 524B5F804B0; Thu,  4 Jan 2024 09:53:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F684F80224
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 09:53:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F684F80224
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xwZGXUtR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=qfBUSdo4;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=xwZGXUtR;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=qfBUSdo4
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 910DE21E73;
	Thu,  4 Jan 2024 08:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704358416;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=60pY3+TKeowAJTEaVySctoSv+hCzrSmVwOvZhPv/TuE=;
	b=xwZGXUtRJiRdVKlDQuXxAzS9QJHCdfY3oTf5juhly34nhize5xSUTJZoAh2CUalB+iCaNb
	MrmxGH5cpeffpB8VjVkJjcv6kc8/dmLq5SZhctEhRVa+6hba5YV1sPIAjUFenP09ZXrUDB
	gDnodDKckz7Nm2UDXSUU0AXLd1bwBAM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704358416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=60pY3+TKeowAJTEaVySctoSv+hCzrSmVwOvZhPv/TuE=;
	b=qfBUSdo4Dz9Uw9vvrnfXEiR8x6mdnbYmZrk9lrkmX2SP64Upz/F0v7lDUIXmYw8iIU1xDB
	D91wi1m732D3ooBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704358416;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=60pY3+TKeowAJTEaVySctoSv+hCzrSmVwOvZhPv/TuE=;
	b=xwZGXUtRJiRdVKlDQuXxAzS9QJHCdfY3oTf5juhly34nhize5xSUTJZoAh2CUalB+iCaNb
	MrmxGH5cpeffpB8VjVkJjcv6kc8/dmLq5SZhctEhRVa+6hba5YV1sPIAjUFenP09ZXrUDB
	gDnodDKckz7Nm2UDXSUU0AXLd1bwBAM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704358416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=60pY3+TKeowAJTEaVySctoSv+hCzrSmVwOvZhPv/TuE=;
	b=qfBUSdo4Dz9Uw9vvrnfXEiR8x6mdnbYmZrk9lrkmX2SP64Upz/F0v7lDUIXmYw8iIU1xDB
	D91wi1m732D3ooBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A40313722;
	Thu,  4 Jan 2024 08:53:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0BSLFBBylmUmVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 04 Jan 2024 08:53:36 +0000
Date: Thu, 04 Jan 2024 09:53:35 +0100
Message-ID: <87il49a38w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Siddhesh Dharme <siddheshdharme18@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP
 ProBook 440 G6
In-Reply-To: <20240104060736.5149-1-siddheshdharme18@gmail.com>
References: <20240104060736.5149-1-siddheshdharme18@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xwZGXUtR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qfBUSdo4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.46 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCPT_COUNT_FIVE(0.00)[6];
	 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.95)[99.77%]
X-Rspamd-Queue-Id: 910DE21E73
Message-ID-Hash: OG2OHESA6E7UDHWEZXYAAM6IYSIN2GV3
X-Message-ID-Hash: OG2OHESA6E7UDHWEZXYAAM6IYSIN2GV3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OG2OHESA6E7UDHWEZXYAAM6IYSIN2GV3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 04 Jan 2024 07:07:36 +0100,
Siddhesh Dharme wrote:
> 
> LEDs in 'HP ProBook 440 G6' laptop are controlled by ALC236 codec.
> Enable already existing quirk 'ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF'
> to fix mute and mic-mute LEDs.
> 
> Signed-off-by: Siddhesh Dharme <siddheshdharme18@gmail.com>

Applied now.  Thanks.


Takashi
