Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13378788530
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 12:47:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE0DF83E;
	Fri, 25 Aug 2023 12:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE0DF83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692960444;
	bh=CbpU1hfaenzOqCYWTxrOwbI02+HBTEoRIHC646s/b6M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fDAU/2LUIXrS2OPAYCtyE5lkLk+7aoFI3X1FjPnPljqnlQkCTgUgScGKnLOmkDiwk
	 v7jVDi+w3IGYMZpSv9n8fE9bkCg9v/LoKYXaJyeaL/FBZHAXtUaqskIcteDxXgJWZO
	 EySELkBIodYPFtLN6RPK8ZJiJbe43ggBN2E+rwfM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C4EFF8022B; Fri, 25 Aug 2023 12:46:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B9A2F800D1;
	Fri, 25 Aug 2023 12:46:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 759A8F800F5; Fri, 25 Aug 2023 12:46:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4625F800AE
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 12:46:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4625F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MGG1ufmu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LLCbXSxP
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 566771F747;
	Fri, 25 Aug 2023 10:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692960378;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sYwNmF8tLKm6ddb55rtxkFovG5zhnS5FHjHUMj94eOY=;
	b=MGG1ufmu3yoMBcSWlHPjLrshJH6zEFBVcQCfbgfP6McLQ5wH9DoBnIW9wVRfa8GYbnXDwV
	xJmuHfsqeSq5f7tncLGmHErNtYnQADLexl1qsIQ6ozFo/4RWY8woZKvIMp++hVFULzLMXd
	lTrq5+rC9TJ45Pj8rna/SuO4nfPA3hg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692960378;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sYwNmF8tLKm6ddb55rtxkFovG5zhnS5FHjHUMj94eOY=;
	b=LLCbXSxPamuU7jAZUnLS6DHeAdbAvVEtXpW6vpKJq60jxriEDfbehJ0mDIEd1LwcGjiKGE
	3n/Y22iA3a0iFABQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 295811340A;
	Fri, 25 Aug 2023 10:46:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iuIgCXqG6GSfKAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 25 Aug 2023 10:46:18 +0000
Date: Fri, 25 Aug 2023 12:46:17 +0200
Message-ID: <87msyf762u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: cujomalainey@chromium.org
Cc: alsa-devel@alsa-project.org,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	Thierry Reding <treding@nvidia.com>,	Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,	Ivan
 Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH 1/2] ALSA: core: add snd_device_init
In-Reply-To: <20230824210339.1126993-2-cujomalainey@chromium.org>
References: <20230824210339.1126993-1-cujomalainey@chromium.org>
	<20230824210339.1126993-2-cujomalainey@chromium.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: KKI5S4ZPB5KWFVUGQA32HW24QBRVRCMW
X-Message-ID-Hash: KKI5S4ZPB5KWFVUGQA32HW24QBRVRCMW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KKI5S4ZPB5KWFVUGQA32HW24QBRVRCMW/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 24 Aug 2023 23:02:52 +0200,
cujomalainey@chromium.org wrote:
> 
> From: Curtis Malainey <cujomalainey@chromium.org>
> 
> Begin allowing refactored modules to allocate their own device but use a
> common initialization procedure for their devices.
> 
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>  include/sound/core.h |  1 +
>  sound/core/init.c    | 19 ++++++++++++++++---
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sound/core.h b/include/sound/core.h
> index dfef0c9d4b9f7..a4744e142c7e3 100644
> --- a/include/sound/core.h
> +++ b/include/sound/core.h
> @@ -240,6 +240,7 @@ extern struct dentry *sound_debugfs_root;
>  void snd_request_card(int card);
>  
>  int snd_device_alloc(struct device **dev_p, struct snd_card *card);
> +void snd_device_init(struct device *dev, struct snd_card *card);
>  
>  int snd_register_device(int type, struct snd_card *card, int dev,
>  			const struct file_operations *f_ops,
> diff --git a/sound/core/init.c b/sound/core/init.c
> index d61bde1225f23..37a8e4791f781 100644
> --- a/sound/core/init.c
> +++ b/sound/core/init.c
> @@ -132,15 +132,28 @@ int snd_device_alloc(struct device **dev_p, struct snd_card *card)
>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>  	if (!dev)
>  		return -ENOMEM;
> +	snd_device_init(dev, card);
> +	*dev_p = dev;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_device_alloc);
> +
> +/**
> + * snd_device_init - Initialize struct device for sound devices
> + * @dev_p: pointer to store the allocated device
> + * @card: card to assign, optional
> + *
> + * For releasing the allocated device, call put_device().
> + */
> +void snd_device_init(struct device *dev, struct snd_card *card)
> +{
>  	device_initialize(dev);
>  	if (card)
>  		dev->parent = &card->card_dev;
>  	dev->class = &sound_class;
>  	dev->release = default_release_alloc;
> -	*dev_p = dev;
> -	return 0;
>  }
> -EXPORT_SYMBOL_GPL(snd_device_alloc);
> +EXPORT_SYMBOL_GPL(snd_device_init);

This will call kfree() at the default release.  It should be avoided
for this case, no?

Also, it's worth that this practically a kind of revive of the old API
that was dropped in the commit 01ed7f3535a2.


thanks,

Takashi
