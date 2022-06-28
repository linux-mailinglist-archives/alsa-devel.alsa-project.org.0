Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2F455C087
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 13:04:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13E05209;
	Tue, 28 Jun 2022 13:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13E05209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656414252;
	bh=cXZAwlkQXVqn+VF+ltYlbgx0SfheynAIgbkGijygw0g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZMpYAEXW3Y/bo1glrhAb0QQ4+cFoqurBg2md9yAPNnDwHMuKF5OAy5w9oboHyK6u5
	 Z+7+dDDZMf5H0xZMWxTAegfnEpGNVflHFbaM2ybR1OX6LvwdV/ikfJ3iKz76sFW9o9
	 pSWHz9+7WS9kukf6Z9vCCUyPNxxiEfdk820nfisc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BA5FF80115;
	Tue, 28 Jun 2022 13:03:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFC41F80167; Tue, 28 Jun 2022 13:03:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65AECF80163
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 13:03:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65AECF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AeRPVnF+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD37A61993;
 Tue, 28 Jun 2022 11:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65916C3411D;
 Tue, 28 Jun 2022 11:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656414187;
 bh=cXZAwlkQXVqn+VF+ltYlbgx0SfheynAIgbkGijygw0g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AeRPVnF+ibzKwLV3Yk656zKEXnjnz7dRGdxoJOlTVVptJz1lhV6ddWUxH+E1etfCY
 +phOPaIFf0CaeFrdhf45kaAU57TlgT3TJD9ZKWUDioR5Ftc4sBZJMDYqXtvSMAaqyg
 AUvqXbqDMFCZQPUFuKfjTdlyt0F4jc04zzZmJKnY+adhnkCle+6bTr20dmsEX2F6u4
 yI92wh0tExvBK6M9N6/C7xqJ6DH+8X4pc3NFOpacKrpJLmGKI1HW+G24wU87j9mTek
 MkBdgA/ebSEyhJQGU3QxP9rlO00zM3dEw5LmC64kC27e6r6LUcIAK18FdCIg5fIMF3
 UjBFXoVPVzY2Q==
Date: Tue, 28 Jun 2022 12:03:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to
 match yaml
Message-ID: <Yrrf5X8wstW+DXHF@sirena.org.uk>
References: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
 <20220628002858.2638442-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AjYvj/PcXvlbfxKw"
Content-Disposition: inline
In-Reply-To: <20220628002858.2638442-2-bryan.odonoghue@linaro.org>
X-Cookie: Do you have lysdexia?
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, krzk+dt@kernel.org,
 bjorn.andersson@linaro.org
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


--AjYvj/PcXvlbfxKw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 28, 2022 at 01:28:57AM +0100, Bryan O'Donoghue wrote:
> The documented yaml compat string for the apq8016 is
> "qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
> lpass compat strings the general form is "qcom,socnum-lpass-cpu".

This doesn't apply against current code, please check and resend.

--AjYvj/PcXvlbfxKw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK63+QACgkQJNaLcl1U
h9CptAf+JkFUuLoyhEDBShd1Q2xada6xhRmtYa1tWIjDmZ5Cxm9yQgVAZVOohbOV
SwZ2T0U47hDZSYhauK0HovPkPih1KlTorxBnTz3BqXpHRCxvF3LktPhFuhjXErBF
bTtl+eixOeTFxXXv+XSvH3pnN+6c/dIPrOYp/WMUY+Hk8fVVWrH8qCYoHuKpdGLj
WUzD6GUCfkt4vQNF7viLkEXPKvECX3IKZ24oPuylSg89tur8V+pKOzuQQZAjm8P8
4kDRW+KG/Yen4TRXpnyeCOko00pZyky8Ya+tRQl99xvJ/2UwgCyUkQcy50vjPadM
ggJKc7s6pyVXORXPqKePhds/N/87Yg==
=K7oH
-----END PGP SIGNATURE-----

--AjYvj/PcXvlbfxKw--
