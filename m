Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB8D721FB9
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 09:37:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05326828;
	Mon,  5 Jun 2023 09:36:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05326828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685950658;
	bh=x8OR7xlag3+0E3Xwv3wIDXyJOCoTZ8//ifFGjLxBm5U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kVpQBkmXlHJ6HbRv8lyFQfiSEXdUo42EcVWzuPx/nNqiYfCUBLM1PO42nclEIG3z5
	 Ad+SZ98K0A/P0fs2mXlcws94M5+GQGgUzlA0PHRzLG88avcDw/9LA3pATYyo9555Wx
	 Qi963fUUag8Fa3rgkipWH9Kolru8VJaSuMNf9InQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4211F80552; Mon,  5 Jun 2023 09:36:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7195AF80290;
	Mon,  5 Jun 2023 09:36:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6EBEF80494; Mon,  5 Jun 2023 09:36:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47C77F8016C
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 09:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47C77F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=gliU+Rb3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=OUhZn66b
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1BC2A21AF9;
	Mon,  5 Jun 2023 07:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1685950588;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZyQYrJRYAU3gYho/iQyn8Ng9xP05pdlHsPTn4ZWxt90=;
	b=gliU+Rb30zCGLi8xyOTJlGIW+XdVfUk5bwpGXHwuSOJwKHYD/rJrN7X/G/HafcmZvzG9tr
	ePMVcIsmIu6x+tANTMyTuDgPSVJFHrPL/FNIqK1zXdUvKlLqUnOcwqrWKJYupweaISH/Jl
	svldqAdMVa2B7FX8HAVlqNipj01jh0E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685950588;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZyQYrJRYAU3gYho/iQyn8Ng9xP05pdlHsPTn4ZWxt90=;
	b=OUhZn66bYPZj+TJK2x4/PeTCo//eI7tnnFoof+sWxKkImPXHc7YElcGjh/RPLu2jCKZ8ky
	d18kC5Xd+4aaAjAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D70A0139C7;
	Mon,  5 Jun 2023 07:36:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8MGFM3uQfWT0bwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 05 Jun 2023 07:36:27 +0000
Date: Mon, 05 Jun 2023 09:36:27 +0200
Message-ID: <87r0qqicn8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yanteng Si <siyanteng@loongson.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: Re: [PATCH 3/4] ALSA: hda: Workaround for SDnCTL register on loongson
 controller
In-Reply-To: 
 <74a63661726b8c44be72bf3bd35a3259f2ae2e6a.1685501806.git.siyanteng@loongson.cn>
References: <cover.1685501806.git.siyanteng@loongson.cn>
	<74a63661726b8c44be72bf3bd35a3259f2ae2e6a.1685501806.git.siyanteng@loongson.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: QMEFN5LILWSAUYKHQIRAN5FM5HB3UWWX
X-Message-ID-Hash: QMEFN5LILWSAUYKHQIRAN5FM5HB3UWWX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMEFN5LILWSAUYKHQIRAN5FM5HB3UWWX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 31 May 2023 05:21:33 +0200,
Yanteng Si wrote:
> 
> On loongson controller, after calling snd_hdac_stream_updateb()
> to enable DMA engine, the SDnCTL.STRM will become to zero.  We
> need to access SDnCTL in dword to keep SDnCTL.STRM is not changed.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
> ---
>  sound/hda/hdac_stream.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
> index 1f56fd33b9af..90fbf9fea2b3 100644
> --- a/sound/hda/hdac_stream.c
> +++ b/sound/hda/hdac_stream.c
> @@ -13,6 +13,7 @@
>  #include <sound/hdaudio.h>
>  #include <sound/hda_register.h>
>  #include "trace.h"
> +#include "../pci/hda/hda_controller.h"
>  
>  /*
>   * the hdac_stream library is intended to be used with the following
> @@ -130,6 +131,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_stream_init);
>  void snd_hdac_stream_start(struct hdac_stream *azx_dev)
>  {
>  	struct hdac_bus *bus = azx_dev->bus;
> +	struct azx *chip = bus_to_azx(bus);
>  	int stripe_ctl;
>  
>  	trace_snd_hdac_stream_start(bus, azx_dev);
> @@ -150,7 +152,11 @@ void snd_hdac_stream_start(struct hdac_stream *azx_dev)
>  					stripe_ctl);
>  	}
>  	/* set DMA start and interrupt mask */
> -	snd_hdac_stream_updateb(azx_dev, SD_CTL,
> +	if (chip->driver_caps & AZX_DCAPS_LOONGSON_WORKAROUND)
> +		snd_hdac_stream_updatel(azx_dev, SD_CTL,
> +				0, SD_CTL_DMA_START | SD_INT_MASK);
> +	else
> +		snd_hdac_stream_updateb(azx_dev, SD_CTL,
>  				0, SD_CTL_DMA_START | SD_INT_MASK);

Similarly like the patch 2, this has to be handled with a new flag
added to struct hdac_bus.


Takashi
