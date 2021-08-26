Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 905873F8CEE
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 19:25:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2392D16C7;
	Thu, 26 Aug 2021 19:24:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2392D16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629998747;
	bh=z2rFIOaaKD7cFPn8J67DWRW1FMSYnX9hlHDtnUOFrRE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XVxR49bCqIBd2kE4qPgBLtY7f+0rNVFQtkr9Kk16hfJjIEDJsuDCytsgmWhrDs/TE
	 fvn/Tnia2CpbDlve4Fn9fyHiColG2ehry2rzKVaCetTfNaZ6uDZeGtW7BEiqeSfHRL
	 P7fsNVNVBcj4ToDa1Ij2Ccgkjd8p+9ImFs1oc3E4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FB9AF80054;
	Thu, 26 Aug 2021 19:24:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B41B9F801D8; Thu, 26 Aug 2021 19:24:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64459F800FD
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 19:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64459F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wJrlHg6o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X8zmFr0zn1e34mT61pOi4Xi/zb4VWghzLhYtSOFCMZ0=; b=wJrlHg6o0rFqoOaAqkoKfVNXI+
 7NJYisk5/bK/aB4iThGOW1f1zfzXAgs0DeGNHX9CHhqUYEOrShceEzvZaUYxGfaudBUGN2dFLbX7O
 Y1imd9yo5s6gh21RsMPGM1fc/UurQh2XmqrD2RcO2Ub5zWmILqtq3pzXiK4ZtPQo4Jy0=;
Received: from 94.196.104.219.threembb.co.uk ([94.196.104.219]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1mJJ6t-00FWcv-EH; Thu, 26 Aug 2021 17:24:16 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id A5FD9D1B3B9; Thu, 26 Aug 2021 18:16:08 +0100 (BST)
Date: Thu, 26 Aug 2021 18:16:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8821: Add driver for Nuvoton codec NAU88L21
Message-ID: <YSfMWOwwV30vdMy5@sirena.org.uk>
References: <20210824041647.1732378-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="B01L4FwL+FhdPcri"
Content-Disposition: inline
In-Reply-To: <20210824041647.1732378-1-wtli@nuvoton.com>
X-Cookie: I can relate to that.
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, KCHSU0@nuvoton.com,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 dardar923@gmail.com, supercraig0719@gmail.com
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


--B01L4FwL+FhdPcri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 24, 2021 at 12:16:47PM +0800, Seven Lee wrote:

> @@ -0,0 +1,1804 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * nau8821.c -- Nuvoton NAU88L21 audio codec driver
> + *

Please make the entire comment a C++ one so things look more
intentional.

> +/**
> + * nau8821_sema_acquire - acquire the semaphore of nau8821
> + * @nau8821:  component to register the codec private data with
> + * @timeout: how long in jiffies to wait before failure or zero to wait
> + * until release
> + *
> + * Attempts to acquire the semaphore with number of jiffies. If no more
> + * tasks are allowed to acquire the semaphore, calling this function will
> + * put the task to sleep. If the semaphore is not released within the
> + * specified number of jiffies, this function returns.
> + * If the semaphore is not released within the specified number of jiffies,
> + * this function returns -ETIME. If the sleep is interrupted by a signal,
> + * this function will return -EINTR. It returns 0 if the semaphore was
> + * acquired successfully.
> + *
> + * Acquires the semaphore without jiffies. Try to acquire the semaphore
> + * atomically. Returns 0 if the semaphore has been acquired successfully
> + * or 1 if it cannot be acquired.
> + */

As I said in reply to Pierre's mail and as I have said on
previous verisons of this patch can you please explain what is
going on with the semaphore - why it's being used, how it's
supposed to work and so on.  The above comment just documents
what a semaphore is which isn't the compliated or unusual part
here, what's complicated and unusual is the fact that there's a
semaphore in use at all.

As I have also suggested in reply to previous versions of this
patch I strongly recommend splitting the semaphore related
functionality out into separate patches so that it doesn't block
the rest of the driver.

Please don't ignore review comments, people are generally making them
for a reason and are likely to have the same concerns if issues remain
unaddressed.  Having to repeat the same comments can get repetitive and
make people question the value of time spent reviewing.  If you disagree
with the review comments that's fine but you need to reply and discuss
your concerns so that the reviewer can understand your decisions.

--B01L4FwL+FhdPcri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEnzFcACgkQJNaLcl1U
h9Blogf/YfgH+gwGlEkHj1T22OwpTMQ+lUqbLbD+cSZcFnkm4XigyDIXNyk/cMjv
dPt3WuUiT8GOD+NMH5t6FnbEr4Hv9+8gwBPoy7op/8ClMLzK3QMAKScdu8lKTqXy
UJuViGX4aPkt4MMqPti0qC70/Beo3tVtWhSzzZvxoPocLNOP4LP6y9YUHStkOnKO
VGvB4d9eTfLp0Xr8uBsWhL7hYgNVQZG/d6FMsBJZw/YcSgyEWjU0dSyzGSDT/QO4
24I0AJ0HuINs1RW3Ik030semBEuNwxUSkcZd4gthZR2iY8nPKqpjmg6ysnjQHerP
v9mkVab9aVAatKzF7q8rSUYHJ82BVQ==
=SsJI
-----END PGP SIGNATURE-----

--B01L4FwL+FhdPcri--
