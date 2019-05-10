Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0779519BA2
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 12:28:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AD0918B4;
	Fri, 10 May 2019 12:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AD0918B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557484101;
	bh=GFHBb7VoX9jtCyiybDhXfREkkvUbqbDnXc9Pf52kc88=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MdfDLdFBc+PQIvpI+Zdkf3LCcPx7p1fzjj6C+JWbfMaALP1HbEi3StMj22cxm1ONy
	 dBFFb4TUuycXBEhxUxhliEFdzuS3mf48KfRzdFsNyMt1Ytl4nmonlWSANK0IhnJqC5
	 PJPhgVZt0O8lLwGpgEBb9EAfy86uiY1ubYdSnDlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFC69F896FD;
	Fri, 10 May 2019 12:26:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD84DF896FD; Fri, 10 May 2019 12:26:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=PRX_BODY_26,PRX_BODY_30,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41643F8073C
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 12:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41643F8073C
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id DF1B520001C;
 Fri, 10 May 2019 10:26:28 +0000 (UTC)
Date: Fri, 10 May 2019 12:26:28 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Message-ID: <20190510102628.u344cqe7sftuamfg@flea>
References: <dc84c7e9ce272109052f553a5e050bfe1a09e9d6.1557252411.git-series.maxime.ripard@bootlin.com>
 <d9afb19c32f8b9b2c40c8d4c0c3df74bff0ccf35.1557252411.git-series.maxime.ripard@bootlin.com>
 <CAL_Jsq+iLmzti5TX-TUU3PN4taC66UMqHMk-aKTjZKt1kVRtMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+iLmzti5TX-TUU3PN4taC66UMqHMk-aKTjZKt1kVRtMQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v2 2/2] dt-bindings: sound: sun4i-spdif:
 Document that the RX channel can be missing
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

Hi Rob,

On Wed, May 08, 2019 at 02:35:10PM -0500, Rob Herring wrote:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: allwinner,sun8i-h3-spdif
> > +
> > +    then:
> > +      properties:
> > +        dmas:
> > +          maxItems: 1
>
> In this and below, these should get added automatically by
> fixup_schema. If not present, we set minItems/maxItems to the size of
> the items list. It look like you added support for that, so left over
> from before you addressed that for if/then/else?

Sorry, I should have brought that up in the pull request.

It seems that it's still necessary when using allOf, otherwise the
schema won't match

Maybe there's something more to fix when using allOf?

> > +          items:
> > +            - description: RX DMA Channel
>
> s/RX/TX/
>
> > +
> > +        dma-names:
> > +          maxItems: 1
> > +          items:
> > +            - const: tx
> > +
> > +    else:
> > +      properties:
> > +        dmas:
> > +          minItems: 2
> > +          maxItems: 2
> > +          items:
> > +            - description: RX DMA Channel
> > +            - description: TX DMA Channel
> > +
> > +        dma-names:
> > +          minItems: 2
> > +          maxItems: 2
> > +          items:
> > +            - const: rx
> > +            - const: tx
>
> I'm really on the fence whether it's worth it to add all this just add
> the restrictions based on the compatible. I guess with copy-n-paste
> this would be a common error.

Converting most of the bindings to the schemas has shown that (at
least in our case), we've been pretty bad at keeping the documentation
up to date with that kind of information.

Adding that kind of construct at least has the benefit to actively
enforce that the documentation is complete.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
