Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C66C3611668
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 17:54:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 594F318AE;
	Fri, 28 Oct 2022 17:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 594F318AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666972470;
	bh=Lr1MwqXp3hb+RyMzAElHgRcN7Y4whufOoogdp/QICXE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eCtiD3uTPmaDPtPUQ0VEW9rmtNmHbx2hyvbY2DuMqhYRf4OyXhNMctm/3Nsm0xzym
	 NgCnF6LME0EFi6WCc7cL//6MvHWfj7nnd84lNFTYt9vlMUyfMUGWhF7Ab8B4lk6bf/
	 uUZ/M1V+I1BU0NoazEU0I/X7WihahtsbmxiGHrdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC38BF800E1;
	Fri, 28 Oct 2022 17:53:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 905B2F800E1; Fri, 28 Oct 2022 17:53:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 790CDF80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 17:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 790CDF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kTgfPiGx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 94BC0B82996;
 Fri, 28 Oct 2022 15:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3B5C433D6;
 Fri, 28 Oct 2022 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666972407;
 bh=Lr1MwqXp3hb+RyMzAElHgRcN7Y4whufOoogdp/QICXE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kTgfPiGxN+g6J1oqeP/b8waZLuwwYlzUeopDw3tKWQ2fLSvWeEmx2N0S+KBOwV5GM
 8FFZrFsAkI0qDCT8MI4PkZELaDiYF/g6VfedIdEUD5piGBOYpwrvbccRsj3k3OqXF/
 u0S3AFqp0J2kVByxUJDqFhrfztIqZuPtJgLxM13IUU5ikfJbLZgHq+RhkBRB2mOiGV
 LqMsA0GRAGHVR9R1tmd7hUSa4p/8glzeP6wkYLniQgnXce2B9PbYSwbGj71aQh08dL
 08Bnw5+OzrtGq4dhLXSnstJefE5LheVFTH6huSer0knqkKZANbfESvRLPpJfaRszGe
 mNiDn6nWvYxng==
Date: Fri, 28 Oct 2022 16:53:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Maarten Zanders <maarten.zanders@mind.be>
Subject: Re: [PATCH v2] ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N
Message-ID: <Y1v68WuDck1oaVmk@sirena.org.uk>
References: <Y1vyMQ8Jj7/smeC6@sirena.org.uk>
 <20221028154534.112175-1-maarten.zanders@mind.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zDVZfyM54uy1DY0q"
Content-Disposition: inline
In-Reply-To: <20221028154534.112175-1-maarten.zanders@mind.be>
X-Cookie: Life -- Love It or Leave It.
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Fabio Estevam <festevam@gmail.com>,
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


--zDVZfyM54uy1DY0q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2022 at 05:45:34PM +0200, Maarten Zanders wrote:

> commit 203773e39347 ("ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk=
")
> commit 2277e7e36b4b ("ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk")
>=20
> Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>

If people send tags like Reviewed-by please preserve them unless you
make some change to the patch that would invalidate them, that saves
people duplicating their effort checking patches when they haven't
changed.

--zDVZfyM54uy1DY0q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNb+vAACgkQJNaLcl1U
h9AwBwf/b90319UQfp1/m9HiG8Biyy4dC4eMZuLMs/OQl1kflINQp2JtHId2cqlD
h2nn5TBXn1MjDqqAK0asOXUEh29VNS77YdTQiF6j39vZdhbeezG1WTy8DBBjmCT+
6z5QYVIC1wkdOxCvqUf98QBMfZ/7hjHrmkc4MRTRRq085IPkuLxU9OrZUAVVTBGd
jDTMjT0VM3uwjvESDZJ3/4cah2+9RTpUni9BEyXvbHf0qWY2yiE+13TjiJ1W9Y7p
c0FHtp0VhJJrBnquCrX1J2PRGLeBuLdquNbAJN+wTsi9k6emiebjg2iG1mxxLXp7
4i4G99xn9OdJ74Lle+g48S5+eWULeQ==
=c6ad
-----END PGP SIGNATURE-----

--zDVZfyM54uy1DY0q--
