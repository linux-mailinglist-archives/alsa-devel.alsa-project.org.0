Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 860F9584103
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 16:23:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 298F515F9;
	Thu, 28 Jul 2022 16:22:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 298F515F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659018229;
	bh=1ZLap4eGsbbvgt1gdvMRC3A6YG6dEbs+KXGpBQ82L6A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AdX/ozqX/fNeRKMpYQFHkoC01IfGVHNedS/RfJMBrl4c9ud5si0sGV0YFYRwvZooJ
	 PWoBz7f92xPeD62im7mfrOttfH5HCPaTeDN/A8h0Yk0i88Wx0YEk0Pe/RYw0q/CpBe
	 ZHb50P5IQ0xnohH5soohOYJ5FIjDVWodQdsV2250=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EDCBF8050F;
	Thu, 28 Jul 2022 16:22:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59B9EF804EC; Thu, 28 Jul 2022 16:22:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,PRX_BODY_30,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEC1CF80141
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 16:22:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEC1CF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y5HXFfFE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3BFBA60A6E;
 Thu, 28 Jul 2022 14:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4054AC433D7;
 Thu, 28 Jul 2022 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659018156;
 bh=1ZLap4eGsbbvgt1gdvMRC3A6YG6dEbs+KXGpBQ82L6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y5HXFfFEczrHiYs6Rl6biGP/3nCuiwwHhNo5YOCtuOoUXlh+PjOtaQvXtoOkqxEy/
 i1kASCXtevXkWsrAGL0cxLUWWREmlRmXZY1WbeqcUG8VJnmZrGEqioo4nk+iAPOQck
 AOYV4w1LOL/5SQKe9uWRhVHfF8SdK8J7GxXOrCCEpmHY1HC/IocRZQHLQEWh95XwY8
 lAJ83JrcqscTu9NY7kk1EBShHN3GDH7SbGq0lUUS/pqOlYpb8/j/wRoGvFJhTkh1+5
 AnYoV1tbRWgRTeRLTcHWbtgmw2auX5VDc/xWKUNGTXcEczX56KitMzAMmRHGtSIEWk
 PjpcEfcl4u7rQ==
Date: Thu, 28 Jul 2022 15:22:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v2] ASoC: qcom: SC7280: Add support for external DMIC
 bias supply
Message-ID: <YuKbpXVOeGn2l2gd@sirena.org.uk>
References: <1659016789-9933-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MxtsZ/7dcBrss2UQ"
Content-Disposition: inline
In-Reply-To: <1659016789-9933-1-git-send-email-quic_srivasam@quicinc.com>
X-Cookie: People respond to people who respond.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com, quic_plai@quicinc.com, judyhsiao@chromium.org,
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


--MxtsZ/7dcBrss2UQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2022 at 07:29:49PM +0530, Srinivasa Rao Mandadapu wrote:
> Update SC7280 machine driver for enabling external dmic bias supply,
> which is required for villager evt boards.

> +++ b/sound/soc/qcom/sc7280.c
> @@ -356,6 +356,7 @@ static const struct snd_soc_ops sc7280_ops =3D {
>  static const struct snd_soc_dapm_widget sc7280_snd_widgets[] =3D {
>  	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>  	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +	SND_SOC_DAPM_REGULATOR_SUPPLY("DMICVDD", 0, 0),
>  };
> =20
>  static int sc7280_snd_platform_probe(struct platform_device *pdev)

Don't you want to connect this to something?  This won't do anything
as-is.  I can't see any references to DMICVDD which might be failing to
resolve in the current sound/soc/qcom.

--MxtsZ/7dcBrss2UQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLim6UACgkQJNaLcl1U
h9Dk8wf+MsLnuYuJIjjPKX84On6/bVQTcNFnLcE6zWzTDjoWVmdWlUpcngQ1j7I4
mW5T0pKVL53Y8VcFCFuY5+awvsL3/tfCfKLpRjoRAhd1rG9kApq3RpgVyQ2OIR1A
ZbzfRK363FCoo/7EmnenWk/QH9u8jlNU7G5vfBcf8C2VOBwepUHt15YdW3xvHDtv
J0OyhPXNMuVCAGmhxTRc6ZbAxTbSu7R6u5aW0RquI+Ovfu6G/Hkcf2Yw0NYAd/Kb
RUP0UjIwsek2lGqM366yItV2PGLDjKNMHDtCZ7i07otKl5TrG5q2DsmY1M+yhnHF
2U9y6ryaWhXclqdx5B0vtki6mnCf2Q==
=Uifj
-----END PGP SIGNATURE-----

--MxtsZ/7dcBrss2UQ--
