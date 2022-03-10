Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C05E44D45AA
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 12:30:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 601CB185D;
	Thu, 10 Mar 2022 12:29:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 601CB185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646911839;
	bh=uKKQrIIKFBwSgsheqX3HqJPqfhTRezkt/iDCDYvlKjw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GurKsAt392mJx07xnMdMvnKun+2SvyAFJOxYJ7IxvfWVRe9CTDfZl2QNin14FDFzV
	 oRoY5sWH2d3UEsV8u3TfXQ9HS6xKYJsfvCJZeS26ezbDuj8I9s1bPajr/uIm9uNiM6
	 Grt1Ze/WKeHMXwk0RdEuQe8ErzwEElMLVysDp+1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C23A2F8013C;
	Thu, 10 Mar 2022 12:29:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45AFBF80137; Thu, 10 Mar 2022 12:29:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6924FF800FD
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 12:29:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6924FF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PAcTTaf/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 72E0D614AD;
 Thu, 10 Mar 2022 11:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902C0C340E8;
 Thu, 10 Mar 2022 11:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646911762;
 bh=uKKQrIIKFBwSgsheqX3HqJPqfhTRezkt/iDCDYvlKjw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PAcTTaf/++SYkJuCwSUTxJMpZrgKyZrjOaqYjC1VoO98l0THMkZSMbZu7LKF3496a
 e1HwiQ07mfaL7e3jcAIbdp00GgKWPbU6uy5CMHl7pqvxfX2WVsz4R+eLnkBvtpnzCQ
 s0LP+clmvzK72uKL07fwm8pF/O1HU/lVRO4rsYGTVdQRkzGioNhRsrgECcVS+pe9bi
 mi33nmsiN/e3wf+0aEsQM1dJGhkBuA3+vr+aUT/TpNY6uLWGidNg8FbmvakJ4qb5nb
 PbjkB8tnAL08YlKmgIawgsFQJG3OHg8yroIX3KC8PsqkGN0v0PwSyt5/kS1FwVl7/P
 bLoBpimh95KWg==
Date: Thu, 10 Mar 2022 11:29:16 +0000
From: Mark Brown <broonie@kernel.org>
To: "Sa, Nuno" <Nuno.Sa@analog.com>
Subject: Re: [PATCH] ASoC: max98390: Add reset gpio control
Message-ID: <YinhDPrSvrYV5vKp@sirena.org.uk>
References: <20220310081548.31846-1-steve.lee.analog@gmail.com>
 <SJ0PR03MB67794358405FA661992A206D990B9@SJ0PR03MB6779.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MNhXQ4XGIMsIAMHL"
Content-Disposition: inline
In-Reply-To: <SJ0PR03MB67794358405FA661992A206D990B9@SJ0PR03MB6779.namprd03.prod.outlook.com>
X-Cookie: Package sold by weight, not volume.
Cc: Steve Lee <steve.lee.analog@gmail.com>,
 "jack.yu@realtek.com" <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "steves.lee@maximintegrated.com" <steves.lee@maximintegrated.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "krzk@kernel.org" <krzk@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "dmurphy@ti.com" <dmurphy@ti.com>,
 "shumingf@realtek.com" <shumingf@realtek.com>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "rf@opensource.wolfsonmicro.com" <rf@opensource.wolfsonmicro.com>
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


--MNhXQ4XGIMsIAMHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 10, 2022 at 08:48:09AM +0000, Sa, Nuno wrote:

> > +	max98390->reset_gpio = of_get_named_gpio(i2c-
> > >dev.of_node,
> > +						"maxim,reset-gpios", 0);

> Why not using devm_gpiod_get_optional()? We could request the pin
> already in the asserted state and make the code slightly better...

Yes, and it'd support other firmware interfaces too.  We also need an
update to the binding document covering the new property.

Might also be worth putting the device into reset when unloading the
driver, though that's not essential.

--MNhXQ4XGIMsIAMHL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIp4QsACgkQJNaLcl1U
h9D6+Af5AXegHDTeiZ2MbFDMHQu/VHpOn1eZieGYkMAzHrNIZ2MzpuTWfomE5iHl
7G5MqciVxPQpF37CSt52SiQhpFbIsaTgJ1d7gM9PMWhLWCElhKVJu1XUWZOEH92E
v+GRHLgkF6JNgpQpUgLejjH1uo/LeVJX9o2UKir4pPAJKhB40VuYhi80k7AqVXPC
9WF8f7tiIowmOozzmTwkjmJuWHgGbZ83mCyz15OtOpitXDTrxgoABc+XxXnJEAEJ
nUBMjbl7kknWM8+hGNjoVLG7q0MiSB5SNM3K6RWfAgUHQKG2UmGcA07sz+4GSJpI
A7wBQjTNTErXCjUsqVIetHCW6iKBgw==
=GZqX
-----END PGP SIGNATURE-----

--MNhXQ4XGIMsIAMHL--
