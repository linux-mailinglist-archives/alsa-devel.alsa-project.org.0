Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C366CAFAFB8
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jul 2025 11:30:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B645A60209;
	Mon,  7 Jul 2025 11:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B645A60209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751880635;
	bh=UsGNeftounXhkbUe+5yOIq3FSti9y3K1tTSifx6MZAc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rO6CrsuLbe0DlulcchsCo+Of3fCZhmAz3yPQ+RkqJDQCa4YUWsFgbE5ZFUlpyDiPp
	 rD/qeaU3WYvFezqkjNW0YOlmbzBGpnfYTVcMCL8E6dUIMgLwKLFOHHcbEJ6cLbd/cU
	 +7u1d1C44avL9Afz/vuXB22pnJd1rIhqmFhnX5ok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1690AF805D6; Mon,  7 Jul 2025 11:29:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66E35F805C5;
	Mon,  7 Jul 2025 11:29:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6259CF80217; Mon,  7 Jul 2025 11:29:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84417F80087
	for <alsa-devel@alsa-project.org>; Mon,  7 Jul 2025 11:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84417F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=GjkOdYZm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ooT1C0WG;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=GjkOdYZm;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ooT1C0WG
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3A2AF21170;
	Mon,  7 Jul 2025 09:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1751880592;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DE+nzHmTe/W5DTzuY77SnXTWP102InHxz+4dQ7YSFPI=;
	b=GjkOdYZmoyOfqaX2oWHgliNhg+pIa0byAHBvTnZvU3zPST5zLI009OYyak39ydBYC14IqQ
	7j0uZ+bmbwOlJ7Bv7BSzl50njfgGpIrDYR1//7Pq5/u/ffiV0ngIvq73+8oHVmKjRUDkkj
	Fdllk7RYBYVIClRlVWGw5gR8SFirWFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751880592;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DE+nzHmTe/W5DTzuY77SnXTWP102InHxz+4dQ7YSFPI=;
	b=ooT1C0WGP7I4vBb79uWeDq4ZC2nDh2w9xS3GoyHvANIG6fNZjMUXThR9X8RjVXqDRUzpNQ
	+ckpPvZz+fSq9qCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1751880592;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DE+nzHmTe/W5DTzuY77SnXTWP102InHxz+4dQ7YSFPI=;
	b=GjkOdYZmoyOfqaX2oWHgliNhg+pIa0byAHBvTnZvU3zPST5zLI009OYyak39ydBYC14IqQ
	7j0uZ+bmbwOlJ7Bv7BSzl50njfgGpIrDYR1//7Pq5/u/ffiV0ngIvq73+8oHVmKjRUDkkj
	Fdllk7RYBYVIClRlVWGw5gR8SFirWFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751880592;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DE+nzHmTe/W5DTzuY77SnXTWP102InHxz+4dQ7YSFPI=;
	b=ooT1C0WGP7I4vBb79uWeDq4ZC2nDh2w9xS3GoyHvANIG6fNZjMUXThR9X8RjVXqDRUzpNQ
	+ckpPvZz+fSq9qCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE25913A5E;
	Mon,  7 Jul 2025 09:29:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YYeFNI+Ta2jPSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 07 Jul 2025 09:29:51 +0000
Date: Mon, 07 Jul 2025 11:29:51 +0200
Message-ID: <87cyacnyb4.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Fix calibration data parser issue
In-Reply-To: <20250707090513.1462-1-baojun.xu@ti.com>
References: <20250707090513.1462-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: CQZQ3HFY25WNISH32IMXVP7TI4QSM2KS
X-Message-ID-Hash: CQZQ3HFY25WNISH32IMXVP7TI4QSM2KS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQZQ3HFY25WNISH32IMXVP7TI4QSM2KS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 07 Jul 2025 11:05:13 +0200,
Baojun Xu wrote:
> 
> We will copy calibration data from position behind to front.
> We has created a variable (tmp_val) point on top of calibration data
> buffer, and tmp_val[1] is max of node number in original calibration
> data structure, it will be overwritten after first data copy,
> so can't be used as max node number check in for loop.
> So we create a new variable to save max of node number (tmp_val[1]),
> used to check if max node number was reached in for loop.
> And a point need to be increased to point at calibration data in node.
> Data saved position also need to be increased one byte.
> 
> Fixes: 4fe238513407 ("ALSA: hda/tas2781: Move and unified the calibrated-data getting function for SPI and I2C into the tas2781_hda lib")
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> 
> ---
> Change in v2:
>  - Add more description about this fix.

Applied now.  Thanks.


Takashi
