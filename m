Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B03213D14
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 17:57:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33F6916AB;
	Fri,  3 Jul 2020 17:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33F6916AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593791859;
	bh=Fwb0iJ6mVcp04VHQWexbTvxsCiVNKg6ZNoMpsYLJboA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mD2cXco/+wTh3SWt9BO7dlZPaM79Rxkm3YFLoRWdf3RfjPwbuXT+BgpFJhX/meZrP
	 HhXqNL2jsdSH9slw4dgym0ZvkZQZjIV3jfjplC+aFFH8/faSTK3UH2sAvyZDRB+G4h
	 w3ewhWCro/mzURCQFkUQRD943ytfnB6noyRUBN3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6326FF8021D;
	Fri,  3 Jul 2020 17:55:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7899F80217; Fri,  3 Jul 2020 17:55:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFFD1F800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 17:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFFD1F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jOpysPRu"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B17420737;
 Fri,  3 Jul 2020 15:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593791751;
 bh=Fwb0iJ6mVcp04VHQWexbTvxsCiVNKg6ZNoMpsYLJboA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jOpysPRuDr3Z2qxjIAg0GOpIqxyWnWgUf0RMwvW1KzR2P5YGytArk+3MuuzkBzn7V
 K5GnEQbu7HtJyloD8PkOJblpECREXxZCqBOIKRKkoR5wO2Mss1R8FEZciWW1JP9LFI
 YIHC8WSRmM5QyPtfDyl3yqFeaNn4DbY2RqWt8Vjc=
Date: Fri, 3 Jul 2020 16:55:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_asrc: Add an option to select internal
 ratio mode
Message-ID: <20200703155548.GA17656@sirena.org.uk>
References: <1593506876-14599-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <1593506876-14599-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Sin boldly.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, festevam@gmail.com, linux-kernel@vger.kernel.org
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


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2020 at 04:47:56PM +0800, Shengjiu Wang wrote:
> The ASRC not only supports ideal ratio mode, but also supports
> internal ratio mode.

This doesn't apply against current code, please check and resend.

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7/VQQACgkQJNaLcl1U
h9Ba6Qf+Pt9/pqEBOEoCDH8/qYlQD3h2YcW8V7LV+bs0lwfMFzHxLPRt7AEt8s33
2CXRTYZvxM4yEcF39OVz1tcKlhk9xzxMhI9OeVspxsaGmImHDDWpwBeIJLze+Tj2
xiUVftkSpVsWvgbDzG+l6CraB0KEmH7T7/t9/OEbetNyc6r/w9wkkQ32TGtvUPFY
PfP4CL5O3K0LpRPyF60C7pMGALCa/ktqrfRVN+6h8M0HQ7/JNejLc302JqjvGCAO
0jACiNqj5u8/3UgMCB+r7iUPNkjDxwheTQw3Y+PWMisQbtcnVq5Qyn5jVoJXLRjk
MzyJtIbWTBUnEVoWiifcNPVUerGMvw==
=vKxS
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
