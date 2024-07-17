Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1913933946
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 10:41:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A864184D;
	Wed, 17 Jul 2024 10:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A864184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721205674;
	bh=opPt7tqdT8LfI+IabmLzugjEK+EwOUpc8JG+FLZUkAs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KyMWzxNRkIqry2/CkbnJX9TEed8hw5VMV1UGag3+rNVJ5Za18/0lmjincsrSXYWRb
	 xqwP5ZPigoVDUH6GPdfQkXzfxd+mqzBu+A/LbrAFVgnnvOunq7LbyIaIP4EzsbPYco
	 BgmuaXldIYh6fkn1WffgVPV/lqyuNAZvmEw14kr4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B11EFF80589; Wed, 17 Jul 2024 10:40:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37D44F805AD;
	Wed, 17 Jul 2024 10:40:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACB4BF8026D; Wed, 17 Jul 2024 10:40:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86850F8007E
	for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2024 10:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86850F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pxa78rQj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GWmGvZw7;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=pxa78rQj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GWmGvZw7
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 606CE21B48;
	Wed, 17 Jul 2024 08:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721205583;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aWd77CskmZAw29o1fnPllLrLsoYpfLesmhhj3Kakj/E=;
	b=pxa78rQj+nX9KXEEB6YNzJPZuY1dvGoDwIBF3G4/JXiUYv3/EqHWprGj7JV8APvb3v8a+c
	9btJdgY2D6i0VYZGmPK37UsKZk7wGcPrpvj4zUIkfthoYWDvbKTX1IAj6w/AWRu+/wJbVe
	MHReJvZ0GjowdiimMEzzKVB7Halp5LA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721205583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aWd77CskmZAw29o1fnPllLrLsoYpfLesmhhj3Kakj/E=;
	b=GWmGvZw7pLd9+mfqz7ssyUO63zC7WhKK80q6aRwea4Xpg3tVO0tWTQj8K+bQJSxvFlAXX4
	aK5Me0k/Pt1Y0CAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pxa78rQj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GWmGvZw7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721205583;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aWd77CskmZAw29o1fnPllLrLsoYpfLesmhhj3Kakj/E=;
	b=pxa78rQj+nX9KXEEB6YNzJPZuY1dvGoDwIBF3G4/JXiUYv3/EqHWprGj7JV8APvb3v8a+c
	9btJdgY2D6i0VYZGmPK37UsKZk7wGcPrpvj4zUIkfthoYWDvbKTX1IAj6w/AWRu+/wJbVe
	MHReJvZ0GjowdiimMEzzKVB7Halp5LA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721205583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aWd77CskmZAw29o1fnPllLrLsoYpfLesmhhj3Kakj/E=;
	b=GWmGvZw7pLd9+mfqz7ssyUO63zC7WhKK80q6aRwea4Xpg3tVO0tWTQj8K+bQJSxvFlAXX4
	aK5Me0k/Pt1Y0CAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 218FA1368F;
	Wed, 17 Jul 2024 08:39:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KdLbBk+Dl2a2FgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Jul 2024 08:39:43 +0000
Date: Wed, 17 Jul 2024 10:40:15 +0200
Message-ID: <87y160xvgw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lars@metafoo.de,
	perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	shengjiu.wang@gmail.com
Subject: Re: [PATCH] ALSA: pcm_dmaengine: Don't synchronize DMA channel when
 DMA is paused
In-Reply-To: <1721198693-27636-1-git-send-email-shengjiu.wang@nxp.com>
References: <1721198693-27636-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[metafoo.de,perex.cz,suse.com,kernel.org,vger.kernel.org,alsa-project.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 606CE21B48
Message-ID-Hash: 6XT6KFUH7LCJTR2EQ437WDGJUPDPVUNF
X-Message-ID-Hash: 6XT6KFUH7LCJTR2EQ437WDGJUPDPVUNF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6XT6KFUH7LCJTR2EQ437WDGJUPDPVUNF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 Jul 2024 08:44:53 +0200,
Shengjiu Wang wrote:
> 
> When suspended, the DMA channel may enter PAUSE state if dmaengine_pause()
> is supported by DMA.
> At this state, dmaengine_synchronize() should not be called, otherwise
> the DMA channel can't be resumed successfully.
> 
> Fixes: e8343410ddf0 ("ALSA: dmaengine: Synchronize dma channel after drop()")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Thanks, applied now.


Takashi
