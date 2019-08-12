Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B30D89D77
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 13:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C31131675;
	Mon, 12 Aug 2019 13:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C31131675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565611182;
	bh=Cq8GN/GKwKRIVwqIfYqnlePo/qO4FEh5uXxhtijOpwk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q6AyB/0063DwEZcAetVeyAsjrnPCKRZ/JASCKpHO8fllrCOIhRmEbY///GaPkKgJb
	 IMNvEvI0jdK2g3dig4uZncEL/SZ0fPSyf/SjM9VIbGBcC2fGnv8aJpt0RbFTz6+dwi
	 3KfnO4UdsCFlJsl9Lcx+eqNLCtgWmbHZqPNUyJC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF395F80214;
	Mon, 12 Aug 2019 13:57:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54418F80214; Mon, 12 Aug 2019 13:57:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FE89F801EB
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 13:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FE89F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="dPexeQ/Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sHO/QiQUuhOUBm0/pVTM4Iglg8CU7EIBkBPDNP1HxNA=; b=dPexeQ/YT+nOSymu6UA2I9NBD
 AWnEYkwB3Lcq7JpUu70TQXEvfBHreX8+g1oHwCyd69m9fO65Siw4I5NTDsOnJIBFrH7pLVB8SBdk7
 SdNwM4HFCUwLEBwXQiheTZcbUOY6N4omYsYY3ouhI0gsKgSLBPkL1lg45lR4xLyTjpNyU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hx8xU-00019A-QG; Mon, 12 Aug 2019 11:57:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DD3FE2740CB7; Mon, 12 Aug 2019 12:57:51 +0100 (BST)
Date: Mon, 12 Aug 2019 12:57:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <20190812115751.GI4592@sirena.co.uk>
References: <20190812095304.19030-1-peter.ujfalusi@ti.com>
 <20190812111332.GH4592@sirena.co.uk>
 <20154773-1cf8-4e2e-a248-f3dfb29a5024@ti.com>
MIME-Version: 1.0
In-Reply-To: <20154773-1cf8-4e2e-a248-f3dfb29a5024@ti.com>
X-Cookie: Decaffeinated coffee?  Just Say No.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, jsarha@ti.com,
 misael.lopez@ti.com
Subject: Re: [alsa-devel] [PATCH] ASoC: ti: davinci-mcasp: Protect hw_params
 callback against race
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
Content-Type: multipart/mixed; boundary="===============4978923993485447109=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4978923993485447109==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cVp8NMj01v+Em8Se"
Content-Disposition: inline


--cVp8NMj01v+Em8Se
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 12, 2019 at 02:46:33PM +0300, Peter Ujfalusi wrote:

> to card level could substitute (new mutex on the card for pcm operations
> probably) the need to handle this in drivers.

> We would need to change soc-core/pcm/compress for this.

Yeah, it'd be a reasonably substantial change.

--cVp8NMj01v+Em8Se
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1RVD8ACgkQJNaLcl1U
h9DFIAf+K2a9CAkyqTBP+EIREoRYCCAkiVjlc7z7ZtkSefkrKUuZRKaTrO7YKrKC
xuZJHFLxwFcW4Q9mS4ooHM35l2oW94GyHBBRqLTbXzIRppYE8BzhZqouF4yKvxY0
IBhNPEPlsy24jSEydGAUTL7K6UaI+BgQNqAyTMIqWsYwoRkSba63fD70ZOo30mhR
9ZghIp4bQIAXAAmXcwCbtSr1kVuxFbt2pYukitcj11fzOJebI+2cXS8EbJ/bXe4A
/9PsML9nABNJkfP/1UoxIr08HMN5DVapAhaO5VUWAJJUZigICAMgcWoW6cg9ZuWL
88T+j1n9ML0s7cTQwBPv/MHVy+1jew==
=OXKu
-----END PGP SIGNATURE-----

--cVp8NMj01v+Em8Se--

--===============4978923993485447109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4978923993485447109==--
