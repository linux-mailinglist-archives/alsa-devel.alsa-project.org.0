Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AC773D2E5
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Jun 2023 20:15:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4048C7F4;
	Sun, 25 Jun 2023 20:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4048C7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687716940;
	bh=spdBz1Ff27VnjhT3G5A9CtTq6THqpbTsZejj4wpycMA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=caAMznVPBFnzQ6RnWhlgkGJUBIbbWHeC+RuQT9rwhPrk7JwGEkwZ6fvfylZM+AKRr
	 cq+S4ysTJUk5KUq0uh8j3d4zIFCwKntV3aS/zhrxU84ADkObZ4G0QklT0pzwTYNYQ3
	 chlPV1hqkYhVYA/rFBCjg2+STOe4UuveKC7MrKrg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73D25F80534; Sun, 25 Jun 2023 20:14:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5348F80431;
	Sun, 25 Jun 2023 20:14:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 591B3F80534; Sun, 25 Jun 2023 20:14:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3037DF80212
	for <alsa-devel@alsa-project.org>; Sun, 25 Jun 2023 20:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3037DF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=eoIY6+Mz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=v+qMZkn9
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C0E3121887;
	Sun, 25 Jun 2023 18:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687716863;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IobH/r92kTGjvuGu4EK7R8QGIkmpjSClxSPjpJ3vAGg=;
	b=eoIY6+Mz4ul52M+8iP1nUBmYJG6b9Ak0rsSAuYoK17jJDlJ+SNHTV+ju6fWU/OA63aDRYf
	Zeav8NhPa5heF7NS3+f2EVyb8e8Mo7pR2pPWMa4fzVh+ARJ+EpH8ARPMcp/QBXVz5KHA74
	yJAng0KAFQL8ZDRsHYfMnCBKdYlkcYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687716863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IobH/r92kTGjvuGu4EK7R8QGIkmpjSClxSPjpJ3vAGg=;
	b=v+qMZkn9W7rHhZh2mL5Lv/8Q7wp3YT+/kSgE0qYMVKF6X8X4c293uMa7AiN7B6WFFY/7ic
	BtBZ46kl3Ec+U6Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B3DB13462;
	Sun, 25 Jun 2023 18:14:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id K6Y+Ff+DmGQ5FQAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 25 Jun 2023 18:14:23 +0000
Date: Sun, 25 Jun 2023 20:14:22 +0200
Message-ID: <87cz1jwgsh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: YE Chengfeng <cyeaa@connect.ust.hk>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"pteerapong@chromium.org" <pteerapong@chromium.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: aloop: Fix &cable->lock deadlock issues
In-Reply-To: 
 <TYCP286MB11886E8193AD36C16451A0AC8A21A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
References: 
 <TYCP286MB11886E8193AD36C16451A0AC8A21A@TYCP286MB1188.JPNP286.PROD.OUTLOOK.COM>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: WPI2SJOMS65HJOLPYL7UGSKDVXTZMEJC
X-Message-ID-Hash: WPI2SJOMS65HJOLPYL7UGSKDVXTZMEJC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WPI2SJOMS65HJOLPYL7UGSKDVXTZMEJC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 25 Jun 2023 18:22:56 +0200,
YE Chengfeng wrote:
> 
> The timer loopback_jiffies_timer_function is executed under
> bottom-half softirq context and require a spinlock, thus
> other process context code requiring the same lock (i.e.,
> loopback_trigger, loopback_pointer) can deadlock with the
> timer if it is preempted while holding the lock.
> 
> Deadlock scenario:
> loopback_trigger
>     -> spin_lock(&cable->lock);
>         <timer interrupt>
>         -> loopback_jiffies_timer_function
>         -> spin_lock_irqsave(&dpcm->cable->lock, flags);
> 
> Fix the potential deadlock by using spin_lock_irqsave.

Similarly like the patch for snd-dummy, this change looks superfluous,
too.


thanks,

Takashi
