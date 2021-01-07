Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 931D92ED46C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 17:38:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C66E1692;
	Thu,  7 Jan 2021 17:37:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C66E1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610037491;
	bh=Y6gt6mv9G74KNcvYZIz48LzKMy14E/VBc6hKapkfbyQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OvCbqZF3dXyX+X+EVF/aPt7jVE+IHjyDZN+lZDtssvRgI+b12FFvlL3zr0VB0Tjnq
	 qxGgLZ+DMCy8V3yjr57vlYXXTNNeX1Wf8MoZSLzBWn1BF9VzIQbax0sCKZmJR19Om8
	 z/TdsRFRVSdp/HP5md6PLcjogpBCeQfTdxuIrmLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02587F80268;
	Thu,  7 Jan 2021 17:36:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6301DF80258; Thu,  7 Jan 2021 17:36:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B495DF800E9
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 17:36:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B495DF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jrOowygr"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81B492342C;
 Thu,  7 Jan 2021 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610037390;
 bh=Y6gt6mv9G74KNcvYZIz48LzKMy14E/VBc6hKapkfbyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jrOowygrVO+VWTzosMBF4JeX3l4NQGnOwtsvjwieA4kcg/LuVVJ5SsbZZnQ3EyyRI
 dkCm/dMgivtqnfiWKDnk29JR2tBnq9Ihk24nGxmSAyJA2eg9HHCFy8S4Fb0xl+KHr0
 MEJkPWD9ZtXAPRcfMMXXgaj1+ExqBagCYR7Rva+nq3bsv6z/Uu0SRyb2BjzOfx6P9/
 PgKSPLgIH1MPpETyj6i4rLcnr1L5txTk69kOl4gkH7LgOTDCbzYCBWIRuLX9cg/2uK
 2JVczmvoqA8cIUjQGqd2rZ6zJkwEqRjUmrUVhOkb9hHGuL3WNAr6LCh9Uzc6DEUHgw
 MFQNeVeVK3vbg==
Date: Thu, 7 Jan 2021 16:36:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH] ASoC: hdmi-codec: Fix return value in
 hdmi_codec_set_jack()
Message-ID: <20210107163600.GE4726@sirena.org.uk>
References: <20210107162640.313859-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r7U+bLA8boMOj+mD"
Content-Disposition: inline
In-Reply-To: <20210107162640.313859-1-stephan@gerhold.net>
X-Cookie: See store for details.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Cheng-Yi Chiang <cychiang@chromium.org>
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


--r7U+bLA8boMOj+mD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 07, 2021 at 05:26:40PM +0100, Stephan Gerhold wrote:

> However, hdmi_codec_set_jack() returns -E*OP*NOTSUPP if jack detection
> is not supported, which is not handled in apq8016_sbc and soc_component_ret().
> Make it return -ENOTSUPP instead to fix sound and silence the errors.

You will also need to update imx-hdmi, it is explicitly checking for
-EOPNOTSUPP so this will break it.  Having two error codes with such
similar names is rather unfortunate.

--r7U+bLA8boMOj+mD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/3OG8ACgkQJNaLcl1U
h9Dv9wf/UbvY3WD7Xvjh3PzeQd/KyOkY7dk1EJqB/AjdvHl691UGnLJfwEQwjr4d
HRrAenqcoMDX335sxHuOhL33Ax/93EtCrDHxJYciNCE0C7SfaUNf8VdqUiiSpaos
/yJGssYZPMiwtSCBgBd/YCOxnLZOs0Ntqxwly/pzrpXjbivvrCyvLRsZ3kfrW1xN
qifCxlNgdR61KRDIzrZ9NNPjc7h7AkJ+c5lw/k/TGOteuvC3js6NOuxmuqKq4OcS
cGTjO2mlSRYceg8afEL5wEVy8yi4AK35xlpiB3NEGdXJmgQS+E/6EHpiGqFKgSBG
VK+nJkIm/4TNO1l9OXdjaHcAApcqXA==
=+rGI
-----END PGP SIGNATURE-----

--r7U+bLA8boMOj+mD--
