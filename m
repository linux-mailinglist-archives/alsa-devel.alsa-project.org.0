Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 045721AD6D
	for <lists+alsa-devel@lfdr.de>; Sun, 12 May 2019 19:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EDD31737;
	Sun, 12 May 2019 19:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EDD31737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557680889;
	bh=hZmTyUXzn7qbJ/8lEkCZld9yT9zX12yPNc3wnL9K/wM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FRvk/wFrzH7AhLRlD4cSg+d/XxfRcv0MrjJxD2aIeA/x1d67ucV5o/ml5IgRy5mU6
	 /uf+8Hj0CFfm5MKuD49LaqDWkeSoaeYUW/DhyqcMCMDs/eJE24LUKwJlM2WIGnjqYQ
	 srcsZrtSPjh+UnLGfcTn3W+cuEJq+fQo2pMP5SfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5167BF896CB;
	Sun, 12 May 2019 19:05:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 249C5F896B6; Sun, 12 May 2019 19:05:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DATE_IN_PAST_06_12, DKIM_SIGNED,
 DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2991AF80733
 for <alsa-devel@alsa-project.org>; Sun, 12 May 2019 19:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2991AF80733
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Z5MaOZyQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9RG2AODhAu0ddI6bREDEwdc3wqRcusF77Y1+ZDoUoqI=; b=Z5MaOZyQWC3c99sXzxJ2QgNM4
 GhhJ95ow9EFGIB1Z3aBaNn0yZ0YLAVrYBDO8eZ4LpYM+zKWIN7545KbFXZEc1BQM45klI5sCGKxfH
 p9MdXFRu9k9EqApl0snS8Md197flO+KVS0KtZLk7az3fDlQj3eg6eM2bbGhmgmSkEsarE=;
Received: from [81.145.206.43] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hPrut-00044V-N5; Sun, 12 May 2019 17:05:39 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id A1BE644003B; Sun, 12 May 2019 08:54:17 +0100 (BST)
Date: Sun, 12 May 2019 16:54:17 +0900
From: Mark Brown <broonie@kernel.org>
To: Viorel Suman <viorel.suman@nxp.com>
Message-ID: <20190512075417.GG21483@sirena.org.uk>
References: <1557408607-25115-1-git-send-email-viorel.suman@nxp.com>
 <1557408607-25115-2-git-send-email-viorel.suman@nxp.com>
MIME-Version: 1.0
In-Reply-To: <1557408607-25115-2-git-send-email-viorel.suman@nxp.com>
X-Cookie: HOST SYSTEM RESPONDING, PROBABLY UP...
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Viorel Suman <viorel.suman@gmail.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>, dl-linux-imx <linux-imx@nxp.com>,
 Colin Ian King <colin.king@canonical.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: ak4458: rstn_control - return a
 non-zero on error only
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
Content-Type: multipart/mixed; boundary="===============7575599832416187020=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7575599832416187020==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RMedoP2+Pr6Rq0N2"
Content-Disposition: inline


--RMedoP2+Pr6Rq0N2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 09, 2019 at 01:30:36PM +0000, Viorel Suman wrote:

> -	return ret;
> +	/* Return a negative error code only. */
> +	return (ret < 0 ? ret : 0);

Please write normal conditional statements to help people who have to
read the code.

--RMedoP2+Pr6Rq0N2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzX0SgACgkQJNaLcl1U
h9Bpqgf/Z4TM2ROcn75WSzHPLXR43KHE2salosbyrC5M/Mg9blRgsevh8gtJwHCW
e2IYJiCmHH80IKs6jMo2MOCXJZ4ib5XsvEd3ZUa1vAiajsIUEqUxJxBTgJY/8Lj6
KvgIc6i7qfd+8gtgvwenOntPYH1vdcJvDlI2pgLtJX1mA8zA8WAqkv8kwbHddQQp
c03uvUyOErkh0duoT4f5WBfsnky2kQh0oZWfREtPdLq4O/mck4zUCj+XJ5Ah0UMs
HP09a4nkC21r+NyYb7tJ2kqs7Mf89F/UW3B2xEx9Xdi0IDsYnONIF95UfIberk5V
jtLqEpVlKdRGgZxNUnqqpsIJmbrpUw==
=G/aP
-----END PGP SIGNATURE-----

--RMedoP2+Pr6Rq0N2--

--===============7575599832416187020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7575599832416187020==--
