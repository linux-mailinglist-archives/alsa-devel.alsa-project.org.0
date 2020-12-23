Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 628602E20FA
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 20:40:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E768C1808;
	Wed, 23 Dec 2020 20:39:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E768C1808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608752432;
	bh=bXkwzD+eDeYS+eIF/2lpusGMCo1Kg2HowmwAewwJTgA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lu0Ax4ixcPmCZ4cutf3EHN8jeH2yUcT7sAb0lbi65E3Qvtu++09AiCoTDzFs7FJjv
	 UqPS0mT12s6QVU4wLdt2+1j8WgAjWbympelG7DVhlEnmWKxiMkCv5Qpvy697eX1xLP
	 BBzxRKB3wEj1B8oQf4Nljq65muwVRYGwZ1M0Ndjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38596F801EB;
	Wed, 23 Dec 2020 20:38:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B19F2F801D5; Wed, 23 Dec 2020 20:38:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FA07F800BC
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 20:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FA07F800BC
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7EE318053B;
 Wed, 23 Dec 2020 20:38:41 +0100 (CET)
Date: Wed, 23 Dec 2020 20:38:40 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop redundant maxItems/items
Message-ID: <20201223193840.GA3669192@ravnborg.org>
References: <20201222040645.1323611-1-robh@kernel.org>
 <20201222063908.GB3463004@ravnborg.org>
 <CAL_JsqJLw_RtLehYDLu_HKCoxDHsx-AdGTWfN0JMJhgNqLeFng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJLw_RtLehYDLu_HKCoxDHsx-AdGTWfN0JMJhgNqLeFng@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=ceURT3LBwQyT03W6ftYA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jassi Brar <jaswinder.singh@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>
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

> > With one comment below,
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> >
> > > ---
> > > diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> > > index 737c1f47b7de..54c361d4a7af 100644
> > > --- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> > > @@ -74,11 +74,8 @@ properties:
> > >
> > >    phys:
> > >      maxItems: 1
> > > -    items:
> > > -      - description: phandle + phy specifier pair.
> >
> > The description may help some people, so keeping the
> > description and deleting maxItems would maybe be better.
> 
> Do we really want to describe 'phys' hundreds of times? No.
Agree, for common properties we as a minimum want a phy-common.yaml
or some such - and have the description exactly once.

> The
> question I ask on the descriptions is could it be generated instead.
That could also be an idea, but assuming most people look at the source
then the same "most people" would miss the generated descriptions.

But to be clear - I see that phys: is a commonly used property so no
problem to have the description dropped here.
Ack still stands.

	Sam
