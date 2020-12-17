Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3092F2DD02E
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 12:13:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A28571877;
	Thu, 17 Dec 2020 12:13:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A28571877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608203637;
	bh=CtGvSHS4WNBQELTxn57sa6pGXJ0TC6b5phmBfTCdtp4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cjXL83joak+StpjLLFinBml0aTXyFizEvUGchzncsEsHM+sz//qjlgEdE6iE2W6gy
	 YanWEmBISQ81nonP/czU0mXiaBwHyx/5pkd/vyEhu5XMq4N0ufQFHCHnL3b707EHDz
	 BS1BJyUHU2EXMIy5rcD8Kue+eJVya+PRSPaP6JFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1823BF80260;
	Thu, 17 Dec 2020 12:12:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A517F8027D; Thu, 17 Dec 2020 12:12:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33479F80260
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 12:12:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33479F80260
Received: by mail-oi1-f178.google.com with SMTP id x13so22731910oic.5
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 03:12:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dZwOGaLScpIa+oDTSTtBNc2tCns1gxIeazUncCzbwsM=;
 b=ZQhDZHs+5/9JhdQo9VLMHWF8uqQnBBSMocOL3tuMfERlH8BBOTaD1T+V0UcXEsW50G
 jxUG0awBJg07wQebbBlYnvZpiTocBJHhv10vu0jK42SWHoTfL31Pqs62EXR3flbldwhz
 IfOScWq3FUqXQYQW9oAf1QuPNgwLHnfh2PIjyBcfeTgcRbNTLiGGb+dWGvOD/cu3zd1J
 xNb5MM0yOtyYs4y+iTK/dleolVFLKtDfaOAS/DemNfMRrOpCd7fbjDhEOHs39gPQA8AZ
 gtLcUGonPnQoOLzl8IMKc0bWMWV8cUjUkjWDWeFTZzosNUn0sPqdKj26S8at4Y064nUR
 7VJA==
X-Gm-Message-State: AOAM532hHESQ7KiplLCH7z+oH4PivaDG2QfRuQzubxJpTYRqQttqxyiV
 RvRUdYdTU+0evD6ZOM/H08bAIo7xMPDyZJ41fkk=
X-Google-Smtp-Source: ABdhPJxfk5ceKnrD9w1jZShtgHYFhHcuDY8P/O/8WRdy5BqvXlQqYAxgRg3IU4KHs/mafiatAWuOar34FD81mi0HayU=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr4357125oih.153.1608203530592; 
 Thu, 17 Dec 2020 03:12:10 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com>
 <20201213183759.223246-7-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-7-aford173@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Dec 2020 12:11:59 +0100
Message-ID: <CAMuHMdU+d7SZc9gh_3WS+bqd4EhXYh=kv0XvYrgUUckdQ7o5jw@mail.gmail.com>
Subject: Re: [PATCH 06/18] arm64: dts: renesas: beacon: Configure Audio CODEC
 clocks
To: Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Magnus Damm <magnus.damm@gmail.com>, Adam Ford-BE <aford@beaconembedded.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
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

Hi Adam,

CC alsa-devel

On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> With the newly added configurable clock options, the audio CODEC can
> configure the mclk automatically.  Add the reference to the versaclock.
> Since the devices on I2C5 can communicate at 400KHz, let's also increase
> that too
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -424,13 +424,15 @@ &i2c0 {
>
>  &i2c5 {
>         status = "okay";
> -       clock-frequency = <100000>;
> +       clock-frequency = <400000>;
>         pinctrl-0 = <&i2c5_pins>;
>         pinctrl-names = "default";
>
>         codec: wm8962@1a {
>                 compatible = "wlf,wm8962";
>                 reg = <0x1a>;
> +               clocks = <&versaclock6_bb 3>;
> +               clock-names = "mclk";

While the driver does get the (nameless) clock, the DT bindings lack any
mention of a clocks property.  It would be good to update the bindings.

Note that arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi and
arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi (both by your
hand) use "xclk" instead of "mclk"?

>                 DCVDD-supply = <&reg_audio>;
>                 DBVDD-supply = <&reg_audio>;
>                 AVDD-supply = <&reg_audio>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
