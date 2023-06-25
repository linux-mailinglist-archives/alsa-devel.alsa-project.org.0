Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5190273D2E4
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Jun 2023 20:15:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7589183A;
	Sun, 25 Jun 2023 20:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7589183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687716910;
	bh=tQoqDstsUxbRyD6ttZZsICF932P7vRiAzMgpPzvmzNg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TamkGQi8nd37Wk7cSPSSbasbpzg6u0Vi5pV4Q20D6vCUoa/DIMXNVcX39zBLp5PEr
	 YSTddNnYiv35JqxFI53IlWIJOBGtdLIU4j62rnOpJi/QuR+BJxFcESh6CR3vvxzYHs
	 7RBCewXh1t5JzC0xWyCLNWz2c5yoLghvvuUH+X2c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7C17F80124; Sun, 25 Jun 2023 20:13:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08C84F80212;
	Sun, 25 Jun 2023 20:13:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D61C8F80246; Sun, 25 Jun 2023 20:13:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A36BAF80093
	for <alsa-devel@alsa-project.org>; Sun, 25 Jun 2023 20:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A36BAF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=b7RKU4pP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kidsZl/N
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D016421887;
	Sun, 25 Jun 2023 18:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687716825;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mIGYuXeg3Z3crSQru1UTV8eTEHb5NndbE7Ik2w/PaYo=;
	b=b7RKU4pPTLR0INoyzyhMF9lIQspZNJJvm2twY/ICPsJDHzIsMZfM5VBCJ/BkOMTSEL8Ma7
	p476GHGVc8bSASsSlqQX+lVPE1wQS34MJSZ4MGqoevVottAU/cpWFMdycgTpUfBcXwk0hR
	iwrv4h8JCLRxgqtI59sBM2W+y5+2iUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687716825;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mIGYuXeg3Z3crSQru1UTV8eTEHb5NndbE7Ik2w/PaYo=;
	b=kidsZl/NA/HZaCeRvnKNFz13WxMid2WGVay/w+59zHqmH4K2wxT0Nsbv5VgzM1kA40jxA+
	A5j81ekjJIUtr8Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 95C4913462;
	Sun, 25 Jun 2023 18:13:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MW/nItmDmGQcFQAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 25 Jun 2023 18:13:45 +0000
Date: Sun, 25 Jun 2023 20:13:45 +0200
Message-ID: <87edlzwgti.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: YE Chengfeng <cyeaa@connect.ust.hk>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"yunjunlee@chromium.org" <yunjunlee@chromium.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: dummy: Fix &dpcm->lock deadlock issues
In-Reply-To: 
 <TYCP286MB1188FEE149369A32D90DCE288A21A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
References: 
 <TYCP286MB1188FEE149369A32D90DCE288A21A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 6T2TF6MPOGE2G5HTKXMI4FAZJ57JDWCX
X-Message-ID-Hash: 6T2TF6MPOGE2G5HTKXMI4FAZJ57JDWCX
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6T2TF6MPOGE2G5HTKXMI4FAZJ57JDWCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 25 Jun 2023 17:35:48 +0200,
YE Chengfeng wrote:
> 
> The timer dummy_systimer_callback is executed under softirq
> context, thus other process context code requiring the same lock
> should disable interrupt. Otherwise there would be potential
> deadlock issues when the code executing under process context
> (i.e., dummy_systimer_pointer, dummy_systimer_start,
> dummy_systimer_stop) is preempted by the timer while holding
> the lock.
> 
> Deadlock scenario:
> dummy_systimer_pointer
>     -> spin_lock(&dpcm->lock);
>         <timer interrupt>
>         -> dummy_systimer_callback
>         -> spin_lock_irqsave(&dpcm->lock, flags);
> 
> Fix the potential deadlock by using spin_lock_irqsave.

Did you really trigger this deadlock, or is just your hypothesis?
I'm asking it because basically the deadlock above shouldn't happen;
those are called only via PCM trigger and pointer callbacks, and they
are always called inside the PCM stream lock, and already
irq-disabled.


thanks,

Takashi
