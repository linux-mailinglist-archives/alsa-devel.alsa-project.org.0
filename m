Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B721C625F90
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 17:33:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40E221658;
	Fri, 11 Nov 2022 17:32:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40E221658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668184406;
	bh=p/hgZ3rU0we6hP1xNAjo5J5GgA5dWBa4Ua+wJnrBtcA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tBhIep0lyMtKciWA1cpPPSlBeGZ+tTyvQsEwbR++Pbc8Rwre5trDfcT2Y+RE2tiKL
	 6crpHAaqpB6a5armeiGptJKVCYFVrPK5SbkYQDvU715Y0HcL5YhxU9rboA7fQmxSqJ
	 GJYu1OdL2X0iQGTKXrRA+tLma2YS+QUkW/kmx9xo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD2F9F804AB;
	Fri, 11 Nov 2022 17:32:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEBEBF8028D; Fri, 11 Nov 2022 17:32:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FF17F80162
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 17:32:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FF17F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HWyh+C2s"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 66E4561E9B;
 Fri, 11 Nov 2022 16:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67FFC433D6;
 Fri, 11 Nov 2022 16:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668184342;
 bh=p/hgZ3rU0we6hP1xNAjo5J5GgA5dWBa4Ua+wJnrBtcA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HWyh+C2s/UDZ7rwK5cpzxbj/PFRtcNOvk5ZIbNwHEdnSXf6BC/6ZE94yMKNQ9B8DI
 efcq+ig+PgD6JKmOIK4wHtPWf9b1IISEjjJwXDOOZZIkr4HqpWHiGp/O+fY7OOqGkb
 a9862wdfMp23Aujy1GqseZlxlPgswqwf9MeMhFY/vSb+Oiwpw2+O0WmOJ2CYqFCxCh
 6ny3DRBplnJ9YtP/FUyZlK/4MD7/ox48jkUyIYBXcnj5nMcKjFA0I4bDa7sbAWnUCA
 69z4zFjmt0gJA+8uzUgIuXNCUiocIQJ3+Z3YPA9eFLnNz5Q0NxeJjG0C8cC/ej+0iU
 WOei1QLNDLx6g==
Date: Fri, 11 Nov 2022 16:32:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,wsa883x: Add sound-name-prefix
Message-ID: <Y255C+TGNVJ9fs8A@sirena.org.uk>
References: <20221111091738.34290-1-krzysztof.kozlowski@linaro.org>
 <Y246wC8zEGJp9SmC@sirena.org.uk>
 <29620da4-fda7-eb71-d9de-599e3bbd2de7@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yL7dWziKYiIamsqH"
Content-Disposition: inline
In-Reply-To: <29620da4-fda7-eb71-d9de-599e3bbd2de7@linaro.org>
X-Cookie: Should I do my BOBBIE VINTON medley?
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
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


--yL7dWziKYiIamsqH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 11, 2022 at 03:33:10PM +0100, Krzysztof Kozlowski wrote:
> On 11/11/2022 13:06, Mark Brown wrote:
> > On Fri, Nov 11, 2022 at 10:17:38AM +0100, Krzysztof Kozlowski wrote:

> >> For multiple speakers attached, it's useful to give them some name.
> >> Sound core already supports this, so reference name-prefix.yaml.

> > If we need to manually extend the schema like this it should probably be
> > done for all the CODEC devices.

> Several files already do it:

>   git grep name-prefix.yaml

> The trouble for me would be here to identify which devices qualify from
> bindings/sound.... everything having #sound-dai-cells?

Pretty much anything could potentially do it, it's a system level thing
for when the same device gets instantiated multiple times.  It's most
relevant when something creates user visible controls.

--yL7dWziKYiIamsqH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNueQoACgkQJNaLcl1U
h9DiTgf9F5Oet7q8wby5hcHu+I8U1kwyboOcEArroSZEaYzKVe2n1mmtTR0UZcUp
BCLDSI5wI4cGZS1O251ItWJP2OH/YVTob/tqu1Ywt/vupPOTZdHRKkIGsawuqvyn
PVB4MVmLJfwutlN1kUMAQAY8mU/69DBNRngRR5aa3mUBDWv5guex4fpMhMNCfvnT
e/0wPAWtWDmGzZcr/p66siZwyYN8jaU7JZH4Ddn/DHRWxu0uXF5xKRqWV2JCYmGC
M+5rqvZIBovkAnv9MFVDt6cSy7NekJwwkfFcuEsv9FCldXJvPBw6NvRIP2sHbhDa
PXHLb4fI3VkUqbzKdHPU1we7F09XeQ==
=hl+y
-----END PGP SIGNATURE-----

--yL7dWziKYiIamsqH--
