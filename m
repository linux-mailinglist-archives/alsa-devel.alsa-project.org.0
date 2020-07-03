Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A522141D3
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 00:52:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C21F716B0;
	Sat,  4 Jul 2020 00:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C21F716B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593816733;
	bh=++Nj0WS/fbRoG0cYbUYNYqTBhY1hGfBC+wzNoS4TTOg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iLQB3ExINGObyyrnKA7I109z1SF4dCE8XQ4+4bkQHe0kgoG+zhi4e3mWezDNry49X
	 O5xCeD7tZmUwmXg0NS+93DlFx4rMDCsKHehASyGQx92lzHfbDfLvuRZ4rNCCcWzDcq
	 sxO9+gCuFXaBAbQEusMVuH8UfwZREEPWf8ig7nNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5F7FF800E0;
	Sat,  4 Jul 2020 00:50:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CF43F80217; Sat,  4 Jul 2020 00:50:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED976F800ED
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 00:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED976F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Utl9Q+dL"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13D6C21531;
 Fri,  3 Jul 2020 22:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593816622;
 bh=++Nj0WS/fbRoG0cYbUYNYqTBhY1hGfBC+wzNoS4TTOg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Utl9Q+dLN0qukZp4Udwg5OOtrBeg3UBgS740gFxT4OZF2kru0R8LXQFFef3WW6dKt
 L9wNatfUbwk4cpgbL/HvYjQnJSYg0BQofovZP3vD86gY11OAySg8Ez+DFhZN/2Q4sL
 c05QdOHl8yK5ujur8V5wVvMa2XqgyTprLVSiAVO4=
Date: Fri, 3 Jul 2020 23:50:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_asrc: Add an option to select internal
 ratio mode
Message-ID: <20200703225020.GB29047@sirena.org.uk>
References: <1593506876-14599-1-git-send-email-shengjiu.wang@nxp.com>
 <159379581381.55795.16716505708033817338.b4-ty@kernel.org>
 <20200703224656.GA16467@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline
In-Reply-To: <20200703224656.GA16467@Asurada-Nvidia>
X-Cookie: NOBODY EXPECTS THE SPANISH INQUISITION!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, festevam@gmail.com,
 linux-kernel@vger.kernel.org
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


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 03, 2020 at 03:46:58PM -0700, Nicolin Chen wrote:

> > [1/1] ASoC: fsl_asrc: Add an option to select internal ratio mode
> >       commit: d0250cf4f2abfbea64ed247230f08f5ae23979f0

> You already applied v3 of this change:
> https://mailman.alsa-project.org/pipermail/alsa-devel/2020-July/169976.html

> And it's already in linux-next also. Not sure what's happening...

The script can't always tell the difference between versions - it looks
like it's notified for v2 based on seeing v3 in git.

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7/tisACgkQJNaLcl1U
h9CDTgf9ElvPFLdEUZthk4VSCqaieXYbsCqPXsP+cbaZLW4aECwO25C2crwaAeLH
cP3VDBeRC1DMrnD5GTM4mqkVBkcfjXWVqVZ2BNkWQ3InpSvBb/ofmZ1fjkpKCdrc
UpSq2wrcMeGWf1/rYlpgXdrzV7a5S/RxLJiLU2ipHvs9ajHWV33bGwvNN8ug4APq
QH9RIhvDpWSM4V/D0eT+eIQtB+qdo3Fv/Db6f4fF9Ugn2pquAqZ4bmzvniqn2Et2
zMDgEDA34cgB4Jm9D2Le7X9ySsROTLwpPv+XbsM8Sl2f/slHeYRHTr3vW4kJFBhG
jkjwRIcv54fqhLCkLPFqhPvLLoMKcg==
=gzcN
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
