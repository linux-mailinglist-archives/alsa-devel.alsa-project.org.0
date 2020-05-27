Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B0F1E4010
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 13:30:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A25C17B5;
	Wed, 27 May 2020 13:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A25C17B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590579000;
	bh=ef/jJPV9ByXtDirUxMky79f/X31SPpgZBquKZf4ExGg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FW0Y2BjThf4VgcZdZXsI0VIQ1awkiOQkNOtOlhqo7aiBxmaHRP+tSfwyAQmXPoAh/
	 Ply3FjgufkbT6kplLKFnKeEE5S+Bz197NJa7/CJeYueXoYvCOciawhmtIGxZ8VI4A0
	 lrSoxBNkD2kyVWpzuqqX5EGM1WrmsRz9TGctGsmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA1ECF800FF;
	Wed, 27 May 2020 13:28:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BC04F8014E; Wed, 27 May 2020 13:28:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64261F800FF
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 13:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64261F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RJY9LUFf"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE186207D3;
 Wed, 27 May 2020 11:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590578881;
 bh=ef/jJPV9ByXtDirUxMky79f/X31SPpgZBquKZf4ExGg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RJY9LUFfHCypglbuznceow9Hw1fql7iGoKCpk7ydeFGTRHjnp11jxf5g4owd2Cu3g
 itrvhN5P5c8PfdjW2ak56F3khIJ3z4UQGG+M3pUr/L7g6iSO6FfO5WP9i5dUxNfm6W
 IQzLRr9RP7/vfapSeVgVqbwwy2Ix4404Ii47l1IU=
Date: Wed, 27 May 2020 12:27:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Akshu Agrawal <akshu.agrawal@amd.com>
Subject: Re: [PATCH] ASoC: AMD: Use mixer control to switch between DMICs
Message-ID: <20200527112758.GE5308@sirena.org.uk>
References: <20200527014023.2781-1-akshu.agrawal@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="imjhCm/Pyz7Rq5F2"
Content-Disposition: inline
In-Reply-To: <20200527014023.2781-1-akshu.agrawal@amd.com>
X-Cookie: Drop in any mailbox.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 yuhsuan@chromium.org
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


--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2020 at 07:10:16AM +0530, Akshu Agrawal wrote:

> +	SOC_SINGLE_BOOL_EXT("Front Mic", 0, front_mic_get, front_mic_set),

This should probably be a mux with two labelled options, or if it's a
boolean control it should end in Switch.  A mux definitely seems like a
better option though.

--imjhCm/Pyz7Rq5F2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7OTr4ACgkQJNaLcl1U
h9DRYgf/akrvrra3kUeV1yqD3LwP+z/Awi1I/4x2sgSYHYzVEF60MkdDjY8+nYNZ
YMvWIEcZYxu7AuOR6dKmzK6ogV0E2dTfiy4IaiftYE+FpFjVQSLml2E258WF4Fyl
5Uz7BzoBvRT/t3YseDiZ1MPR/PiA/RbA38oiE//OKqLNQvEo+TZFf6Z/mzh6v7Fy
BhN9D7wbAIWk9LNzvlx/F4w+W9oOc822A573binK00Ye7oTZGz1jr1hZ16nzOTha
BmwljhOAM2VQW9Lly8uz3DfHP/P8z1X/Y09/EoTiEiH83v59zVL3vh3s4GrcFX/m
JUsmP5670wkUeRvmMe4muY+0ReOj7w==
=YKkv
-----END PGP SIGNATURE-----

--imjhCm/Pyz7Rq5F2--
