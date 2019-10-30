Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B37EE9D2B
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 15:10:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 824DF2308;
	Wed, 30 Oct 2019 15:09:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 824DF2308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572444602;
	bh=BPHB3dOsxeF1qrNkQgkWU8tH1YeJRMuaofr57yNjBPs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h410goU4KDsbSQFp2X77e9xlxI7IycTPFdvBBmgK3wQUlzgu29AGtUTTbzg9QMEFe
	 bc2GXovD4JuuOpfmiegY3rd7evE80Rc/LVwd6rDLDspsuIgEiZxD/QseDEbcv52dG1
	 ULaW1fdZ+5fzDO9/zTvBT3PQof6VG/OP8cJvBcOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19E13F80600;
	Wed, 30 Oct 2019 15:08:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B063FF805FE; Wed, 30 Oct 2019 15:08:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE6F0F805FB
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 15:08:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE6F0F805FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KsOIJA/d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XIGXDgt0I1fqbUkMpSR0kXLaYpzztRRQmayL+dWJlhw=; b=KsOIJA/dZNpZahFRkoC4yB8kw
 IEFqAWo83lJIVxrfcboGN9RM4LWT2nMAduAsA/H7iA4WDWUMKIo6cQOavjnD2usxd4X6OsTlH6mZb
 g/EquGofvNkAxuHajgKbS7onI67oWQHi/PjFM16DAeZzaMCS5o/ODFCfRxWrE998SJW20=;
Received: from [195.11.164.221] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iPodi-00057v-V3; Wed, 30 Oct 2019 14:07:59 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 96A4BD020A6; Wed, 30 Oct 2019 14:07:58 +0000 (GMT)
Date: Wed, 30 Oct 2019 14:07:58 +0000
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Message-ID: <20191030140758.GL4568@sirena.org.uk>
References: <20191030085556.14351-1-shumingf@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20191030085556.14351-1-shumingf@realtek.com>
X-Cookie: Keep out of the sunlight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, derek.fang@realtek.com,
 sathya.prakash.m.r@intel.com, flove@realtek.com
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: dt-bindings: rt5682: add button
 delay device property
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
Content-Type: multipart/mixed; boundary="===============4137174591108144012=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4137174591108144012==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C7Ke/meiCZutM6I/"
Content-Disposition: inline


--C7Ke/meiCZutM6I/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 04:55:56PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> The btndet-delay device property could control the HW debounce time.
> It is easy to adjust the sensitivity of push button.

Oh, sorry - it does.  Usually the binding update comes before the
code change but I should've checked, my bad.

--C7Ke/meiCZutM6I/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl25mT0ACgkQJNaLcl1U
h9C4Uwf+MlMFuZ23fexm47dxmfGMGfKm4L8QD/s+Hnpq5/ZZ/+groXVPz2ijcvm0
GVpsmLRedHzgA27MML+q7JiPCloHceJ6PORM9IoFg4UqV/E4j9PLA0v/rB02vFf9
GpyN2vuz0fZdh4F5Tqdu7JMGaV6FWOO7VVja6wn3swdni8wcw5FQgBsCs6zCtJEG
XVCny9dnEZmlp6xWFD9f4VqDCUYeUuDrmFVbg364o6nX3YAOGp9RGbqrdW0arBjM
4KNLYyVpl5CDqLxvJsDuJ42VKdmRMZdVTiB+skaTBz11zJytjF9Kr+2cNdnYIGU1
SR9zdXz0qmnAU8T+0vWneHoin82iCQ==
=jE7H
-----END PGP SIGNATURE-----

--C7Ke/meiCZutM6I/--

--===============4137174591108144012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4137174591108144012==--
