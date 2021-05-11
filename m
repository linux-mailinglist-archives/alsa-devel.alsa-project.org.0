Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE2437C092
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 16:46:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 995DE18B4;
	Wed, 12 May 2021 16:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 995DE18B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620830771;
	bh=K5dIHfa4f6iByDzBZIlrjQRjF6/bEjxWK1nUAqzRpew=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qt0aXfAVyueDxNZHqbx4CsR5CpKBkuiwcuZ/Ce8gUtRqZ9lubKFwbq9AzG9s0ksbo
	 adpJ0Ab+2Tepybwqod6dtdHrepzevmQJY68L/xPUCNhEzSobeQk92mAlpB1UxIXxJ3
	 nAPTmwBP1NvdprT2y+ulBdFytYWH7tALJxgTAmUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52690F80482;
	Wed, 12 May 2021 16:43:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 327BCF801D5; Tue, 11 May 2021 16:24:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8478DF80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8478DF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JwaonazL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C246561928
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620743040;
 bh=K5dIHfa4f6iByDzBZIlrjQRjF6/bEjxWK1nUAqzRpew=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JwaonazL7mHtxi37clzYyAaTtim9WYGe0jNdHlIfH66KDgGwD7QSLjEbrzvQMGgxj
 cDxVGdxsCSttt8JIk8CkX28GzepNyrYgvBI1JuvlFOJaMgtQqfDezEAUokTzNj9Di/
 AXk99SIB1YVQuMhT8u6c+PflBGCBBVOhpYgwe9cQWyML9PY1iJv974grpxFQf2Zlfk
 aUGvNVSxIAiuPtI40JwsNp54vhkyiWFA7kZoGWTVhKJA8n9Wz1XL4k007CFv87+k2k
 ie6Ts3jvb6fuJ96vpOt+4eetlT3LXFNfFHwPDzEMeFWHkETQEygR474DDgvL+Oc1l/
 9cZVdIGiRgynA==
Received: by mail-ed1-f51.google.com with SMTP id g14so23123814edy.6
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 07:24:00 -0700 (PDT)
X-Gm-Message-State: AOAM5303ZJYX63DJgbXY1rTYFxvXPrvmHv2H8E868el2m2nTL0xNWXVm
 LhuqaJCb/fFgtJWvk0+0j/FmMIMfvyCBLwnrZg==
X-Google-Smtp-Source: ABdhPJxvejkoMRuepYDfIZklCbkFbvR1TbNfZ2DNIhf0/HxlULmwCrdyYucaU8vfjuT695OoYvWsI5knsrz4cgRv3yU=
X-Received: by 2002:a50:c446:: with SMTP id w6mr33152086edf.62.1620743038881; 
 Tue, 11 May 2021 07:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210510204524.617390-1-robh@kernel.org>
 <d3aae746-284b-b0bc-0d52-a76c361d3592@lucaceresoli.net>
 <CAL_JsqLhwifngoNK0ciO=yuVqpEbMGOSWMHyT=5DcYcO9jcuCw@mail.gmail.com>
 <2b09c4ed-758d-6eed-8fc1-39653d10e844@lucaceresoli.net>
In-Reply-To: <2b09c4ed-758d-6eed-8fc1-39653d10e844@lucaceresoli.net>
From: Rob Herring <robh@kernel.org>
Date: Tue, 11 May 2021 09:23:44 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKEdtJ=NndWAR4j1WEBnzML_UkGFzKd6fkKOiV1SLFczg@mail.gmail.com>
Message-ID: <CAL_JsqKEdtJ=NndWAR4j1WEBnzML_UkGFzKd6fkKOiV1SLFczg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: More removals of type references on common
 properties
To: Luca Ceresoli <luca@lucaceresoli.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 12 May 2021 16:43:38 +0200
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Linux Input <linux-input@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, devicetree@vger.kernel.org,
 Odelu Kukatla <okukatla@codeaurora.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Alex Elder <elder@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev <netdev@vger.kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
 Georgi Djakov <djakov@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
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

