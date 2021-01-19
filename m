Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B5D2FBE60
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 18:59:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 019E818E3;
	Tue, 19 Jan 2021 18:58:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 019E818E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611079154;
	bh=KGoKmlKHtjxBHZarBU7FUTDTaXryaMRO1aHYV6xnZCg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GaZT2AeK0O37ULqpkDUrEE26oshdMUuYi6rmrrUfFc/HK3QrTt1CccPUSmVbmrCUP
	 lGp6aKF1vG2tNof8HOI8yyyQUkrzQMKum3SHWywwnd89jwScCOECoDYuOqI3ciTuhX
	 4vZNAtEjt75wlL1KhUHwUZpVr7vUnPRUFQF7Yjxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C9DFF80255;
	Tue, 19 Jan 2021 18:57:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07A8CF80257; Tue, 19 Jan 2021 18:57:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFA03F800FE
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:57:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFA03F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WbtKuRS1"
Received: by mail-wr1-x429.google.com with SMTP id v15so16969262wrx.4
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 09:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cCuyHdaDKNdgvkGiCtIDRjNsTS1QMIkBB5jEcNPOBbc=;
 b=WbtKuRS1nA02ixu8TOLQZmxeJ3Q3Ib6SmpAjhjsqyxpJP8SpTApAmNuII3RhU59gQT
 HO1s26/ZYk8hn9946Y7LytYDSybdT3w4hcUKIHb54+I5XO8Gms4KfgmD+PW6x9m5E124
 eUT4HK24tJWD4isorfUzWr7/XMAvOwNK38iMtNlf6IPczt/zLLIjoj3SqDv8YlfVfhyA
 +KTnTGFpHmN2uf3JkSP3zdFUKJuT0fwZ/fDQxnFEP/Y0E2z4VER1w0YQsOkWLmdS49Uj
 izNbb+ZygnZBWH05oGwO2lt9FlKKUcCnC68ONPUbXpWd+sLH70qS4Rb0Ih+6upKcJGLM
 D7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cCuyHdaDKNdgvkGiCtIDRjNsTS1QMIkBB5jEcNPOBbc=;
 b=iiOY+LzqoszycjXL0VTbxD3abeDSIOko+VC30ZrqCYUtZLKJjBFB00UXgyDezIcH0j
 LFqE15aW9MpUYrzDHuQN05n9pwZBCTxsqD1q7QMnrQUEYziLchCmkDu9XuFE807hK729
 630so5sNcOb4B/TfqwWRjQdY4HodPQ1XtoOhhM/N4nSbSDdppxmDNPpYXVFl4LMkTsEr
 hqjQiMPApNbanLaZfK+oLsP3vmAYD8dRIB9pUoEROrztHvqujJgwiOgVAn6q2RilJn3W
 9sUFEgZj5EueeQV6YgQTHQupRZlcu8ECLEVFK+uE6vjfOVKgzm11ji13n6QvLpUitEJj
 go0A==
X-Gm-Message-State: AOAM530YwblnjtlQ/4C95k33wCcVGTFtrVf62wB9Lu3MKDMca1YkmrDC
 Xy6s2tzogzFKEMGQD+Yv5io=
X-Google-Smtp-Source: ABdhPJxgji7Hd60FCvBKG6RsKh9xWB1ix7MRh3EgGDUFQRiug/el9Iqg2O8XkLOQpxAUQ288fVSi7w==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr5422477wrd.329.1611079054086; 
 Tue, 19 Jan 2021 09:57:34 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id t25sm5407477wmj.39.2021.01.19.09.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:57:32 -0800 (PST)
Date: Tue, 19 Jan 2021 18:57:31 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: Re: [RESEND PATCH v6 5/6] arm64: tegra: Audio graph header for
 Tegra210
Message-ID: <YAcdi7ARk0imXafQ@ulmo>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
 <1611048496-24650-6-git-send-email-spujar@nvidia.com>
 <YAcTxxyogVgfN1uw@ulmo>
 <b83eb795-328e-acc5-4555-7befd919a136@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ef4HD4ePKjEwSwzf"
