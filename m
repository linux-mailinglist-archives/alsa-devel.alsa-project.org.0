Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C25F11B234B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 11:53:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60ECE168F;
	Tue, 21 Apr 2020 11:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60ECE168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587462823;
	bh=IauNheB062Hx5TwDVP9QGchcfHWEIwmMV2csGlvp1Co=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WNq8IrBnyiWekYDXLVkGcOBVq9idrbi7OldKG0PNwTr23APRRX6IK145kxT1GERn3
	 t+fSqzuWO0Mm7at9TiaOhoYtwiCgV0r/spc1IuEssEXI+rBW9PDf7YpkIhhIEGb0RM
	 V+6esbtKbzR1TRcNeQ7lHPFfF9oPGq9vOJ6C8MVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58B88F800E7;
	Tue, 21 Apr 2020 11:52:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A53CF801EC; Tue, 21 Apr 2020 11:51:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87040F800FF
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 11:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87040F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TWYByTCO"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0335A2087E;
 Tue, 21 Apr 2020 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587462703;
 bh=IauNheB062Hx5TwDVP9QGchcfHWEIwmMV2csGlvp1Co=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TWYByTCOBPe9TYJ5N5O4IsoELB6F3vHA6O80HIcV8nnnmnt4k2pp52gP+/SHiQ274
 OqB8JJuS9/+69Dpn4TETGnXou7VQGAOpACqRHUnK5+CAXauoiJOul79OPfh5fCEUuC
 4xcWwon+SREvq5R5c8dKOQrmkudpJ9UixOjYUD38=
Date: Tue, 21 Apr 2020 10:51:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_esai: Remove expensive print in irq handler
Message-ID: <20200421095139.GA4540@sirena.org.uk>
References: <1587458483-2166-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <1587458483-2166-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Non-sequiturs make me eat lampshades.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2020 at 04:41:23PM +0800, Shengjiu Wang wrote:
> Use dev_dbg instead of dev_err in irq handler, the dev_err
> is expensive, we don't need the message to be printed everytime,
> which is almost a debug option.

>  	if (esr & ESAI_ESR_RFF_MASK)
> -		dev_warn(&pdev->dev, "isr: Receiving overrun\n");
> +		dev_dbg(&pdev->dev, "isr: Receiving overrun\n");
> =20
>  	if (esr & ESAI_ESR_TFE_MASK)
> -		dev_warn(&pdev->dev, "isr: Transmission underrun\n");
> +		dev_dbg(&pdev->dev, "isr: Transmission underrun\n");

These are error messages which would suggest a problem that'd lead to
data corruption, it seems bad not to try to flag that to the user -
surely we've got bigger problems than performance if this happens?
Perhaps convert to a ratelimited print if the issue is that when errors
happen they happen a lot?

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6ewiMACgkQJNaLcl1U
h9CKwwf/Tpe5//zRDnlqtVpZt3Oxy35CTdjomxN1dhZTt7hBudQjOITkDCoiNst3
SEvHAoPl0m/Y5PyAiZGgZlxFxttzFt7kPUskvTeDXWhmWRWjErukhTFBAbsA/xZM
AlHWU436vHLDv7G769/c+foQJxQQAnfiCmS2BOK/4K18HIMLgz+C6e78zEXkFPsX
rkvU9CKIZYUwgNB/YJ00JHWTy99JeURMB9IhF5vz9u+rKO7fflOjF+o/XMsxHsVw
YHYxXyu35bWT21LslOL2gsB5NWI6MIzRXOirDJKY3wHhzspdL3NkMOg0QFb3pSs0
ZHl2Tbk2fhTu7Aebf9LPYn11mmwaWA==
=YObh
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
