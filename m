Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C4A79CA96
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 10:51:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE788950;
	Tue, 12 Sep 2023 10:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE788950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694508688;
	bh=w+2jDHnL+K2GSYrM4PrNVINIoRLiElza0bikDjxuiqE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TGugQS5LOpAiyUUcaNXPDxUAGGsFupHE0Wyd5kouCsN/2tIDMDJPruaRzRKeefPn6
	 GdR/+kXnrT6jz1XPWDvbdBtUcVzeAbPB+HwszhAU+gt61GcwkMjv9AAGVRh53lfIQF
	 rWGRGNjGO8SdCTxfw+foI1AcLG++QZvFPDVGHnm8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A05AF80246; Tue, 12 Sep 2023 10:50:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7B97F80246;
	Tue, 12 Sep 2023 10:50:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB053F80425; Tue, 12 Sep 2023 10:50:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B785F800AA
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 10:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B785F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=eW1YZYxL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=yKM33t8E
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 56B191F85D;
	Tue, 12 Sep 2023 08:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694508623;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KyBRNaYAj1FKVpZu9HTV7I7nxJWl2NPUn/LfwzF1WeI=;
	b=eW1YZYxLFqxyWkULT6ZYZrK3h/QcYe+vuzo+A5rmti1vihVjukYpzwz0+Gr0kPWGrXx3JG
	BowZ6Sad+tkbiDlYbYRAm9A/v1FpfJwMVJFhNrlEl4klsuFKV72hurstQMIPAWAT1CCfEM
	Nh1QDJVu1KqrOnUilB/A4vuQ99gKOK4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694508623;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KyBRNaYAj1FKVpZu9HTV7I7nxJWl2NPUn/LfwzF1WeI=;
	b=yKM33t8EHd+XHmiR+zbPECsds0tfw8Jgv5kxkR4URSa4w32uf1pdsQsVeebl9tVtyHy3N3
	cFYGvoKjbVnhduDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 19703139DB;
	Tue, 12 Sep 2023 08:50:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 5+cNBU8mAGWhJgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 12 Sep 2023 08:50:23 +0000
Date: Tue, 12 Sep 2023 10:50:22 +0200
Message-ID: <87o7i77p2p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ma Ke <make_ruc2021@163.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	cujomalainey@chromium.org,
	maciej.szmigiero@oracle.com,
	clecigne@google.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: do not access controls without possession
 of r_w lock
In-Reply-To: <20230912084530.3307329-1-make_ruc2021@163.com>
References: <20230912084530.3307329-1-make_ruc2021@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: ROIHVXXKDRURELACL5B5KVTY5A76UMKX
X-Message-ID-Hash: ROIHVXXKDRURELACL5B5KVTY5A76UMKX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ROIHVXXKDRURELACL5B5KVTY5A76UMKX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 12 Sep 2023 10:45:30 +0200,
Ma Ke wrote:
> 
> we should not access any of its memory when we don't ensure possession of
> a read/write lock. Otherwise we risk a use after free access, which allows
> local users to cause a denial of service and obtain sensitive information
> from kernel memory.

This function is called always under card->controls_rwsem.
So it should be OK as is.


thanks,

Takashi

> 
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> ---
>  sound/core/control.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/core/control.c b/sound/core/control.c
> index 59c8658966d4..98782cc68ee1 100644
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -590,7 +590,8 @@ static int __snd_ctl_remove(struct snd_card *card,
>  		remove_hash_entries(card, kcontrol);
>  
>  	card->controls_count -= kcontrol->count;
> -	for (idx = 0; idx < kcontrol->count; idx++)
> +	count = kcontrol->count;
> +	for (idx = 0; idx < count; idx++)
>  		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_REMOVE, kcontrol, idx);
>  	snd_ctl_free_one(kcontrol);
>  	return 0;
> -- 
> 2.37.2
> 
