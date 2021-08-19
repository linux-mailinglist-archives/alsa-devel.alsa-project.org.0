Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6553F2749
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Aug 2021 09:06:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CA45167C;
	Fri, 20 Aug 2021 09:05:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CA45167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629443171;
	bh=oRgVkx+6GMWt5n5ZIY2zFuPqLFtK9CK5Zy8qCUC2+r8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WUdzacjH0qdlR3UgqzwR1c7oWwqMD5Pd2NWUjiSSQNt03PV4VTLm2rD6HkwJUH2fc
	 FXd6VFaSt3zLXIOEYty6XYJU9SRCc+gDd6vIVqcSiVaN9mj05AIsBf6Kby4B0lzf6H
	 97ETqZOB//cErB78x7S6Lr4z4kKfxrhZzrbHbzFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B387CF80511;
	Fri, 20 Aug 2021 09:02:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0C12F8026D; Thu, 19 Aug 2021 15:53:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E200F800F8
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 15:52:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E200F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BVG+5HrA"
Received: by mail-ej1-x62b.google.com with SMTP id d11so13072217eja.8
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/HYaakT71hwEdcXvkxwyQsillUjSwTO59JhdjV9n6y4=;
 b=BVG+5HrApNRX9+03fK0jt38W6Ps+UyhCQADZcdZe1QVPyVsrWh+RlxWohzju5i7IfV
 IGO9cvRFPjCMp+i8l1kXqOyMt3QsOoyEyu6f7xLSY7Vs2LzpmsgFEuz3zLkK/6CTLrdj
 F7nnKRo3DDRugBTcoyY2Rss9o2yUYfy9fQZb1Ep0lkSXVE8XYZuQuYlYw0PKM9C5vj1A
 w2VGwE8UO4owDU0hs4h1DKqlg8np9j+vKv5jrARah7QGVhcuNxgx2j2bpqUMvH8vp+eV
 vRUi7Sq+lk179LXgirigXKAzF0UqCguYyHo0hgqud7AZMK6uB2DFeBV2HxFX1QzBgUO8
 +utQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/HYaakT71hwEdcXvkxwyQsillUjSwTO59JhdjV9n6y4=;
 b=Anx3JKbPM5f4XnnLPlRM/QCM0xarJYev/4q1oAMxdRwwU3H+N2JXU/kqnKY6wtFeFG
 uCuE06xBib3ahqBSftzSG1DlOTw8M7DZvqKLLlpTvV0B4goEfrtd3bGbCcPxH/4FVBgH
 ht/T43JfJ8SUlR6Z8wFIEObSQiirKMwcePYMSiriQ8zMfQ2qduh9IF/7hMlJQXehQWOq
 fVjzciiiOlZmCFDSqWxUwS/cbFIYwaxF2A0fc+VNN+KPQwTumuBhYLaIkFu9S7ntyrgX
 KWcz1XlX2JQ0m+CrM3VhFDW9vyXQRyBjGBvbcpITHBtfJ+Ghhx7rF3Xlvyap5fyD/MF4
 uiIQ==
X-Gm-Message-State: AOAM531hjIMpmEHRRJ4FUutLRNMH1cYGtcnLjAS6pY9fEDFAED2jaNfd
 UghJ0NmGeeAmcr009kGrI5g=
X-Google-Smtp-Source: ABdhPJxf6vkzIJ5gvRxJJnkoE76NF/NsXfuA1qI+2XbKik7L6dd//lHk57lp40vP12GLenGbbQ1fCQ==
X-Received: by 2002:a17:906:1dd6:: with SMTP id
 v22mr9418467ejh.226.1629381176818; 
 Thu, 19 Aug 2021 06:52:56 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id y23sm1294480ejp.115.2021.08.19.06.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 06:52:56 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/4] dt-bindings: sound: add rockchip i2s-tdm binding
