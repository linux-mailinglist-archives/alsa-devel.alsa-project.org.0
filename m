Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 421C0554F88
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:39:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5AC3205A;
	Wed, 22 Jun 2022 17:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5AC3205A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912376;
	bh=F/vMo4R/b96NxA1EnfF5s3+RU0Eh/4X4Nhs79FHFr9A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hdQptskesimPnzKIDrEEN+kCWt25IGL0GnuyBw5UhVk7A4DRKGdDpq4f0wu8iM5Qz
	 EX6A8h6x7tO/+B2+WW+Dzhx88q/duLpK9AyOK/in1uEc8Bt+ZQxY5QDL0J/fZECwHn
	 f2XpaqXnkRo8pJ/g8114noM2PCMMUcEOizMmy6LI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 497E4F8070D;
	Wed, 22 Jun 2022 17:24:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3854F800E3; Tue, 21 Jun 2022 11:32:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_135,PRX_BODY_30,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D6BAF800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 11:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D6BAF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="baOjPn3H"
Received: by mail-lf1-x136.google.com with SMTP id w20so21323066lfa.11
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KVxqgQkmpuz9sfivRrmvLlkvyXCsZ/UVRlJX8Kn06s0=;
 b=baOjPn3HMnQGhZj1nBS+hjUUnJUJ+Qaef24QVnmcEHRl7vEXdUjo5QRsBfEgNpCnf1
 Jm2mGhGNtiWo638Mh2HKumHhvcYmxsqdqaKFiIY93JNSLRKOtYQlJpKBnZGURLayjob+
 /MB/FkKHC8pVilIrHz6/2s03W4EKJQLZphbVT9pgnKGGgCYWlbAKxlSPmKCXeDMSOGEz
 k4bqKGBybgmOLqK4EsPHVpmL5fxyLVBFK/CNU2l5aGa83kOmEMKiC50ivmJ883ZTIT77
 lTZMo0A50VvPHdVjC+D1Xe9WkvlxRXsvrK+2mvS5A9BpF2X8NlUaokkHL1Dw0Q1ZNI3b
 GQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KVxqgQkmpuz9sfivRrmvLlkvyXCsZ/UVRlJX8Kn06s0=;
 b=741fJ/WDTnpwPG0R/5vtZNORQPTxZVXaX35fQ7kLw+dh2ENvIU5YOS/PpAiOPqIwmY
 ynsxZVkegxUvoK0I/yNzJalGpZpclqRkZ8UIMKqiQVG3ZTnrfUxJV0MBpAiL0vqOKh0m
 U5ogt44IGBdoeSvLbRXC7/TB8507wz60vqwdOSy6REaBkV5QgXjwHFnxIZbbO6nNeY2G
 AD93mcOBSXC9yE/9osfQU+l7A6EL+C0bFdIVaWlY0U20p+zbYRNWvjTivUCuMpeCE5Ci
 5HDEUSNF7nHH0S+ID3zTewoCh05EmZMjqQ5d+2+qvo2EMnfM4oUNMQbLwZmb9CZGRxW2
 AgRw==
X-Gm-Message-State: AJIora/GMORabPLdC8ciLJya5F3HIvkAfKdXHf3OjHDtqrr56kaYtKdL
 DJ+YZkrHuYnj/Mw+E5/ycb4=
X-Google-Smtp-Source: AGRyM1tUHbN/43UfLBdEExbn+1p4lZ6hBmumkDYlyBIRa9Zw3iDqI9SetAAfAkHiF5XrbJVvOtVraA==
X-Received: by 2002:a05:6512:2808:b0:47f:51c4:1dea with SMTP id
 cf8-20020a056512280800b0047f51c41deamr12102421lfb.390.1655803954972; 
 Tue, 21 Jun 2022 02:32:34 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a19ca55000000b00477a287438csm916926lfj.2.2022.06.21.02.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:32:34 -0700 (PDT)
Date: Tue, 21 Jun 2022 12:32:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Message-ID: <20220621093231.tytrh6fimzfxgzm2@mobilestation>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <CAMuHMdWDcnAxjxdwpnbfUiDUoo=RGvQm537-EboAmaQTmxpY-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWDcnAxjxdwpnbfUiDUoo=RGvQm537-EboAmaQTmxpY-g@mail.gmail.com>
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:18 +0200
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Mark Brown <broonie@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <mail@conchuod.ie>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi <linux-spi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Vetter <daniel@ffwll.ch>, dmaengine <dmaengine@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
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

Hi Geert

On Tue, Jun 21, 2022 at 09:03:25AM +0200, Geert Uytterhoeven wrote:
> Hi Serge,
> 
> On Mon, Jun 20, 2022 at 10:56 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >

[...]

> > > +
> > > +        spi-rx-bus-width:
> > > +          const: 1
> > > +
> > > +        spi-tx-bus-width:
> > > +          const: 1
> >
> > You can just use a more relaxed constraint "enum: [1 2 4 8]" here
> > irrespective from the compatible string. The modern DW APB SSI
> > controllers of v.4.* and newer also support the enhanced SPI Modes too
> > (Dual, Quad and Octal). Since the IP-core version is auto-detected at
> > run-time there is no way to create a DT-schema correctly constraining
> > the Rx/Tx SPI bus widths. So let's keep the
> > compatible-string-independent "patternProperties" here but just extend
> > the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
> > properties values.
> >

> > Note the DW APB SSI/AHB SSI driver currently doesn't support the
> > enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
> > bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
> > DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
> > activated by means of the corresponding CSR. So most likely the DW AHB
> > SSI controllers need some specific setups too.
> 
> That doesn't matter here, as DT describes hardware, not software
> limitations.

Can't argue with that.) My note regarding the current DW APB SSI
driver was mainly addressed for the Canaan K210 users, since
should the SoC-based board really have the Quad Tx/Rx SPI bus
most likely the interface won't work with the full bandwidth.
So it is a good reason to perform the platform research and if
possible alter the driver accordingly.

-Sergey

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
