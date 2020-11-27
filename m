Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E38E2C6112
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 09:42:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97D851749;
	Fri, 27 Nov 2020 09:41:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97D851749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606466521;
	bh=NiYg4H1aMV8tGRh+hd79esp2a/GklDPB3SA4Ax6nKwk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qv2XUIolBtqzqDu1O9U5E9yH6151KO2ayvvBjjcGhS1YcBFSU1lLCaM+txMfE5m+q
	 zbSCOeZA4mYEZ5NzIsl8wFlA+lJRcXcb4tYsTRInADbLxq/0ySxhJLAXeZ6KZzJEn1
	 /xsqGxalSeTLzKq06Gih49avO1qPWkhplfER8BRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08D1AF80218;
	Fri, 27 Nov 2020 09:40:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC39BF8019D; Fri, 27 Nov 2020 09:40:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D35F1F800EA
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 09:40:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D35F1F800EA
Received: by mail-ot1-f65.google.com with SMTP id o3so4036325ota.8
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 00:40:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/D+lVsFpiig9p8Mfv+F/WnI4wKF69UpUHln9lDG06g4=;
 b=TCinPPIR2GdW/Tw/OlPjRAvq2fCqliUeMI6UztNG6S1rdlf+g5wccXxB5cr5uTMpVJ
 N6jNSSVC4I8PhNbyfHRVOaaryWbRvv3KEbUKITlyeCs+s5bezKlyuJXxofyT4IwfrGiE
 bZFwzL+C7BVEKv0+3R2l+e+2z5Iys3govdLhnrLkRr79FZxxs5VRzI3WKxAx/6Du6eDY
 p802lBJ/AIvZVFeWpSRZ6D8a+rWgTSshx59NKrM/h1tkkGK/rlSe+2WUDs9/NtqqHUmW
 Y+N4nsXxxIgodwTPIYKXROCwxiPF/K8q9Qi+QfjERsgxAt2fB5Sghkqptfptvz+ytq4y
 4Pkw==
X-Gm-Message-State: AOAM533jTy9A8oo6dkhKmeREX7uRkAqmWMmXxtpigEsja+tBRFzuxXl3
 mSoDBWGj2DA/0EM37XeSl2F4hrOvv/87bZ7vWBk=
X-Google-Smtp-Source: ABdhPJy2I/IdfAm6V2ydZbwLB9NPNLYo9PucEpxX/NL/qzuCx8bfpYwJU7BhpITpgvBGwlFRBVNr8EmnqamS0CIYUsg=
X-Received: by 2002:a9d:686:: with SMTP id 6mr4709371otx.107.1606466415531;
 Fri, 27 Nov 2020 00:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
 <20201126165950.2554997-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20201126165950.2554997-2-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Nov 2020 09:40:04 +0100
Message-ID: <CAMuHMdW4J0xA6T4AWqZdo1go1kxWqVSSo5JXQpUAM4yWEpDdOw@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/ps3: make system bus's remove and shutdown
 callbacks return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, scsi <linux-scsi@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Alan Stern <stern@rowland.harvard.edu>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-block@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Geoff Levand <geoff@infradead.org>, netdev <netdev@vger.kernel.org>,
 USB list <linux-usb@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jim Paris <jim@jtan.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
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

Hi Uwe,

On Thu, Nov 26, 2020 at 6:03 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> The driver core ignores the return value of struct device_driver::remove
> because there is only little that can be done. For the shutdown callback
> it's ps3_system_bus_shutdown() which ignores the return value.
>
> To simplify the quest to make struct device_driver::remove return void,
> let struct ps3_system_bus_driver::remove return void, too. All users
> already unconditionally return 0, this commit makes it obvious that
> returning an error code is a bad idea and ensures future users behave
> accordingly.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Note that the same can be done for ps3_vuart_port_driver.remove().

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
