Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7F3A50436
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 17:10:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C3C6603C5;
	Wed,  5 Mar 2025 17:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C3C6603C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741191045;
	bh=LvdFCFJHY3Rn4CYbBeqB8eaKQCsCyJdu8iqH3qc8dN4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U9o7rz+YMdbIfgtCuCFGWT5ivq8oSH9HyYe+LzL+khq2ImONvFdHr/9M/QiB1y7Sf
	 8B3LCRC5mRrledelHrv80XkS1IbYUE9zF6cozr+SzTScB/kQ3j8mIGMHU2d4q56bMl
	 C7JlMDtMn81j0BmLYbwdEa8qT4u+pRF8w4btXgco=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 912F3F805BD; Wed,  5 Mar 2025 17:10:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A66AF805B4;
	Wed,  5 Mar 2025 17:10:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24C90F802BE; Wed,  5 Mar 2025 17:10:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3087F80171
	for <alsa-devel@alsa-project.org>; Wed,  5 Mar 2025 17:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3087F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=DVzbsA/q;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=SlZStIqJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=DVzbsA/q;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=SlZStIqJ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 873921F394;
	Wed,  5 Mar 2025 16:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1741190993;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JLcDxgtLdtZZEchsaRGzC3FY9F3HbBFNCz5bKNwvIUU=;
	b=DVzbsA/qEYT6cl3NG88FSdDFx8Xwhy9AR8GyOW/39StH4djByIHzmqXTKaaqdqKwD1Ufqw
	5mg/8UnJeur4bAXqowj1t7RCuYro4woYgiH2abwN7L+YbFVcdnDje1/5kI8ztdUGV/7WbS
	a2LvO1b/SXHDBEMK0vetJZLhkieEIK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741190993;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JLcDxgtLdtZZEchsaRGzC3FY9F3HbBFNCz5bKNwvIUU=;
	b=SlZStIqJOf0TPmqv/tt/JWMT1fowpO0CCvLO+NsdIHd7v8GLNgPNnYDTFX2cSowku1mwu/
	6cAbxekznEk3p9Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1741190993;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JLcDxgtLdtZZEchsaRGzC3FY9F3HbBFNCz5bKNwvIUU=;
	b=DVzbsA/qEYT6cl3NG88FSdDFx8Xwhy9AR8GyOW/39StH4djByIHzmqXTKaaqdqKwD1Ufqw
	5mg/8UnJeur4bAXqowj1t7RCuYro4woYgiH2abwN7L+YbFVcdnDje1/5kI8ztdUGV/7WbS
	a2LvO1b/SXHDBEMK0vetJZLhkieEIK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741190993;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JLcDxgtLdtZZEchsaRGzC3FY9F3HbBFNCz5bKNwvIUU=;
	b=SlZStIqJOf0TPmqv/tt/JWMT1fowpO0CCvLO+NsdIHd7v8GLNgPNnYDTFX2cSowku1mwu/
	6cAbxekznEk3p9Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 693BE1366F;
	Wed,  5 Mar 2025 16:09:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UhJ3GFF3yGeFdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Mar 2025 16:09:53 +0000
Date: Wed, 05 Mar 2025 17:09:52 +0100
Message-ID: <87y0xjqx0v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: noman pouigt <variksla@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: XRUN handling in pcm driver
In-Reply-To: 
 <CAES_P+_nK8TPS_=TsJ-_eh+zRDGfCiu-=+73=i9c26KriuXSiw@mail.gmail.com>
References: 
 <CAES_P+_nK8TPS_=TsJ-_eh+zRDGfCiu-=+73=i9c26KriuXSiw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: U3DWQ62QQ5CAAK27ASSAEO6CGGPNAEXZ
X-Message-ID-Hash: U3DWQ62QQ5CAAK27ASSAEO6CGGPNAEXZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U3DWQ62QQ5CAAK27ASSAEO6CGGPNAEXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Mar 2025 18:27:43 +0100,
noman pouigt wrote:
> 
> Hello Maintainers,
> 
> I have a question regarding XRUN handling.
> After an XRUN is triggered, userspace generally
> calls TRIGGER_STOP followed by PREPARE
> and TRIGGER_START. In the PREPARE stage,
> we are currently not sending the ALSA ring
> buffer (physical address, rate, format, etc.) IPC to the
> DSP but instead doing that in HW_PARAMS
> which is causing bad audio after XRUN is triggered.
> 
> I was able to resolve the issue by moving the
> IPC to PREPARE, which fixes the XRUN problem
> and results in good audio even after an XRUN.
> I have also observed a similar approach in
> Qualcomm drivers, which I assume is for the same reason.
> 
> Is moving the IPC to PREPARE the correct
> approach for handling this issue? I would appreciate any
> insights or guidance on whether this is the recommended
> way to handle XRUN recovery.

IMO, It's not necessarily about XRUN, but rather a question how the
driver reacts to user's action: stop, and the immediate prepare &
restart.  It's a common pattern, and the driver should handle it
properly in general.

Note that, if the hardware needs some time or procedure to clean up
before the prepare, it should be handled by the driver's sync_stop PCM
callback.


Takashi
