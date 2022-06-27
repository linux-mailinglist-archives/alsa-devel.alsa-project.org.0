Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7B455B974
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 14:15:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C283D1666;
	Mon, 27 Jun 2022 14:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C283D1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656332116;
	bh=TSzHAHQfMmFipcqU92GkicfWoead864mZ2vofTvD9O4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nIKO364YNWvp8VdNosEjZBk7UBVkCkM2tlOAzvf80BBUg2GUt4YwIYS7Di9+s33w5
	 bCwS9P17NY1dmJbo2cKNHRTPveDv5H59SUNCZ0b7pWSMgHN/pqp2DcJ6kutEPMzF5f
	 8ZTrqUWCD2qHMvOdLIX59JXxei8It/FNv3ENAgu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81876F804F1;
	Mon, 27 Jun 2022 14:14:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D85B8F8028B; Mon, 27 Jun 2022 14:14:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FB0EF80128
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 14:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FB0EF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QtVXeozW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3973C614EE;
 Mon, 27 Jun 2022 12:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E05BC3411D;
 Mon, 27 Jun 2022 12:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656332052;
 bh=TSzHAHQfMmFipcqU92GkicfWoead864mZ2vofTvD9O4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QtVXeozW54y8gZ90XrRMsEs9Ok5tM9i/pKZqxRKPXobDeaqutpltE27zZ9Hjg1kZ/
 kk6t1IbUm6f6M6IPIORWLiDs4BXpRy9LEfn73MESPOF+0usimEYzzyn8YAmUz7V5Ou
 nykUoWTcwlJWxRG+3/3V46fASUj+sbQsE4EqvIX0loaqGB91hZkwNsM98ZMTLTZKLc
 HZlXdF3lmEHxKcLmkRYF6weljOMtaRKCpmT1ehske9U1IU6lzVBUikaruKkhRSN0gL
 1ev8f2xNvaV73EclZGrJvBmNQuQjTK/Skmw8+gIL1kmjZChs0wYc7K64kwaChhVBoW
 HAB+lda+ENZpg==
Date: Mon, 27 Jun 2022 13:14:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8821: Add headset button detection
Message-ID: <YrmfD3M9FdD8pLY8@sirena.org.uk>
References: <20220627032959.3442064-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xF1QEDtjFE94JVn4"
Content-Disposition: inline
In-Reply-To: <20220627032959.3442064-1-wtli@nuvoton.com>
X-Cookie: Your supervisor is thinking about you.
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 CTLIN0@nuvoton.com, dardar923@gmail.com, supercraig0719@gmail.com
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


--xF1QEDtjFE94JVn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 27, 2022 at 11:29:59AM +0800, Seven Lee wrote:
> This patch adds the function of headphone button detection,
> Button detection will be enabled if the device tree
> has a key_enable property.

Is there any reason why we wouldn't support button detect - is this
device unusual in requiring some external hardware to support that or
something?

--xF1QEDtjFE94JVn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK5nw4ACgkQJNaLcl1U
h9Dg0Af8C8RI+bePbUNRPIrMFupHdXLvKa0hf9GrrFKoWcUlXOF/0Mwbot/CNGQS
fvhKaD2o/obRYgXPHCkxiwO8wmc/ZUCIt3QoFp7zXRv8/0nriGA9vBBCJ5JmPTeB
RYMtd/xTFOGyxiDh326C81mn1KCOjhpbIzl+Xk1WwbypT4RWHLlWqv8TabonmS3M
Vp3Xd2EiDE5YgBhUfU+kus+ywclYXMMjjXt+qXoWonhZk06yG80zBEX4wOEYfp5G
/22zbm0Xg3BuAWZYefQr6vlrjhkh87EHhofJB92v5cV4COKHHaP3J8Q8PynW/byT
1OGGTuQQJdDFXTxRcV4q3vbJBfXuUg==
=s+/2
-----END PGP SIGNATURE-----

--xF1QEDtjFE94JVn4--
