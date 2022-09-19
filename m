Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8405BCB05
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 13:47:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 078AB1614;
	Mon, 19 Sep 2022 13:47:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 078AB1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663588075;
	bh=xgcZi59DJTSa3l9738EbDpIrqcT1ku1DRfKmeaPhb0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VRdr2QWzSW1rqCiJx7aPts5g+hN4feVEv/0IaidCslsrKFbH+jpLOgNeCALSbA2A6
	 I5Ru8BhLjJUIQs6ij7cI7VjTDxEWKyEOnEk4pkmyVt6s+G3ecQJ2ZvqWD4RaMvFUX1
	 Qrh/IEGpmJyhEc8I2CN/VylioIxShBO8xFXm9o+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9165DF800E5;
	Mon, 19 Sep 2022 13:47:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C4E1F804B4; Mon, 19 Sep 2022 13:47:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1C97F803DD
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 13:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1C97F803DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hZ7qcRrA"
Received: by mail-vs1-xe2e.google.com with SMTP id a129so29616623vsc.0
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 04:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fKtska7zV2Fg+EfIPpoEMTUbCLRCeKFO87xJdNKwlXs=;
 b=hZ7qcRrATubjNu9J6EKzo2G34ZYs2VQWzktnPNz1RQQB229BKCnI7QQ04IdjOhNpiS
 noYMJmgZgiJOwbZTutMyxzTqkxPgPt2bgCPdjvnCuYfqkQFGkr2g8fUr4KHgZipb24FI
 z4KWMWL17qtO0cagxkH24dDB84/YklxtzvCssO2xbuRXTGSlPKw5/CUwi3xTDqnKm31V
 B/ENsTUQZTliTm92Rd+Gdci81MoL4ag72lK0A4uRGsuVu+2X7tBbpW9OkiuW3nA74Bqp
 e2Ve3D2HwkJRQR3gRS+T48vN3oD/SSpnkwFNT3Ajl1Rd3wkQf8edxKQGaiOOHkoAnWjw
 1gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fKtska7zV2Fg+EfIPpoEMTUbCLRCeKFO87xJdNKwlXs=;
 b=juIz87DGaQHn4TikV4ZVVkKJC98hKyJE/R1fzw39ZIvHOm/igM7uekNPDVnx5zuqU0
 65HCG2hTFr8OPlBWmNWh6jTu9moCZlkhXCGgQGwS9y212GhAEECg6kjNDFLfF2im4opW
 IId/LpPOo7ARlveLH82U2c9L/pVtJUmxl+uSe0cKKPLZkwfxq4+OKHeBSZs5jDDUV87A
 xuhJth+HnLUGjuHTFAT8LKBbldR6Cpm4U7zD50TqJUflj+d95rsbUBXPldZHvOWTvVRz
 3JkU3OuOw0G12tyZlrcaPZPt4YnEJ2gBhK35aWsU0X1+oKf2jXZdHxkdQwDWHbalohNs
 6PYA==
X-Gm-Message-State: ACrzQf16SbfdTeeU+Xr3LFfiyE/hqhOQ+wlxjfeIg1JuUw6SPwC3+jiv
 hl003AWCJKZ0t7vaCyzwLPYSHRaFSwzaZNZyaKg=
X-Google-Smtp-Source: AMsMyM4M2ser5bOF6J2igC/p57FX5aXjOfh63rBKsvNVK82zChDx25dnwcFkZuYVUg+agaq0+PNxstXRhVrSUizXXIk=
X-Received: by 2002:a67:8c43:0:b0:398:6815:d340 with SMTP id
 o64-20020a678c43000000b003986815d340mr5863396vsd.42.1663588014187; Mon, 19
 Sep 2022 04:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAB7eexL1zBnB636hwS27d-LdPYZ_R1-5fJS_h=ZbCWYU=UPWJg@mail.gmail.com>
 <871qs7dav5.wl-tiwai@suse.de> <87r107btti.wl-tiwai@suse.de>
