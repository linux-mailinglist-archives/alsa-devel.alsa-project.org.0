Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8BD4947C5
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 08:05:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1E5B2F2D;
	Thu, 20 Jan 2022 08:04:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1E5B2F2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642662320;
	bh=gAYzLLu/RAOrw2Wad+OWsZpPyZTaoepY/G9ZAGASItk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VAZ6sxhIM0dQHzfjJu+IkFp8zIRH/9HDiEHzjv3mSbZKdJUNlrh9QCzQSJAt0NxSK
	 +GTKbpsNAB+TAZRUfwHq8snJ8Z6TA2p8nyrc1pjI1rkp10f+eTkW+dM0tyexqLPhQ2
	 r2JyCOuY8/oCiNp0Wk7bYoQzhkBJpf2labTthlFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AE98F80508;
	Thu, 20 Jan 2022 08:03:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86CF4F80425; Mon, 17 Jan 2022 09:42:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 588ABF8014B
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 09:41:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 588ABF8014B
Received: by mail-ua1-f53.google.com with SMTP id 2so4348259uax.10
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 00:41:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HSt6CNnm0GlM6Pd+PH2cbsXZ5sf+8uWh7XWO1e+2zQ0=;
 b=cGVo1dOzsiQKHNTzvu/BT68xvYios+gBL4NSxdrGtZeRxYRj2qqmzNxBVq/mujN6FF
 J/SjF/hnZy3mJPVlwb8sxXTcHmnPUTpxKb4sSYtNhJ0a9TgtPHI2voR8eOLSXxfaBA6g
 Anxsr3996UDDgsoa1/auSY1a+XqVRvYwiNs7QszcuBwCd2NFkW8mA79kRYS7wamrau6f
 McFZRJbZ5k4nrDIwcdn+vzYHF1rlR0jxGsVIyy7rkgB6GuQPUeycOOPKghQS0SkW9ejT
 K8NHw0eZj6opGu/94NdMDr80ywfFZoK+7PFgGsMfJPUSpJO4a+N2htq8nzlukIUpzYvw
 XJNQ==
X-Gm-Message-State: AOAM532sMV7qhTlEBdLE6zvhWxvHPGi+as+pCRxSnF5/TLR+YNrqT3Ux
 EQAY2ap8l3WBKDHgvyh8KbS9rQSbmpP6JzNK
X-Google-Smtp-Source: ABdhPJzejznp3+L4JIbdrjUxxVzWlEvdkN+RQpDn0/FYFz9qYQwuBlJz/JVD5Goi+9eeqUVLldf/0w==
X-Received: by 2002:ab0:3d84:: with SMTP id l4mr2146721uac.143.1642408916786; 
 Mon, 17 Jan 2022 00:41:56 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id e30sm3534171vsl.26.2022.01.17.00.41.54
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 00:41:54 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id m15so29060492uap.6
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 00:41:54 -0800 (PST)
X-Received: by 2002:ab0:4d42:: with SMTP id k2mr5629977uag.78.1642408914153;
 Mon, 17 Jan 2022 00:41:54 -0800 (PST)
MIME-Version: 1.0
References: <20220110201014.mtajyrfcfznfhyqm@pengutronix.de>
 <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
 <20220114092557.jrkfx7ihg26ekzci@pengutronix.de>
 <61b80939-357d-14f5-df99-b8d102a4e1a1@omp.ru>
 <20220114202226.ugzklxv4wzr6egwj@pengutronix.de>
 <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
In-Reply-To: <c9026f17-2b3f-ee94-0ea3-5630f981fbc1@omp.ru>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jan 2022 09:41:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
Message-ID: <CAMuHMdXVbRudGs69f9ZzaP1PXhteDNZiXA658eMFAwP4nr9r3w@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:03:34 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 netdev@vger.kernel.org, linux-spi <linux-spi@vger.kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 platform-driver-x86@vger.kernel.org,
 Linux PWM List <linux-pwm@vger.kernel.org>, Robert Richter <rric@kernel.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Corey Minyard <minyard@acm.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, John Garry <john.garry@huawei.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 openipmi-developer@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Richard Weinberger <richard@nod.at>,
 Mun Yew Tham <mun.yew.tham@intel.com>, Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, Linux MMC List <linux-mmc@vger.kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>, Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
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

On Sat, Jan 15, 2022 at 9:22 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
> On 1/14/22 11:22 PM, Uwe Kleine-K=C3=B6nig wrote:
> > You have to understand that for clk (and regulator and gpiod) NULL is a
> > valid descriptor that can actually be used, it just has no effect. So
> > this is a convenience value for the case "If the clk/regulator/gpiod in
> > question isn't available, there is nothing to do". This is what makes
> > clk_get_optional() and the others really useful and justifies their
> > existence. This doesn't apply to platform_get_irq_optional().
>
>    I do understand that. However, IRQs are a different beast with their
> own justifications...

> > clk_get_optional() is sane and sensible for cases where the clk might b=
e
> > absent and it helps you because you don't have to differentiate between
> > "not found" and "there is an actual resource".
> >
> > The reason for platform_get_irq_optional()'s existence is just that
> > platform_get_irq() emits an error message which is wrong or suboptimal
>
>    I think you are very wrong here. The real reason is to simplify the
> callers.

Indeed.

Even for clocks, you cannot assume that you can always blindly use
the returned dummy (actually a NULL pointer) to call into the clk
API.  While this works fine for simple use cases, where you just
want to enable/disable an optional clock (clk_prepare_enable() and
clk_disable_unprepare()), it does not work for more complex use cases.

Consider a device with multiple clock inputs, some of them optional,
where the device driver has to find, select and configure a suitable
clock to operate at a certain clock frequency. The driver can call
clk_get_rate(NULL) fine, but will always receive a zero rate, so it
has to check for this (regardless of this being a dummy clock or not,
because this could be an unpopulated clock crystal, which would be
described in DT as a (present) fixed-rate clock with clock-frequency
=3D <0>).
For configuring the clock rate, the driver does need to check
explicitly for the presence of a dummy clock, as clk_set_rate(NULL,
rate) returns 0 ("success"), while obviously it didn't do anything,
and thus configuring the device to use that clock would cause breakage.

You can check if the clock is a real clock or a dummy using
"if (clk) ...".
And you'd use the same pattern with platform_irq_get_optional() if it
would return 0 if the IRQ was not found: "if (irq) ...".

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
