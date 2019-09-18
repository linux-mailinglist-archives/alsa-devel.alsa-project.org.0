Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C49B6515
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 15:52:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CD361679;
	Wed, 18 Sep 2019 15:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CD361679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568814719;
	bh=HGQAFi9t36yo5LRdrLX/r04hfm9/MXDrUZRnQa/NCE4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gUxhzGmXsAEtLYTutsSAuCPW1mhaENsIpXX/TlfEMt5cF76dxR0ec1pPVAbKsUtMd
	 V1xZ8nNsEmO7yuCMJ6W8rwk+izf2iGPcZexx+VIdGaqnTAh6JXKs2+hci8MUhvac5/
	 5zXiEYgpbC2iOKNJqUhOzphka9/fV5RbN1tOKdi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 482EAF80535;
	Wed, 18 Sep 2019 15:49:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 717F6F8053A; Wed, 18 Sep 2019 15:49:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5824FF80534
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 15:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5824FF80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MN6zvA84"
Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BAB5821928
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568814585;
 bh=Vsir7F3Rw0yN2oG3BxCXE+fvnqJZovYT8xzQgG4Purk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MN6zvA84e1GAQzDF8Oc7KorTjwkfX8QhfTlV/yE89YGnvwWTCGc+sZiyx/Cd1wOXW
 88i5Lif6ocTrKz0x4e/qziBndrZ8KfvrmDcYiFeunXLidgzYYY9Y4XgAJgMbrfpLnd
 RywIv4FoZQGnLOZZNn62evPeLTXYCZsAF/6EsZP8=
Received: by mail-yw1-f50.google.com with SMTP id q7so2474666ywe.10
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 06:49:45 -0700 (PDT)
X-Gm-Message-State: APjAAAUF49lbSFS9lnNzRB8ixi1N2I+cvTAhdhSVqr0Hf7AvSBH2I3Vf
 fLRJQC0jM3X7FE+a8CxPs2qilJcv7JZ8pEHMAw==
X-Google-Smtp-Source: APXvYqyX5J7M/JnrOKuHqti9BK5SCSbzkKBYf8CDlkD0T4RESNs7Vm4Lj+l5V24NuFFkS5g5wceeMPsbDURipVXo9vI=
X-Received: by 2002:a0d:ddc9:: with SMTP id g192mr3041978ywe.281.1568814584947; 
 Wed, 18 Sep 2019 06:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d@eucas1p1.samsung.com>
 <20190917111413.22711-1-m.falkowski@samsung.com>
 <20190917120452.28135-1-m.falkowski@samsung.com>
 <CAL_JsqJmjUR63i_hKUuZwDu42rebwABHu62bQoxTRRJu5yObEA@mail.gmail.com>
 <40f56f61-a1db-a1a2-262e-1f4c771481e1@samsung.com>
In-Reply-To: <40f56f61-a1db-a1a2-262e-1f4c771481e1@samsung.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 18 Sep 2019 08:49:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
Message-ID: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
To: Maciej Falkowski <m.falkowski@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Sangbeom Kim <sbkim73@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] dt-bindings: sound: Convert Samsung
 I2S controller to dt-schema
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Sep 18, 2019 at 5:08 AM Maciej Falkowski
<m.falkowski@samsung.com> wrote:
>
>
> On 9/17/19 3:05 PM, Rob Herring wrote:
>
> > On Tue, Sep 17, 2019 at 7:05 AM Maciej Falkowski
> > <m.falkowski@samsung.com> wrote:
> >> Convert Samsung I2S controller to newer dt-schema format.
> >>
> >> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> ---
> >> v2:
> >> - Added missing Signed-off-by certificate
> >> ---
> >>   .../devicetree/bindings/sound/samsung-i2s.txt |  84 -------------
> >>   .../bindings/sound/samsung-i2s.yaml           | 119 ++++++++++++++++++
> >>   2 files changed, 119 insertions(+), 84 deletions(-)
> >>   delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
> >>   create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> >> diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> >> new file mode 100644
> >> index 000000000000..59dc76035cb4
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> >> @@ -0,0 +1,119 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/sound/samsung-i2s.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Samsung SoC I2S controller
> >> +
> >> +maintainers:
> >> +  - Krzysztof Kozlowski <krzk@kernel.org>
> >> +  - Sangbeom Kim <sbkim73@samsung.com>
> >> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    description: |
> >> +      samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
> >> +
> >> +      samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
> >> +      secondary fifo, s/w reset control and internal mux for root clk src.
> >> +
> >> +      samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for
> >> +      playback, stereo channel capture, secondary fifo using internal
> >> +      or external dma, s/w reset control, internal mux for root clk src
> >> +      and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
> >> +      is to allow transfer of multiple channel audio data on single data line.
> >> +
> >> +      samsung,exynos7-i2s: with all the available features of exynos5 i2s.
> >> +
> >> +      exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
> >> +      with only external dma and more no.of root clk sampling frequencies.
> >> +
> >> +      samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
> >> +      stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
> >> +      slightly modified bit offsets.
> >> +    enum:
> >> +      - "samsung,s3c6410-i2s"
> >> +      - "samsung,s5pv210-i2s"
> >> +      - "samsung,exynos5420-i2s"
> >> +      - "samsung,exynos7-i2s"
> >> +      - "samsung,exynos7-i2s1"
> > No need for quotes here.
> >
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  dmas:
> >> +    description: list of DMA controller phandle and DMA request line ordered pairs.
> > How many?
>
> Hi Rob,
>
> I have one problem with determining size of dmas.
>
> It seems that there are only two options for dmas: tx, rx or tx, rx, tx-sec.
>
> It looks like minItems should be two and maxItems should be three.
>
> However, some of bindings have different definition of dmas.
>
> When there is:
>
>          dmas = <&pdma0 10
>                  &pdma0 9
>                  &pdma0 8>;
>
> the number of Items for dmas is one,
>
> when there is:
>
>          dmas = <&pdma0 10>,
>                       <&pdma0 9>,
>                       <&pdma0 8>;
>
> the number of Items is three.
>
> Both of these are equal from perspective of dtc,
>
> however from schema point of view, they have different size.
>
>
> What is a proper solution to this kind of problem?

The solution is writing things in the latter form. I have a script to
convert a bunch of these. I need to coordinate doing that at the end
of a merge window.

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