In-Reply-To: <87r107btti.wl-tiwai@suse.de>
From: Rondreis <linhaoguo86@gmail.com>
Date: Mon, 19 Sep 2022 19:46:43 +0800
Message-ID: <CAB7eexL-H7v5+EB6DVLLZSaV0daHtWhr1gjpuMOspJhJSjq5Lw@mail.gmail.com>
Subject: Re: KASAN: invalid-free in snd_card_new
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,

I tested this patch with the reproducer and the crash did not trigger again.

On Mon, Sep 19, 2022 at 5:24 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 19 Sep 2022 10:30:54 +0200,
> Takashi Iwai wrote:
> >
> > On Sun, 18 Sep 2022 15:01:11 +0200,
> > Rondreis wrote:
> > >
> > > Hello,
> > >
> > > When fuzzing the Linux kernel driver v6.0-rc4, the following crash was
> > > triggered.
> > >
> > > HEAD commit: 7e18e42e4b280c85b76967a9106a13ca61c16179
> > > git tree: upstream
> > >
> > > kernel config: https://pastebin.com/raw/xtrgsXP3
> > > C reproducer: https://pastebin.com/raw/w2sdQWYj
> > > console output: https://pastebin.com/raw/Yyf7zw2d
> > >
> > > Basically, in the c reproducer, we use the gadget module to emulate
> > > attaching a USB device(vendor id: 0x1bc7, product id: 0x1206, with the
> > > midi function) and executing some simple sequence of system calls.
> > > To reproduce this crash, we utilize a third-party library to emulate
> > > the attaching process: https://github.com/linux-usb-gadgets/libusbgx.
> > > Just clone this repository, install it, and compile the c
> > > reproducer with ``` gcc crash.c -lusbgx -lconfig -o crash ``` will do
> > > the trick.
> > >
> > > I would appreciate it if you have any idea how to solve this bug.
> >
> > Could you try the patch below?  It looks like a simple double-free in
> > the code.
>
> A more proper patch is below.  Please give it a try.
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: core: Fix double-free at snd_card_new()
>
> During the code change to add the support for devres-managed card
> instance, we put an explicit kfree(card) call at the error path in
> snd_card_new().  This is needed for the early error path before the
> card is initialized with the device, but is rather superfluous and
> causes a double-free at the error path after the card instance is
> initialized, as the destructor of the card object already contains a
> kfree() call.
>
> This patch fixes the double-free situation by removing the superfluous
> kfree().  Meanwhile we need to call kfree() explicitly for the early
> error path, so it's added there instead.
>
> Fixes: e8ad415b7a55 ("ALSA: core: Add managed card creation")
> Reported-by: Rondreis <linhaoguo86@gmail.com>
> Cc: <stable@vger.kernel.org>
> Link: https://lore.kernel.org/r/CAB7eexL1zBnB636hwS27d-LdPYZ_R1-5fJS_h=ZbCWYU=UPWJg@mail.gmail.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/core/init.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/sound/core/init.c b/sound/core/init.c
> index 193dae361fac..5377f94eb211 100644
> --- a/sound/core/init.c
> +++ b/sound/core/init.c
> @@ -178,10 +178,8 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
>                 return -ENOMEM;
>
>         err = snd_card_init(card, parent, idx, xid, module, extra_size);
> -       if (err < 0) {
> -               kfree(card);
> -               return err;
> -       }
> +       if (err < 0)
> +               return err; /* card is freed by error handler */
>
>         *card_ret = card;
>         return 0;
> @@ -233,7 +231,7 @@ int snd_devm_card_new(struct device *parent, int idx, const char *xid,
>         card->managed = true;
>         err = snd_card_init(card, parent, idx, xid, module, extra_size);
>         if (err < 0) {
> -               devres_free(card);
> +               devres_free(card); /* in managed mode, we need to free manually */
>                 return err;
>         }
>
> @@ -297,6 +295,8 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
>                 mutex_unlock(&snd_card_mutex);
>                 dev_err(parent, "cannot find the slot for index %d (range 0-%i), error: %d\n",
>                          idx, snd_ecards_limit - 1, err);
> +               if (!card->managed)
> +                       kfree(card); /* manually free here, as no destructor called */
>                 return err;
>         }
>         set_bit(idx, snd_cards_lock);           /* lock it */
> --
> 2.35.3
>
