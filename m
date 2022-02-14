Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C12C74B8439
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 10:28:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58EBB822;
	Wed, 16 Feb 2022 10:27:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58EBB822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645003696;
	bh=QRj4vkBWgyXx6ewekqW9hJ0FbQoQ8DvTt6uGMLsmpoc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dCPYq/UMVojdfkBsijCJ4Zsxiqt5pRgNMkh4HI0qryTyWtrQZzx18pH3T8y9VK0Nx
	 oEZfjJYGiZXYLhElJYJgNBDJANCn3/FkuPmCxGHqpb8aAZBg8iZegFUK3iPOGB2GYZ
	 hSzjqK4831KZJFmAv8pj8mEhvkGFgrCEr5e5riwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A3BAF80527;
	Wed, 16 Feb 2022 10:25:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95855F80310; Mon, 14 Feb 2022 10:01:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F278F800D8
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 10:01:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F278F800D8
Received: by mail-vk1-f171.google.com with SMTP id o129so7818175vko.7
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 01:01:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3zUaM8opKL0LG20PPLjLO0sGhx6OMEFs8RjHjfjsiY4=;
 b=WqyDltrbFGZS6iRf6hQtEr9EUpceAikiogSmrpSUQ/1m+Gjjm2Ywe+c8dluxFc5nwT
 zQswXYyyK2HYWwwpI9MjTjEfGGqe6qXV2bHRiidHDHlJhBHixYv2LfY96J10t8UFcGYy
 y5/x+A8wR4b6lg8i+di8Ez2iJb7sK8L2LPlpMZmH/XKsHjJ52gNYtZ7G4zH1cvMVdtoc
 1e0+T2BE+ErI5ddFrExppPj1C5392194A7YoNSmE27EhAu7tsJc0IwkMu8teIyBrIYmE
 Jnzwy6t92wjUm8nUlYKJtMGWQR2TvMSP/+s+k96r5NBju1+ferZQpGKDiD/F46Ri6Vpi
 XGsQ==
X-Gm-Message-State: AOAM530ya2aliSQV6ORuf1T6UeHfi+YtHAb8WYDn7tKBK9GZdSKR6VXP
 rR4SXRATzlSkA7oU/zEMtcrNq/o8hkxlKFq0
X-Google-Smtp-Source: ABdhPJw2bpKfmbnYmHro8gKeSsw0oVeKsr8izZh1hWPhauI7MPwW0YaOu9xzMUiC9eQAta0PJLVuYQ==
X-Received: by 2002:a05:6122:926:: with SMTP id
 j38mr3666269vka.33.1644829288432; 
 Mon, 14 Feb 2022 01:01:28 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com.
 [209.85.221.171])
 by smtp.gmail.com with ESMTPSA id f3sm704713vsl.1.2022.02.14.01.01.27
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 01:01:27 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id j201so1335595vke.11
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 01:01:27 -0800 (PST)
X-Received: by 2002:a1f:7307:: with SMTP id o7mr818150vkc.0.1644829286141;
 Mon, 14 Feb 2022 01:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20220212201631.12648-1-s.shtylyov@omp.ru>
 <20220212201631.12648-2-s.shtylyov@omp.ru>
 <20220214071351.pcvstrzkwqyrg536@pengutronix.de>
In-Reply-To: <20220214071351.pcvstrzkwqyrg536@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Feb 2022 10:01:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWi8gno_FBbc=AwsdRtDJik8_bANjQrrRtUOOBRjFN=KA@mail.gmail.com>
Message-ID: <CAMuHMdWi8gno_FBbc=AwsdRtDJik8_bANjQrrRtUOOBRjFN=KA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform: make platform_get_irq_optional() optional
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 16 Feb 2022 10:25:43 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, kvm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-phy@lists.infradead.org, Oleksij Rempel <linux@rempel-privat.de>,
 Lee Jones <lee.jones@linaro.org>, "David S. Miller" <davem@davemloft.net>,
 Peter Korsgaard <peter@korsgaard.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, platform-driver-x86@vger.kernel.org,
 linux-pwm@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Corey Minyard <minyard@acm.org>, linux-pm@vger.kernel.org,
 John Garry <john.garry@huawei.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Eric Auger <eric.auger@redhat.com>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 openipmi-developer@lists.sourceforge.net, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Mun Yew Tham <mun.yew.tham@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Zha Qipeng <qipeng.zha@intel.com>, Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Brian Norris <computersforpeace@gmail.com>, netdev@vger.kernel.org
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

On Mon, Feb 14, 2022 at 8:29 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Sat, Feb 12, 2022 at 11:16:30PM +0300, Sergey Shtylyov wrote:
> > This patch is based on the former Andy Shevchenko's patch:
> >
> > https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko@l=
inux.intel.com/
> >
> > Currently platform_get_irq_optional() returns an error code even if IRQ
> > resource simply has not been found.  It prevents the callers from being
> > error code agnostic in their error handling:
> >
> >       ret =3D platform_get_irq_optional(...);
> >       if (ret < 0 && ret !=3D -ENXIO)
> >               return ret; // respect deferred probe
> >       if (ret > 0)
> >               ...we get an IRQ...
> >
> > All other *_optional() APIs seem to return 0 or NULL in case an optiona=
l
> > resource is not available.  Let's follow this good example, so that the
> > callers would look like:
> >
> >       ret =3D platform_get_irq_optional(...);
> >       if (ret < 0)
> >               return ret;
> >       if (ret > 0)
> >               ...we get an IRQ...
> >
> > Reported-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>
> While this patch is better than v1, I still don't like it for the
> reasons discussed for v1. (i.e. 0 isn't usable as a dummy value which I
> consider the real advantage for the other _get_optional() functions.)

IMHO the real advantage is the simplified error handling, which is the
area where most of the current bugs are. So I applaud the core change.

Also IMHO, the dummy value handling is a red herring.  Contrary to
optional clocks and resets, a missing optional interrupt does not
always mean there is nothing to do: in case of polling, something
else must definitely be done.  So even if request_irq() would accept
a dummy interrupt zero and just do nothing, it would give the false
impression that that is all there is to do, while an actual check
for zero with polling code handling may still need to be present,
thus leading to more not less bugs.

> Apart from that, I think the subject is badly chosen. With "Make
> somefunc() optional" I would expect that you introduce a Kconfig symbol
> that results in the function not being available when disabled.

Agreed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
