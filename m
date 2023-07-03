Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A0B745702
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 10:11:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 794987F4;
	Mon,  3 Jul 2023 10:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 794987F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688371893;
	bh=KxHbJqDBMh1K32ghnnQhAkhEi/hMszoOw59j5JuyhFs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cq1BpuQtDWBwDL63FTODZKEALdW+DByn92g86NJf/GcdfXVZpHjJE4INl1iwr6axi
	 u2L2lJaeK2Fz3sZltY0bOE+DZhG5tijyXivawEaVyIhyLDCdboYBrZFfXS0/rS9GXs
	 QWmxUL7vyV5tFbMOy24qOXAaJ9NHbrG+OZcFAvsA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9DA8F80104; Mon,  3 Jul 2023 10:10:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96014F80104;
	Mon,  3 Jul 2023 10:10:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CDC2F80125; Mon,  3 Jul 2023 10:10:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DA6AF80100
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 10:10:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DA6AF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=zwMAnXa8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/QmjuhL4
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3AF9D1F8AC;
	Mon,  3 Jul 2023 08:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688371835;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JF+yuK7urvWRKC3M9mc+JnxvxoWl/3dAyFeQYEcA1mc=;
	b=zwMAnXa8uyglsATv4kQP1InR9RqwjBStdOEcr9VqmT/2YUc9BSL7juYog1lwuT7mwSR++1
	ngQjg6wCRguej3oYDMzWahB9/1uJrNd7IT+8tUBMFR8fAXhGmUYNqV3KLaQnjL6Wn2zwEV
	pgMHwS3qcdBmtZbvx675bvGrxMUXd5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688371835;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JF+yuK7urvWRKC3M9mc+JnxvxoWl/3dAyFeQYEcA1mc=;
	b=/QmjuhL4UqKQ7cg+4SmN4Rd1RdV/dSaZj2zD6a6fBFC2TJvoSh5Ib4ONvF4OG3pdHz9zF/
	GV+uPI/FiuFQOECw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3FB6138FC;
	Mon,  3 Jul 2023 08:10:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id VlKSMnqComRKagAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 03 Jul 2023 08:10:34 +0000
Date: Mon, 03 Jul 2023 10:10:34 +0200
Message-ID: <87a5wd76v9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tuo Li <islituo@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@outlook.com,
	BassCheck <bass@buaa.edu.cn>
Subject: Re: [PATCH] ALSA: hda: fix a possible null-pointer dereference due to
 data race in snd_hdac_regmap_sync()
In-Reply-To: <20230703031016.1184711-1-islituo@gmail.com>
References: <20230703031016.1184711-1-islituo@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: Y5LCTQYA7AU2TH23RNKZMNOLOMWB6BXR
X-Message-ID-Hash: Y5LCTQYA7AU2TH23RNKZMNOLOMWB6BXR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y5LCTQYA7AU2TH23RNKZMNOLOMWB6BXR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Jul 2023 05:10:16 +0200,
Tuo Li wrote:
> 
> The variable codec->regmap is often protected by the lock 
> codec->regmap_lock when is accessed. However, it is accessed without 
> holding the lock when is accessed in snd_hdac_regmap_sync():
> 
>   if (codec->regmap)
> 
> In my opinion, this may be a harmful race, because if codec->regmap is 
> set to NULL right after the condition is checked, a null-pointer 
> dereference can occur in the called function regcache_sync():
> 
>   map->lock(map->lock_arg); --> Line 360 in drivers/base/regmap/regcache.c
> 
> To fix this possible null-pointer dereference caused by data race, the 
> mutex_lock coverage is extended to protect the if statement as well as the 
> function call to regcache_sync().
> 
> Reported-by: BassCheck <bass@buaa.edu.cn>
> Signed-off-by: Tuo Li <islituo@gmail.com>

Practically seen, it's pretty harmless, as the flag is set at the very
beginning of the codec driver probe, while snd_hdac_regmap_sync() is
used only in the runtime PM resume that must not happen during the
probe.  IOW, codec->regmap_lock itself isn't really meant to
protectthe change of codec->regmap flag.

OTOH, your change makes things more consistent, so I applied the patch
now.


Thanks!

Takashi


> ---
>  sound/hda/hdac_regmap.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/hda/hdac_regmap.c b/sound/hda/hdac_regmap.c
> index fe3587547cfe..39610a15bcc9 100644
> --- a/sound/hda/hdac_regmap.c
> +++ b/sound/hda/hdac_regmap.c
> @@ -597,10 +597,9 @@ EXPORT_SYMBOL_GPL(snd_hdac_regmap_update_raw_once);
>   */
>  void snd_hdac_regmap_sync(struct hdac_device *codec)
>  {
> -	if (codec->regmap) {
> -		mutex_lock(&codec->regmap_lock);
> +	mutex_lock(&codec->regmap_lock);
> +	if (codec->regmap)
>  		regcache_sync(codec->regmap);
> -		mutex_unlock(&codec->regmap_lock);
> -	}
> +	mutex_unlock(&codec->regmap_lock);
>  }
>  EXPORT_SYMBOL_GPL(snd_hdac_regmap_sync);
> -- 
> 2.34.1
> 
