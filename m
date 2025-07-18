Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8EFB0A43E
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jul 2025 14:29:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 335FD601F6;
	Fri, 18 Jul 2025 14:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 335FD601F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752841797;
	bh=6wBOWVx8Q80iVl8o23f+2jKy8/O1afElhr915+zc/wg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B8lMYoBnGYIfK+ohEXcYq36Qj7HtPNgP7pM/GRRxW55HbR5hbv/Liog46o9E8pi8X
	 4N0UmwIkVzyMjQwyXZ/EfYHyXSL7sGTgLQcll7NT0lMuKS23k+l4UBKmoCaRYsNRmQ
	 amUch797GpSsVQmIXwZvNF8esj6jqRCU83PfaeqU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45F4DF805BE; Fri, 18 Jul 2025 14:29:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B91F7F805C5;
	Fri, 18 Jul 2025 14:29:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AD06F8026A; Fri, 18 Jul 2025 14:29:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DC52F80217
	for <alsa-devel@alsa-project.org>; Fri, 18 Jul 2025 14:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DC52F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=WNqGni77;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CucdTcEN;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=WNqGni77;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CucdTcEN
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3FA4A21235;
	Fri, 18 Jul 2025 12:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1752841751;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PeGQxZIGrA4M25Tdpvso3PY4IErucOZFEm7P3o3ww5k=;
	b=WNqGni77oRM5D13syOK0CxPrg0gV7GIGdH2GVO1uGPLmwYilYFZnUrKDP81R6b7ny38izb
	pKeqnEv/VPg8p7ngGzgag/uBP5pF5YmJ1WoHAXj2FWtI9Z/HggP2lekhpNv7QB7wXYLfz8
	Px8Kmes8mdLSF234mrKkbRLKvVYdECk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752841751;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PeGQxZIGrA4M25Tdpvso3PY4IErucOZFEm7P3o3ww5k=;
	b=CucdTcENtxCZHjv6s9BPzaa7+go0DGkebyifO3vh3zlRN5zCoxHHTqNIHMJ0XWd+zosb/e
	8WCmW7DHfZJ8HpAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1752841751;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PeGQxZIGrA4M25Tdpvso3PY4IErucOZFEm7P3o3ww5k=;
	b=WNqGni77oRM5D13syOK0CxPrg0gV7GIGdH2GVO1uGPLmwYilYFZnUrKDP81R6b7ny38izb
	pKeqnEv/VPg8p7ngGzgag/uBP5pF5YmJ1WoHAXj2FWtI9Z/HggP2lekhpNv7QB7wXYLfz8
	Px8Kmes8mdLSF234mrKkbRLKvVYdECk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752841751;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PeGQxZIGrA4M25Tdpvso3PY4IErucOZFEm7P3o3ww5k=;
	b=CucdTcENtxCZHjv6s9BPzaa7+go0DGkebyifO3vh3zlRN5zCoxHHTqNIHMJ0XWd+zosb/e
	8WCmW7DHfZJ8HpAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E4E1C13A52;
	Fri, 18 Jul 2025 12:29:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sdKQNhY+emjbEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 18 Jul 2025 12:29:10 +0000
Date: Fri, 18 Jul 2025 14:29:10 +0200
Message-ID: <87ms917kdl.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v1] ALSA: hda: Add TAS2770 support
In-Reply-To: <20250718094454.26574-1-baojun.xu@ti.com>
References: <20250718094454.26574-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,alsa-project.org,ti.com,139.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: UDR4UBGL3KOXQU4KFU6GGTZSWEJGBEAS
X-Message-ID-Hash: UDR4UBGL3KOXQU4KFU6GGTZSWEJGBEAS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UDR4UBGL3KOXQU4KFU6GGTZSWEJGBEAS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 18 Jul 2025 11:44:54 +0200,
Baojun Xu wrote:
> 
> Add TAS2770 support in TI's HDA driver.
> And add hda_chip_id for more product support in the future.
> Separated DSP and non-DSP in firmware load function.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Any reason of the submission of the very same patch?
It was requested to resubmit after rebasing to the new location for
HD-audio (sound/hda/*) as found in for-next branch of sound.git tree.


thanks,

Takashi
