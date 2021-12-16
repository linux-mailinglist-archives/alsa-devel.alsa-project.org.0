Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4C847736F
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 14:46:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DA2C1F27;
	Thu, 16 Dec 2021 14:45:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DA2C1F27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639662380;
	bh=3HVXSs3m78NUVgf16l/C9RZr5jdm7iq4ovcvfHWp+K4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J7HKuM+OKO1OP5PKov/ReaOp3XLGMzQW5fmLW5jX897PZpeVPAeHgEXgrkcw8DjXF
	 2dPk5Uh4pGsFKKK9L+3EMPz0zRBVRgy0o/8QE14XIv37dEL/0Sw/HouGHuzFcyGBdR
	 7R54q6/LjSxvTEW8ySYAUlVxrEA9bhxYPv5IjYfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9F5EF800B0;
	Thu, 16 Dec 2021 14:45:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3848AF8014C; Thu, 16 Dec 2021 14:45:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16C0CF800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 14:45:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16C0CF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HrWv8JnJ"
Received: by mail-wr1-x433.google.com with SMTP id e5so10876905wrc.5
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 05:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rb/+mXWhEG6S9EIOxh8qb2+7X3qo0XbenUvRxK42X4M=;
 b=HrWv8JnJnUWNpGfUfgoP28RV3plxvArdBwVrg7DrufSqxT585BnKuWYLc0D7Q5tYnX
 PdipKeyeKJIgY22MxO8r6aPupC4FmHiPWxpGfb/ugjS4c29ljsdZziGUCL/Aq30sHGhK
 LZvYUcwENb4uMBnrczV/5D4gW/KdLKLHpiMjfRl/rGTA5525YFLYz2U5Lu24ciz4v6i/
 b1SaHUBfggNNcVHPRCWnoQan3QaQ8FLrG8t730UWYq2ipC+eAL2pSWN6jjMec4UZox4L
 H7CtLz9Qzv94oEyIv6WHUxYOMSpDGZHyqYKgSYKUa11o6n/P4LHq3nJTOxOc9duv9KN5
 AzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rb/+mXWhEG6S9EIOxh8qb2+7X3qo0XbenUvRxK42X4M=;
 b=ksJbmjUBeWOwTKW7doCETU2/lqNMTJ+KJ3DVUEb1O1zksDjMRY97c3uXqjxlIPKEMG
 jr7aofDUv6CTsXfDNsbOH60cncgNhg2joCnnsc5uYAgl8zTz2YM2T3Gk/KomI/Cq/o9J
 kKMDLm8LBMJW/gYkYLcKGSUaSwcrQV9gbTLST/dF5GlsDK9dkfhRDnFoaq8huRerFGe9
 HkHOgv8Nkj2/vjUh1ezPNe68DvuZzxgFavCD4LzbNrYoOK4PYFJFU+zDRahD0/77auq0
 BKy8mNdLDois47gjXbPuF+28Fyl0QvCOnS3bqnd9t/Oa8Cklh+nTtQMyf2IpN+kGhfVK
 03Pw==
X-Gm-Message-State: AOAM532gaKGa2tzv7YFwbZNB6cIwJKwlY2C3K0SLPgWpYZkrqHjDUYq2
 lWw3h2P12NXeCqQme9q/Y0o=
X-Google-Smtp-Source: ABdhPJy6hVlpxQM2rUPWydGYq7yKNFFkMicJChI8RDdCEN4VFcMwnhxLAszmafAbXMvfL64VfVPwTA==
X-Received: by 2002:a5d:47a1:: with SMTP id 1mr9182996wrb.436.1639662300835;
 Thu, 16 Dec 2021 05:45:00 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id p5sm5039109wrd.13.2021.12.16.05.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:44:59 -0800 (PST)
Date: Thu, 16 Dec 2021 14:44:56 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: sound: nvidia,tegra-audio: Convert
 multiple txt bindings to yaml
Message-ID: <YbtC2I49D0pdcyLY@orome>
References: <20211211224946.79875-1-david@ixit.cz>
 <a84213cb-272a-f1b2-338f-ed8ed0bf133d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VYhNuZYXPUbD/PRF"
Content-Disposition: inline
In-Reply-To: <a84213cb-272a-f1b2-338f-ed8ed0bf133d@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, David Heidelberg <david@ixit.cz>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, ~okias/devicetree@lists.sr.ht
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


