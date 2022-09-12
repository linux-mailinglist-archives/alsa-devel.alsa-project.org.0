Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C375B5CC5
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 16:55:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B8C4F7;
	Mon, 12 Sep 2022 16:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B8C4F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662994543;
	bh=3uuqNEjtwj9t+tcq27DDc+DWOJcCwy9OGBZFyr/myFA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mAgOcS2sOAspdtw1/r/OaEIa0gPP5pwlgygFXGznZqlxxrcM0PIVNr/3VE9AOqY1p
	 Kf321IzvVfj0NCAMqYnb6ka12np1RXH01t1YSHS1doV5B+Fh+hDz63z9cPVvcyLvuZ
	 vO4FgCdFKlIlKFp8p2AoujWvWqyNBBR47JcRjb3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B541F800FE;
	Mon, 12 Sep 2022 16:54:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 103EEF8027B; Mon, 12 Sep 2022 16:54:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD699F800FE
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 16:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD699F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N/7Zs7c+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4363AB80DB3;
 Mon, 12 Sep 2022 14:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D95C433D6;
 Mon, 12 Sep 2022 14:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662994477;
 bh=3uuqNEjtwj9t+tcq27DDc+DWOJcCwy9OGBZFyr/myFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N/7Zs7c+lC9mCsemc5NAkbMDne0+DcE4floWtGDgQ6EefyspVLAazqI1ffJ/UoMG0
 xfF6vZ7p6hewTN4UeGxvjob2+BNkqGxO/ROGKxLz8RS/AawXDGWCCKvtovgh7yp3uG
 hkUSS6eD423V1vXOaWQn8Rx3y8raTIXHVLV6XylXn0Tqd1EHW0TRc0z6nayAsizZa2
 XaMU702inopCl39xKrvsgdqtOy2JeQbBQLXNShHK4pLwxU8pOi9se8vAeGPq54UCPE
 4iKgR7qweXpXCOzDW/emcqiBzwOmRuiebEorUmLMA96HI98RpM5BT1wNpWVyGULTKw
 OCC5gNi0JXXVA==
Date: Mon, 12 Sep 2022 15:54:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 00/14] ASoC/qcom/arm64: Qualcomm ADSP DTS and binding
 fixes
Message-ID: <Yx9IKU4+SjQJGuP1@sirena.org.uk>
References: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JAb9sFBGi317spRE"
Content-Disposition: inline
In-Reply-To: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
X-Cookie: One FISHWICH coming up!!
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
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


--JAb9sFBGi317spRE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 08, 2022 at 11:19:32AM +0200, Krzysztof Kozlowski wrote:

> Dependencies/merging
> ====================
> 1. The DTS patches are independent.
> 2. The binding patches should come together, because of context changes. Could
>    be one of: Qualcomm SoC, ASoC or DT tree.

I'm happy to pick them up if people are happy with that, they
look to be mostly ASoC changes?

--JAb9sFBGi317spRE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMfSCQACgkQJNaLcl1U
h9A71Qf/a5WfyJOVip+yc/Zeg9kIJStxG1iQ6GhnfRrxVsecZzinCisPxAU8DZHd
8JP49FMCy0PemGJooFErG0YVQDakpZ1+UDC9nbsTw49pL2BRwRwUqFpyfnlk+13T
vuEzg9AiuFDDhzn1bZ8TLNRbav4ZWMy2E21doyo90Kwrhw7NnUDYKjDFWs1QBHzV
bElJ+W9x/jcnN+0SFlYQ6j3+uQc4lJ3wK3/FORvbVDh4jbXrs5hYR6AGCEMwZ3eu
Aql7tGimMDsNe7K7fB+IcALMcJxTuLQjNHoxJ3rVg3xMjBJNxbCtJA6ue7zpky9c
CzUjMQrJL/dfdKpidaSAVhFRdALcPA==
=xtE/
-----END PGP SIGNATURE-----

--JAb9sFBGi317spRE--