On Tue, May 11, 2021 at 9:09 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>
> Hi Rob,
>
> On 11/05/21 15:44, Rob Herring wrote:
> > On Tue, May 11, 2021 at 2:20 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:
> >>
> >> Hi,
> >>
> >> On 10/05/21 22:45, Rob Herring wrote:
> >>> Users of common properties shouldn't have a type definition as the
> >>> common schemas already have one. A few new ones slipped in and
> >>> *-names was missed in the last clean-up pass. Drop all the unnecessary
> >>> type references in the tree.
> >>>
> >>> A meta-schema update to catch these is pending.
> >>>
> >>> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> >>> Cc: Stephen Boyd <sboyd@kernel.org>
> >>> Cc: Olivier Moysan <olivier.moysan@foss.st.com>
> >>> Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >>> Cc: Jonathan Cameron <jic23@kernel.org>
> >>> Cc: Lars-Peter Clausen <lars@metafoo.de>
> >>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >>> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> >>> Cc: Georgi Djakov <djakov@kernel.org>
> >>> Cc: "David S. Miller" <davem@davemloft.net>
> >>> Cc: Jakub Kicinski <kuba@kernel.org>
> >>> Cc: Sebastian Reichel <sre@kernel.org>
> >>> Cc: Orson Zhai <orsonzhai@gmail.com>
> >>> Cc: Baolin Wang <baolin.wang7@gmail.com>
> >>> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> >>> Cc: Liam Girdwood <lgirdwood@gmail.com>
> >>> Cc: Mark Brown <broonie@kernel.org>
> >>> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> >>> Cc: Odelu Kukatla <okukatla@codeaurora.org>
> >>> Cc: Alex Elder <elder@kernel.org>
> >>> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>> Cc: linux-clk@vger.kernel.org
> >>> Cc: alsa-devel@alsa-project.org
> >>> Cc: linux-iio@vger.kernel.org
> >>> Cc: linux-arm-kernel@lists.infradead.org
> >>> Cc: linux-input@vger.kernel.org
> >>> Cc: linux-pm@vger.kernel.org
> >>> Cc: netdev@vger.kernel.org
> >>> Signed-off-by: Rob Herring <robh@kernel.org>
> >>> ---
> >>>  Documentation/devicetree/bindings/clock/idt,versaclock5.yaml    | 2 --
> >>>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml         | 1 -
> >>>  Documentation/devicetree/bindings/input/input.yaml              | 1 -
> >>>  Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml   | 1 -
> >>>  Documentation/devicetree/bindings/net/qcom,ipa.yaml             | 1 -
> >>>  .../devicetree/bindings/power/supply/sc2731-charger.yaml        | 2 +-
> >>>  Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml          | 2 +-
> >>>  7 files changed, 2 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> >>> index c268debe5b8d..28675b0b80f1 100644
> >>> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> >>> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> >>> @@ -60,7 +60,6 @@ properties:
> >>>      maxItems: 2
> >>>
> >>>    idt,xtal-load-femtofarads:
> >>> -    $ref: /schemas/types.yaml#/definitions/uint32
> >>>      minimum: 9000
> >>>      maximum: 22760
> >>>      description: Optional load capacitor for XTAL1 and XTAL2
> >>> @@ -84,7 +83,6 @@ patternProperties:
> >>>          enum: [ 1800000, 2500000, 3300000 ]
> >>>        idt,slew-percent:
> >>>          description: The Slew rate control for CMOS single-ended.
> >>> -        $ref: /schemas/types.yaml#/definitions/uint32
> >>>          enum: [ 80, 85, 90, 100 ]
> >>
> >> Ok, but shouldn't "percent" be listed in
> >> Documentation/devicetree/bindings/property-units.txt?
> >
> > It is in the schema already[1].
>
> Sure, but having an incomplete file in the kernel is poorly useful, if
> not misleading. What about any of these options:
>
> - add to property-units.txt the missing units
> - delete property-units.txt from the kernel sources
> - replace the entire content of property-units.txt with a link to the
>   schema file, stating it is the authoritative and complete source
>
> I would feel a lot better with any of these. I can prepare the patch too.

Yes, we should remove it. I just hadn't gotten around to it. Note
there is one reference to it in writing-bindings.rst.

Rob
