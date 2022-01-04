Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A9B484778
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jan 2022 19:08:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D02817F7;
	Tue,  4 Jan 2022 19:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D02817F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641319694;
	bh=txfvS+Gitakuv4kkZ9OkxwiKDa6QdbuL+sIHK0c2OxI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FSKEFjyjvenmfRTvLFO2zFN47j3g0+po0kLgLXRKeV5En433Q9hWQ1cYaJk86GXUM
	 nfj1+WjA9DdvHFmgtpvgqbhC8XFvGp8pUyuLVqlTtGenBacq+vwID5iM6dGMxjiWBA
	 0im5iMPgaaFHKeXnV7xUZd2X/HIWBVxRCeID2NA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C23EF8049C;
	Tue,  4 Jan 2022 19:07:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AE3FF80424; Tue,  4 Jan 2022 19:07:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73989F8027C
 for <alsa-devel@alsa-project.org>; Tue,  4 Jan 2022 19:07:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73989F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TODSu9Pk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 28C55B817A2;
 Tue,  4 Jan 2022 18:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34CDC36AED;
 Tue,  4 Jan 2022 18:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641319620;
 bh=txfvS+Gitakuv4kkZ9OkxwiKDa6QdbuL+sIHK0c2OxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TODSu9PkSjLNlNUJyBzC+8Cdt+Ux36ZiJX6gytEt0Sg56BXO3Eo1sgHAjb6ZJ53U6
 03ekSEye8DfpM2W7iS7LpZ//U+8LjI7GaY1fi09XDA+FbBnRWVEkBOPCaA+bCKqJ2B
 UcAmuTuICA5nzHRaPCUcIjm41628b+o0qXaQopyYLY9i5PO4mMSGS5/60uLRMvchqz
 6SlVOosnsr5UNzLgSvKMyCUOYZ8mbpw7fKA4uh/1AStk5NpgZK7aGSmAWu9DNWTW9i
 swxQBKY3tXMy4CqNMly8wyByj2/HWX9TQDMEJ2AGBFWaFlSxz9Ck2BETWKTUDHkDnV
 xpKmO8fLsT+MQ==
Date: Tue, 4 Jan 2022 18:06:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/3] ASoC: imx-card: Need special setting for ak4497 on
 i.MX8MQ
Message-ID: <YdSMvtXHsYWl7E0U@sirena.org.uk>
References: <1641292835-19085-1-git-send-email-shengjiu.wang@nxp.com>
 <1641292835-19085-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wM9Rnn4bmiJ3jtwv"
Content-Disposition: inline
In-Reply-To: <1641292835-19085-2-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: The horror... the horror!
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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


--wM9Rnn4bmiJ3jtwv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 04, 2022 at 06:40:33PM +0800, Shengjiu Wang wrote:

>  			/* sai may support mclk/bclk = 1 */
> -			if (of_find_property(np, "fsl,mclk-equal-bclk", NULL))
> +			if (of_find_property(np, "fsl,mclk-equal-bclk", NULL)) {
>  				link_data->one2one_ratio = true;
> +			} else {
> +				int i;
> +
> +				/*
> +				 * i.MX8MQ don't support one2one ratio, then
> +				 * with ak4497 only 16bit case is supported.
> +				 */
> +				for (i = 0; i < ARRAY_SIZE(ak4497_fs_mul); i++) {

Shouldn't this be keyed off checking that we are actually running with
an ak4497?

--wM9Rnn4bmiJ3jtwv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHUjL0ACgkQJNaLcl1U
h9DLtQf+NYjFfOunR2kagpHatM3uw3vj6y2ywBhn8AKl0Ar0TPugAPIBV7cClQVk
1sHU5pGUol0aOrSl9c/y+uccKTxxK+dZs3jnI2RX3u8n9UdW/tsiQepu/rkVgMYy
SZdNhfcCp0VkJGYq8099YjMoo0zH4WUC5b5Ph0Jb0c80dixXJ2LCFtcKoKaxMkHZ
oYCJrpeu1LWU4b9hqgjkuRpFpU2ihQWuHQQwMIXzqk2+zdRYbyGabWRdxnyN2F+8
3LHLlPlUXGdyomQfUFWu//LqMI1Yi/xqHDeyk1Oi7WFduA4WvFuSrwtaHDqSpX9E
ds+WpmNO0leJRKzk7+c+U8iIqlXt3g==
=8shi
-----END PGP SIGNATURE-----

--wM9Rnn4bmiJ3jtwv--
