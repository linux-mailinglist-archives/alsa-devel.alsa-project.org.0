Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9C228F4D4
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Oct 2020 16:34:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF6301742;
	Thu, 15 Oct 2020 16:34:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF6301742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602772491;
	bh=V+w0BgiZGIRrUFkjIUFnlsU1haDzRIPNyZqxr0XgcxQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f8cN1WW9RUHa0ZxAg0k2Ey+y3d/xOTK6Xz6NvPd5cQnjNHdHyI2f4m+5fBm7wSEcM
	 MP6wz8YDpv3oyciNdhGVclIRuO0Nib4C3s8JZGE7DEIvAHk5mw/cYe/oeOfbPn98gf
	 pQ3hsAhndaRbntStqOYkj15gIr2PB8pBjcPGWjpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ED01F80247;
	Thu, 15 Oct 2020 16:33:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85CC0F80268; Thu, 15 Oct 2020 16:33:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A75D7F80247
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 16:33:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A75D7F80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ro54jaBD"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 571B020723;
 Thu, 15 Oct 2020 14:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602772381;
 bh=V+w0BgiZGIRrUFkjIUFnlsU1haDzRIPNyZqxr0XgcxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ro54jaBDXChGl8LZICl+4WSt+mXkRwrdQZ+bl6DHUpmyjEdi7u0kjOLS8tuxEvtjG
 12k/FU8qhpYUsi9WnKJbqDKgIRCWYPvIEFokQxp7W30WDkShrIsUFILsBaTUYWjlW3
 si0yIdMC12BtfBBWMVYlqpTtXEo6WflqfYKA6xCY=
Date: Thu, 15 Oct 2020 15:32:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: More Generic Audio Graph Sound Card idea
Message-ID: <20201015143254.GC4390@sirena.org.uk>
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
 <87imbeybq5.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="96YOpH+ONegL0A3E"
Content-Disposition: inline
In-Reply-To: <87imbeybq5.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Neutrinos have bad breadth.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Sameer Pujar <spujar@nvidia.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
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


--96YOpH+ONegL0A3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 01:50:25PM +0900, Kuninori Morimoto wrote:

> > I'm thinking below style as new audio-graph-card2.
> > It is not tricky, thus connection judgement for normal vs DSP is easy.
> > Then, code can be more readable (=3D no guaranty :P) ?

> I have proposed DPCM connection idea for audio-card2 before,
> and proposed Multi-CPU/Codec connection idea later.
> I'm not yet implemented these, but I want to merge / reuse these
> idea to keep simple code.

> By this mail, I want to propose Codec2Codec idea.
> It is almost same idea with DPCM, Multi-CPU/Codec,
> and is last parts for missing feature.

> I think this idea can be generic and easy to update
> in the future (if needed).

> But, I want feedback, opinion.
> I wonder does it works for your use-case ?

> -- Image ---
>=20
> Codec2Codec
>=20
> Codec1 <--> Codec2
>=20
> -- DT Image --
>=20
>    +--+
> =3D> |  |<--> Codec1
>    |  |<--> Codec2
>    +--+
>=20
> -- DT Sample --
>=20
> 	sound {
> 		compatible =3D "audio-graph-card2";
>=20
> 		dais =3D <&codec2codec>;
> 	};
>=20
> 	CODEC2CODEC {
> 		compatible =3D "audio-graph-card2-codec2codec";
>=20
> 		ports {
> 			codec2codec: port@0 { fe_ep: endpoint { remote-endpoint =3D <&codec1_e=
p>; }; };
> 			             port@1 { be_ep: endpoint { remote-endpoint =3D <&codec2_e=
p>; }; };
> 		};
> 	};

I'm a bit confused about the use of FE and BE here since the two CODECs
are peers rather than this being DPCM - I think that's just a bit
cut'n'paste rather than anything else though?  The other examples look
sensible I think but this one feels odd.

> -- Image ---
>=20
>           *******
> PCM0 <--> *     * <--> DAI0: Codec Headset
> PCM1 <--> *     * <--> DAI1: Codec Speakers
> PCM2 <--> * DSP * <--> DAI2: MODEM
> PCM3 <--> *     * <--> DAI3: BT
>           *     * <--> DAI4: DMIC
>           *     * <--> DAI5: FM
>           *******

> 	DSP {
> 		compatible =3D "audio-graph-card2-dsp";
>=20
> 		ports@0 {
> 			/* Front-End is pcm0_ep, Back-End is dummy */
> 			dsp_fe0: port@0 { dsp_fe0_ep: endpoint { remote-endpoint =3D <&pcm0_ep=
>; }; };
> 			         port@1 { };
> 		};

I'm not clear why we need to represent the dummy port here?

--96YOpH+ONegL0A3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+IXZUACgkQJNaLcl1U
h9AF7wf+ISm7onUic1fR3zNNjftq9dju8MbKez9uk2AvLbpGJ4m37muety5RHKQO
WxLPWRfhtDEDhdEXJiusvQBM2wIWELjhepk5Ew3aO/6I9UPEhUlHCQ5yVn+zy/Mq
5bR6BKftHf2HdClC9B75OUaTOQwD+bx7iHcBLxWNV2vWRJz2/wPFORHCrwAzgDzS
k/5suW55muu3cU4BLF8ICqMHZrNkZpAQ4khOY6kb5p5JuIs9qCUGHfUzefJSIWiU
+ArGiaFcy0/NF8ELmZq/mwlwp3G4MEZb9WHzQCEfpK4jdffjs05tL6eeJJ4sttfJ
Ah7sDM4ybj7vZ7lysWU/+4i3pQKRrA==
=d1SU
-----END PGP SIGNATURE-----

--96YOpH+ONegL0A3E--
