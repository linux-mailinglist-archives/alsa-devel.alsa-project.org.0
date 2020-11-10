Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1932AD5BF
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Nov 2020 12:58:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C7BF1721;
	Tue, 10 Nov 2020 12:57:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C7BF1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605009506;
	bh=YryXYnKNldudDO/RjAz80bAXrbW7/qbSF3tU+VW8eT0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sl0BUfVpIe9jUpcDipQiJUdYPI0Tt0ckw6iDezgIsd/oEzAwtv5nx4jpFpjYZ/fx+
	 1sFLQTMa3t+tsJT5oy3wL1Bz0ORZkuwSRZvWMmfXVtSnsaFr9I/D2/r0/3DPDUAdJN
	 fuTDkJ7HVlFC75SibOHCcq/Izk8+LmHj0pIP1FZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1F31F801EB;
	Tue, 10 Nov 2020 12:56:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFFDAF801D5; Tue, 10 Nov 2020 12:56:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52532F800EB
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 12:56:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52532F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QDV5JKZr"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A84EE20678;
 Tue, 10 Nov 2020 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605009406;
 bh=YryXYnKNldudDO/RjAz80bAXrbW7/qbSF3tU+VW8eT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QDV5JKZraXd4PgJ4NstqiTlrlzLQdcoRw2n9tyyBrQ0/7KCCZWJ7JAlHBmIHBFps5
 8lkXJxSkhjzdeouUKFsggexk820zmoLe7TN+BF4FxJqnj+oyBq/X50SdHrPHHsUQO3
 bvVHp1xR9os+ukKwR3X0/21Alpj+n3EXFYWyThPc=
Date: Tue, 10 Nov 2020 11:56:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v6 0/2] Modify documentation and machine driver for
 SC7180 sound card
Message-ID: <20201110115631.GA5957@sirena.org.uk>
References: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
 <CALprXBZCthdkxGbJBZZ+ESJRDBHY879FZMpB_4Mgpq1YAJun2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <CALprXBZCthdkxGbJBZZ+ESJRDBHY879FZMpB_4Mgpq1YAJun2g@mail.gmail.com>
X-Cookie: Disk crisis, please clean up!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>,
 ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ajye Huang <ajye.huang@gmail.com>,
 Patrick Lai <plai@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Cheng-yi Chiang <cychiang@chromium.org>
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


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 05:40:40PM +0800, Ajye Huang wrote:
> Hi, Mark
>=20
> Could you please kindly review the series patch v6? And may I get your
> approval if the review is done.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+qf+8ACgkQJNaLcl1U
h9DxYAf+Ml8fbU5qJTIhVmWOIV4EI0pby5cVXJ8Jm2A/+6RqBfDCWb4wpO3Znxbn
8GZnLxdDqCAQ0Ej/aTIDFS5ssSjOluIxZb0D4awtsX8Czodu8881Clpg2vlKlUw6
Uc7PsqBs5fGjPNpmavFnmL3Mu8JAhIuZBFF58Y1FDR5ns6A5fLa7tfFfO0Wbuggo
rk0vvB/2lxH8jdPqM5U0h7XM0wixDmB+MDPnTjSKHtb2bbfuBik6NzVQn6UdkrTj
vVKNExPim4TwFRG7WfVZkTBfhybxziwuFM63n0P1UCjHLIPG2Ay1lBwsPXyxrg/4
dH2Xo1C2aS2VZy5o4pMtXvVBCawm1A==
=oGFb
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
