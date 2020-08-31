Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9482257ADC
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 15:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4940717CC;
	Mon, 31 Aug 2020 15:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4940717CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598881919;
	bh=ztLmZ+941EYqr7AcuVlAnDkvVWFOEg0Wm9jORnDkfUk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JHMHLsj/++J+bnomq9nh960kMdMJDjU3vHaXFUf2tZE58vEgr80lzJUCWTra+Tvmn
	 2ns78WNfZ1JRxTkWqEPxh9LW4eEnGynVJeApzcEwT2iZ5sYs3VubA47OMwmQui5Uk4
	 nPSB09Cn6KOBlzF4i/SUlTte1k3QhTVx3UTR2bE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B435F801DA;
	Mon, 31 Aug 2020 15:50:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C8C0F80212; Mon, 31 Aug 2020 15:50:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10F51F80096
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 15:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10F51F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vYV/FGnl"
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B461320719
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 13:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598881807;
 bh=ztLmZ+941EYqr7AcuVlAnDkvVWFOEg0Wm9jORnDkfUk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vYV/FGnlQ06Mj/nnQX76wRgv2qFhTHS7eVvVPBLvjpO93baFcabyDVe+wYQC1Lh/9
 /QyPf451GSDyQH6zTMXYOggTlJyPDU0J/9TRQJa1M3PVfN8lyPGbPgU2+hcUYgPH/W
 y7q1CTt1RI1xlnnrSJpNG2oXDCfTI9ekdZZNsZj0=
Received: by mail-ej1-f43.google.com with SMTP id e23so3106189eja.3
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 06:50:06 -0700 (PDT)
X-Gm-Message-State: AOAM533zAeqqOCAE/6oTre4nUXYI0jjXCHLCzi2K7R9awoAZfewV6VoA
 dmpaFFkm/3/vrrUumaJYpLngGFOUJf25FeKAPmI=
X-Google-Smtp-Source: ABdhPJzSNDPf0SiyxO/14ODP0ki5tEh8fCdOy7QMsQkV/SOOG8rXrfpgfQiPmDMwBNPvJpjGjdhWCIJ1LfOLyjDXiZU=
X-Received: by 2002:a17:906:8401:: with SMTP id
 n1mr1217460ejx.215.1598881805398; 
 Mon, 31 Aug 2020 06:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142607eucas1p137f06c4bac607652e972f4c49d1a9982@eucas1p1.samsung.com>
 <20200829142501.31478-10-krzk@kernel.org>
 <84ec0795-2b7f-adde-4277-2238cede8c24@samsung.com>
In-Reply-To: <84ec0795-2b7f-adde-4277-2238cede8c24@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 31 Aug 2020 15:49:54 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdTz0LScEFMzJtUytHo3zHwGd=w=EOpqOc04wvoLEhchQ@mail.gmail.com>
Message-ID: <CAJKOXPdTz0LScEFMzJtUytHo3zHwGd=w=EOpqOc04wvoLEhchQ@mail.gmail.com>
Subject: Re: [RFT 10/10] arm64: dts: exynos: Enable Arizona interrupt
 controller in Exynos5433 TM2
To: Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Inki Dae <inki.dae@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
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

On Mon, 31 Aug 2020 at 15:12, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
>
> On 29.08.2020 16:25, Krzysztof Kozlowski wrote:
> > The Wolfson Arizona codec is interrupt controller which is required by
> > bindings.  This fixes dtbs_check warnings like:
> >
> >    arch/arm64/boot/dts/exynos/exynos5433-tm2e.dt.yaml: wm5110-codec@0: 'interrupt-controller' is a required property
> >    arch/arm64/boot/dts/exynos/exynos5433-tm2e.dt.yaml: wm5110-codec@0: '#interrupt-cells' is a required property
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> However I really wonder if it makes sense to expose this to DTS. Indeed,
> the main MFD device of the WM5110 chip is interrupt controller, but its
> interrupts are requested internally by the respective drivers.

In such case maybe the schema should be updated? Feel free to send a
follow up or a replacement patch for this one.

Best regards,
Krzysztof
