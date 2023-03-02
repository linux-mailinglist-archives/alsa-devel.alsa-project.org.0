Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C32F6A8967
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 20:18:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E14382C;
	Thu,  2 Mar 2023 20:17:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E14382C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677784728;
	bh=MXRJnOyM8GPk7kQEwGaPuhfbuYdYjwAlz/76UKsl5vU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nsabOAc5jUC6V511clsrfSNdXS90rtP5ZqeWwCECd6ST61WprTCW70+/LkrxVnCcX
	 6yC97Z8u5zYSc0oV06eq6SNDxTec8DOtyAEudnA8AnPuuleB64Jh+qQoMkTiwRwU9l
	 ERw+GfDqBd2pAJdQlSnKIEwCQUeHAlCAiE/fgD/s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18B48F804B1;
	Thu,  2 Mar 2023 20:17:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CB9BF804FE; Thu,  2 Mar 2023 20:17:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F632F8049C
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 20:17:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F632F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=metanate.com header.i=@metanate.com header.a=rsa-sha256
 header.s=stronger header.b=Isa2W5G/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=metanate.com; s=stronger; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description;
	bh=87JKjmVsuv8rIF34mdQmg/4fonoAxbnoQcy8w4pOxC8=; b=Isa2W5G/aXeD2eH1yhZOcjnyPY
	o1a2makI6Kvj33x1f5eY4mxN54iFIOc2Ye3GDGM95efsqUVkimk1BusyztXQzENx089/ffpbjP4dc
	TWZ0wInn5QjFDidAHtJkTGd8XpI2bDR08VX7gy9YLN2o9cLIo6+EmiWQTfVedHf27huz/HT9rr7kK
	7nB5V8Y3M8++Ipi24KFr1cay62Kc47Y7vkgOM+oMYEkLozZ8RH/q8fCqwiahYfpYSjqCWimDZLkfT
	V+Gb6u6An9/YUcti+97tsKhx8OdrYJ2xoFpOag5/WVBs6Hw0oPpj3ilwjI2SsYp01JM7HJj0G0Ukc
	gn+h3LoQ==;
Received: from [81.174.171.191] (helo=donbot)
	by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <john@metanate.com>)
	id 1pXoQ5-0000qA-J8;
	Thu, 02 Mar 2023 19:16:49 +0000
Date: Thu, 2 Mar 2023 19:16:48 +0000
From: John Keeping <john@metanate.com>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>
Subject: Re: [PATCH] usb: gadget: u_audio: don't let userspace block driver
 unbind
Message-ID: <ZAD2IPJFyg0e7r7N@donbot>
References: <20230302163648.3349669-1-alvin@pqrs.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302163648.3349669-1-alvin@pqrs.dk>
X-Authenticated: YES
Message-ID-Hash: PML65JFSKWRNH76IDE5YSJKRGYLDHGYR
X-Message-ID-Hash: PML65JFSKWRNH76IDE5YSJKRGYLDHGYR
X-MailFrom: john@metanate.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yadi Brar <yadi.brar01@gmail.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 Felipe Balbi <balbi@ti.com>, alsa-devel@alsa-project.org,
 Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 stable@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PML65JFSKWRNH76IDE5YSJKRGYLDHGYR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Mar 02, 2023 at 05:36:47PM +0100, Alvin Šipraga wrote:
> From: Alvin Šipraga <alsi@bang-olufsen.dk>
> 
> In the unbind callback for f_uac1 and f_uac2, a call to snd_card_free()
> via g_audio_cleanup() will disconnect the card and then wait for all
> resources to be released, which happens when the refcount falls to zero.
> Since userspace can keep the refcount incremented by not closing the
> relevant file descriptor, the call to unbind may block indefinitely.
> This can cause a deadlock during reboot, as evidenced by the following
> blocked task observed on my machine:
> 
>   task:reboot  state:D stack:0   pid:2827  ppid:569    flags:0x0000000c
>   Call trace:
>    __switch_to+0xc8/0x140
>    __schedule+0x2f0/0x7c0
>    schedule+0x60/0xd0
>    schedule_timeout+0x180/0x1d4
>    wait_for_completion+0x78/0x180
>    snd_card_free+0x90/0xa0
>    g_audio_cleanup+0x2c/0x64
>    afunc_unbind+0x28/0x60
>    ...
>    kernel_restart+0x4c/0xac
>    __do_sys_reboot+0xcc/0x1ec
>    __arm64_sys_reboot+0x28/0x30
>    invoke_syscall+0x4c/0x110
>    ...
> 
> The issue can also be observed by opening the card with arecord and
> then stopping the process through the shell before unbinding:
> 
>   # arecord -D hw:UAC2Gadget -f S32_LE -c 2 -r 48000 /dev/null
>   Recording WAVE '/dev/null' : Signed 32 bit Little Endian, Rate 48000 Hz, Stereo
>   ^Z[1]+  Stopped                    arecord -D hw:UAC2Gadget -f S32_LE -c 2 -r 48000 /dev/null
>   # echo gadget.0 > /sys/bus/gadget/drivers/configfs-gadget/unbind
>   (observe that the unbind command never finishes)
> 
> Fix the problem by using snd_card_free_when_closed() instead, which will
> still disconnect the card as desired, but defer the task of freeing the
> resources to the core once userspace closes its file descriptor.
> 
> Fixes: 132fcb460839 ("usb: gadget: Add Audio Class 2.0 Driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>

Reviewed-by: John Keeping <john@metanate.com>

> ---
>  drivers/usb/gadget/function/u_audio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
> index c1f62e91b012..4a42574b4a7f 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -1422,7 +1422,7 @@ void g_audio_cleanup(struct g_audio *g_audio)
>  	uac = g_audio->uac;
>  	card = uac->card;
>  	if (card)
> -		snd_card_free(card);
> +		snd_card_free_when_closed(card);
>  
>  	kfree(uac->p_prm.reqs);
>  	kfree(uac->c_prm.reqs);
> -- 
> 2.39.1
> 
