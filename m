Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F96B4812CB
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 13:44:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A91551716;
	Wed, 29 Dec 2021 13:43:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A91551716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640781873;
	bh=UfYolpn+RgMIdjPgRGBmiG9V4Rtqln7egsudZE+1jNk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PWH3F3cmfyEhmEmi4P9l+jBbDUCw603yTe/IrL1keCrGTZA5Yh09k6PKh3ypsltJ/
	 Zh5DtWj45rPQjtPg3cdHWPiAdZoGL4MneudTpTRufWHTNWzxYFuwnjFzF0GFvePdb4
	 bVR28FJx2VYXDlG1EKLzOCkXHyfUDjOkflT7TZtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1427BF800D1;
	Wed, 29 Dec 2021 13:43:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EE30F801EC; Wed, 29 Dec 2021 13:43:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16086F800D1
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 13:43:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16086F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gn67DqSS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4DD361451;
 Wed, 29 Dec 2021 12:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C827C36AE7;
 Wed, 29 Dec 2021 12:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640781797;
 bh=UfYolpn+RgMIdjPgRGBmiG9V4Rtqln7egsudZE+1jNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gn67DqSSXTIJeQ7+jS/FZvDzFs628uGtUXw5rSHPy18dmXbQVX+RmYjpLyxVKxGSM
 M5bNPMHnx0VKSLLy/ancXNJV/BeToG9d+0tqlPcu+5BJN3/G982dvkFjcGBY41DFQy
 qoD5BBBfrGR4+OVpLBLjEZpG7/Z1cTC57B8r0TmaYWooJA+XwgRd0h7eLRNzgjU6Ee
 L9U/QiBNuMv2F6E//T+Wc//CVUxk3EDwJdSXQ7ecxg1Kxm22psHZD4nEHTpMkAC/rX
 706Sv8xufJUII7/ZrJ2ZXeW7vjgDNc2tVRz6OLF8vYLGAq5HeBzEGOEvU7wnx0eqAf
 8b08fAGqEH9Xg==
Date: Wed, 29 Dec 2021 12:43:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: cs4265: Fix the reset_gpio polarity
Message-ID: <YcxX3XFWO9jQWlLJ@sirena.org.uk>
References: <20211229114457.4101989-1-festevam@gmail.com>
 <20211229114457.4101989-2-festevam@gmail.com>
 <20211229115352.GA18506@ediswmail.ad.cirrus.com>
 <CAOMZO5DcXUR2Z6-cokwizDbAKnEs877AjbX9FEow2RFHfebnuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hq8rfqdTxyCff+UD"
Content-Disposition: inline
In-Reply-To: <CAOMZO5DcXUR2Z6-cokwizDbAKnEs877AjbX9FEow2RFHfebnuw@mail.gmail.com>
X-Cookie: New customers only.
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Fabio Estevam <festevam@denx.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, "Handrigan,
 Paul" <Paul.Handrigan@cirrus.com>, james.schulman@cirrus.com
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


--hq8rfqdTxyCff+UD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 29, 2021 at 09:04:19AM -0300, Fabio Estevam wrote:

> I could not find a single user of the cs4265 in linux-next.

> The board I have does not connect a GPIO to the CS4264 reset line, so
> I am not affected by it.

There might be more out of tree users of course - there's no requirement
for people to upstream their DTs.  Probably better to play it safe.

--hq8rfqdTxyCff+UD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHMV90ACgkQJNaLcl1U
h9AJggf9GbljdqSsbY6X+0ddWTAS49MhMlCfon7+rcYQddO3qezo1q8xNUhGEmgl
hS21G3G9iomk5zxWfp/XXLdGJ8ddz+7cZigN5WKnEX+J/FKuGzpAtdp+NL4VJcnm
52RgWKUmfV07syV4+wxNbaqNJrswihDaaeAzdQzwBbZj9wvkqmS0jwFhngMR3elo
zK695RBVbp3Df6/baRUAQVqUv+otbx+zk1VjOALqcO9VXKMQuvJ2i4g5IFF7MB4X
eAN27/Pi7cI82K7/ag0NBRZ/szx5tzq6ylvuXrm4VnkP1raQm0X3AO3NHL4t9e7g
VK77HVcMVVLDiKca+oqXUit4D7mVtQ==
=9lb3
-----END PGP SIGNATURE-----

--hq8rfqdTxyCff+UD--
