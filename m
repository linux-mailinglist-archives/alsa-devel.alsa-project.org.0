Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5097774E9B
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 14:57:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE2041AF0;
	Thu, 25 Jul 2019 14:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE2041AF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564059447;
	bh=Xw/cCqKa1uterTtHUVhV0zhZgQxgR1MOxggk4ZIjSTg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AjwB80Z/4g204BEcbGwNNc5oRelBDXjMAlpVFP6ClTbIjTmMO3Ddfo7x3stTU/Vy2
	 zA/YtbWEb2tQsJOVsxvP3MyebvsVtBE5kcZgU8We08WGPGTyzOPwfktiWoRUzsKPRW
	 QhqCKq/3HAQx/7PVN/lO8EjscgxVb2KLNavHS6Q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12965F8015A;
	Thu, 25 Jul 2019 14:55:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE15CF803D0; Thu, 25 Jul 2019 14:55:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A8DBF800F5
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 14:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A8DBF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FFdsSjhR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T6VBY4zfiy3MSxSKbCuz8zMQX5tnpNzxcWkHlxGBC1w=; b=FFdsSjhRbkNH5xwbBGATMKGW4
 HVVY+8OydWs93YxTv3Cm32qq9W92+AZZynxhgJNA1HFLYmdzdoqkKtRnUw+vTYGncKTgKNAn+biXT
 5O7xXBeHXNy7D5iNtkRunzSBAtQhxk5KkduTa+RStmcbbSn1u13jq3C8qZxkpPqDXfFgE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqdHT-0002oT-Ky; Thu, 25 Jul 2019 12:55:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A616F2742B52; Thu, 25 Jul 2019 13:55:34 +0100 (BST)
Date: Thu, 25 Jul 2019 13:55:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <20190725125534.GB4213@sirena.org.uk>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
 <20190724162405.6574-4-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20190724162405.6574-4-jbrunet@baylibre.com>
X-Cookie: Jenkinson's Law:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 3/6] ASoC: codec2codec: deal with params
	when necessary
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
Content-Type: multipart/mixed; boundary="===============8930898605386479005=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8930898605386479005==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 24, 2019 at 06:24:02PM +0200, Jerome Brunet wrote:

> Also, params does not need to be dynamically allocated as it does not
> need to survive the event.

It's dynamically allocated because it's a pretty large structure and so
the limited stack sizes the kernel has make it a bit uncomfortable to
put it on the stack.

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl05psUACgkQJNaLcl1U
h9BPRQf/TWxfdv1adKppGIBtuqwmpBS+DoFYnHcZDpi77bESSWpws7sxnJQocVHi
R4/NkWuIBihp5crQr4F1z7G68tmtVTxFRDni9rutYtQxaVloBZ9OFkesJLaaLG5Y
7e/uDcl2Q7Dlw7jo7NsboC1WTLq3vCDRpioZja9GjL6X/YNxLAmcoQEA3EeWvwtp
2cvDAI/Ah34hsYvfQwyaIFKPzS5UNcPdkb3MN03010mqR3xmVTnJTvWQp7A0l2sd
tliUrBzMtpqW3gTD5ZCjI6dHOp6eeI7BZ26v49WUJtOpawsibdFpkGI4PdZeeuf0
1wJevZvP7lpr4zNMaCWpLwA5LkAY3A==
=XabL
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--

--===============8930898605386479005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8930898605386479005==--
