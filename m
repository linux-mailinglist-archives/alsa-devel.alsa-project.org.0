Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EE029287A
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Oct 2020 15:45:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F8181723;
	Mon, 19 Oct 2020 15:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F8181723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603115117;
	bh=W8PX6rOXCaKRqHspJHuuS7rqx2nHYinSDG9OKP9m+1E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tVPPcWoSOA6mF1s4FOrgcD8y7auaLidpGhC6VIhmKpGPdYcHjcLQ8MSdNPSKeqQum
	 RMRsZA9pO/zC645AD/ORtYDkf9nW79Q8Q9RdQGQxZJajlNSE9tyWdyxL0EOO6jr5ll
	 VNew1N5NFfof/uDP0KKNu7VVpDBKS+vvtZn16+08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE9D7F800AD;
	Mon, 19 Oct 2020 15:43:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB5ECF80247; Mon, 19 Oct 2020 15:43:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B43E5F800AD
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 15:43:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B43E5F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c1bPtZ3T"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E679B22268;
 Mon, 19 Oct 2020 13:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603115008;
 bh=W8PX6rOXCaKRqHspJHuuS7rqx2nHYinSDG9OKP9m+1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c1bPtZ3TZtgL/qyYpE+WMjTFWRKX+0oNkQQpfWmu6NjNO5QxufZ/T+NZaQfQiZ6v4
 2et9xXNslnjaD1KUnXbpwG/kl204cVr0p+jl+IMi7bG5qmQXDhVlaYe2OLVKJHscyd
 t3ndVCFFh+sYs5arfI331jvs3Zyhe0Yrs4iQQnb4=
Date: Mon, 19 Oct 2020 14:43:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Defang Bo <bodefang@126.com>
Subject: Re: [PATCH] ASoC: amd: move the call to devm_kzalloc below
 platform_get_resource()
Message-ID: <20201019134318.GB4904@sirena.org.uk>
References: <1603110689-5015-1-git-send-email-bodefang@126.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Content-Disposition: inline
In-Reply-To: <1603110689-5015-1-git-send-email-bodefang@126.com>
X-Cookie: FORTH IF HONK THEN
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, akshu.agrawal@amd.com,
 Vishnuvardhanrao.Ravulapati@amd.com
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


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 19, 2020 at 08:31:29PM +0800, Defang Bo wrote:

> Just as the commit <4cb79ef9c6c4>("ASoC: amd: Fix potential NULL pointer dereference"),it makes no sense to allocate any resources if res = platform_get_resource(pdev, IORESOURCE_MEM, 0); fails,so move the call to devm_kzalloc() below the mentioned code.

Please keep your commit message wrapped at below 80 columns.

> -	if (!adata)
> -		return -ENOMEM;
> -
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!res) {
>  		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
>  		return -ENOMEM;
>  	}
> +	adata = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dev_data), GFP_KERNEL);

This is missing a blank line between the two code blocks.

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+Nl/UACgkQJNaLcl1U
h9AlZQf4pIMSukqFAwur78kup/5uO0nSFrFowcRxx3ePupdTIvBQz3RPjMHiaSsO
ZoRY4654+ve5XZYMY54Dit+XKvjpEEhLCBlwo2AZ2JyzXxvgO3KApGv5OLwiTXgm
eWnCeJ6dwCBAcvwGVVznjbQGy7fZunyeplPlSxXZ31MM+eOxcnlnNKhl41gGln5B
p7jizhAwxPCPWrSd9H6OL8QyOcuYtNhZwi7vCeAGPhQHYBka3iyX3JjuUekYc3GN
6tgo4j19n/vhQ5ew+WiP9pwaIZmCxqRHc/BALE5fs4hsLm0zZeHVOTKiux+sNAKB
Q7LYO2QLGbNisfknv3x9c9P5of1r
=oX0M
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