Content-Disposition: inline
In-Reply-To: <b83eb795-328e-acc5-4555-7befd919a136@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, linux-tegra@vger.kernel.org
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


--ef4HD4ePKjEwSwzf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 11:09:32PM +0530, Sameer Pujar wrote:
>=20
>=20
> On 1/19/2021 10:45 PM, Thierry Reding wrote:
> > On Tue, Jan 19, 2021 at 02:58:15PM +0530, Sameer Pujar wrote:
> > > Expose a header which describes DT bindings required to use audio-gra=
ph
> > > based sound card. All Tegra210 based platforms can include this header
> > > and add platform specific information. Currently, from SoC point of v=
iew,
> > > all links are exposed for ADMAIF, AHUB, I2S and DMIC components.
> > >=20
> > > Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> > > Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> > > ---
> > >   .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 153 ++++++++++=
+++++++++++
> > >   1 file changed, 153 insertions(+)
> > >   create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.=
dtsi
> > I prefer keeping everything in tegra210.dtsi, but I can do that merge
> > when I apply, after the DT bindings have been acked, so no need to
> > resend just because of that.
>=20
> I think this may be fine for Tegra210 based boards. But for Tegra186 and
> Tegra194, whenever we add support for it, can rely on a common audio-graph
> dtsi because there is no change w.r.t APE. This can help us to avoid
> duplication of the bindings. This most likely applies to future chips as
> well (where Tegra186 audio-graph bindings can be considered as base) when
> there is no significant change in APE.

Maybe. Although that argument is somewhat extreme because we already
have some of that same duplication throughout the other .dtsi files. By
the same argument we could save a bit of duplication by having something
like tegra-gpio.dtsi and including that in all the SoC .dtsi files and
only update the compatible string, because that's the only significant
change.

Duplication isn't a big problem for DTS files because the data is meant
to be stable anyway. So once it is in place and doesn't have to change,
it really doesn't matter if it comes from an include or it's duplicated.

Thierry

--ef4HD4ePKjEwSwzf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAHHYsACgkQ3SOs138+
s6HzERAApo6U7ZDcY9jQ9XXohES6pX0zS0bRwPETSxyp1JYt4RWMgDn5fnfeYtkP
InqVfiYYiqSbF46y4yBtVv5CcNJFu8+NRMmXhlgf3BLP7wMOQo1ZA+awS+Q8LX11
mIs2vuAnbyPZIaaU/+YiCpXjfu6Rb/+yLCZbCDkpy0E9BWh9q15Qo512HcEQTowh
VrVSZLQfx7mWnAs0gDykKdnMghb/LCTtLsSLrJaS2Uh7LoY84L3sDHDIRqAVLgqu
LyTPeb6cw+TH9YA9Vb1DbzXQiOl0fmb7ca1Fhglfd4oCoaSAh+Oti0m4TLkOlAwV
2mJi7iHCOCGZw4EdMKsWBRPSwtAv/jqqnYzF2sozC6+79Kitktf2LalH3HdiwgWr
bcnPVKIYGNK8nvvllKSxnODb9dwBh5dvVERUTrPScTb+wtVkBJckbDHQ8KhQsmzO
HrXD6f/DpgSjkacP9We0zwiud1toD0kr0b3BsD4n3CrKeGuJBtK/jDK2WcwIXX4O
oNxxKIhnSr//KNI+29dxug6BJaBMt55r8gqVg+d/EZeufXFvyiCwQHJKyuNREQgf
Ne0cj/tDFyHu2l5TG0ivO+fbnmqin7UBFxNnFP7ObwS61l1VuYE3SCNraT2WrDtz
PX+ONBWVUg6Bc0/HRieI978DI5krbdHZjxOmgNKfeqrT3r+Sfc4=
=ThIL
-----END PGP SIGNATURE-----

--ef4HD4ePKjEwSwzf--
