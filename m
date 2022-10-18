Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81583602C1F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:50:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F2099D70;
	Tue, 18 Oct 2022 14:49:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F2099D70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666097440;
	bh=TwczKmsg0Mo/4ZwI5MSFQ/oO9PfdbJeeylWhJ79f2qs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l7nSCFuNJ0adHIkr/soDAs5nRGlZUZs4ddSsB2b3/w7AOfQIBZ4Ld2EnLfdn3pxkr
	 OckD7gb7pR4l1T8uhyja7VvXJWzrB5TVcwlwPp7NiGR+AFmSukB+QJT23b+Io2nYtD
	 io+2o46qPtJvHG1s5ISm8dg0pB8DqpieVxmCMHcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 907E2F800AA;
	Tue, 18 Oct 2022 14:49:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA431F8024C; Tue, 18 Oct 2022 14:49:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5559FF800AA
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5559FF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ur4B27pU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 694AE6153C;
 Tue, 18 Oct 2022 12:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DDEC433C1;
 Tue, 18 Oct 2022 12:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666097377;
 bh=TwczKmsg0Mo/4ZwI5MSFQ/oO9PfdbJeeylWhJ79f2qs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ur4B27pUiM+v43sacXhmahlHVrI3vyuRbQpWRLCXgVLC1tfDjDtFmcO/rvZ7MqIOd
 /lbDHCDkmN4O7IazP+iPhEpseIbEsIGjSm983WakxcvHbGINDra1Y3r9UIHESKQ7H7
 0BhNqO+URC4kg+7urSMaFkVDmu3Ud++n4I7bS4i3/7NvJv6P8FKTCXJO+P+l4KoT7z
 c8AhdbQSj4rgzr8yjb2YnwUezO9MvZBr2PYl8thABU6WbAY56rLBXJkE2w2TgQOb/e
 zQTuBBjtwHMIMLUbk9lyZ1MMtus03fqKjalBNnjbD5Xzjp8H6TJc5zUDHgBQ2+ZoDl
 d03VitzTUyTng==
Date: Tue, 18 Oct 2022 13:49:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 06/11] ASoC: soc-dapm.c: merge dapm_power_one_widget()
 and dapm_widget_set_power()
Message-ID: <Y06g3XzdxHmHnGsU@sirena.org.uk>
References: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
 <87tu42owdd.wl-kuninori.morimoto.gx@renesas.com>
 <9b721915-1428-81ee-1be9-29c2e9d36d5f@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ceLzI03DYP6VS32+"
Content-Disposition: inline
In-Reply-To: <9b721915-1428-81ee-1be9-29c2e9d36d5f@linux.intel.com>
X-Cookie: Lake Erie died for your sins.
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--ceLzI03DYP6VS32+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 12:47:24PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> On 10/18/2022 1:37 AM, Kuninori Morimoto wrote:

> > +	default:
> > +	}
>=20
> This introduces build error when applied:
>=20
> sound/soc/soc-dapm.c: In function =E2=80=98dapm_power_one_widget=E2=80=99:
> sound/soc/soc-dapm.c:1890:2: error: label at end of compound statement
>  1890 |  default:
>       |  ^~~~~~~
>=20
> (May be because of CONFIG_WERROR, but still it would be a warning at
> least...)

Probably also depends on toolchain.  In any case a break; is needed
there.

--ceLzI03DYP6VS32+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNOoNwACgkQJNaLcl1U
h9DupAf+Mrr2mofgOEC4GdP/9+ONtbXJwq4iJ7XUmE465YpGBDmjmtcevGVpmnuh
kQYbkLpkud++Js2PatBD4njJtTP+vuwK5dULdEQMJDFn/UHKcYY1pJOX4BKXfYBN
7QgAM+UWUTv/GKh2zQ/vW4w4pmzEdTykXCbo+NImFHpYwOzF63v7vWgljtQ1Kpcr
ZWnvJheUj6UIPjKF6sPkn3QHnPRVdmv6PrhfFUxrK7/kiMdUNaBvOfu6F2pOgWiu
kAV6+wKLtPojfzpLE7pIlnKVM3o4X1t9h0l0P49LUflh5RhQKP5XAGYCF8pqABWW
KVAM6n1g0Tf6MQ/fCiF7q0gkFUCx6A==
=/xbj
-----END PGP SIGNATURE-----

--ceLzI03DYP6VS32+--
