Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 768EC4C362C
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 20:51:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 069D51920;
	Thu, 24 Feb 2022 20:51:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 069D51920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645732310;
	bh=8xsZGWwjXv7cnRarGpQnyDw9mQoGNr7rSbI+e2asYPE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hPRCMtxBTAFjaLJu6OVWXFdU0h/9qAD7ARDv/+jumkrqiZf8WVdeviPZXzHMqkm6t
	 FC9I+wZs222vBu6hAqwiGHAmimXeAJSLofIzhoExKwSBfPrLKm8mQmssPDyUXRynHU
	 R3YN5fkJG9YMdMFPwZdBYwRAYy0mLszhdOD44VzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F05F80310;
	Thu, 24 Feb 2022 20:50:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91FFFF8030F; Thu, 24 Feb 2022 20:50:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E175F800F3
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 20:50:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E175F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D+7+mnur"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 564506170C;
 Thu, 24 Feb 2022 19:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50395C340E9;
 Thu, 24 Feb 2022 19:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645732234;
 bh=8xsZGWwjXv7cnRarGpQnyDw9mQoGNr7rSbI+e2asYPE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D+7+mnurlkrzPUi/r78FbvehdnSEeF8WqcKgku78MYtyKCxkVSejeIRIC9sguz6qK
 zzENdoFMyCuSXm/2Yaf8b/Z0FJ1w2qGpH/8QMjfsuxlKBqxb+HR/mvAi7ubSJaxCvY
 W1omnMVv2zxFweonRgjVOB7b3crbLsQqK+0CzXQ7V4P+J9CdRwTL4QdHHSMO+5V5md
 YC+QzPPKvrEfl7NZ5yW5r0nT0HXMqPRvbOup9e1oPooYS4BRwN0foSSwxFDaET/gyq
 Q/JfWSy23nth1KCMjEJY6gZWYqF86wfXVsSZz8WncIMCtzAnB5iltaAS0NF2vEnftA
 rDNV7dQIaBZpQ==
Date: Thu, 24 Feb 2022 19:50:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v3] ASoC: codecs: Add power domains support in digital
 macro codecs
Message-ID: <Yhfhgrvl38WcNOFu@sirena.org.uk>
References: <1645708759-8833-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7N28iCaW0tsV26lc"
Content-Disposition: inline
In-Reply-To: <1645708759-8833-1-git-send-email-quic_srivasam@quicinc.com>
X-Cookie: I smell a wumpus.
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


--7N28iCaW0tsV26lc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 24, 2022 at 06:49:19PM +0530, Srinivasa Rao Mandadapu wrote:

> +	l_pds->macro_pd = dev_pm_domain_attach_by_name(dev, "macro");
> +	if (IS_ERR_OR_NULL(l_pds->macro_pd))
> +		return NULL;

Shouldn't there also be a DT binding update for the users?

--7N28iCaW0tsV26lc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIX4YIACgkQJNaLcl1U
h9Ar2gf+P1DXI3jrG/N8JSEhOsEnIRpZ3hzB1gV86SjrpMkT9QH9/z/RD5pyWp49
EC4g6Qdwatg7wK62yEeqfrXP0VgbP5she7silonyEFCznDycxQgBTy8p3Twn4OXq
nsaVoeEHQkvtKNaleckz7pgfDyNkLdM8HxiS/xldfVFGkpjq/whXEjOgQwGq2t/B
SPbvRiYnEZDIxBEOjJXtmi5wTQe1MsbG/1aOxz6SQDfVECf6drS6FUwW71Li+Ggv
Alv09mzQeaGRCDCSUlDSn2wR/UazmQ92TBngzBl17QKjLeiJ7BWQIKyCHG34vjvR
VAIXMWWSCKxwmkHShmvqZbHd9SzNYQ==
=qS1/
-----END PGP SIGNATURE-----

--7N28iCaW0tsV26lc--
