Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C1669C88
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 16:36:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F4578E37;
	Fri, 13 Jan 2023 16:35:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F4578E37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673624177;
	bh=AivO8JDw/WyHjidS7YoK4myyH4+EaADUH7bMH5PRS8I=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ONYzsscxyM7B7z+oc+Usy4KaVNQ/RQRSHeGOnS8ss0kTvbIm9yQQQBpCXzo02sPH1
	 r5KJuuud8wAFAtK7HgMcPgyLi9R30Vn3T1UAQDnvTh6wsZ/rQ/TeWvBzYDeh19z5LJ
	 kMpk6findiuUJm1EmNFTvP3twGz7Pf3UBYxap4M8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CC5CF8019B;
	Fri, 13 Jan 2023 16:35:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A996CF80425; Fri, 13 Jan 2023 16:35:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94F8BF802E8
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 16:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94F8BF802E8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IhXS6XQz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8934620DB;
 Fri, 13 Jan 2023 15:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A506C433D2;
 Fri, 13 Jan 2023 15:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673624121;
 bh=AivO8JDw/WyHjidS7YoK4myyH4+EaADUH7bMH5PRS8I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IhXS6XQzAGz3WhQDr+A4dD8j2ujJJJjqKVuqCBovUZE80M5wS3OCMBP6D75EY6sLB
 0HBs/xxlqJ2Fa07junLcSQFI1dClKbqUYgvt+WPpfOup8HoDND7xnVrHrwDSzJ+ARs
 3vPnr+J4oWY/4P8SEenLgyt/JCyeP7WsdcTBH+kUWSeZT2NgLh/Pn6IpAxN5OZmh28
 e3kbaR2qkxW8gnN5WOuyZZB2GQ0C9Xra4JaByTXlWJt3VpCjV2VaY88YgzmyHvKzKx
 99rsKewp6stHO5tthdCWeEM2elpVCD5A6iM3md1ev1o6hEY5FQoe9L8tpiuvXR5pXx
 HDfvVvODwSj7A==
Date: Fri, 13 Jan 2023 15:35:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: sma1303: Iron Device SMA1303 Amp
Message-ID: <Y8F6NKvrnLzX3qNv@sirena.org.uk>
References: <20230109091402.11790-3-kiseok.jo@irondevice.com>
 <20230109091402.11790-4-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0vxyvrCEvgr/23By"
Content-Disposition: inline
In-Reply-To: <20230109091402.11790-4-kiseok.jo@irondevice.com>
X-Cookie: I know how to do SPECIAL EFFECTS!!
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, application@irondevice.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--0vxyvrCEvgr/23By
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2023 at 06:14:02PM +0900, Kiseok Jo wrote:

> +properties:
> +  compatible:
> +    const: irondevice,sma1303
> +
> +  reg:
> +    description:
> +      I2C address of the amplifier. See the datasheet for possible values.
> +

This doesn't document the DT properties that the driver parses.

--0vxyvrCEvgr/23By
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPBejQACgkQJNaLcl1U
h9A9KQf/YVwE9lzOTOrnPtghKjBgPs6XMCbRgjBEYFZQS4kLa2w1sDfYBa0vJ1bS
TKWXK1BVtaR/dOP+kXz1rkt9fqGVeD65rcPNkyJ7wslFjjF7liGeWZjeGyg751LT
1HbcoBvbIBmTYpCDCdMwCgYOBb8Kna7m+nhiYfb+1PhEja8NWKFrfZEt/CKAPhXW
6Pv+hRMuw7E+U6gl5Th9qVNuDZNIp0/PIpyVNvIRuvx4SJdCBxDzzjhcsorwVAQR
Cq2vm/Pwiz7UgESZhJHURTynrSGEdHRz7PTZry5cEKAi7Z/NYcsGXd3RX5D8QqOI
s8vcGnzR1Zcg8Xmth0lDT/Ui6DI43g==
=958i
-----END PGP SIGNATURE-----

--0vxyvrCEvgr/23By--
