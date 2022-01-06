Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5A54864A3
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 13:55:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1B3F190C;
	Thu,  6 Jan 2022 13:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1B3F190C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641473708;
	bh=SmNlDlUm3zQNo+NJsHbizSEC2ta9YZo7B/3hUXR9FlA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BpqrxKtpmKhdX4+e49iltv1+C+zE9tJmX8Vtpi4i1bFfksbYtgl58ArS4xYcQwUy5
	 keDn6d6e7l0KuN+a/t9pGmL+ghCoGzG1WEeo55QWq2Xi76apF1uy2oeFhGn5+mdbIa
	 LoysMBf+jaofjd2t2qlo2A+YEhK9uhzGSOmOUC8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16532F80158;
	Thu,  6 Jan 2022 13:54:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 072A6F800AE; Thu,  6 Jan 2022 13:54:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9B30F800AE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 13:53:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9B30F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GRzmIPeF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21460B82070;
 Thu,  6 Jan 2022 12:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662C4C36AE5;
 Thu,  6 Jan 2022 12:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641473632;
 bh=SmNlDlUm3zQNo+NJsHbizSEC2ta9YZo7B/3hUXR9FlA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GRzmIPeFfriGEeGR5YBgKMsHKD7sWoBwH0h+5q313TnmlzB2njBgCsFzXBXgW9wJz
 1LNqIZ4rt+rm7VwR4DnbDlcqxecWxdQ9EKJhO73h+4oOxh5BTAnwI4oIDMT5Ky1LSY
 2HkjxydqqjxI/BNKvXiz07kIg/S9/W+4oVABqmPGHwm2mYLrXM5NQl1NVPiZNWnpJn
 tNo5nsaiJc+bU3qv2jNvBrIaFy/95f8GS2q2856CyjwPmBmp9OIVMdbKJaE/e1MoCI
 zhrr8HDopwZewLQ5GhM7/R2YXtQTR2FnYR/ry6ASw49Hi5lG+mqgkaCWuhmnGpUI5B
 lTX1M5Y8TDXMQ==
Date: Thu, 6 Jan 2022 12:53:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Subject: Re: [PATCH 5/5] ASoC: simple-card-utils: Set sysclk on all components
Message-ID: <YdbmW8Oj7FLXkAxG@sirena.org.uk>
References: <20220105225146.3517039-1-robert.hancock@calian.com>
 <20220105225146.3517039-6-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wWQb7qRXVZWrWzv3"
Content-Disposition: inline
In-Reply-To: <20220105225146.3517039-6-robert.hancock@calian.com>
X-Cookie: I think we're in trouble.
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 michal.simek@xilinx.com, maruthi.srinivas.bayyavarapu@xilinx.com,
 tiwai@suse.com
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


--wWQb7qRXVZWrWzv3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 05, 2022 at 04:51:46PM -0600, Robert Hancock wrote:

> +			if (ret && ret != -ENOTSUPP)
> +				return ret;
> +		}
>  		for_each_rtd_codec_dais(rtd, i, sdai) {

Again, missing blank line.

--wWQb7qRXVZWrWzv3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHW5loACgkQJNaLcl1U
h9BtqAf/e57HOyWbRnVpR4puJ8GnPgcEfLzAAiLtJbEZ1iz6Vsf/fIP34zxGrTqC
Sh8pzvfzEesfEUbSdBs6NJ63XCVmuw+57Gn7KFM5XpeV1FzO5DCZFxvRpZ9dDETg
gfDW7LuIswGF78xV68fZbxKgKiFxOvoDgTodAwWefMqVVts7Ddsk0Rum5gfAzyCT
70rUb0i6ade0UnO7CTlhgDxjEOUA7Ov5HTWDfFpQXArbDDlwKu2ZLkIcRAOMM5HC
ytyb5hg/t0qmcLL/ss6VelDLmGrr4I5X7Uq1VzcfQZL6kUbfo08KATeJs3Wa6m4n
dyxTFWUKjxW0gk/lzIzGOrY1yNeySA==
=U4rB
-----END PGP SIGNATURE-----

--wWQb7qRXVZWrWzv3--
