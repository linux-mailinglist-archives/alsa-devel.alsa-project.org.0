Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A0F3EBD26
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 22:13:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0280181A;
	Fri, 13 Aug 2021 22:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0280181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628885637;
	bh=MYUzrejtEl7l9RwDqY0F5OpLgetekGe13y2OLZd+CNM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HApdUhilrnvVdnQ28y4bIJxLFl5/5BWawfm7H9bV6GBQdBwIYYKwKYII1tZgVBPOI
	 h4/0n3bevGXyJKHFGUW/jFHugPjn+i540TBH6koANjcXAyJukvuQRnhYFkewJ6rERx
	 DBtEniY8+9Wf+Yin8LxcK2o8KoEmecCfNlN0azOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11CBFF8032D;
	Fri, 13 Aug 2021 22:12:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 274A3F802D2; Fri, 13 Aug 2021 22:12:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D145F80129
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 22:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D145F80129
Received: by mail-oi1-f176.google.com with SMTP id t128so17622708oig.1
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 13:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=brjSAKvcG3w//6u1qpeaPj8Sen2eVcNEcaY+HnZUn+Q=;
 b=gIbb/ajbab2AoZN73QnpBsMUPsbpt4Jg1Vg9hu52keFU/I8lONa6zimn0bGWZB0kq0
 omJZMdKsuISlJRKI/Pc0c+P9HsykM2D0bNWURTkqQUxc0leB2wWPOI1J0cMUJzkcaFYn
 WyeIbIFKnhM6WRH/GhWF1Nu+iVPzvW+fBcm8eCds5D2Fp0Rgpeqfdxavm5M0KR/ueVSW
 EQflMDQRzdY9BeAb95MOfd3DHQhYPYxKyok16eStL34rY/ozDkVwMV1rY1KVQXynubbO
 5jHL2TSyMCloztVv3ZeXQMa4eK/hpKhkgpJOLQgSqPFBZpXRv7rsAr6gNOJYmA0yQgnH
 V01A==
X-Gm-Message-State: AOAM532o4Qe1fMx7ma2ykALddkUfKrdii8L5yCan5TmT18TyjKOvNuTo
 d+25ME98zr44LPdb/2ycjg==
X-Google-Smtp-Source: ABdhPJwGTSMtK+9NYP9pDRzcZrjvm0ClM2a1UqumCqT/+n4os3icmryyREvNZp/z5ivhq9qWazn64A==
X-Received: by 2002:a05:6808:1906:: with SMTP id
 bf6mr3371811oib.52.1628885537689; 
 Fri, 13 Aug 2021 13:12:17 -0700 (PDT)
Received: from robh.at.kernel.org
 (2603-8080-2a06-ed00-7254-0b80-dd3c-00c6.res6.spectrum.com.
 [2603:8080:2a06:ed00:7254:b80:dd3c:c6])
 by smtp.gmail.com with ESMTPSA id t13sm453083oor.37.2021.08.13.13.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 13:12:17 -0700 (PDT)
Received: (nullmailer pid 3944256 invoked by uid 1000);
 Fri, 13 Aug 2021 20:12:15 -0000
Date: Fri, 13 Aug 2021 15:12:15 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 2/3] ASoC: dt-bindings: sound: renesas,rz-ssi: Update
 slave dma channel configuration parameters
Message-ID: <YRbSHw9X51Nif/Sd@robh.at.kernel.org>
References: <20210806102930.3024-1-biju.das.jz@bp.renesas.com>
 <20210806102930.3024-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVnU4HSXCr08WEiVmYCNoRBcdZGOfS7mwmS_euo2RZaEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVnU4HSXCr08WEiVmYCNoRBcdZGOfS7mwmS_euo2RZaEA@mail.gmail.com>
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

On Mon, Aug 09, 2021 at 02:57:33PM +0200, Geert Uytterhoeven wrote:
> Hi Biju,
> 
> On Fri, Aug 6, 2021 at 12:29 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > The DMAC driver on RZ/G2L expects the slave channel configuration
> > to be passed in dmas property.
> > This patch updates the example node to include the encoded slave
> > channel configuration.
> >
> > Fixes: 5df6dfbb6de815ba3a("ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support")
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> > v3->v4:
> >  * Updated bindings as the DMAC driver on RZ/G2L expects the
> >    slave channel configuration to be passed in dmas property.
> 
> Thanks for the update!
> 
> > --- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> > +++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> > @@ -93,8 +93,8 @@ examples:
> >              clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
> >              power-domains = <&cpg>;
> >              resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
> > -            dmas = <&dmac 0x255>,
> > -                   <&dmac 0x256>;
> > +            dmas = <&dmac 0x2655>,
> > +                   <&dmac 0x2656>;
> >              dma-names = "tx", "rx";
> >              #sound-dai-cells = <0>;
> >      };
> 
> I think it would be good to describe the expected format in the description
> for the dmas property, so the DTS writer knows what the numerical
> values in the example really mean.

Yes, but that's a property of the DMA controller binding, not this one. 
It could vary from chip to chip.

Rob
