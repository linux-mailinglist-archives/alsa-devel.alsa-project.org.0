Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB5764DAA3
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 12:48:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94AE5228A;
	Thu, 15 Dec 2022 12:47:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94AE5228A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671104924;
	bh=8snVgzDkOR9zhOe/egX/KJ3N1HQ0HLrjXTG8drtdyY4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kQwUwT3Ri+Fs7W6nBHZhbH/njVgeZjpCqZG/O8nxlC8axSPY3wx16e6mOz5whBcPs
	 a9wo30sgJDRISrEcQnlcHZUObhsu7uXSQu9Lh8WKgPaniFGdmulNatGFBmlEBSGFB/
	 Js7vbG7Da097IhZRA2zWrFsfQU/P/Zms3aUO/tvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E096F80141;
	Thu, 15 Dec 2022 12:47:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44F6AF804E7; Thu, 15 Dec 2022 12:47:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7623AF801D5
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 12:47:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7623AF801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FCBQzN34
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8A6361DA2;
 Thu, 15 Dec 2022 11:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42C4C433EF;
 Thu, 15 Dec 2022 11:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671104861;
 bh=8snVgzDkOR9zhOe/egX/KJ3N1HQ0HLrjXTG8drtdyY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FCBQzN34iw4qBds47R7Lh74FgGK/c1B+JmvJc4AN/oUvQcwD6lsvYiQIdg9LM1v9v
 AebAnCGpKeTuIovJS/mERhVrV6Z4HzL448CQyC/qV923rnnryiwGJB7Qx6Mzeetmk8
 h2SAkPaAaw2ziQ7p3uw9/4XvjZIbLX/WgnawPILtKgkQThsofxKfdRemIdpFAak+nQ
 SFVT/L9lrV11ZutMZ1pU2N2WvSj6aSCdrmUM3kVvGWJE3ZsdKgbJOiHdgOaVzwuvgy
 pRlgHcxKGD2d9wOloX3sgyY/aViPqK5VT2+0lL/BKLNfCWGsdCWso7tg5OjaD6nua6
 h8YCHyeDIprzA==
Date: Thu, 15 Dec 2022 11:47:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 06/11] ASoC: dt-bindings: ti,pcm3168a: Convert to
 json-schema
Message-ID: <Y5sJV2KfX98KoMYZ@sirena.org.uk>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
 <87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdW=_-MyqAjRqaoPyWkoUmdB2VOE1t+wpym7eyOxkzc_7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QJDUvaOOFQYQAqme"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW=_-MyqAjRqaoPyWkoUmdB2VOE1t+wpym7eyOxkzc_7g@mail.gmail.com>
X-Cookie: Today is what happened to yesterday.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Rob Herring <robh@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--QJDUvaOOFQYQAqme
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 15, 2022 at 12:03:02PM +0100, Geert Uytterhoeven wrote:
> On Wed, Dec 14, 2022 at 2:23 AM Kuninori Morimoto

> > +maintainers:
> > +  - Damien Horsley <Damien.Horsley@imgtec.com>

> For v2, I had planned

>     -+  - Damien Horsley <Damien.Horsley@imgtec.com>
>     ++  - Jaroslav Kysela <perex@perex.cz>
>     ++  - Takashi Iwai <tiwai@suse.com>

> as Damien's address bounces.

I wouldn't do that, I gather the maintainers for DT bindings are
supposed to be people who know and care about the specific binding in
particular.

--QJDUvaOOFQYQAqme
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmObCVYACgkQJNaLcl1U
h9AEtwf/cHHOHd+LiHpcnpC/OdbwGPMWgBNmMYDNu8nAuQ0yM3Ao4e/gRfickAWM
r9dJ+UpAGmA42n1pdk99B42neFVHQZ1iwlBmEjX6SmVAz561RO/dEVIMrHDCegT1
GIxcPEyL3xaikoUqKYrznygcAHdKY2taKVVlHn0cj9QkQGdXaz5jruypmOVLjwQC
6W5Hq7kN0NJ9TWHkanX3T8fkIcA7PkpLjdcDh2i71mjeCdxStN6qenYQ742n29xp
wjSzNWnVzYuTLv4mNKfRUwX8qfxT8WjJAogDN7Ww0HQr0VjRSB3Vx5Pn7RDr0swf
xymy5W2FQyYatqzN6LEJUM5NjKCWGQ==
=GYG/
-----END PGP SIGNATURE-----

--QJDUvaOOFQYQAqme--
