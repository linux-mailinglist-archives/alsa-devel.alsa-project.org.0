Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 401AF199DCA
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 20:09:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA37D1666;
	Tue, 31 Mar 2020 20:08:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA37D1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585678157;
	bh=jl26SHyxAe0iJyZr0GDE1hbdlNocrKRvr1fmq6hyG5Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WCEDPpegqxudflmF+DcaDXlbCGkooyxcE4BcdM3dRJln0S0udaMeuxGjT3V+6xAXE
	 mPFm37ffOs0p5i4Y7JEqbPcEVq+23Imst9LxcK65bR6jQBfsqink5vvZSrWF5o6ESh
	 C6VdPYrHutcu67NmKGfqdzU/xpUnH+cRD3TkDB7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 698C0F8010D;
	Tue, 31 Mar 2020 20:07:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 387BAF800AA; Tue, 31 Mar 2020 20:07:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id EA278F800AA
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 20:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA278F800AA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BCAA30E;
 Tue, 31 Mar 2020 11:07:25 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BFF13F68F;
 Tue, 31 Mar 2020 11:07:24 -0700 (PDT)
Date: Tue, 31 Mar 2020 19:07:23 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?77+9zLDvv73vv73vv70=?= <gt82.lee@samsung.com>
Subject: Re: [PATCH 2/3] ASoC: topology: use name_prefix for new kcontrol
Message-ID: <20200331180723.GG4802@sirena.org.uk>
References: <CGME20200330073555epcas2p47495e0e0435e6cf34e6a5d7e248a3e80@epcas2p4.samsung.com>
 <000f01d60665$d8e86220$8ab92660$@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/i8j2F0k9BYX4qLc"
Content-Disposition: inline
In-Reply-To: <000f01d60665$d8e86220$8ab92660$@samsung.com>
X-Cookie: It's later than you think.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com
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


--/i8j2F0k9BYX4qLc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2020 at 04:35:55PM +0900, =EF=BF=BD=CC=B0=EF=BF=BD=EF=BF=BD=
=EF=BF=BD wrote:

>  	return soc_tplg_add_dcontrol(comp->card->snd_card,
> -				comp->dev, k, NULL, comp, kcontrol);
> +				comp->dev, k, comp->name_prefix, comp,
> kcontrol);

This has word wrapping damage too.

--/i8j2F0k9BYX4qLc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6DhtoACgkQJNaLcl1U
h9BxoQf/dtErOCZxcQuegBqZXoqe10hOS7KtZfQCG1lbC3FHQPmccA4pFEzqk+LZ
z+XRE0+B4ZSxgFxm3Tru8+yacymO+q+j532+I6jEeStrqnISV1bSj1nVCa3EslFj
4WkVrBKrbV8pIFSqU78asMhBsyiXPOfPbMfMSV+aZ9z9D9cO1Lem/UHCopgB206Q
uqUeGwIkcC1qEutqWejqJcGdlpk+F/uSsjOa7Y5Fy3tab0POXPpfF6wvAmhwFFzY
EX7mAMIZI2qidGwL49y5f3uMloRzHi2HYsMML9bXBWdi6pAaawSennsI1s+2q04f
O+MIag8spXQxp3ImOm2uA6i/WAKgcw==
=zPUC
-----END PGP SIGNATURE-----

--/i8j2F0k9BYX4qLc--
