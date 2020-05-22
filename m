Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5E91DE4FF
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 13:02:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E39421882;
	Fri, 22 May 2020 13:01:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E39421882
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590145340;
	bh=tfBbqScwZyNvJWHpGRHVjG8LGXJ7tH0t1I8qXOHhuyI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eHNlJqWD2e9ghVKvUxYGITaxZhhDmtdwsMXcXDgeMx8hlYbRWP6OLAivoptkygAjq
	 w2Bkgfe1rGwO0vdAx+b/odG+i9Idwyt+UsZJGyZXCFsrR8hCgEAK8X3ZPJxw9OFJIy
	 pTwk6AXaoO6RHfgtqJ143iaQz3JBC0ouCVu9beAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E667EF80213;
	Fri, 22 May 2020 13:00:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42932F801F9; Fri, 22 May 2020 13:00:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77D51F80111
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 13:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77D51F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sj4dVWdG"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E117820679;
 Fri, 22 May 2020 11:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590145229;
 bh=tfBbqScwZyNvJWHpGRHVjG8LGXJ7tH0t1I8qXOHhuyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sj4dVWdGvA+RNyt8m7etvr9KpPIAtsxLZfRSLzM6F+7Y+TffmS8FFGuA13r7NMnSs
 eu1gWYyoP94VaO7WYwatQuG6S9iOAmgmPFH1IG7Kdx64nnwQZ4uHGBwBor9W6mDxMU
 Cn+OTtj0jCTx5g3auftvJE4HEaFsEqxWwOZhWScs=
Date: Fri, 22 May 2020 12:00:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
Subject: Re: [PATCH for-5.8] ASoC: amd: doesn't print error log if the return
 value is EPROBE_DEFER
Message-ID: <20200522110026.GA5801@sirena.org.uk>
References: <20200521144434.14442-1-hui.wang@canonical.com>
 <20200521154356.GD4770@sirena.org.uk>
 <9062728e-cd0b-ec1c-e001-f191f3a351bc@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <9062728e-cd0b-ec1c-e001-f191f3a351bc@canonical.com>
X-Cookie: C for yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
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


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 22, 2020 at 03:47:22PM +0800, Hui Wang wrote:

> There are many modules in the kernel, no other modules print the -517 error

This is quite simply not true.

> or warning, so if this driver prints it, it really confuses users (according
> to my test, the audio works but the kernel prints this error with 100%
> chance, and within ubuntu, the error message is read color, it is very
> easily caught by users).

> How about we put off the registering the machine device, this can guarantee
> everything is ready when machine driver's probe is called. I will send a V2
> according to this idea.

You could also lower the severity of the message when deferring.

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7HsMoACgkQJNaLcl1U
h9ArMwf+LaC2zjWEnFPDcpxtlHJfUsYrioyY+4cwuvdVtDTJUDaljGgt5WWTukZC
jQgmq2eLyBKoU+0ILrY+PSihkuEP5LZ86f3KXFPhD7JmuEGRtfAijfXBsMlkePmJ
//X450rZIv6LY5R8kWMNM+ZJES5PPAueVlayDXZ+1gwnSeWIHfN8RTZNUJaXxdoE
NrHH4rtLC8YX0KEHj0XbmKfB5+3uQkhL9qUBaIU7mrGf5uwwTjkOPd92Rp3Z0I/9
nfqb5jTxn9C/aNtGud5K8I04mMvq4av5LCuw/VHu63AOGOZhGl3Rjsh7XxmEsHj4
8C4tB3ZjSHpJhqbzBk7ujYBacbKvEA==
=8b+d
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
