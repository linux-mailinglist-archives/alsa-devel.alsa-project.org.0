Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A476A6726
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 13:13:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B1F91674;
	Tue,  3 Sep 2019 13:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B1F91674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567509212;
	bh=9miGInRnpJrfziRdvhpbhemfpOCCngASiBuJOjllLts=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YRVdT/LZW3ykcCwLAOtn5U4fBHZPdVHt4VMWSCfCAedj57T3iJol/97jdsmCvt6xo
	 9kBE0frTnmyIFutm8txxTI/vF/Qg4Agt5cC8lJTgEiMMfdCz6UMLRWVQk4uplbWYcW
	 QvzoXgO9O+yXiVVrWk99LwTkO0WUMPCBh6uJw0PI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4A4CF80228;
	Tue,  3 Sep 2019 13:11:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31A47F8045F; Tue,  3 Sep 2019 13:11:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 303ABF80392
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 13:11:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 303ABF80392
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KRtF4qyy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=argzVRzEFGHYFQGslpYsGNYzeGLhmYgxsVk0qESpcFs=; b=KRtF4qyyrckBy6LvG/OfuR/yD
 q0f225FApjOQ1n6sOGWqYVrIxkUDW0Lft7ypc7AFuKKvN7CgqMAbmlC6T5HxNtSuflXp3++C/2lLr
 aTNA8zWHeBFrmjj0jowjC1kwcZAS0FJZQoZADL4f3rwb8pM4SUKXLAt62pp01iGhNn4tQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i56ip-00083y-67; Tue, 03 Sep 2019 11:11:39 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4BC7A2742D32; Tue,  3 Sep 2019 12:11:38 +0100 (BST)
Date: Tue, 3 Sep 2019 12:11:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Message-ID: <20190903111138.GA6247@sirena.co.uk>
References: <20190831162650.19822-1-katsuhiro@katsuster.net>
 <20190902120248.GA5819@sirena.co.uk>
 <1a3c5934-4731-d474-e9d5-795e8337b180@katsuster.net>
MIME-Version: 1.0
In-Reply-To: <1a3c5934-4731-d474-e9d5-795e8337b180@katsuster.net>
X-Cookie: The revolution will not be televised.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, David Yang <yangxiaohua@everest-semi.com>,
 Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] [PATCH v2 1/3] ASoC: es8316: judge PCM rate at
	later timing
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
Content-Type: multipart/mixed; boundary="===============5408495318628823770=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5408495318628823770==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2019 at 04:19:10AM +0900, Katsuhiro Suzuki wrote:
> On 2019/09/02 21:02, Mark Brown wrote:

> > The best way to handle this is to try to support both fixed and variable
> > clock rates, some other drivers do this by setting constraints based on
> > MCLK only if the MCLK has been set to a non-zero value.  They have the
> > machine drivers reset the clock rate to 0 when it goes idle so that no
> > constraints are applied then.  This means that if the machine has a

> In my understanding, fixed and variable clock both use set_sysclk() for
> telling their MCLK to codec driver. For fixed MCLK cases we need to
> apply constraint but for variable MCLK cases we should not set
> constraints at set_sysclk(). How can we identify these two cases...?

Like I say it's usually done by settingthe MCLK to 0 when not in use and
then not applying any constraints if there's no MCLK set.

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1uSmcACgkQJNaLcl1U
h9BHBwf/URm9L7YnJCv+tUQB+bbOzUTiUQOR23hSvxTvO+aMMjXRaNFKTTj+1ZV4
h876xX+RykF8GgLvEOKMdkcmbk0UHdpj350OOLBI/8LQ3Ir/FhSHk1FVV4KM+n2V
hYBfz48cTj39UvNutOrZu7YdAG2zT3e6zgtIH3qMNj+E0CP2Xr+5qggA6QPo3d44
erXRwSRS94Og2G1bKm+Zm9wF7w/JJA766ige3ROWWgpZ+TF/QkZIlv2wczUha1U3
qFcgjJymaUV2D7RAF7R1MqlvAFSc9gqommoGhN3SebKsDt1lF2zH0sFkAqjQ1LDg
V1ET11vnqFz1nqWhMYfbcR4i1A3ofw==
=2Fmo
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--

--===============5408495318628823770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5408495318628823770==--
