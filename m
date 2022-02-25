Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DDA4C462B
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:25:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC8111EE9;
	Fri, 25 Feb 2022 14:24:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC8111EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795508;
	bh=Xwz9kLVHyWZsdxcrnoF/sDH7jLbV2c8FkOg5piNNcDw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Io/v27va9NS1JwmI2Y3iy/RPfGevDzfbG2klbpoCbAabnahmrrgTMrJGNrYVLvHMr
	 GwhhXG8c6vWxbWhEZ4swNoxRHodc1Kbp8pRdks+Xh+xzyx65VPZS6Xlk11ezIhmOjE
	 +/K+0z6GnxLXx7VtKBfGJaASYyf/WI7mY18uwY3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97482F80676;
	Fri, 25 Feb 2022 14:12:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E869CF80673; Fri, 25 Feb 2022 14:12:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFDF4F80159
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 14:12:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFDF4F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CTFtdiB9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E3DC61C41;
 Fri, 25 Feb 2022 13:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5131EC340F1;
 Fri, 25 Feb 2022 13:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645794742;
 bh=Xwz9kLVHyWZsdxcrnoF/sDH7jLbV2c8FkOg5piNNcDw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CTFtdiB9m3XjyyYr8JjVYHKb9pQ3sUnnAR1ggZoDV1hOgCnkZ85bbVT4OWVWvSVQy
 QqF8NxW16fMzL1vjsS7LF1elOCvJv9ax/XoBcre5bpmQlXQR7yxdczCTR5Ie5RxiNR
 9VwuFLUg2xgTKPGoS436tRrTTbuB+99BQ32k1w8dBQqoc22Vc/VzV+KgEV5ePE4pKq
 7v4yFGDmIE82udHcoP4QEIZr87D89BpDnDeak1+Z08Qrp9+0doivOcwfNcHjsUrx51
 Y57zCzUSAeeVGeJr86A6fpC4wc2cORjP8tpjnov680IfsJkSQZ2k1fCimue8Z0vNer
 JCPHgaZxY4ioQ==
Date: Fri, 25 Feb 2022 13:12:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Meng Tang <tangmeng@uniontech.com>
Subject: Re: [PATCH] sound/soc/amd: Use platform_get_irq_byname() to get the
 interrupt
Message-ID: <YhjVssdVIP49T6uj@sirena.org.uk>
References: <20220225112358.19403-1-tangmeng@uniontech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ni88dYQ52S44UoyN"
Content-Disposition: inline
In-Reply-To: <20220225112358.19403-1-tangmeng@uniontech.com>
X-Cookie: I smell a wumpus.
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org
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


--Ni88dYQ52S44UoyN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 25, 2022 at 07:23:58PM +0800, Meng Tang wrote:
> platform_get_resource_byname(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypasses the hierarchical setup and messes up the
> irq chaining.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Ni88dYQ52S44UoyN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIY1bEACgkQJNaLcl1U
h9CMsgf9HCDinfY/9LwPrkDH7m1gZJCWHoophXU3Zw9m91QZ/bwR9Bet0Rnm2mQy
8KCTy5XiW+h0GZ7SyHoHCoFMiKbWOupxRlOb7beVOP13RzlaP9r0DrpgCfva3grA
F05FNqMTHslXk1K9iBWZ0B82flpp5XvxWfeQ7K8ZclNrZ/l5qf22/gLOLN5zE+qG
rFT41o3+q4n5KD+4hwv4fcRh1/y73rkIDy+YY4enI4yU59voiPQ5B+jMxMU/beo7
jfB4t7sAgys3W+LSvd9nCDuC9K8U2vsS286shhMUvkCtyzduyVeSMkCb+Ah+Ocia
8SwFT8rD1dHuhvNDZrb3L2qNoIc8+g==
=XUgy
-----END PGP SIGNATURE-----

--Ni88dYQ52S44UoyN--
