Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 966C34C2B7C
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 13:17:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26D61174D;
	Thu, 24 Feb 2022 13:16:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26D61174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645705024;
	bh=9EYwuXUUNe4s56JSespRsmrf4WVo2K2M5a/Ux3TMvqs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RW5IWTS/VQwpKovgbop3E4Vm+Xn3ptAfpe+O5rWCTZpvTWdvjsC/2LTSnJjgr9lGm
	 Fvk1NkfSJLKnA/MB3Z0ado07jREIyzxnLtL3cTDREgNuQKLyrgW96Ve1N+uyebudpU
	 Bd9QPmY/mSPn0JkHTY3yRUN6O8m/2LjpE75aVGS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FF1DF800F3;
	Thu, 24 Feb 2022 13:15:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8E44F80118; Thu, 24 Feb 2022 13:15:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CF6AF80118
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 13:15:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CF6AF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EO20dRI6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EEBD3B8256D;
 Thu, 24 Feb 2022 12:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8962C340E9;
 Thu, 24 Feb 2022 12:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645704943;
 bh=9EYwuXUUNe4s56JSespRsmrf4WVo2K2M5a/Ux3TMvqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EO20dRI6IsJOnpEYkrjAoI8Gfmbt38X+lccQKIlTplkGD+mQ39K3JwP5YURGYwyM+
 bipJHv7pDLoOpYdsF9A4LJf5cwubCHeEtD8dGw9MLIL/sM9jfBbRKaide45qafv78J
 I/SqNA0SLapUbLI9tNOp8kmck8xHVZW+p/khy9R2ri5yuhICOVMl38CDiVBxib9tnL
 hyIM3Gguyjxmfx6/opYrxLAIw6xmGnYUUmy5Omjq4HQZU5zz3/LtVmORuo9g16IjSk
 dmLGWDPW6VmWy4Ldc7h0vDUlv1LPE1/nRhAwEt+LMWm9RKjoSQ/4Mbkbdt0JWxpjzh
 /aPqggDSVmVQQ==
Date: Thu, 24 Feb 2022 12:15:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v15 6/10] ASoC: qcom: Add regmap config support for codec
 dma driver
Message-ID: <Yhd26Cbe6ecbiVYH@sirena.org.uk>
References: <1645630745-25051-1-git-send-email-quic_srivasam@quicinc.com>
 <1645630745-25051-7-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FvdNv5j3qU77ttYL"
Content-Disposition: inline
In-Reply-To: <1645630745-25051-7-git-send-email-quic_srivasam@quicinc.com>
X-Cookie: You will soon forget this.
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


--FvdNv5j3qU77ttYL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 23, 2022 at 09:09:01PM +0530, Srinivasa Rao Mandadapu wrote:
> Update regmap configuration for supporting headset playback and
> capture and DMIC capture using codec dma interface

This breaks an x86 allmodconfig build:

/mnt/kernel/sound/soc/qcom/lpass-cpu.c:976:29: error: 'lpass_va_regmap_config' defined but not used [-Werror=unused-variable]
  976 | static struct regmap_config lpass_va_regmap_config = {
      |                             ^~~~~~~~~~~~~~~~~~~~~~
/mnt/kernel/sound/soc/qcom/lpass-cpu.c:966:29: error: 'lpass_rxtx_regmap_config' defined but not used [-Werror=unused-variable]
  966 | static struct regmap_config lpass_rxtx_regmap_config = {
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~


--FvdNv5j3qU77ttYL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIXdugACgkQJNaLcl1U
h9DUDAf+O6sb93bAoBGhzMwOIQTlMCUY6RbjN6tCvv7xqIeI3FKZu9UXYMvTvRqr
oozDPOY5L+qBqOgtN4YDhD5ocrIt7MD6P+vEiXxPZc7nSDJZiiu17gTIrQNAHkOJ
aiTh9Ur/Kabr3RogUR0sKm2XwLrsxBvHNpfBKG+0cKTCKCP2gcmbeA6W0AJJMesI
q+Nuh5wO0oOEA8gUyx3qAxS9JAunaHmTPrvlGx/wGoXyDJ3kx30ON/rMyrWIFCQp
ZOEJ4wqTVfc52iIHPI/GssqOwAQRuhNt/wLiAMcla4rIMS2JAu4xjUK2z1KGoyHH
f6iH6riNaGRSyCi2k2zz6Sfj9nXxeg==
=jFE4
-----END PGP SIGNATURE-----

--FvdNv5j3qU77ttYL--
