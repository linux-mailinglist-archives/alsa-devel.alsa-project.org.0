Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8BB426BB4
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 15:32:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F552168B;
	Fri,  8 Oct 2021 15:31:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F552168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633699921;
	bh=/7mJmle3e4Gpv9xlULJnPukFgV/2LlmCJJhy0Z+i9Yo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hbgdpf2avCoRK2AkyR69froBH3HlEtkxAdJJn1x3GILPjuMmw7Opdi6Kb/o4vZZJZ
	 wTbnhkG/QZR56vv7DCfOiqNcRALgz8nS2ynTVw/+NcfJyw8mXYneQnZhbf7w5lWk0A
	 YfTokT8GtaRhkqNLoqPopJyymfCrZ+jStRF+bkCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB8B7F80249;
	Fri,  8 Oct 2021 15:30:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20AE1F80246; Fri,  8 Oct 2021 15:30:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 300BCF80229
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 15:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 300BCF80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ni+Vpf7+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B04160F9C;
 Fri,  8 Oct 2021 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633699836;
 bh=/7mJmle3e4Gpv9xlULJnPukFgV/2LlmCJJhy0Z+i9Yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ni+Vpf7+MECOn73d/aiO4SbdMircJS+g+46EFB4pH+hrYtzkX5QlXVwMd0SySNGrF
 lM+zO2Vr+7BPGPM5oNiYXqpHE8bltiVuNkIK7UTZJxuVhbB4kttefVizOBC1CmOTL4
 BNvajbHcm600QUSO/bWOdPvTNKZHWinnWDEPdiOe6hCV+h8hUhiZXtjEvFSfg7YYwE
 t6mN8R5cFu/0z/fv3SBCyCKPp2maQtedtHjsTiRlU35JRIF5HdHHOfH7vZdac2SQzv
 qimvAI33a3m9Op4vSpDPv9XFPQGVqGkxRB8+CRUgDqRFVOZxx3s8AlztsOByRxYC86
 01KAYsglPpkKA==
Date: Fri, 8 Oct 2021 14:30:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v2] ASoC: qcom: soundwire: Enable soundwire bus clock for
 version 1.6
Message-ID: <YWBH9gAKIHJMlFlY@sirena.org.uk>
References: <1633443285-18685-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BPJD35IZkxr8pTnU"
Content-Disposition: inline
In-Reply-To: <1633443285-18685-1-git-send-email-srivasam@codeaurora.org>
X-Cookie: Check your local listings.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <potturu@codeaurora.org>,
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


--BPJD35IZkxr8pTnU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 05, 2021 at 07:44:45PM +0530, Srinivasa Rao Mandadapu wrote:

> +	if (!of_property_read_u32(dev->of_node, "qcom,swrm-hctl-reg", &swrm_hctl_reg))
> +		ctrl->swrm_hctl_reg = devm_ioremap(&pdev->dev, swrm_hctl_reg, 0x4);

This is a new DT property so needs an update to the bindings.

--BPJD35IZkxr8pTnU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFgR/YACgkQJNaLcl1U
h9AUvAf9FbBPGw1yV6XG/d/bVCgoobVsSJFVbNKFWgBaYVu18TFmfPra+yBC5eR2
2DmM38hLH90ljY/9aV76p7aBFn87KZlU/jTc8j7+LQ99UvSGNj0ztJH84d6lQMQG
0+IoK5/OX46PcYSYrhFdWAIf1ZxSM8SJSXVpLr/MGiw3GiQr8V90HIIHokeV7Fow
WyPItSKcOYUXnG9g4QsskC69yrEcfxWdrSVNnFuc2TEBqayMdW+AolYuL9T+qDy9
eI970IdonyKGcBWVc4Ag16V0v3vYyArTDPyQclw4sEb7s5QwrUpAzeQU8BcwvS3X
9sGE7ZMVi3H3B6SYPF/aDE0PUHHMWw==
=CyWD
-----END PGP SIGNATURE-----

--BPJD35IZkxr8pTnU--
