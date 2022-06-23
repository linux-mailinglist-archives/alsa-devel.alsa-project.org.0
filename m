Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A7D55784D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 13:00:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 287611AE2;
	Thu, 23 Jun 2022 12:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 287611AE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655982016;
	bh=CfMWKUhq2LwBwXVFqnGPAdGYJgnDF2oxir15TkcTtUs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q9jwKFA6TD+UDL9BJtt2Z4smHZ3ElRJ51OB6PV3OZ4VYsGm8kRw+dua1Tonktx7sK
	 mvzkKwlk3TdcOkjMje38zPX1daWIpAMquom76jRwgjRbIiaH1rKk7tSngZwSZsqqjo
	 WzEm2IZtDb9eoebqFXLQxCfFd63I+CLnvHTyxNIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74366F804CC;
	Thu, 23 Jun 2022 12:59:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F489F800D0; Thu, 23 Jun 2022 12:59:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DA1AF800D0
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 12:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DA1AF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CAp3iHZo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3DD21CE23E3;
 Thu, 23 Jun 2022 10:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F84C3411B;
 Thu, 23 Jun 2022 10:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655981945;
 bh=CfMWKUhq2LwBwXVFqnGPAdGYJgnDF2oxir15TkcTtUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CAp3iHZoYrem1wfMXPX7VHgmKRZ1bvpp37pskrENNAXnur+1FR/Y6c74IOXH762rX
 b8QyKRQRMSGeFMTFfbdfsYFvRqGECVn/uP3jxHHREh9y9r3Exyeaq3mou2LeRsSE6l
 8Vx3xErMa61BjxoCzOOQkd+rNkg4QYPOduEWn6SS5n9XE9uwuYMzn/C/erAMf9j17I
 Wm/cvzD3kYp6mvcmV0T3Wb7LlLe13H8U5w32FMYeuqKxpraancGrgVaXWxqjfREo+D
 1TrH8adIvsUWZWNeGqpuyGvd2/RpDKd3uKUFtvd03SZ7BdnyHAnU41/jlTGiOAc23t
 N2VPPBAsvFHiQ==
Date: Thu, 23 Jun 2022 11:59:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: core: Make snd_soc_unregister_card() return void
Message-ID: <YrRHdJdlmryopCU/@sirena.org.uk>
References: <20220621145834.198519-1-u.kleine-koenig@pengutronix.de>
 <165591900215.1405752.6651339800557082462.b4-ty@kernel.org>
 <20220622205046.by5jnrql6psaev3u@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PhGv3YkaA9Ljwtt3"
Content-Disposition: inline
In-Reply-To: <20220622205046.by5jnrql6psaev3u@pengutronix.de>
X-Cookie: I had pancake makeup for brunch!
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com,
 lgirdwood@gmail.com, nicolas.ferre@microchip.com, linmq006@gmail.com,
 tiwai@suse.com, kernel@pengutronix.de, codrin.ciubotariu@microchip.com,
 claudiu.beznea@microchip.com, linux-arm-kernel@lists.infradead.org
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


--PhGv3YkaA9Ljwtt3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2022 at 10:50:46PM +0200, Uwe Kleine-K=F6nig wrote:

> Did you see the kernel bot report with the build issue? It doesn't make
> allmodconfig fail for me (that's why I didn't notice the issue). I'm
> looking into it.

Yes, it raced with me queuing it to apply I think.  It doesn't trigger
in an allmodconfig for me either.

--PhGv3YkaA9Ljwtt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK0R3MACgkQJNaLcl1U
h9D0Ugf/TFSPks3W7rHR+ZY6qTZ9dmpDzmm31LrYZZDaeHqCI8lsSp8Zgp0MhlIb
a/RgNHEr/diZbdc0nHOoBv94q7aMeDXranSi5ICpqa4kpA4e6ArrEKvsYBVlvMkB
JDfH2uJ69YXZt5DM3QvRbwi27BWfGkbjFF4jtI3Yf771DS3nysZon6LDctGeWh0W
0uhMJGiAorjNciY7DkG90H5YVSVspmyBO9Hb5evt75D/mcDhve0UQFBF0BY52HD6
vK8fLKeft7t9xuj6H8e2cf++l99Zr63w5xu74ZBd3r1IzwtGsbU+QNdPaHPHs9GG
BUkoInrWuooOPlm+exW8X5WdWI32Pw==
=uLLe
-----END PGP SIGNATURE-----

--PhGv3YkaA9Ljwtt3--
