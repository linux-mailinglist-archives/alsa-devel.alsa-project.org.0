Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CF63E3538
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Aug 2021 14:02:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC8AE16AF;
	Sat,  7 Aug 2021 14:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC8AE16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628337724;
	bh=OilFXgzoWAful73M4fYDTQXrwb6IepswQl0qEidF5Gk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fGpNycbABbLbCKrVIgk4SG1o3mjcG7iUDZ+wm/6LeNxxf/TwFjnN7J0fyTDT2KEyF
	 HI0pTuLpTLH6YtBIu6pRbd/dW67T7zxicUiwAB4yS0us7D6R+c7FcjHxblwvhqCV5F
	 UrQc0FGvF+ex+mZJKpYixQi809mu3Xn0FHHEXlDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5286CF8016D;
	Sat,  7 Aug 2021 14:00:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80B0FF802E8; Sat,  7 Aug 2021 14:00:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3129BF800FD
 for <alsa-devel@alsa-project.org>; Sat,  7 Aug 2021 14:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3129BF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QOdR5x9J"
Received: by mail-yb1-xb2e.google.com with SMTP id z18so20204767ybg.8
 for <alsa-devel@alsa-project.org>; Sat, 07 Aug 2021 05:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WyWRBH02aF7TMZK2H9iKEqjuVSj2aT5mi1GkBNRCyKg=;
 b=QOdR5x9JTDfThKVhuyhEYPReV0+hyqKytp6bhrDU9jtJxybQG/OIAaA3oWXzAmhUeI
 OpdNdHL2cTWOdcoGJdjl6SMiapPShk5dqCtzePXNHkSDDTyDYEUVEMRWoeWDVMRgEvWT
 F3WsjtH95W2GEqcxmYbu5Nki6iHjaP/wAYl8B41Jx1LBzEzxM7r/El9yGNDidzRbvvqa
 Kmis+CIiKYZTjEfn/MyNVZZE/sJlnMzcMNu5e2sZtEh+M3pQUSfAAN/s+5gpulRT28gX
 WpDFxD9aYBck7JqESW1IHpFohPSZLTlNkFRqH4KUtyrj9Pxrh4lb4vBKQjKvBi3tS5E+
 KYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WyWRBH02aF7TMZK2H9iKEqjuVSj2aT5mi1GkBNRCyKg=;
 b=HQT5S9fvai+Y6+IHF0ECDVC2UaON8lvDZfW71pCigFrfCK1Gr5f10W6d0qKS8y+HSS
 svWO9quaJRA4ofvmvWSeiFzA5jZXhhOoU3le6MBhjYOKWWze0wROyuxt8DPYsxzJn7zC
 DKjnQp0G+syMiGufjxrqQWW8PygXsYxTX0zU1afRU9mYgN6km5mU0WBVOoAxb9f0DUC+
 4AsNoPejdCm0BkTYd9VRtFLHb9yKtm2rStE4KIumFHDlnq2Jha4PIE0jhe1I10EnSGwf
 l5m8hRKpZJtmGRpcwQbiVO5+7cjw9vOF95W8bdFoU5y3w6Q3hXb9qjlYMj4FiK7zg4pz
 +OVg==
X-Gm-Message-State: AOAM5320lemiAPUcdpjM4lXy/Y7NXVZaDu3nzqf0vSMzJxl09XasWMOt
 MwkdKUpe+Psuw0IE3TVYO77C/vNg6c+XVwlisyQ=
X-Google-Smtp-Source: ABdhPJxo9qHswzoJFxioC74Rd4uuv/McBZ+hRPGpGsGEvfuOE6rZWY4LuFWwzY6Vg59fOtg8kqf5oNFF1j4ZtwtEzDU=
X-Received: by 2002:a25:1546:: with SMTP id 67mr19373700ybv.331.1628337626600; 
 Sat, 07 Aug 2021 05:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210807091927.1974404-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210807091927.1974404-1-u.kleine-koenig@pengutronix.de>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 7 Aug 2021 12:59:50 +0100
Message-ID: <CADVatmO7Wtc8+4mzorrmcwKv2QXg579avynK==9D1Dqz9PHaJw@mail.gmail.com>
Subject: Re: [PATCH v2] parisc: Make struct parisc_driver::remove() return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: linux-input@vger.kernel.org, alsa-devel@alsa-project.org,
 Corey Minyard <minyard@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev <netdev@vger.kernel.org>, linux-parisc <linux-parisc@vger.kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, linux-scsi@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, openipmi-developer@lists.sourceforge.net,
 Jiri Slaby <jirislaby@kernel.org>, "David S. Miller" <davem@davemloft.net>
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

On Sat, Aug 7, 2021 at 10:19 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The caller of this function (parisc_driver_remove() in
> arch/parisc/kernel/drivers.c) ignores the return value, so better don't
> return any value at all to not wake wrong expectations in driver authors.
>
> The only function that could return a non-zero value before was
> ipmi_parisc_remove() which returns the return value of
> ipmi_si_remove_by_dev(). Make this function return void, too, as for all
> other callers the value is ignored, too.
>
> Also fold in a small checkpatch fix for:
>
> WARNING: Unnecessary space before function pointer arguments
> +       void (*remove) (struct parisc_device *dev);
>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> (for drivers/input)
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> changes since v1 sent with Message-Id:
> 20210806093938.1950990-1-u.kleine-koenig@pengutronix.de:
>
>  - Fix a compiler error noticed by the kernel test robot
>  - Add Ack for Dmitry
>
>  arch/parisc/include/asm/parisc-device.h  | 4 ++--
>  drivers/char/ipmi/ipmi_si.h              | 2 +-
>  drivers/char/ipmi/ipmi_si_intf.c         | 6 +-----
>  drivers/char/ipmi/ipmi_si_parisc.c       | 4 ++--
>  drivers/char/ipmi/ipmi_si_platform.c     | 4 +++-
>  drivers/input/keyboard/hilkbd.c          | 4 +---
>  drivers/input/serio/gscps2.c             | 3 +--
>  drivers/net/ethernet/i825xx/lasi_82596.c | 3 +--
>  drivers/parport/parport_gsc.c            | 3 +--

Acked-by:  Sudip Mukherjee <sudipm.mukherjee@gmail.com>


--=20
Regards
Sudip