--VYhNuZYXPUbD/PRF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2021 at 05:52:12AM +0300, Dmitry Osipenko wrote:
> 12.12.2021 01:49, David Heidelberg =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    sound {
> > +        compatible =3D "nvidia,tegra-audio-rt5677-ryu",
> > +                     "nvidia,tegra-audio-rt5677";
> > +        nvidia,model =3D "NVIDIA Tegra Ryu";
> > +
> > +        nvidia,audio-routing =3D
> > +                "Headphone", "LOUT2",
> > +                "Headphone", "LOUT1",
> > +                "Headset Mic", "MICBIAS1",
> > +                "IN1P", "Headset Mic",
> > +                "IN1N", "Headset Mic",
> > +                "DMIC L1", "Internal Mic 1",
> > +                "DMIC R1", "Internal Mic 1",
> > +                "DMIC L2", "Internal Mic 2",
> > +                "DMIC R2", "Internal Mic 2",
> > +                "Speaker", "PDM1L",
> > +                "Speaker", "PDM1R";
> > +
> > +        nvidia,i2s-controller =3D <&tegra_i2s1>;
> > +        nvidia,audio-codec =3D <&rt5677>;
> > +
> > +        nvidia,hp-det-gpios =3D <&gpio 143 0>;
> > +        nvidia,mic-present-gpios =3D <&gpio 132 1>;
> > +        nvidia,hp-en-gpios =3D <&rt5677 1 0>;
> > +        nvidia,dmic-clk-en-gpios =3D <&rt5677 2 1>;
>=20
> I spotted that nvidia,dmic-clk-en-gpios is undocumented, but DTs and
> binding are passing the validation. We will make another patch to fix it.
>=20
> Rob, could you please tell whether this is because unevaluatedProperties
> doesn't work yet or we're missing something?

If you update dt-schema.git to the latest "main" branch you should have
most of what's needed to make unevaluatedProperties work. However, there
seems to be an issue with some $referenced schemas setting
additionalProperties to true and then that gets propogated to the schema
that included it.

Rob came up with the patch below to fix that:

--- >8 ---
diff --git a/dtschema/lib.py b/dtschema/lib.py
index 3cc5e428b0eb..a0f22aab935a 100644
--- a/dtschema/lib.py
+++ b/dtschema/lib.py
@@ -367,6 +367,9 @@ def fixup_sub_schema(schema, is_prop):
     if not isinstance(schema, dict):
         return

+    if 'additionalProperties' in schema and schema['additionalProperties']=
 =3D=3D True:
+        schema.pop('additionalProperties', None)
+
     schema.pop('description', None)
     fixup_interrupts(schema)
     if is_prop:
--- >8 ---

I'm currently running the tools based on that and it's indeed been
flagging some properties as unevaluated that weren't there before.

Thierry

--VYhNuZYXPUbD/PRF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7QtUACgkQ3SOs138+
s6HjCxAAuTnbsKxAgxycX85cJbBSIHKr0b51aKNXDI71KKBxLN4QSgOtVa7ZyTyh
vj1eR6Ub2iMKQqd20prcPw2G/OyDMT4Ej3+UK14zAGfOPIgPHzTuTivT2yAmdZQY
qMC1rz2YpzLxUWMbiL7d5BUWH10feHqodEhEYyR5ai4dayw5h3uTaXU3zAg6nrxv
t3us4Am42PXfUKk8v7yEBoKCr9N6p45xI3oAjlzmcTcUmJ/znM4ExIUW/vNsXUYb
vehBTrfGWLwF/Zc8FXHrqa1ZWIUVuVdhJq8gBCKURp7Aq34eXQLyBKc2yzWzTr1U
u8Bd1Ui5bUOvqG+pijUaNnELUBNu042FSlj26UZsbbATxnvj/rT60477YfE7IjJg
0nBTUGR9tCeqJT7PNdQ2qrycFnwIDSokNldvCjxGO+dYf1mTC1F7GHYp1xN92qtK
wPNPqt97gnajhx0rUIvXBuFMDRhhz8dsSPZTPK0vuoo7r6Ot0k5MaweCT1B+SoKw
tYIKnXImguOGPXKX14DAmRdMO5mVUF2L4tnWlBiTMRaN0YjEESkdtfUKfOp2Drg5
P0GU9HyOB84/yfHnd23+osuqB1kWWIZ8DTLyf+GJ3K2KSL7gZA+IUsqawHGZTdvx
96U+hM8GBu77CfrjrHoUGftBOSz+vGdNRU4/fxJxTMEHpaVRTHc=
=FRv9
-----END PGP SIGNATURE-----

--VYhNuZYXPUbD/PRF--
