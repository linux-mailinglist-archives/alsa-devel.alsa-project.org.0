Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A6D68BE76
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 14:39:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2319852;
	Mon,  6 Feb 2023 14:39:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2319852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675690792;
	bh=hbMUg4C2FzxOpw8ToaDb493iL0oyBf4eM+3FJYiu9Z8=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=V/icPmaxmzaU7KizniHEjsmE5LxwDfl7PjO6pva201ABnaWPpglZQ2bWhrqAZNXWc
	 41NE0HIZYIKk2eyEG/8UHRCuTUrOhn6qgFS0f3jCQXjPq4iIFyWJeNtMnQPs+Z9QyT
	 u5/m0QJVq5UDlg+N+ho9EteZVhELY1AtseUWXfyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16142F800F5;
	Mon,  6 Feb 2023 14:38:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A11CF804F1; Mon,  6 Feb 2023 14:37:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BB7EF804E7
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 14:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BB7EF804E7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MOvccU8D
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F5F060EEA;
 Mon,  6 Feb 2023 13:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4816FC433D2;
 Mon,  6 Feb 2023 13:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675690670;
 bh=hbMUg4C2FzxOpw8ToaDb493iL0oyBf4eM+3FJYiu9Z8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MOvccU8DLF2RyW2GqDr91cER6HgSvApo2LAIYyjrppFwcho3QdBkaJRkdPMvb4R/C
 HacD4WWviRPVp34zz9n8kmzrkTRNpISeaweiSErurgG8Qg3g0Xtm+Y7y4LZb5BDwYd
 ZXpEldlugOzaWL4nWA0hxeKZ05n0lQu3s2ndaDVbGqpp1z61QU7zYHldQV9/yQoN/w
 u91pZ/F4EKhfWHmwpKEKX65E/QODY489sBdhgwVY0J5aCeLL4CEjL7gaVk4s5vIN2D
 WtBWcRQjHQAExtDQIDMIZSuwvGwkWuYrd01deidVHapn4/89dIzjmAeqJrPadmmLza
 hoY9u8wOsCjSA==
Date: Mon, 6 Feb 2023 13:37:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] ASoC: da7219: Fix pole orientation detection on OMTP
 headsets when playing music
Message-ID: <Y+ECqY/vyT2Iz2zJ@sirena.org.uk>
References: <OS3PR01MB66416CEF9F6E5AE62D194BACCDC49@OS3PR01MB6641.jpnprd01.prod.outlook.com>
 <20230119161221.GA981953@roeck-us.net>
 <OS3PR01MB66416C10BF8E6400C84DAD02CDD09@OS3PR01MB6641.jpnprd01.prod.outlook.com>
 <38f09c4d-70d1-f65f-6e9b-4ad84eda4059@roeck-us.net>
 <Y9kE1cSUg2CQM5vq@sirena.org.uk>
 <20230202155101.GB1373010@roeck-us.net>
 <Y9vtIISfmpICi+9u@sirena.org.uk>
 <8f89eeac-b3ef-4137-80df-6cf044873b05@roeck-us.net>
 <Y9wQygzbFyOWl54r@sirena.org.uk>
 <20230204154222.GA877819@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a+zr94RLtWLGe1ik"
Content-Disposition: inline
In-Reply-To: <20230204154222.GA877819@roeck-us.net>
X-Cookie: Hope is a waking dream.
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 David Rau <david.rau.zg@renesas.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--a+zr94RLtWLGe1ik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 04, 2023 at 07:42:22AM -0800, Guenter Roeck wrote:

> Solve the problem by enabling the ground switch immediately and only
> after an insertion has been detected. Delay pole orientation detection
> until after the chip reports that detection is complete plus an
> additional time depending on the chip configuration. Do this by
> implementing ground switch detection in a delayed worker.

This looks sensible to me.

--a+zr94RLtWLGe1ik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPhAqgACgkQJNaLcl1U
h9DIzQf/ekcpkZmkGRQDURuwwftcrEUxbs2H5KsMirLXEuoNwaQojXwZr0IP60hj
OuJ6qR8EivksADWUXbFlo7GpOaWtryeyLBeG26NvX6O2JOMKAfeBkra0K8Feu2Xj
1JeudIecUb8Ysf6pG8LxO8+ZySXd4QORUeILSOHmjSC4meMnLfEScu1JjT7OpBxr
iP7HuPqiWSwaIUw+Pka+ff7PywsvIqU0DWoN/OAblYaEIXrWpMtVCggK4vd3Ewze
6NPGKpqbogRFiL3C+BbEUGqVyjhQZUZfVrIAUkVD6qg7LYCe3tkjLCR+J8r7dz2O
IDJCY5LYLbf8IGrJ4QrCSt03xolSng==
=jcdD
-----END PGP SIGNATURE-----

--a+zr94RLtWLGe1ik--
