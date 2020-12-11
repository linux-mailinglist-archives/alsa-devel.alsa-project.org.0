Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 710A52D8000
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 21:29:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA77C1755;
	Fri, 11 Dec 2020 21:28:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA77C1755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607718545;
	bh=aOw0RfZFMvx+4fMpScAcwGXgVLkPZUxWahDI1GJz4k0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PSgN6k9PGJjogcShdIjylRgIz6KiOwcgAYoZ39qDndSnTnDf2rjwLtopp0i1tu/DJ
	 V88pUTsc1vfyfNeUlvRTbE7NoesRIMnVrYp40Rg8jX8wUeE2CqCjPOZxKokp0JYhHM
	 guwSJQ8elNBDzpsDXd8IIE9Jyf+EQrcTV47tsM34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FF69F80217;
	Fri, 11 Dec 2020 21:27:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CACF5F8020D; Fri, 11 Dec 2020 21:27:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A10CF8011F
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 21:27:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A10CF8011F
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr
 [86.194.74.19]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 2A68660002;
 Fri, 11 Dec 2020 20:27:19 +0000 (UTC)
Date: Fri, 11 Dec 2020 21:27:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: add simple-audio-mux binding
Message-ID: <20201211202718.GI1781038@piout.net>
References: <20201205001508.346439-1-alexandre.belloni@bootlin.com>
 <20201210020545.GA1480364@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201210020545.GA1480364@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
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

On 09/12/2020 20:05:45-0600, Rob Herring wrote:
> What's wrong with the generic mux binding and driver(s)?
> 

The main issue is that the driver doesn't expose audio routes and so
DAPM can't do its job properly. Also, it is more convenient to have the
control part of the ALSA sound card which is not possible with gpio-mux.

You could argue that we can have simple-audio-mux use the mux subsystem
but we still need a new binding and driver anyway, just as we have
io-channel-mux or i2c-mux. I'm not sure this would be useful but I can
be convinced otherwise.

> > +
> > +properties:
> > +  compatible:
> > +    const: simple-audio-mux
> > +
> > +  mux-gpios:
> > +    description: |
> > +      GPIOs used to select the input line.
> > +
> > +  sound-name-prefix:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      Used as prefix for sink/source names of the component. Must be a
> > +      unique string among multiple instances of the same component.
> > +
> > +required:
> > +  - compatible
> > +  - mux-gpios
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    mux {
> > +        compatible = "simple-audio-mux";
> > +        mux-gpios = <&gpio 3 0>;
> > +    };
> > -- 
> > 2.28.0
> > 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
