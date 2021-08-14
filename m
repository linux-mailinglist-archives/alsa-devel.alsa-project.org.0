Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D8D3EC18B
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Aug 2021 11:13:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC198179B;
	Sat, 14 Aug 2021 11:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC198179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628932386;
	bh=siHcT+7aC7YWPuDXHag/aUpnEMGtgoxRTOAnlbWoF2M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U4FkGx/kfJkkLGx7r+zogS9TNfv6UiC2q1RpjMQuL1BeFg2qyi0VI/JSFOdRvEuL3
	 eqYT1DwaNdLp27cRlYn7euOMmo+83dYHl22sRHYXFSuqpjxlCwtU9qyUShhDAYG4f3
	 t24D5TJv7xzsgy7dx6WNY8oSBR1TtlkgHLj0dbYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2A24F80279;
	Sat, 14 Aug 2021 11:11:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B8BFF8025D; Sat, 14 Aug 2021 11:11:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A660F800BB
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 11:11:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A660F800BB
Received: by mail-ua1-f44.google.com with SMTP id m39so5414795uad.9
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 02:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nS2GBUaZJqdSBV6ll8beKF35e+BRExfjUT6JLRFqePs=;
 b=JFcmK/rf0zSfrW2L4Kjv2QTOIWoDJ9JzX77YoSeW3VcoG+THex+fwYBf647FKW3fnU
 lnzGHoGdfIeLyl7A6QDZkjHb4g1DPrtsDIyA9FNnsy7tZwtOhWff9qybc6SrSZw8mjGm
 p7r7iImiGHc9F7o6ev6fcELExdHyTgPxINc+hb+aOmx1wrfWFcfl+Z37vm5xXIkxuhbf
 fFXDEOv8cC/s9lSTUlOnrwGoUHaCGrOpCtU/lDA40d+L4ZZswsNO96YoGZKIpJsBboth
 hgPo5+1nsB6muwWlGpjmRoJLg/UDc9vsgxAEo9vazk1EDJBN+DcrvmyTx0v10Sbhd2Af
 3/9g==
X-Gm-Message-State: AOAM533Bs19GB6Bc+1/WewVUbAnkPrDyL86giq4ST78W3T5i3b1LHD3f
 h1YZ2cBwjsaKSi3hobikmSbj2JuGJA9pbZpmRcE=
X-Google-Smtp-Source: ABdhPJwDZ92lrh+CYuLTZSHlHS4ZHH7Rm08fcznOaAAqNrX88dRPlmVucjpDawgMaoLwq6WOgO2xuYqn0lpv41Vl01E=
X-Received: by 2002:ab0:6887:: with SMTP id t7mr4505712uar.114.1628932275340; 
 Sat, 14 Aug 2021 02:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210806102930.3024-1-biju.das.jz@bp.renesas.com>
 <20210806102930.3024-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVnU4HSXCr08WEiVmYCNoRBcdZGOfS7mwmS_euo2RZaEA@mail.gmail.com>
 <YRbSHw9X51Nif/Sd@robh.at.kernel.org>
In-Reply-To: <YRbSHw9X51Nif/Sd@robh.at.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 14 Aug 2021 11:11:03 +0200
Message-ID: <CAMuHMdXipSxTTEtiAYrZNXz6POzB9C_qaRUv+KXYtUS+DeGzug@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] ASoC: dt-bindings: sound: renesas,rz-ssi: Update
 slave dma channel configuration parameters
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Chris Brandt <chris.brandt@renesas.com>
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

Hi Rob,

On Fri, Aug 13, 2021 at 10:12 PM Rob Herring <robh@kernel.org> wrote:
> On Mon, Aug 09, 2021 at 02:57:33PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Aug 6, 2021 at 12:29 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > The DMAC driver on RZ/G2L expects the slave channel configuration
> > > to be passed in dmas property.
> > > This patch updates the example node to include the encoded slave
> > > channel configuration.
> > >
> > > Fixes: 5df6dfbb6de815ba3a("ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support")
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > > v3->v4:
> > >  * Updated bindings as the DMAC driver on RZ/G2L expects the
> > >    slave channel configuration to be passed in dmas property.
> >
> > Thanks for the update!
> >
> > > --- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> > > @@ -93,8 +93,8 @@ examples:
> > >              clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
> > >              power-domains = <&cpg>;
> > >              resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
> > > -            dmas = <&dmac 0x255>,
> > > -                   <&dmac 0x256>;
> > > +            dmas = <&dmac 0x2655>,
> > > +                   <&dmac 0x2656>;
> > >              dma-names = "tx", "rx";
> > >              #sound-dai-cells = <0>;
> > >      };
> >
> > I think it would be good to describe the expected format in the description
> > for the dmas property, so the DTS writer knows what the numerical
> > values in the example really mean.
>
> Yes, but that's a property of the DMA controller binding, not this one.
> It could vary from chip to chip.

Right, unlike the other Renesas SoCs, RZ/G2L uses the normal DMAC for
audio, not an audio-specific one.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
