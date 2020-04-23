Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5CB1B5EBD
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 17:11:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F194D169C;
	Thu, 23 Apr 2020 17:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F194D169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587654694;
	bh=X4P2B2KmEmeYsLyoH8WKcYsNGId7PfauP+g0Xv1/qZo=;
	h=From:Date:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cOXuYTHPKyEdlt9jVusfOocVZ1lpwpxVTlguPxPSV4h3iKr9gJFcWs4SkYmDzjPOE
	 d/Dg5443ytXgFVpVuEoPcwfvmKkeYFs7uogweLo26NZPUo9pVGikVYxeG1LfD44AG7
	 7g7+06Qe2qIzBqZUhw/t/MtzoOdFNHa/yWKs2fBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0198FF801ED;
	Thu, 23 Apr 2020 17:09:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97CFDF801EC; Thu, 23 Apr 2020 17:09:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9745CF80121
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 17:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9745CF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WzTicfBs"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 500EE20857;
 Thu, 23 Apr 2020 15:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587654575;
 bh=X4P2B2KmEmeYsLyoH8WKcYsNGId7PfauP+g0Xv1/qZo=;
 h=From:Date:To:Cc:Subject:References:In-Reply-To:From;
 b=WzTicfBsD+41eEJoTVpJGoGTQd6YRhaGAZs0u7Xl8jrhWOCdTRu5Vfk1sezXUjsoK
 es6/7G311SI3HPxFRNIb14l6F+nghSXAG9IrIigW+VpVI4K/5TlAyz0mkY4lNj8v1U
 BnCBF3ZRLNWFhrltnZ4VErORwgem+WyJG9LUKbY4=
From: broonie@kernel.org
Date: Thu, 23 Apr 2020 16:09:33 +0100
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 02/17] ASoC: soc-dai: don't overwide dai->driver->ops
Message-ID: <20200423150933.GO4808@sirena.org.uk>
References: <871rofunaq.wl-kuninori.morimoto.gx@renesas.com>
 <87y2qnt8oy.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kVcb4xucqmsYUpQy"
Content-Disposition: inline
In-Reply-To: <87y2qnt8oy.wl-kuninori.morimoto.gx@renesas.com>
jrom: Mark Brown <broonie@kernel.org>
X-Cookie: This unit... must... survive.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--kVcb4xucqmsYUpQy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2020 at 08:14:05AM +0900, Kuninori Morimoto wrote:
>=20
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> Current ASoC overwides dai->driver->ops if it was NULL.
> But, it is not good idea, because dai->driver might be reused
> when modprobe/rmmod or bind/unbind, etc.

> This patch checks dai->driver->ops when use DAI callbacks,
> and removes null_dai_ops from ASoC.

This is fine but it's not a correctness issue since we're always filling
the same value in - the big issue with putting stuff in structures is
when you end up using the same struct for two different different things
so you fill different values in.

--kVcb4xucqmsYUpQy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6hr6wACgkQJNaLcl1U
h9Cu3Af+N49qytx79TGAjN8Tr+GRvQMolbAftGdS3ErSa7yMGZIccm5g+QR2wHOF
t45wjMKOF46bFzMIN6no/VvKpCi7LjDwX1c8WRbAKkKqxOTsztU1nHSTYAZ8Dgxn
t4qQGbpecwbeY7QoezvOOJOBteD3DDLA5OUIxU6fMfUEGeHmXT5fVj0QmftOoQtR
RGbt9wGXpVowuDqMhaXtH8a/H0lyY7SanK2CUErtLvJLl3E2rGlFfmDRqcUbozCf
XO4CKPsHht6h9kfunNhSrtBt59bktiiEC7OWiUdYcoEcWMOgp0WpXxImguhcZETz
YYJ+uDDbcPsj0T2Oy0B7yeMTvMiPDg==
=Fv1E
-----END PGP SIGNATURE-----

--kVcb4xucqmsYUpQy--
