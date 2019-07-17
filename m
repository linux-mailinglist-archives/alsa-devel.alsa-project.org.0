Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241C6BB0F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 13:08:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 062BC1688;
	Wed, 17 Jul 2019 13:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 062BC1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563361703;
	bh=OSMM5bFd6zLz72nKuPUyGYpv+BDxsuoKRXJ6EqlgU7E=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iO45Kwc7Y5vZ/b574KTMN3hbjMmw/lZaLlNr6HY9PAAF5+wXOwRRHN/WKA9M8l/Ot
	 RalhyxmgprqU5yZaRlIWmRRaoFPB71hTM9juA4NsC77fE8LAQRBzc65GxuAeGITPOs
	 xnUQKAud9OONI9Xs4jte9/CFrjb12y4quAb55/tk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C218F800C4;
	Wed, 17 Jul 2019 13:06:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B84DBF80363; Wed, 17 Jul 2019 13:06:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B98FF800C4
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 13:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B98FF800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YheKDbbw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JCV8mMpZbHyRKQMjDTlFQkx11JvDqdWE9t7dIJCPaqU=; b=YheKDbbw6TmNmYE/zSlLLS6R0
 g+ulVhJW1928Z/NeXtf5WMaXm9H9l2UahraRnNce/BSJqdezXIG09hJ0knAfVpx/nx9WupMFO9KWq
 MEBeDYiUvArWFcn0KfFhIzjIPjgq4Vn8pyZ4u7/PVaTQaxY5NDvG755JCbvwWM6qgq/hc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hnhla-0000Nu-4L; Wed, 17 Jul 2019 11:06:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 303B02742C17; Wed, 17 Jul 2019 12:06:32 +0100 (BST)
Date: Wed, 17 Jul 2019 12:06:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Message-ID: <20190717110632.GA4459@sirena.org.uk>
References: <20190717105156.15721-1-l.stach@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20190717105156.15721-1-l.stach@pengutronix.de>
X-Cookie: Fremen add life to spice!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 patchwork-lst@pengutronix.de, Nicolin Chen <nicoleotsuka@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: mark regmap as fast_io
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
Content-Type: multipart/mixed; boundary="===============3539286412787647368=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3539286412787647368==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 17, 2019 at 12:51:56PM +0200, Lucas Stach wrote:

> The regmap is only ever used to access MMIO registers, so it's fair
> to say that register access is fast.

Are you sure there's no caches that try to do allocations at
runtime?  The main thing fast_io does is change the locking to
spinlocks which means we shouldn't do any allocations under lock,
such as when updating the cache.

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0vATUACgkQJNaLcl1U
h9CjZQf/dhUk5WYJfbbSdolGhGTGVxREvD34c+NDDsfaoHSLdEeVn5CEn/ordLf1
UUzmNXlCMqaMHJ5doeS1fF4jRixq/MHP4w4bEQYN9360Ij+eIbtlIQewBYCPuIyG
z5rEEf5YolcEboiJrIgC6rfGPMH7KSZciwwnKMHUrdTtP+dKbCLckdDwTHW8MOCT
wnSfTaZ2+C638kqjpLOBhicpVZ+GzZPdo4/kQlUMlGQdAPUuM9iKovrnoROB5A78
Gbre/hsBtEEU0X7Aa11G+BRvaBL5Wt7La6ZQMnfJV4yDWfk7TDh28wX6wlQ9ZIs6
BccrfqKRbozC6zJSit7TPRztnWDb5w==
=SCRH
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--

--===============3539286412787647368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3539286412787647368==--