Date: Thu, 19 Aug 2021 15:52:55 +0200
Message-ID: <2412250.zZEsDtmPgG@archbook>
In-Reply-To: <deb50900-fcfd-23d0-ab8a-0e64b2abb063@arm.com>
References: <20210817101119.423853-1-frattaroli.nicolas@gmail.com>
 <20210817101119.423853-3-frattaroli.nicolas@gmail.com>
 <deb50900-fcfd-23d0-ab8a-0e64b2abb063@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailman-Approved-At: Fri, 20 Aug 2021 09:02:12 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
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

On Donnerstag, 19. August 2021 14:08:36 CEST Robin Murphy wrote:
> On 2021-08-17 11:11, Nicolas Frattaroli wrote:
> > +  rockchip,trcm-sync:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Which lrck/bclk clocks each direction will sync to. You should use
> > the +      constants in <dt-bindings/sound/rockchip,i2s-tdm.h>
> > +    oneOf:
> > +      - const: 0
> > +        description:
> > +          RK_TRCM_TXRX. Use both the TX and the RX clock for TX and RX.
> > +      - const: 1
> > +        description:
> > +          RK_TRCM_TX. Use only the TX clock for TX and RX.
> > +      - const: 2
> > +        description:
> > +          RK_TRCM_RX. Use only the RX clock for TX and RX.
> 
> I wonder if that might make sense to have boolean properties to describe
> the latter two cases (which would effectively be mutually-exclusive),
> rather than a magic number? Or possibly even just make the respective
> clocks optional, if this is something which would be done per-SoC rather
> than per-board?
> 

From what I know from downstream vendor device trees, these are per
board, not for the SoC as a whole. There are I2S/TDM controllers on the
SoC which I think are hardwired to certain other IP blocks, such as I2S0
being connected to HDMI, but I2S1 can be routed outside of the SoC where
these come into play I believe.

As for making them boolean properties, I'd rather not. If I were to make it
two mutually exclusive booleans, this would result in 4 possible states
rather than 3, and require complexity to check it both in the schema and
in the probe function. Like this, I can get away with a switch case that
has a fallthrough, and a list of consts in the schema.

> > +
> > +  "#sound-dai-cells":
> > +    const: 0
> > +
> > +  rockchip,no-dmaengine:
> > +    description:
> > +      If present, driver will not register a pcm dmaengine, only the dai.
> > +      If the dai is part of multi-dais, the property should be present.
> > +    type: boolean
> 
> That sounds a lot more like a policy decision specific to the Linux
> driver implementation, than something which really belongs in DT as a
> description of the platform.

I agree. Should I be refactoring this into a module parameter or
something along those lines? I'm unsure of where this goes.

> 
> > +
> > +  rockchip,playback-only:
> > +    description: Specify that the controller only has playback
> > capability.
> > +    type: boolean
> > +
> > +  rockchip,capture-only:
> > +    description: Specify that the controller only has capture capability.
> > +    type: boolean
> 
> Could those be inferred from the compatible string, or are there cases
> where you have multiple instances of the IP block in different
> configurations within the same SoC? (Or if it's merely reflecting
> whether the respective interface is actually wired up externally, could
> that be inferred from the attached codec?)
> 
> Robin.
> 

They can't be inferred from the SoC because there are indeed multiple
instances of this IP block in different configurations on the same SoC.
The RK3566 and RK3568 have four in total, of two different categories,
each being able to be configured for a different format (though the
number of channels and available formats vary for the two categories,
one group only supports I2S and PCM with two channels)

The particular configuration may even vary per-board; an I2S/TDM
controller may be connected to an external codec which does not
support capture, whereas on another board it may be connected to
one that does.

As an example, if I understand it correctly, I2S3 on the RK3566 and
RK3568 can do 2 channels RX and TX in I2S mode, but only 2 channels
either RX or TX in PCM mode, but I'm unsure of the language in the
(still not public) documentation I have.

Regards,
Nicolas Frattaroli


