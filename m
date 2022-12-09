Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D00F96482E5
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 14:47:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A377821F5;
	Fri,  9 Dec 2022 14:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A377821F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670593648;
	bh=0vJexYVJ7dA+B1Gc21dMVtSJjF3iHAFiZkhsau0NBQ4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pZBuBpqu6RsIlbTAp6FQKTxBQL9Y/4mD/O0tUPPvXJCYUZRZ8ofrFme1g5rZ1h4Rk
	 aC97zfxRTlkWsfs9uLvLeIngMMWXmFEXCcLkVAlTHDGe19HITUv5brq3KDLy/dXjpM
	 19gHXpkRgYa/1rtUoMicyeQ8a4GcMdk6DZ7j8bPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80D07F80115;
	Fri,  9 Dec 2022 14:46:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7E6BF8022D; Fri,  9 Dec 2022 14:46:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AB81F800F8
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 14:46:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AB81F800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OGJmY7Kf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B1F86225F;
 Fri,  9 Dec 2022 13:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DE4C433D2;
 Fri,  9 Dec 2022 13:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670593591;
 bh=0vJexYVJ7dA+B1Gc21dMVtSJjF3iHAFiZkhsau0NBQ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OGJmY7KfYqe79Ew0FN3w7goIQImNu0FN5niW4Zf5ESKJElu6Tu9glb8X8siFh7K1f
 8U4KE8s6MSeJSVAWo3W2rwoB55RrBvQQ5OPANM1jjKKvemi7mfkuichyXakRPzBU1v
 TmIQvFjYv5oVPUz/AHRsJ+Ww1NI/dmtIYfzN9y6po+TchHOZGeCEYf1ovXAfJA4Fir
 pPqqyrlagpzMwSJimBDqYyjR4OcfiZqnwppcs4FzKWkvxGRqZjzwDT0XMQDa2lcwnR
 DvUujFWcmKRyy4UDv0u/mSN5sLdMc2ARqrjXmBkGlnrK1XrzT0Z1IxRk5X1nArXgU6
 2iVVpzzVeRW6w==
Date: Fri, 9 Dec 2022 13:46:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: Revert: "core: unregister clients and
 machine drivers in .shutdown"
Message-ID: <Y5M8MYT60KiS2XBn@sirena.org.uk>
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
 <20221209114529.3909192-3-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d3gwZZP8XvK5up3k"
Content-Disposition: inline
In-Reply-To: <20221209114529.3909192-3-kai.vehmanen@linux.intel.com>
X-Cookie: Who is John Galt?
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.de,
 daniel.baluta@nxp.com, Oliver Neukum <oneukum@suse.com>,
 peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Zhen Ni <nizhen@uniontech.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Archana Patni <archana.patni@intel.com>, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--d3gwZZP8XvK5up3k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 09, 2022 at 01:45:29PM +0200, Kai Vehmanen wrote:

> This reverts commit 83bfc7e793b555291785136c3ae86abcdc046887.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

> -	/*
> -	 * make sure clients and machine driver(s) are unregistered to force
> -	 * all userspace devices to be closed prior to the DSP shutdown sequence
> -	 */
> -	sof_unregister_clients(sdev);
> -
> -	snd_sof_machine_unregister(sdev, pdata);
> -

I am somewhat surprised that these block on the kernel side rather than
just disconnecting the kernel side of whatever userspace sees - I'd
thought they were more like hotplug operations than something blocking.

--d3gwZZP8XvK5up3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOTPDAACgkQJNaLcl1U
h9Cv4Af9E4RD7gzAlKWLOmtZ5USMGaxyyv/mwRe4lVkbexG+J24mfyR3Hx6jbFnX
pVn6IrVPSVVbXw2V2M8pfvSeMIHEtH0xn6FlQYNS8TdbL6uObTKe5m0f1/kEF5LV
RkVj52nxfTKsQgQhfMeVBp9+W5su+VWsOeNceDkAF5NFt8xSJtoZdfyYvMAtOK6p
nEa8YDVzutNUvwFtZvuU3XZZl+12LTbpO17zfB2RiIRUu+0W88nFGS8Pz7olHxHX
+P9uKfciXMZGpvZTNH2U+6g0kzKs4qoxUcssCSuyyYO2J5Yl3F9bpQTEWnCWj6++
6YhzQN7toDi+X9Ua14VGOgCrI3q/9Q==
=gR+F
-----END PGP SIGNATURE-----

--d3gwZZP8XvK5up3k--
