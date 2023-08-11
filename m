Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 392BC778892
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 09:51:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7132E82A;
	Fri, 11 Aug 2023 09:50:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7132E82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691740279;
	bh=OdW/fGxAUIcYrse5XRoYlUbYPfBGcpqX7/UgfQQh1SY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bJqARhbV6+64NJ9OjvHwcjieN/YTTz6KLiA8EJa85sdcCDcdrhW2jxhJBjGzi5v4U
	 XSvMD/apYTg6/IOJQ+X9tMSNZ9nqeAvlhJ6FGVHpnnQ1yPvjm7fTsj7JwFjqK+1Py2
	 YCRym43HI9PQ7XVJyiZt98pfcW+eAsDPUeapLzB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E96CF801EB; Fri, 11 Aug 2023 09:50:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2242F80016;
	Fri, 11 Aug 2023 09:50:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A375F80166; Fri, 11 Aug 2023 09:50:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FAB8F800F4
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 09:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FAB8F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=UBlAiTnF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EZ4x6JSg
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 72C5D21872;
	Fri, 11 Aug 2023 07:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691740199;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3fZI4ubGx1w5dDIafD7wxZftQKheaAMKXq/LEXkbPbQ=;
	b=UBlAiTnFydLHlpW0t6OltknqJTgJzP9hwcDRGxM8Ye4l0vsd4bqu3ESVY+4kePN5XZFKul
	nrttAVzhEl3LiLj8i/uT7qAC5XM7rExA+nAr/P0SjDYkPM3XUld+M9z1MwMMnJooqCp1Iv
	SKirDRtqqYAMMKlZtpRzJPpv+XPo7WQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691740199;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3fZI4ubGx1w5dDIafD7wxZftQKheaAMKXq/LEXkbPbQ=;
	b=EZ4x6JSgn5rCeN0jITX1s7u7T/CVEwhiqEOBiDxd1hjgDNO88skXCcnZaZO17n8hkhBoYG
	lCzf1uYyuaEVG6Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F4091138E2;
	Fri, 11 Aug 2023 07:49:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4hsBOibo1WT/bgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 11 Aug 2023 07:49:58 +0000
Date: Fri, 11 Aug 2023 09:49:58 +0200
Message-ID: <87msyyrpax.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Cc: <perex@perex.cz>,
	<tiwai@suse.com>,
	<claudiu.beznea@tuxon.dev>,
	<lgirdwood@gmail.com>,
	<broonie@kernel.org>,
	<nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>,
	<peda@axentia.se>,
	<lars@metafoo.de>,
	<nuno.sa@analog.com>,
	<povik+lin@cutebit.org>,
	<wens@csie.org>,
	<jernej.skrabec@gmail.com>,
	<samuel@sholland.org>,
	<robh@kernel.org>,
	<u.kleine-koenig@pengutronix.de>,
	<alsa-devel@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<asahi@lists.linux.dev>,
	<linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH -next 5/5] ALSA: Remove redundant of_match_ptr()
In-Reply-To: <20230811071426.2343133-6-ruanjinjie@huawei.com>
References: <20230811071426.2343133-1-ruanjinjie@huawei.com>
	<20230811071426.2343133-6-ruanjinjie@huawei.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 6FJAWOUHVLOWGS5ARXWVCXE6XF34ZUQD
X-Message-ID-Hash: 6FJAWOUHVLOWGS5ARXWVCXE6XF34ZUQD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6FJAWOUHVLOWGS5ARXWVCXE6XF34ZUQD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 11 Aug 2023 09:14:26 +0200,
Ruan Jinjie wrote:
> 
> The driver depends on CONFIG_OF, it is not necessary to use
> of_match_ptr() here.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

> ---
>  sound/drivers/serial-generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/drivers/serial-generic.c b/sound/drivers/serial-generic.c
> index b0262541802a..c8db6c75d133 100644
> --- a/sound/drivers/serial-generic.c
> +++ b/sound/drivers/serial-generic.c
> @@ -366,7 +366,7 @@ MODULE_DEVICE_TABLE(of, snd_serial_generic_dt_ids);
>  static struct serdev_device_driver snd_serial_generic_driver = {
>  	.driver	= {
>  		.name		= "snd-serial-generic",
> -		.of_match_table	= of_match_ptr(snd_serial_generic_dt_ids),
> +		.of_match_table	= snd_serial_generic_dt_ids,
>  	},
>  	.probe	= snd_serial_generic_probe,
>  };
> -- 
> 2.34.1
> 
