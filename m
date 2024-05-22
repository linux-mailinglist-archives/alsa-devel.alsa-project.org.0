Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 454FB8CBAD0
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2024 07:53:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B2A8820;
	Wed, 22 May 2024 07:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B2A8820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716357212;
	bh=7rl3MJ2xqObrtTFVmEhG93ja5bgZEDf/8t5zN6tTAgw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VykRcRXvGTEx/2sF7iGcnwjLC5o3m6HOgbPjef6517SsU+dMMvl1xWEwPV9K93Fj/
	 Hrc+65czA6f7znCh6//A1rceAJ53ygrNSnCsMBQOB1MfatcCj04SCmHVatUGHljMuM
	 c612Cf8tLwmhSJ6edPedTOoCPrbovzpea7C9D0a4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A848DF805B4; Wed, 22 May 2024 07:53:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 114DBF805A9;
	Wed, 22 May 2024 07:53:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B146F8016B; Wed, 22 May 2024 07:52:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D61FAF8016B
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 07:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D61FAF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=A8KY6B1s;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=stvDvwBv;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=xLO+hbK7;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Zlx6hSj+
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F13A834B78;
	Wed, 22 May 2024 05:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1716357117;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SO7Vj16TE+7ELY0AackoqSl5lpmUjxZgU0xxRG1lc04=;
	b=A8KY6B1sAPCgaCksqyKludilYHioqAYWa2RNPJf007qew8hG91ZVa7ooPOvsiKxd6tgwdM
	2AEqC0CTUlXvYvstZBuJla5TK6cJrqQrpriOqSVasCwd4+wFmEtpKL+K06I9Li8d4s7T7w
	5jxmN/sZU8dHNDKL2eQcviq0ce38HLA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716357117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SO7Vj16TE+7ELY0AackoqSl5lpmUjxZgU0xxRG1lc04=;
	b=stvDvwBvRE4ShEgkU7CTrGLzoC5mXWO/Uuir21S2sZc4kURkmDbcsZBLcvEcYJdjn1ig5g
	FX10NvNzDSU0OvAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1716357115;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SO7Vj16TE+7ELY0AackoqSl5lpmUjxZgU0xxRG1lc04=;
	b=xLO+hbK7dXzUGVm4DInedFvrzXOZ41IVO1nUhE7z2mPzGUZ0PhZdJlT4r1vEBHWG671JFA
	0lvA+nr+s3nwchZupX9CBgW7FdTZNp8SFSLigzRTddSGKvvTCSkhf99XXQumJK5AgnXuXM
	oDFkiZHFSbNZ+pZPRkMdNzeWYgaaMvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716357115;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SO7Vj16TE+7ELY0AackoqSl5lpmUjxZgU0xxRG1lc04=;
	b=Zlx6hSj+1bLyXRLdMnrc7n85ecuPiumwWHZLGvT4BOtIJHK2ojqGYLNcXTCPRWo6lHJnfJ
	KwKZR1pYpOygowBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99761139CB;
	Wed, 22 May 2024 05:51:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dXOqI/uHTWYZQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 22 May 2024 05:51:55 +0000
Date: Wed, 22 May 2024 07:52:14 +0200
Message-ID: <87msoiz94h.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	miquel.raynal@bootlin.com,
	perex@perex.cz,
	tiwai@suse.com,
	lars@metafoo.de,
	lgirdwood@gmail.com
Subject: Re: DMA Transfer Synchronization Issue in Out-of-Tree Sound Card
 Driver
In-Reply-To: <6e01c13f-2bc1-4e08-b50e-9f1307bda92d@sirena.org.uk>
References: <Zkxb0FTzW6wlnYYO@localhost.localdomain>
	<6e01c13f-2bc1-4e08-b50e-9f1307bda92d@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.24 / 50.00];
	BAYES_HAM(-2.94)[99.75%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,alsa-project.org,bootlin.com,perex.cz,suse.com,metafoo.de,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: 4TVGO7CKKHQ6G2S3Q75IETH3KHI5Z3FH
X-Message-ID-Hash: 4TVGO7CKKHQ6G2S3Q75IETH3KHI5Z3FH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4TVGO7CKKHQ6G2S3Q75IETH3KHI5Z3FH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 21 May 2024 20:32:59 +0200,
Mark Brown wrote:
> 
> On Tue, May 21, 2024 at 10:31:12AM +0200, Louis Chauvet wrote:
> 
> > To address this DMA issue, I have created a patch [1] that guarantees the 
> > completion of the DMA transfer upon the return of xdma_synchronize. This 
> > means xdma_synchronize now sleeps, but looking at other drivers around it 
> > appears expected to be able to do so.
> 
> You need to set the nonatomic flag for the PCM to allow this, the
> default is that triggers run in atomic context.

Right, that's a most straightforward solution.  It implies that the
period updates must be in non-atomic, i.e. use a threaded irq handler
in most cases.

If the synchronization is needed for assuring the hardware stop, there
is an alternative with PCM sync_stop callback, too.  The callback is
called at each time after a stream gets stopped before the next action
(that is, either prepare, hw_params or close).  It's only for
stopping, and there is no similar way for sync of a stream start,
though.


thanks,

Takashi
