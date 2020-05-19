Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB881D955C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:35:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F16B2175C;
	Tue, 19 May 2020 13:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F16B2175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589888112;
	bh=Y53efITvYZVtJl6cw5OV0vJ3kuKOZSH+TO6Nu/a4JO4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aLFk6MMwsZYhUpc8Pn1hv1p0ru9wQUNXkk+4q/VZ0qFTEuYhzZIqA78FudPJBS6Bt
	 W4ZcSajEnpKgXOPR06jzBxM6+CvHgPgtP/gkWkEp6wrHXVniF23yOGFFy7ctO4dn5J
	 BcrDl++yo9toT5ms1v6sgaDCuL1kk/JCHfFyTsoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3361F80161;
	Tue, 19 May 2020 13:33:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD92FF80229; Tue, 19 May 2020 13:33:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5E87F80132
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5E87F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WRHkhe6L"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93F7920708;
 Tue, 19 May 2020 11:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589888015;
 bh=Y53efITvYZVtJl6cw5OV0vJ3kuKOZSH+TO6Nu/a4JO4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WRHkhe6LzHIghFbIic/Xtb5eD4tOiZjfz2805XKsPbLW8XUsFLXHGRxiqtTevP/DW
 m2tguJ05UcZVxlM7ShVMaIRfq5lfQxao3n9ITRASVGoq6KslU530YUC9HUqgzm3Ory
 v7x2ZGfkFqfBcKi7Fq1CAzz1A/vlfsEsde0ArFRA=
Date: Tue, 19 May 2020 12:33:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH v3 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
Message-ID: <20200519113332.GF4611@sirena.org.uk>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
 <20200518171704.24999-10-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pyE8wggRBhVBcj8z"
Content-Disposition: inline
In-Reply-To: <20200518171704.24999-10-Vijendar.Mukunda@amd.com>
X-Cookie: Do not write below this line.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, Alexander.Deucher@amd.com, alsa-devel@alsa-project.org
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


--pyE8wggRBhVBcj8z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2020 at 01:16:59AM +0800, Vijendar Mukunda wrote:

> +	ret = rn_acp_deinit(adata->acp_base);
> +	if (ret)
> +		dev_err(dev, "ACP de-init failed\n");
> +	else
> +		dev_dbg(dev, "ACP de-initialized\n");

We should return the error code if we fail to suspend.

--pyE8wggRBhVBcj8z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7DxAsACgkQJNaLcl1U
h9B9bQf/dlflHvT++KFO3Fv0T5Oc/eemHC5cYA1C0EurDALZUA/3Ri2+rq3PA+j7
1aqXDH7LsvWxPbBuxRpk3Jl9gSymytMoSZox3a0anu3TPa8r2HNiSxXhE16OUXV1
+rYx4/XWSoAgZecIdBhObA4JHNpvbj4BaF8YWgyAq9q+l9iSbRSA6IEus+cFqtdW
sUkSVUGP80wdze+nJcwnjKhc5xaLkF+I1ZKh6AymZ0cgzBBSroOJvUdh20uAB18L
fYbftxeiZvd5sN1jAdI0Jixq6pKSEH3K9cOGJi5p/B3TTqsMyvhVQb1kF9KlR/mz
3wPAupVuZ6XTlPtIrsLWrFxakVRaXw==
=fW5q
-----END PGP SIGNATURE-----

--pyE8wggRBhVBcj8z--
