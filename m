Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F9D4709D0
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 20:07:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5797213F;
	Fri, 10 Dec 2021 20:06:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5797213F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639163269;
	bh=a/eOKH9jFHnWsEPS7CpsX8vzNK7X917Ezfg3GYiV0zY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B6IyJe6sGJBb9vy1g+SlgD6vVfXRvgBkFUNkGmuZzlN+5vb3VaPba0kbRGW67Rq1C
	 MFN37L4JFHtxj9iyn4/hmvXSe7gY7WBJuMoP+oFW6ZeRMGhtfg/1Dc/Vy0h8/sTs2H
	 P11mZA6nQQy9o1C+ZqMteMRfen2Z2LewyNVMjFv8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1181DF804ED;
	Fri, 10 Dec 2021 20:06:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1492AF804EC; Fri, 10 Dec 2021 20:06:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF18DF8028D
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 20:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF18DF8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="as5br9jZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AFE59B829BC;
 Fri, 10 Dec 2021 19:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F23C00446;
 Fri, 10 Dec 2021 19:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639163192;
 bh=a/eOKH9jFHnWsEPS7CpsX8vzNK7X917Ezfg3GYiV0zY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=as5br9jZ1hNRbJKnPfhz5/64PfYz3Pevbna7XhaZxnMZT1bKKSDgkrF58xqS75otx
 hBekW7imCkqTpMPlU3frScUWscSyPaiPFT1VmuUusv3IPfvuFYnbVZSTwkVS88Re4j
 rFPvqxPiWw4xVieHBDgptNtoB/7xW+Dzu7K+REAApLeuf/SajD2Iu3ivIInJcBEspu
 L/vk8KS3tka7Xll6EAQc9AShPtA+qRPvUg3vsXJ/gl2goxh6yC+8pPrQp94Cvgo4r/
 Gh6pgd+IF//r1znw/oDUpnlRnp6qlh1vAo7MOCatCXWRbCPunM7dvaf2naCANtBIw4
 DJwVbpgzypT8g==
Date: Fri, 10 Dec 2021 19:06:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [RESEND, v9 06/10] ASoC: qcom: Add regmap config support for
 codec dma driver
Message-ID: <YbOlMdiRc0Xirajz@sirena.org.uk>
References: <1638800567-27222-1-git-send-email-quic_srivasam@quicinc.com>
 <1638800567-27222-7-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WSzyGP1U7OF5nLGs"
Content-Disposition: inline
In-Reply-To: <1638800567-27222-7-git-send-email-quic_srivasam@quicinc.com>
X-Cookie: One picture is worth 128K words.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, rohitkr@codeaurora.org, swboyd@chromium.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


--WSzyGP1U7OF5nLGs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 06, 2021 at 07:52:43PM +0530, Srinivasa Rao Mandadapu wrote:

> +static bool __lpass_rxtx_regmap_accessible(struct device *dev, unsigned int reg, bool rw)
> +{
> +	struct lpass_data *drvdata = dev_get_drvdata(dev);
> +	struct lpass_variant *v = drvdata->variant;
> +	int i;
> +
> +	for (i = 0; i < v->rxtx_irq_ports; ++i) {

> +	for (i = 0; i < v->rxtx_rdma_channels; ++i) {

This is looking relatively expensive to run with all these loops -
there's a reason these are normally written as switch statements, the
theory being that the compiler will generate something at least as good
as any data structure we're likely to code.  It's not a *problem*
exactly, but if you're doing anything that ends up querying properties a
lot it might be an issue.

--WSzyGP1U7OF5nLGs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGzpTAACgkQJNaLcl1U
h9BOWAf+MVXmAYTXdCSSLIWm9urbvgPo+9iMFnLJXtBKu9dWuX1r3zSzZP9eO4dJ
MGGQvq0wylkBP+CxyNf8IrJX0YN/KUnh/C3pE21qQj6VQkBjUlIs6MWkGqXsob7r
zICYs1btoqDSkkOsnlvpjoWLROOX6egusSYw7p02SaA2hKfSQfoCcGLP5GSZiiF6
2TwHuFDB2Iu9qT+hf7BBHNAHDFU9BJJZB5EJwXdjC538fI/QlCKk4ARDllzVMk8H
oy3Enodc2t+Xgg3E7r4Ea/7BE8sSex8zFHaoyNMlYpYelFzBFIPuiAw1SH5sN3I1
Sh9cfGTfvBJ1VVRedUc0Ly4ssXuj0g==
=inw7
-----END PGP SIGNATURE-----

--WSzyGP1U7OF5nLGs--
