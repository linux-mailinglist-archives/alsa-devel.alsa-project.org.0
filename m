Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EA9A1CA0
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:24:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 627FF16A5;
	Thu, 29 Aug 2019 16:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 627FF16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088698;
	bh=CBL1y5A00S/5E234+OIr9S77IFTAhe+97JAADraWqRo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LQaJB9WOGoTZhd3uQJOqM+TAdetUhJKYKTwHlnLdS6dbGFCa0/cqcKEioIGRPtQL8
	 PiUfrw9yqkptLhv93UtExYYk9dnv929Ss+uTp+WUeWqdonbMKd0FWsL+nOG5mAUGGa
	 Y5C0QaV8kbpo8a9CsVA/Tpb/5dIkjNwhwNuPTSF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2711CF8978B;
	Wed, 28 Aug 2019 15:03:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7DCBF8978B; Wed, 28 Aug 2019 15:03:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B59E6F89789
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 15:02:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B59E6F89789
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="a/RfKNL4"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 46JQq06pXgz86;
 Wed, 28 Aug 2019 15:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1566997278; bh=uRuZuOqBLbzAnAvpCnYbVSyoMKxEZTSKinbvSRrThOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a/RfKNL4MlNT+Kbj4nC71eLuYccZ4AB8NolM7w1vrgnZ6euiuqXjf13U1jRziElvk
 ucg3Gg+i24xGI5+y1w5iJegO715BAu/bLNhxEYNUKzEy6OQXtqJW8PlZZLqWxHCTy4
 8qf92eDmWNSZVcDwKReB5AdAirysbTx9mkKGrZ//GDRi2JU3P3EDBMYwdZ07NY2iAm
 sVVtEL3HNSEPj102qGv/PBH+OnPi+Z2ZaumQOHIcsWDtMAYXYi0UtlKXLx/uy9mxnb
 dS34IGGFYSRXIGcA+3LpGRzW4Vtz9OcFeuOjTe0qX65wYYLZUBDaRyaQvhUTOE2LC8
 a+nZHriRfnmcA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.2 at mail
Date: Wed, 28 Aug 2019 15:02:52 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Rob Herring <robh@kernel.org>
Message-ID: <20190828130252.GD20202@qmqm.qmqm.pl>
References: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
 <9b85d5a7c7e788e9ed87d020323ad9292e3aeab7.1566677788.git.mirq-linux@rere.qmqm.pl>
 <20190827223716.GA31605@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827223716.GA31605@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, Chas Williams <3chas3@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 4/6] dt-bindings: misc: atmel-ssc: LRCLK
 from TF/RF pin option
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Aug 27, 2019 at 05:37:16PM -0500, Rob Herring wrote:
> On Sat, Aug 24, 2019 at 10:26:55PM +0200, Micha=B3 Miros=B3aw wrote:
> > Add single-pin LRCLK source options for Atmel SSC module.
> > =

> > Signed-off-by: Micha=B3 Miros=B3aw <mirq-linux@rere.qmqm.pl>
> > =

> > ---
> >   v2: split from implementation patch
> > =

> > ---
> >  Documentation/devicetree/bindings/misc/atmel-ssc.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> > =

> > diff --git a/Documentation/devicetree/bindings/misc/atmel-ssc.txt b/Doc=
umentation/devicetree/bindings/misc/atmel-ssc.txt
> > index f9fb412642fe..c98e96dbec3a 100644
> > --- a/Documentation/devicetree/bindings/misc/atmel-ssc.txt
> > +++ b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
> > @@ -24,6 +24,11 @@ Optional properties:
> >         this parameter to choose where the clock from.
> >       - By default the clock is from TK pin, if the clock from RK pin, =
this
> >         property is needed.
> > +  - atmel,lrclk-from-tf-pin: bool property.
> > +  - atmel,lrclk-from-rf-pin: bool property.
> > +     - SSC in slave mode gets LRCLK from RF for receive and TF for tra=
nsmit
> > +       data direction. This property makes both use single TF (or RF) =
pin
> > +       as LRCLK. At most one can be present.
> =

> A single property taking 1 of possible 2 values would prevent the error =

> of more than 1 property present.

It still would need a validation check in the code, though: you
could put wrong value then.  It seems more consistent with the
existing parameters to have two bool properties.

Best Regards,
Micha=B3 Miros=B3aw
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
