Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3463D7A076B
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 16:35:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B498FA4D;
	Thu, 14 Sep 2023 16:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B498FA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694702099;
	bh=uf3sAgbIblySVnPorTgMZT1bs33dJ+Tzc8/ehPhd8VM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dDBnLp5mxzGOF3OoZO/kc2yHp2y+mNepf0R0xUqLO1UuxFVRSYmUlfgWoIICKI/qZ
	 OLnx40+6YHRhguVo+9Hz3v2vibWR3/SLc8T0/pf3cw8gI81pZX27LYlcR1DOkbR4SH
	 yxklwWDoXhdBZdQbNFm0soMNBP+PQZ07QAkviCmY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9061EF8047D; Thu, 14 Sep 2023 16:34:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7CB1F80212;
	Thu, 14 Sep 2023 16:34:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B5C6F80246; Thu, 14 Sep 2023 16:33:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EF64F801F5
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 16:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EF64F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Ljr+tYJJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7qh9OFq6
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9B3AC1F854;
	Thu, 14 Sep 2023 14:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694702026;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d5rEenZBwSJn6DR04Z5FgCyx5EyiMtGMUTcETZbYacg=;
	b=Ljr+tYJJSNtXB4Q4C75WoxfD7PYX5b/oW/jYm3OG4qtXtYCnUd5yxr9bFJj0n/q/bVOl0N
	5KfrsQlcU95vjGmPkMdeFQbtcteXAHJ9fdej4LUTqnnvngqnS0xz4qXTo/8wcPScqnMgoe
	tLvlzeXQCCMIMgXtNT603U6H/RQMwZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694702026;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d5rEenZBwSJn6DR04Z5FgCyx5EyiMtGMUTcETZbYacg=;
	b=7qh9OFq6eaAfDxTbuP2fqhGRuPIWp0JM66TYAF3827YYtUKBXlptPOat3UkNcHB2AAE/PT
	ODwoJOqgr9OQfbCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C953139DB;
	Thu, 14 Sep 2023 14:33:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id dGa9FcoZA2XXdgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 14 Sep 2023 14:33:46 +0000
Date: Thu, 14 Sep 2023 16:33:45 +0200
Message-ID: <87y1h8ygc6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: cujomalainey@chromium.org
Cc: alsa-devel@alsa-project.org,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	Geoff Levand <geoff@infradead.org>,	Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,	Ivan
 Orlov <ivan.orlov0322@gmail.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>
Subject: Re: [RFC PATCH v2 1/2] ALSA: core: add snd_device_init
In-Reply-To: <20230913200846.1894258-1-cujomalainey@chromium.org>
References: <20230913200846.1894258-1-cujomalainey@chromium.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: ZXXDL2S5VMMANBFHHYO2NXOL6NQIWOAL
X-Message-ID-Hash: ZXXDL2S5VMMANBFHHYO2NXOL6NQIWOAL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXXDL2S5VMMANBFHHYO2NXOL6NQIWOAL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 13 Sep 2023 22:07:42 +0200,
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
> index 22c0d217b8608..87b5368d20350 100644
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

I'd rather leave release unset here and mention in the function
description to set release in each caller side.
default_release_alloc() calls kfree(), and certainly it doesn't match
with this call.


thanks,

Takashi
