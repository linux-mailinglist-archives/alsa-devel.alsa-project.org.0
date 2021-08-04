Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C4B3E0715
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 20:03:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C18C1697;
	Wed,  4 Aug 2021 20:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C18C1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628100182;
	bh=XtYeLMT1UphzeTQrv/0yWpjX/9zyUNUmseX4712AJTM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e30skc4lZI9P7qWdfJr9QWYWzYTKXmmiETa65HFvF9NjG7eSG2fvuTukNeluDPy35
	 QT6FRELXGvREFoW9b+vuMc8KtV6WpsCqp1eQgLMrHjeqTNpY+b9JokAM/o9NzHVRwl
	 hiJlweSycGfifq8IQn/nqhqlOfknhdto28MJP+5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEC11F80268;
	Wed,  4 Aug 2021 20:01:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6588BF8010A; Wed,  4 Aug 2021 20:01:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03622F8010A
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 20:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03622F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RBDoPrUH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D121260C41;
 Wed,  4 Aug 2021 18:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628100086;
 bh=XtYeLMT1UphzeTQrv/0yWpjX/9zyUNUmseX4712AJTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RBDoPrUHYoYRPPZQouRH1CAN5AYTzl+GH48CZ24yp/mZ+cvZP4Vy5amzK7YfIH4oZ
 7Sa2f+yilull80dIK5sFvl/LfmBYe77kR4GFi0IRv7SV1d2r1wQJ7X7OU0+URNjs0h
 pEXNm0XsFrtwVuaHfCF5B2u3ttPFk1YNFIcvTX8VOIU08AcchwqvRe3WhKoPToZo6h
 9zUT5xKJIMdXzlXSYehU29Is1/al7qcJPTceXJgZbrZELB+i87BllE6ZO0BHTwBrlx
 N/39e8KgTw/7fZGJK1rxhFuDxTCzBgmg29sakmfG8f/oZHLSMnOEqNuhOXLWnKID94
 FTXdgsw0VIzYg==
Date: Wed, 4 Aug 2021 19:01:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 10/20] ASoC: dt-bindings: q6dsp: add q6apm-dai
 compatible
Message-ID: <20210804180111.GF26252@sirena.org.uk>
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
 <20210803125411.28066-11-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s5/bjXLgkIwAv6Hi"
Content-Disposition: inline
In-Reply-To: <20210803125411.28066-11-srinivas.kandagatla@linaro.org>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, bjorn.andersson@linaro.org
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


--s5/bjXLgkIwAv6Hi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 03, 2021 at 01:54:01PM +0100, Srinivas Kandagatla wrote:

>    compatible:
> -    const: qcom,q6asm-dais
> +    enum:
> +      - qcom,q6asm-dais
> +      - qcom,q6apm-dais

What do these two compatibles mean?

--s5/bjXLgkIwAv6Hi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEK1eYACgkQJNaLcl1U
h9BmLgf/WyWLyNw9CyY52qyGTgLXfSRuuRlLrbbYVsLn4Vl+v5Xv1ozpRKqbJn9m
kt9cJ5ZQ1O+AmhwjOoqMTGcysEW+g2/tbFZE/wyBBi3aI1ivrMNxizxu5QurZQMI
IGli4YflL5zoIjJbNqvyse8KbQh8l7yBuLQmO9uIM4tkiBpOPIQP+LEe+3WQkYvZ
TvlnxF1d6HOXjCegsM2ettpDZKmHgoWphX8rTrZxzLlWJjv1XPiy2vTaSPaLh3p6
qQTu8exKkqF32G8268w09xI3EGm4IyQ87jALk14e4rUc9AqxO9uXjBdVb7vcVH9V
VeGLPMII5yeIyoyudMGaKcVMiw70Kw==
=p1sr
-----END PGP SIGNATURE-----

--s5/bjXLgkIwAv6Hi--
