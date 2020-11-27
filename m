Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8232C60F3
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 09:37:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 577C7181C;
	Fri, 27 Nov 2020 09:36:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 577C7181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606466257;
	bh=wYeMDUhvMk2Wmx29RUqBMi9r/Khl2wtz8d1sESmrRuc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EE8sgYS4Fxp9Xwo42O6w/oUi/+eAgzVPdWPzo2q9nRWBPBj9W5ZlmNG9FNejihB8R
	 2nhpwIgPfq8l8Bgbi9Ao9pHPaNraN//7rQaG/vZ3PyTyuO0LWyAtfugzFHbNzrnYEW
	 j1NfHjUQK0SsSPLTBA02N4cYDbUckDcs+FGYXeog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4CB2F8019D;
	Fri, 27 Nov 2020 09:36:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE842F8019D; Fri, 27 Nov 2020 09:36:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5184EF800EA
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 09:35:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5184EF800EA
Received: by mail-ot1-f66.google.com with SMTP id 79so4020258otc.7
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 00:35:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xh1hHzZVurhLLa9A5bjYyJ5OP5iFGRKbQx8AzvX3xN4=;
 b=dNtmREMkH20LaNJWK5goN3xYaKdjMM6GxMifvmAVdSvZ/fSUgtildJJouqFnp0HUzj
 vLFrkt8rUkiYAXisZeUBFaAx1Bv3h3hFQ40Pk6/D4U/5joVnEM6lP2r1jkPEwefQAeN/
 vN54H+RU0lkhcIudLJyKPCRd5k4KXqtMfBN0TaF8jMKhZ2yAHaX6HoBoaWFrisLt3GV5
 8xHFV23D81Crj78HLTuxyZWVwkCAy6p8Gz5fN3FXfrGQ22LnmMgXm6uI18m0dWzG0MXo
 Zxe7zadBAkWZGhIHSSPQku2HzLHK6A4DTychid6Qa8itk3in0BK/C06TM6MBOh3d95xB
 wGBg==
X-Gm-Message-State: AOAM531el2oNtrQgkBowpB1linDfnIt0QQe8j1YdGuOKXmd6TUKwM+nE
 MAFqCZqN3eRaNlTWSuQDeAL/9wf4lRIzmnlmDfA=
X-Google-Smtp-Source: ABdhPJxi+ycxEsm5KsGHfXpYVjf0qoqXVdSm5mG1czf/VSu3Ar1g/6kPH+lbgaSp8/Ea4xlpW0yThv8dOVha3z28GvM=
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr4949297otc.145.1606466150802; 
 Fri, 27 Nov 2020 00:35:50 -0800 (PST)
MIME-Version: 1.0
References: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Nov 2020 09:35:39 +0100
Message-ID: <CAMuHMdUbfT7ax4BhjMT_DBweab8TDm5e=xMv5f61t9QpQJt1mw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ALSA: ppc: drop if block with always false condition
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
> The remove callback is only called for devices that were probed
> successfully before. As the matching probe function cannot complete
> without error if dev->match_id !=3D PS3_MATCH_ID_SOUND, we don't have to
> check this here.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Note that there are similar checks in snd_ps3_driver_probe(), which
can be removed, too:

        if (WARN_ON(!firmware_has_feature(FW_FEATURE_PS3_LV1)))
                return -ENODEV;
        if (WARN_ON(dev->match_id !=3D PS3_MATCH_ID_SOUND))
                return -ENODEV;

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
