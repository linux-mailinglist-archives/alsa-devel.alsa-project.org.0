Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DFB25C197
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 15:19:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB4A4192D;
	Thu,  3 Sep 2020 15:18:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB4A4192D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599139148;
	bh=nmNMJ+6uk3+nnJfxBiYKL7wugvHHSF9tKMY73g+C5X8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N+obD9nClI6gaZq9EwGeQFyYW1oY+MC8LWh2B8xePrKd8cI3nXeAcTipz+4tG0Sio
	 2l2d4dTqYqy83bLhu853F+5sTPFDxzUxsMALNOX4gJmqymNgquAqFd8q3Wtl+dXelM
	 uW3HkOVkowqt7Zzl+3ZxDbdCEwOssvn6ifKi8e1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0046BF800BA;
	Thu,  3 Sep 2020 15:17:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84D7AF80217; Thu,  3 Sep 2020 15:17:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50A82F800BA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 15:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50A82F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QbqU6ThQ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC97F206EB;
 Thu,  3 Sep 2020 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599139035;
 bh=nmNMJ+6uk3+nnJfxBiYKL7wugvHHSF9tKMY73g+C5X8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QbqU6ThQKVH/Qfdr0a2zkGGjop9wTUh9efErigNJQszZMus+I0k0rtQGARiFS5pqX
 WOEZJ5TUzclbTGQA0CsnLNEK2MEV6pbYrZLnuJ0TGu/IMBR9xUQ99bqJe3Xhe5P+b1
 yIC6EIJN/7v5ViDyLPeuJCC7tYKYzzIi5qDPKw58=
Date: Thu, 3 Sep 2020 14:16:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [RFC] soc_pcm_open: error path behavior change since v5.6
Message-ID: <20200903131633.GA4771@sirena.org.uk>
References: <48810933-41cf-265c-1784-2e2acf979720@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <48810933-41cf-265c-1784-2e2acf979720@intel.com>
X-Cookie: Murphy was an optimist.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>
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


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2020 at 10:31:35AM +0200, Cezary Rojewski wrote:

> Some time ago negative-tests found out that behavior of soc_pcm_open has
> changed, quite sure this might be a regression hence my email. Till v5.6
> soc_pcm_open was invoking ::shutdown() for cpu_dai in error path only if
> ::startup() succeeded first (label: 'out'). After addition of commit:

Please don't invent new notation that nobody else uses, it just makes
your messages harder to read.

> Should dai's ::shutdown() be introducing some kind of state-check from now
> on? - similarly to how developers deal with some of the core pcm operations
> e.g.: ::prepare() (as it may get invoked multiple times in a row so check is
> there to prevent redundancy).

If there are stateful things it's probably better to do that from a
robustness point of view whatever is going on.

> Or, perhaps behavior change should be reverted with ::shutdown() routine
> again being called only after successful ::startup()?

IIRC part of the thinking there was that we were getting the keeping
track part of things wrong and sometimes missing things that should be
being shut down in error paths.  Anything that tries to stop extra calls
would need to be very clearly robust and easily maintainable.

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9Q7LEACgkQJNaLcl1U
h9DNSwf+PLzNnl0thy9gimkZZnBZ4ibG+dA1IkhBdiKjT9nxvwChY8ljC1Q4k5Kv
aZTwzZKTV4PML90rMH1Aomsd8R1fmQZOxVYwVMUZX+gbCbelLUjO68BZJm3GEMtK
APHydPX3glIjSbhATB1P0wfVFLJJTolVA5iAOUAUMqZ/J7zFwK1FctzdK2UB8v55
nftLT6oYmBbz3BXklWtfXxGNOuHrC7pCZEdcIy47mM7CQCNJim3BTn4ER7O7TjiM
eVpdbMrxT4G+4RT3jen5//bZ6aDOzL0BN7kAdtS+tRKyInM16Ku7fHi7z1PQhxC5
yEZIFO3DXMkP4CmXkWRPk2bEqL19oA==
=654l
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
