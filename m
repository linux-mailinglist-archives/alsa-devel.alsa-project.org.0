Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 459E94B5606
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 17:23:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C97F618AB;
	Mon, 14 Feb 2022 17:22:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C97F618AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644855789;
	bh=qEwq4Wh/5idQ4A2e+iKpPVSvtXQzvCrJ5eNIEXQ4q94=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rPe3EsaDR279fOakSc1KjfRCjOWZHRSdcvNPrBeYn/HUMbGqY7cHG96R6mv8eqfx5
	 dqfbGxZvsIDEph4NYxZXuoIZCNOnL1xlyaDvXkeIykvXGrwOgkuK5TmvfpBlzHfTZZ
	 lsPxYewMiASxlKvtC4uRFvB3c80dZr5ZpfOAI3PQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D9CEF800D8;
	Mon, 14 Feb 2022 17:22:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43AC3F800D8; Mon, 14 Feb 2022 17:22:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91E3AF800D8
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 17:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91E3AF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DGlivWF5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1C041B81100;
 Mon, 14 Feb 2022 16:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A90C340E9;
 Mon, 14 Feb 2022 16:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644855713;
 bh=qEwq4Wh/5idQ4A2e+iKpPVSvtXQzvCrJ5eNIEXQ4q94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DGlivWF52HwgMNQ80euf2rG0krx0swohHpXt/fikP7GtRmSM9p2qQWlh4ySIHpQWI
 M9NY94I6KPxgqyMXnPC1ga2oxdKEDmnzClX6/wQdTDdNQJLqFnp3zrY5/hROTew0f8
 8Lrm3FCC9zxJrAUMKTNqpuEE/K7DXStHKcULFjvgQGeDIHi5SJ/KfNfUUpSBGwoIsi
 C3Sfh4Y1XtZhUpnoGHgi0hlRgNWyWHPSwSqA/mexLkaUjBKxVI8pSKp546r1qlIotm
 Zx2L+7EnAiqHwSHuBRciD9y3q6hAz/LF8n0LaIH4ewbuucOtoBHEhg4zWvkG5uJdtc
 RO1YKv0Q925Tg==
Date: Mon, 14 Feb 2022 16:21:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v13 07/10] ASoC: qcom: Add support for codec dma driver
Message-ID: <YgqBmvAQvh9WRMj+@sirena.org.uk>
References: <1644832778-16064-1-git-send-email-quic_srivasam@quicinc.com>
 <1644832778-16064-2-git-send-email-quic_srivasam@quicinc.com>
 <YgppMcVjs0KuE5y8@sirena.org.uk>
 <669f2d39-8c14-68b9-6d89-a26e0e2e8857@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BgkULJaiFKZhJKvr"
Content-Disposition: inline
In-Reply-To: <669f2d39-8c14-68b9-6d89-a26e0e2e8857@quicinc.com>
X-Cookie: Am I in GRADUATE SCHOOL yet?
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 rohitkr@codeaurora.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 quic_plai@quicinc.com, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


--BgkULJaiFKZhJKvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2022 at 08:10:20PM +0530, Srinivasa Rao Mandadapu wrote:
> On 2/14/2022 8:07 PM, Mark Brown wrote:

> > I only have this patch from both v12 and v13, which were sent very close
> > together.  Please check what's going on here.

> As only one patch has update, so sent only one patch. will do resend all
> patches if needed.

You should always send all patches in a series, sending only some
patches at best makes it very difficult to follow what the current
version of the series is intended to look like.

--BgkULJaiFKZhJKvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIKgZoACgkQJNaLcl1U
h9BvMgf9FGQNXpy24DbHrBE271iFyFSYKquxP9pmvVBT6VapB9cXZsV8RFzyOWdY
67DkWKvbsS3CckRTRXsHc2byeDyD4knoyxOYSK8Igg6hcMdliSi6whxE2C9Qj4Ew
n5CimQJf7QkHVQQ+BodS6iqEalUyhU+pa8J54bdmXFikzd0Qi9nprpc6uhjaeS9A
3QewvdNGEz5dtUxLdClpef/2WCuGF8qY/iGNxleotra7EgTqGg2njfvrPflDQN0L
XEk/287Y2NOp8SMJVJWBdIBDWoEQ0CM5mLraYn8cyjg73J69E5Ss9P7SwoUZpq7o
64XObDdLEYmLdbb6/xB8pHwtRMMwOQ==
=Edqc
-----END PGP SIGNATURE-----

--BgkULJaiFKZhJKvr--
