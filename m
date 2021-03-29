Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C0034C4AB
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 09:15:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3191F1614;
	Mon, 29 Mar 2021 09:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3191F1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617002147;
	bh=vucYtVVBFOdlaUJDpayw+vyhoSr/ByEee5iGD2n/2Xc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cIGfl3jUeqgTMJlU5btYXQp/VgCNkNk7BhO6O3UlCoDPYXr27MuJR3Z28ZUNcgOKZ
	 i06TxrX/uO6Dt2meq2naVazVvobvkxQEJBel3DRfkTZSg1E7OvdrtRvZgP1DzmM9XB
	 JbFsKy/IIoI5wJOPjnlHd4wH/ToHsOeJFG7kdXbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8797DF8015A;
	Mon, 29 Mar 2021 09:14:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0BD5F8015A; Mon, 29 Mar 2021 09:14:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFA20F800B9
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 09:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFA20F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="O1Lhqri/"
Received: by mail-ed1-x52e.google.com with SMTP id j3so13000149edp.11
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 00:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DNyW7G1yT2hTo5u6qo+I50JVd8C42OgcsWqOflCzXh8=;
 b=O1Lhqri/67H3A4ntvRGIydscVPwxr/qAV5aGyhnIbjAHlV+nk7mWe6nHtno/pegeZf
 SM++FZT5GqiihoyqQcOac3ePKzKfmpCeSGM8moJG2g3Mq5AF9yvvt6v9HVLf0O11tUKf
 biwf750LE+xhmiOFBed+kOsBYKW8Nr0Hv1l/+B9uWaWFc4vu5w4iOg1udlS6rG1dTMQq
 fiL//aT9e/bxD0IXQoHzmR25OsMyjTFdgAWmrt6jF15IXHmi+kLfV5EH7Y+AFcGJDHnH
 cgJpOrHj5HjHWNyE+WyWzuhwnbXl3J+qKRhguHEvI5eKtdfvxYnKsdPLaEP13R0hqZr5
 RR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DNyW7G1yT2hTo5u6qo+I50JVd8C42OgcsWqOflCzXh8=;
 b=HuXcq2UjVAMYdkvqrCBhsnXdVHqr9S4p1tUqvxbuJ1dgNn13MGWFPTYBebkb1CA3kn
 BzRroG8uqAJyJF11FqreYu3eNYf0IE6iD2FP8Pm8vssEIj2BR/IKr/poBxg1EngQkLNX
 nohpzwZd7j+olkm1fRNuMUx+wPDSSw/Ji7ukYBIUievJ3xjuQpMuDY4yCRlm3Jo+31g6
 T8SSXknyNLK/5STsliiemVrlrklw5hgzSCvdul6/dU/RtJWI9gU/PRJer9pFVHE0/yo+
 6IwhHCO7ffZkKKVgZ4cjudXVpw7ivvByX5UHLg0o1Je6bTSu9W+6+SL+Xj3Zb/Ob8vle
 VhNQ==
X-Gm-Message-State: AOAM530tNYtBUGNhIk58BhBrFtasi4V0ak9wQjHOWUEUAD/XYh1uCW+o
 oMwwoSzxe8wan6orE2v+eq8=
X-Google-Smtp-Source: ABdhPJwVwW5cVDZlYzF9U4PsBjpggA44GaTXotCE7zMC/gqmx+8jDQerBxH6zaPOFWzoUAR1vbWcKA==
X-Received: by 2002:aa7:cb4d:: with SMTP id w13mr27168220edt.249.1617002051233; 
 Mon, 29 Mar 2021 00:14:11 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id a9sm8475486edt.82.2021.03.29.00.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 00:14:09 -0700 (PDT)
Date: Mon, 29 Mar 2021 09:14:35 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 12/17] ASoC: tegra: tegra20_das: clarify expression
Message-ID: <YGF+W2Uum+pHkH6F@orome.fritz.box>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
 <20210326215927.936377-13-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u16SdL02k7B5NOWk"
Content-Disposition: inline
In-Reply-To: <20210326215927.936377-13-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 tiwai@suse.de, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 broonie@kernel.org,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
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


--u16SdL02k7B5NOWk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 04:59:22PM -0500, Pierre-Louis Bossart wrote:
> cppcheck warning:
>=20
> sound/soc/tegra/tegra20_das.c:64:60: style: Boolean result is used in
> bitwise operation. Clarify expression with
> parentheses. [clarifyCondition]
>  reg =3D otherdap << TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P |
>                                                            ^
> sound/soc/tegra/tegra20_das.c:65:61: style: Boolean result is used in
> bitwise operation. Clarify expression with
> parentheses. [clarifyCondition]
>=20
>   !!sdata2rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_P |
>                                                             ^
> sound/soc/tegra/tegra20_das.c:66:61: style: Boolean result is used in
> bitwise operation. Clarify expression with
> parentheses. [clarifyCondition]
>   !!sdata1rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_P |
>                                                             ^
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/tegra/tegra20_das.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--u16SdL02k7B5NOWk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBhflsACgkQ3SOs138+
s6GRWw//bi/X8imkX0asE+iIbIjEB/8g0DDtXmC2e58GwHBjtrzNy5YnJGEvD3MX
KDFYn0bSoGKTy+g4SQe86WyPY4m45WEjWJipDG7Y84HxlQrpZfBfLgTYoT6LxLBc
vFoNwz7POLiegrL7xrPXyd1ut6JIm294V5rAO10lDX5o/nW7xXfI0ocV5FE/rcJh
YUSg1l2ITZ7E9pdV3kpaBvfqPUR6jpmHnGWNG7G47tmp0fyjNMIRi6zplq2OGz0j
rXYVU8w1/BxFM4LtCAmo1Fb0Wv9SwZm6u7t4TH5YWChPrRqe72BsI8JXiBGljCf/
dKWANs50A1tg/V8A+cQUycQ/UfSnH82GR0NjxoMyvNTLzlRklQHrYu37T9Umhy8h
ER7k0MT5833AKFCGFn/WN444JgDkop0jl77WICZITHuDXUDf58VY1vi3lBYWRNcO
XNwx/keXxo9NxR7dogIGSDKXtLhgv0REHKRw0Svfic7aRJGHzETUANbMU3CRfv4y
KsLm8JFQ5lnLkxPNYIrwrR2cfmKcTGXs+7JWAulUaZpasekEdguPwwTy4gKmmcz6
VyMv0w/ZcjV7dlnY5EAR/WqRxNBUUiTQ2vvHAfOXa51DuCkdhCqSwiTdKHBaTXZ+
qo8j1m0qkmaptH2mzNpvSxplcomiqVfVKogkp0d57frRFWsqeFk=
=sfBK
-----END PGP SIGNATURE-----

--u16SdL02k7B5NOWk--
