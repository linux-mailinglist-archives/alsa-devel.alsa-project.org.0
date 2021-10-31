Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA18440DA7
	for <lists+alsa-devel@lfdr.de>; Sun, 31 Oct 2021 10:36:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 345D016A4;
	Sun, 31 Oct 2021 10:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 345D016A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635673012;
	bh=vJl6wad1L8/qQsHFiM4x6jV7Ba+rQVM5va0SBcOMf20=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOW0VNEd+057EB7slGmu6ppZxgISVY7p4w1C+xWeS7pMvagRcPWwT3Epy3dVztWty
	 rpevkQuP4ZZ8Bu1FJkBUuNNL8pKsHWwxPOifMTeebCZ38NFcqCdKiXoRzpe5c4QYZx
	 hjyqN4QDInmRj8XAyWHi1bur4DBcBA6hMoyJgFvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F6CAF8025D;
	Sun, 31 Oct 2021 10:35:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F71EF80229; Sun, 31 Oct 2021 10:35:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from msg-4.mailo.com (ip-15.mailobj.net [213.182.54.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F574F8010A
 for <alsa-devel@alsa-project.org>; Sun, 31 Oct 2021 10:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F574F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="LzxmPc/r"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1635672917; bh=vJl6wad1L8/qQsHFiM4x6jV7Ba+rQVM5va0SBcOMf20=;
 h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
 References:Content-Type:MIME-Version:Content-Transfer-Encoding;
 b=LzxmPc/r6zetKg6txq7wv8VVsphGY7Op2zZIYzlWtTyAHkyvmx+4XEhbEKwB71+IY
 xoavisHzSRMTP8qxoYTgfYN24arihCi/PgkKLzudF2DyGzWZxk/ZYE0yo5wwpIJJtm
 0EfvpdBGGmlBkLQEFR5XELFZgErhUsazWaW94gCQ=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Sun, 31 Oct 2021 10:35:17 +0100 (CET)
X-EA-Auth: G/xCF6IFwpi4luFdXUamameEVAkt81gKAIbtu5Egt8p0gvNt1SPUyLj91+xiitzXK6u5pr4rxNuIK+Zi5dCB7bwmSewjjv/Bi+qA5GH7yRo=
Message-ID: <a2f4bcd22b896f05ec3f33809f577cf9e889f270.camel@mailoo.org>
Subject: Re: [PATCH v1 3/4] ASoC: dt-bindings: nxp, tfa989x: Add rcv-gpios
 property for tfa9897
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: Rob Herring <robh@kernel.org>
Date: Sun, 31 Oct 2021 10:35:15 +0100
In-Reply-To: <YXtYtsPCeh937oF6@robh.at.kernel.org>
References: <20211024085840.1536438-1-vincent.knecht@mailoo.org>
 <20211024085840.1536438-4-vincent.knecht@mailoo.org>
 <YXtYtsPCeh937oF6@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 stephan@gerhold.net, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
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

Le jeudi 28 octobre 2021 =C3=A0 21:13 -0500, Rob Herring a =C3=A9crit=C2=A0=
:
> On Sun, Oct 24, 2021 at 10:58:39AM +0200, Vincent Knecht wrote:
> > Add optional rcv-gpios property specific to tfa9897 receiver mode.
> >=20
> > Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> > ---
> > =C2=A0.../devicetree/bindings/sound/nxp,tfa989x.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++++++++
> > =C2=A01 file changed, 10 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> > b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> > index 7667471be1e4..a9e15baedafd 100644
> > --- a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> > +++ b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> > @@ -12,6 +12,16 @@ maintainers:
> > =C2=A0allOf:
> > =C2=A0=C2=A0 - $ref: name-prefix.yaml#
> > =C2=A0
> > +=C2=A0 - if:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
st: nxp,tfa9897
> > +=C2=A0=C2=A0=C2=A0 then:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcv-gpios:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: op=
tional GPIO to be asserted when receiver mode is enabled.
>=20
> Did you test this works?=20
>=20
> You have to define the property outside the if/then schema at the top=20
> level. Then use an if/then schema to restrict it (rcv-gpios: false).

Sorry, I only tested validation with dt_binding_check.

I'll send another version later today with
if:
  not:
    properties:
      compatible:
        const: nxp,tfa9897
then:
  properties:
    rcv-gpios: false
and a tfa9897 example section, which passes the check and fails
if rcv-gpio is added to tfa9895.

Thank you



