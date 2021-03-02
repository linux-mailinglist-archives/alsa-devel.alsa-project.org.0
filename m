Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4791A32A095
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 14:23:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDF021715;
	Tue,  2 Mar 2021 14:22:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDF021715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614691407;
	bh=iytCnS3/Fqm59AJCTx4Td5YHfFiyyY8XF5Iqi/De8P4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rIPNvxKl2K/6GjJIusquJQAXL8COt7GY2bEPrQBKRlyNG6wriIjHWR3Sy0m3y7gfU
	 lCWEQsZpm9pglKWn1jHH8AaCQDUJ5wdwba77D98Yr4eG/fZGLXUE2Eacn+9rnz9CrH
	 No/qLeWyBlYzkmDA4bgCPUriuXQR6VsxSnU0rs9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19C48F80271;
	Tue,  2 Mar 2021 14:21:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54AD8F80269; Tue,  2 Mar 2021 14:21:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D55C8F80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 14:21:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D55C8F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JvfE4cxh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D9CB64F12;
 Tue,  2 Mar 2021 13:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614691310;
 bh=iytCnS3/Fqm59AJCTx4Td5YHfFiyyY8XF5Iqi/De8P4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JvfE4cxhrvhQNG1uiT0poBGzhekrWpbOlIxK5VePyKISfBBW0lWl+QjPPnYMDsQxj
 aLVRYCTHbYDFDa2i6U5CLy2RDtw++OtYk4lMJGB3yevFI4N1u4lDm47+L3H2JvSsTe
 d7CIVghk8hBQXjor5pOtpUj70VWid0EEzCgnKx1sgW7t6Seh0kCpSNYNGWstspbKEg
 jS7hl04Q9dvcbiRQrPgAn7j1ZCP04AllSdxWPUzB2w1W3EAbHoz8BN2VGepEoV0IHj
 1zFWHOJPzbnVV/lKcKtt8XuUeX/J4s21r4JRqXFQWr75enJiCzOKUdrnPgGIfUJtz0
 HLYJf/BOR4FQA==
Date: Tue, 2 Mar 2021 13:20:43 +0000
From: Mark Brown <broonie@kernel.org>
To: tangbin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: codec: Omit superfluous error message
 injz4760_codec_probe()
Message-ID: <20210302132043.GF4522@sirena.org.uk>
References: <20210302121148.28328-1-tangbin@cmss.chinamobile.com>
 <K2DCPQ.25EEALUNZ4K3@crapouillou.net>
 <76c87931-094e-0804-9405-ad4841fae2d3@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+jhVVhN62yS6hEJ8"
Content-Disposition: inline
In-Reply-To: <76c87931-094e-0804-9405-ad4841fae2d3@cmss.chinamobile.com>
X-Cookie: Friction is a drag.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Paul Cercueil <paul@crapouillou.net>
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


--+jhVVhN62yS6hEJ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 02, 2021 at 08:55:25PM +0800, tangbin wrote:

> Yes, I would have written it in your ways, but considered the variable
> "ret", I gave up, and just deleted dev_err().

If it's not used any more it can just be removed.

--+jhVVhN62yS6hEJ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA+O6sACgkQJNaLcl1U
h9D3Qgf8DCZVmc6ugbe3U+nU/APz1o3uNlnfvCBUw0+J0EN+fkVj0Aoj493A0viD
IuXCy7XCPmam3JE4yIYbnA/FzmIs+PJ36/CnKNOH22e63WxWd5zdFk1S4dW6LA1m
1ucckj2XD3+y6xGscd7FIdgX7EPoGYvKC2zB6QYBypL4mkNk09S7bjStYApaZKNK
q+3wIjc/HoGFrKwG+L5v/wDeoMA6NX+x526O+3BDCv46JClza20O0OtHg8iSE8hL
oKJxwBcluivy3SW/McFFmCIHnS8t+6B/UZ72PsSKjFkyKSqB8lgLNE5Dez/F10K8
VFuCsAchxsyOWBiVzHCjrZsDDKze1g==
=uM7f
-----END PGP SIGNATURE-----

--+jhVVhN62yS6hEJ8--
