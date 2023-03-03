Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A8E6A8E57
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 01:52:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C96AB826;
	Fri,  3 Mar 2023 01:51:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C96AB826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677804741;
	bh=0rJZjSmP+GX7dO56tl+OBeE7Y0kQJxDS3z5wYqRPhxY=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H5+4TWS75DAw832aH631ICVhiM3cykkNIwNy/YClR1r4bI0KRZcyWOMKsfAb4Mkrl
	 tqM7fAcSpPECQW5NwCuVeOpHqBBfp86o9QnILT/VF4e3AyNpGuEcdPoGw6d3EnMoFO
	 1KpcKeJ1ifvbkd3AU8Z38GSBJmBDoQ7EoOFGyzlQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D19AF8025A;
	Fri,  3 Mar 2023 01:51:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2B2BF80266; Fri,  3 Mar 2023 01:51:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 161A4F80236
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 01:51:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 161A4F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PTSN8VZY
Received: by mail-pf1-x434.google.com with SMTP id ay18so608464pfb.2
        for <alsa-devel@alsa-project.org>;
 Thu, 02 Mar 2023 16:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677804674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJYk4hCKjOxFQ49axmFLTnRK8yHcLGp0RaCvx6w4UZo=;
        b=PTSN8VZY7bxIAnoE+oKlL98axPXERPDJ3I2XICKNOBUQsUqSYfN/k7TdWdpOfDO/uR
         5RuxpBfv15zz5/XLJwLOmUePrOxW7T/HPfRZ1qnsOw7RSXLaQ1eJ2Fc1aicfCvD+rGC6
         c3TX542Nx/WHx5i+1TrS+ITXmrU5/EEa59tdeYqoqBw5iKZGyz61IqupvT7pNcP879vP
         gcRM7qCFoXY9Gr5EvJaNvHUisokzO2tzSK8bp6sa2D8NOAbz1Of6miZnYupjM4/10nJ7
         s6+lnn2JB3QNeqE5/WI/23X/PmldskoYM2LUudD2tyXIG2pRmcp7oZq4xgtNWQt+1Rfj
         Uo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677804674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJYk4hCKjOxFQ49axmFLTnRK8yHcLGp0RaCvx6w4UZo=;
        b=ObABZu34RYkSiuRAQBBg45JUNcyz9dG6s28yfGpFfYot+euqfR9byIDpY59CLHVXPH
         DzvOjuPfHHYSXXoyyNlnPCzPBU/j5MKaJc5zou2mBqVicAG5kAaFMfg1Jp8Jxx7nsPV3
         9hThJ2XzIqmpfrNzdUWglUSNd7trksFcuWkCJkJqBoj7Zpa+O6++LtxdoE1kpHBaUyab
         L7VOzsKflPfjHBnYc6ur3cDfm9SdVNfUjzb+AxweUR34pOdEUaVnBjFKPxHA9/6Lg/AW
         q9UIIFxQ7winWtLmJGYWv4xO9NM/6+vWICpZUqfOdg4yWJKrv4oAa6Hh9zW2viMucB06
         jTZg==
X-Gm-Message-State: AO0yUKWVi28sTCM+RekUNlIdGiusW7qx9mNpD9AFek0S3NBrscwSB1O6
	OmSGan4bmaaYhOpB6ea6G5jn4vAhi/qf2F23zwI=
X-Google-Smtp-Source: 
 AK7set+8913cW40rRk6iFWRxSLXX85Xkgyh4u1C4LzKcHqHle7Cfal1MiqBUSeP5RoeTmEVAjM9/SyCXFuNz4UCYoqU=
X-Received: by 2002:a63:2b04:0:b0:503:83e8:9b54 with SMTP id
 r4-20020a632b04000000b0050383e89b54mr1454436pgr.1.1677804674271; Thu, 02 Mar
 2023 16:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20230302163648.3349669-1-alvin@pqrs.dk>
In-Reply-To: <20230302163648.3349669-1-alvin@pqrs.dk>
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date: Thu, 2 Mar 2023 19:51:02 -0500
Message-ID: 
 <CAB=otbTiCd0RTbJQxVrp1BB=MVtH-U70eM0fTMHdFH33bC00HA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_audio: don't let userspace block driver
 unbind
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VOFKWENBKKYMIRSRNF4KFHKTA4JQHFZH
X-Message-ID-Hash: VOFKWENBKKYMIRSRNF4KFHKTA4JQHFZH
X-MailFrom: ruslan.bilovol@gmail.com
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
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 stable@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOFKWENBKKYMIRSRNF4KFHKTA4JQHFZH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Mar 2, 2023 at 11:39=E2=80=AFAM Alvin =C5=A0ipraga <alvin@pqrs.dk> =
wrote:
>
> From: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
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
>   Recording WAVE '/dev/null' : Signed 32 bit Little Endian, Rate 48000 Hz=
, Stereo
>   ^Z[1]+  Stopped                    arecord -D hw:UAC2Gadget -f S32_LE -=
c 2 -r 48000 /dev/null
>   # echo gadget.0 > /sys/bus/gadget/drivers/configfs-gadget/unbind
>   (observe that the unbind command never finishes)
>
> Fix the problem by using snd_card_free_when_closed() instead, which will
> still disconnect the card as desired, but defer the task of freeing the
> resources to the core once userspace closes its file descriptor.

It seems nobody has tested that use-case before. Thank you for fixing it

Reviewed-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>

>
> Fixes: 132fcb460839 ("usb: gadget: Add Audio Class 2.0 Driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> ---
>  drivers/usb/gadget/function/u_audio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/f=
unction/u_audio.c
> index c1f62e91b012..4a42574b4a7f 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -1422,7 +1422,7 @@ void g_audio_cleanup(struct g_audio *g_audio)
>         uac =3D g_audio->uac;
>         card =3D uac->card;
>         if (card)
> -               snd_card_free(card);
> +               snd_card_free_when_closed(card);
>
>         kfree(uac->p_prm.reqs);
>         kfree(uac->c_prm.reqs);
> --
> 2.39.1
>
