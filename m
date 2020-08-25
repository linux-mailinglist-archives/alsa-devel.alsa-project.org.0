Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA5A251857
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 14:13:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20B541676;
	Tue, 25 Aug 2020 14:12:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20B541676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598357611;
	bh=lLcZy5Wo6jWvC7rPiDhmximohADFk1jbAXM/KoH5hVQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mqLjnzeeRl7GvX7I0ge6lIgtYAkMmMecsJ3zj5/5V/goVLvMiEKIxbeQ4/bOPWk87
	 BYj6Knexj9Tu2bm40HlfSKcYhz6feZKB2NOH+mgCPUfwcOnZGCR3TCpC03b0F47AHL
	 NXbBXL9YdEOCs7Rmsh/btKvzLNmBS/+hN/9z6uJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50CDEF80260;
	Tue, 25 Aug 2020 14:11:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98AC8F800D1; Tue, 25 Aug 2020 14:11:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3697F800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 14:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3697F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NtoEFfPQ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B355920706;
 Tue, 25 Aug 2020 12:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598357498;
 bh=lLcZy5Wo6jWvC7rPiDhmximohADFk1jbAXM/KoH5hVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NtoEFfPQ4QExLDKzsR29XM4M/Hv+Kf1cudKSei+JdGaz0fTh1snxnWmUmgHiCwQJi
 WPgVVcN4Pu2OE2jRcg8B69zc0BULmNtSPu9Z/m7CPUYkS5AZ7faPAbV5PL4t7IyHXy
 6yW0DhQ13Ay17zkd3EdsQTxsjBq5yQ242NBffaf4=
Date: Tue, 25 Aug 2020 13:11:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Yu Kuai <yukuai3@huawei.com>
Subject: Re: [PATCH 1/2] ASoC: fsl: imx-es8328: add missing kfree() call in
 imx_es8328_probe()
Message-ID: <20200825121102.GF5379@sirena.org.uk>
References: <20200825120531.1479304-1-yukuai3@huawei.com>
 <20200825120531.1479304-2-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="twz1s1Hj1O0rHoT0"
Content-Disposition: inline
In-Reply-To: <20200825120531.1479304-2-yukuai3@huawei.com>
X-Cookie: Don't get to bragging.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 yi.zhang@huawei.com, festevam@gmail.com, s.hauer@pengutronix.de,
 tiwai@suse.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com, linux-imx@nxp.com,
 kernel@pengutronix.de, yukuai@huawei.com, shawnguo@kernel.org, xobs@kosagi.com,
 shengjiu.wang@gmail.com, linux-arm-kernel@lists.infradead.org
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


--twz1s1Hj1O0rHoT0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2020 at 08:05:30PM +0800, Yu Kuai wrote:
> If memory allocation for 'data' or 'comp' succeed, imx_es8328_probe()
> doesn't have corresponding kfree() in exception handling. Thus add
> kfree() for this function implementation.

> @@ -151,7 +151,7 @@ static int imx_es8328_probe(struct platform_device *pdev)
>  	comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
>  	if (!comp) {

The allocation is being done using devm_ which means no explicit kfree()
is needed, the allocation will be automatically unwound when the device
is unbound.

--twz1s1Hj1O0rHoT0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9E/9YACgkQJNaLcl1U
h9By5wf9GsLAxwbWBAbrnKCxyu9PM9ucYMMERlrYpCaWXat0bBzG/zblA6fGcCVd
UtSA/ON7K+KTqqXX7wYEK1HebOUSfemHcJDZ9OvUfpFkswXpZqkhAmcm4n4wZ0Jo
ARFpyf9ifjltEU43SfqNs9iwVW6Dj/RXghoQ6/iTh4vzXokipE6IuXiPNnxsJ09g
SjeN6JJJe0SLYLhPIcrPb7tSIv5ZB5no846dUSUdgpxKN7g0G3nGFeQjYjh63P1u
ghEhEfq9nUvhjfMZmajC1CtiUjrgf+Y+3eXDByE0p/goE9PH/nQbgTYOsHoSEExC
BviLGNDWPywLcqIgIv9fsj+ewCVfVg==
=kko3
-----END PGP SIGNATURE-----

--twz1s1Hj1O0rHoT0--
