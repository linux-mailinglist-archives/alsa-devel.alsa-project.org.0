Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD17C913A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 20:57:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25691167C;
	Wed,  2 Oct 2019 20:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25691167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570042646;
	bh=KCqABMLOVgJLBurlPUe/TwRIz/QVO04sRajD4qnUOe0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T+kV+/5sgWZH55Ko4/+J26rlTDDwEKYWsqVKJQEoMevZWfPseZWh8fMHusJp9rW3J
	 lJTROo3hfmcCfH/jvh9NrVf/VE9IAQpg+N2xKqgHZFnK+5fQP3V+UyxhlDQmkd9uCD
	 HPk4VurY9E7tQshGxOtjEmr3ytFR4e+pKCMEWfF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A47CF80391;
	Wed,  2 Oct 2019 20:55:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 230B4F80391; Wed,  2 Oct 2019 20:55:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F9C3F8016F
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 20:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F9C3F8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="IFWg83Q+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=itztzdefBd9Pzdrrkj8Qr8LC3/m0NABGz3HkwXQeJ2I=; b=IFWg83Q+loI8D3EBavVNKZWmW
 htPtk9WH8OF2GOKJY3jqE4uhIf8DiVgMydImE1T5CM3wBxD90/uFsAycRSJSf864rbefuI84G8JzH
 yXv3cZupTaKT/TWO31kFRYKnv0bSmxIlsZuKyIbdFPQJcTYUvMGFyJabMtcwva8ygV6zE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFjmh-0002GH-Fm; Wed, 02 Oct 2019 18:55:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6F56F2742D0A; Wed,  2 Oct 2019 19:55:34 +0100 (BST)
Date: Wed, 2 Oct 2019 19:55:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20191002185534.GB6538@sirena.co.uk>
References: <878sq3bu2t.wl-kuninori.morimoto.gx@renesas.com>
 <877e5nbu1z.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <877e5nbu1z.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Pardon me while I laugh.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 1/6] ASoC: soc-core: use devm_kzalloc() for
	rtd
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
Content-Type: multipart/mixed; boundary="===============5543491197483371125=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5543491197483371125==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2019 at 02:22:32PM +0900, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> Current rtd, rtd->dev, rtd->codec_dais are created by normal kzalloc(),
> but we want to use devm_kzalloc() as much as possible.
>=20
> Created rtd->dev is registered by device_register() at
> soc_new_pcm_runtime(), and it will be freed at
> soc_free_pcm_runtime() by device_unregister().

These aren't using devm_ because they are done at card init time and so
might happen multiple times when other card components get removed and
added.  This shouldn't happen too much but if it does then it could end
up consuming a noticeable amount of memory.

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2U8qUACgkQJNaLcl1U
h9COmgf9E72xFcvejFsnMYDORlYSJbKhr6CFu2eNMLnA3XEsxd/+ZkAbfQ3Hom9a
ot+G4llyfK8Hdt8I0pAqNMWig5TylWXOgHMRJfBOU36NdIU+iQBTNWaQ+/HBtUQW
P0ICS9K74VUKVAeunj+9KsqdoCJ31RQT2H/dY23tGlbItYp0OEC+7xUws+RoJv2t
yW9gazQ4/RJDZM8QoevQl5I4jBlbkk8QTqhwaDGmriwhFqBIeI4Z+DPPIIWClnOm
mVE1fmEaz8UEiGXR+gfotnOqA5UseqHzOh5aa2UeTlrMrCxVJFR5IZZ4yXDbxakb
4NfJn4md10EZT7oVL9PPGA3fjJJOIg==
=9Ch+
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--

--===============5543491197483371125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5543491197483371125==--
