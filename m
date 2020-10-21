Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F20E294AB4
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 11:43:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE2F7173A;
	Wed, 21 Oct 2020 11:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE2F7173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603273410;
	bh=siJzHcRRa4KFW8mbtewNQ0VwcnQmGW8vm6PQQtUwqQQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M1kBnsiPqaniOtm7gkKUMad7sQ4t9RJAsAMJmmX5SHsFNIKe/tx0j4yFiMMQpRURn
	 tQFBkvZJOazrS2SCY1O5scT/hOeATh9vDJMSpRBkh9J2XzRVahKVp2M879Wi61ZFeT
	 d9OpfKGerUJl8Yl05iiaTqvAzpQWt4mqrkUShe9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A32F8026F;
	Wed, 21 Oct 2020 11:41:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DDC3F80264; Wed, 21 Oct 2020 11:41:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE2CDF8011C
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 11:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE2CDF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YgAbg2Fi"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8287A21D6C;
 Wed, 21 Oct 2020 09:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603273301;
 bh=siJzHcRRa4KFW8mbtewNQ0VwcnQmGW8vm6PQQtUwqQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YgAbg2FieVVn/zLLhFc75BZ61Uhak3BDPQbyYk+p4SASrDumbeFaeRXG4PX2PzRGF
 byq43QZBbBO6N3GetLDXYLPut8XG/0J65osDeZr8lJlnUrUn//2e+zQMfVPohlbPgw
 KHz43NdCE339fNCA8XtfZJnTWSbIxBXAHgiotvqw=
Date: Wed, 21 Oct 2020 10:41:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Defang Bo <bodefang@126.com>
Subject: Re: [PATCH v2] ASoC: amd: move the call to devm_kzalloc below
 platform_get_resource()
Message-ID: <20201021094129.GA4497@sirena.org.uk>
References: <broonie@kernel.org>
 <1603263867-8754-1-git-send-email-bodefang@126.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <1603263867-8754-1-git-send-email-bodefang@126.com>
X-Cookie: That does not compute.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, akshu.agrawal@amd.com, weiyongjun1@huawei.com,
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


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2020 at 03:04:27PM +0800, Defang Bo wrote:

> Just as the commit <4cb79ef9c6c4>("ASoC: amd: Fix potential NULL pointer dereference"),it makes no sense to allocate any resources if platform_get_resource fails,so move the call to devm_kzalloc() below the mentioned code.

As I said on my previous mail:

| Please keep your commit message wrapped at below 80 columns.

Please don't ignore review comments, people are generally making them
for a reason and are likely to have the same concerns if issues remain
unaddressed.  Having to repeat the same comments can get repetitive and
make people question the value of time spent reviewing.  If you disagree
with the review comments that's fine but you need to reply and discuss
your concerns so that the reviewer can understand your decisions.

>  	}
> +
>  	adata = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dev_data), GFP_KERNEL);
>  	if (!adata)
>  		return -ENOMEM;
> +
>  	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,

This appears to add new whitespace, it doesn't seem to do what the
commit log says?

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+QAkgACgkQJNaLcl1U
h9BgQAf+JOwEXFuMzMDzjpL/SJstQqvXa6N4Sxd6iMSbuUka+npx/xEAcRW6OZYe
/61Xayeulywoe7DyncM23aB77FTXZ6UgJXvfMxURFa1Q6a1PJzClKriGLlkFgNbN
8/UkeUjsur/Lg1zckfGA0K7Nrhjj/BS+n5DF9cKDSdtsQEhRn+FQjPnZth/Vfjvv
xClrvK9CNQ5Y5xCrMMeUwh9obKeRbN9Pi3eQG+MFfzci0kKul1SkBZUff+PFbgML
KNYMkHnwcff23/VboGncsbyY6J0z9TWQjqKzPfD4ub1Kco0sPmBp20JCvIQtssoz
vG6caxw+Hkp9U+vmK36Rex04RGQQUw==
=ThGY
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
