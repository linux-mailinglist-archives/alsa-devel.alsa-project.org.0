Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45320664299
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 14:59:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C83A0BFEC;
	Tue, 10 Jan 2023 14:58:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C83A0BFEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673359176;
	bh=lF/saPJXboEiKAom+2j+crI83CaqhVkfm0qrNigQRTs=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=J56Ei3AdB9rb9RabtVKlSBtXBzTQfTGGR7fHRLO1yzfn6Wj8OgbZ2kBOHbYojhwfJ
	 +Fz3j96NBzUeOAcj2hoinSn9Iho9sEGfWPBZ97BpStdU0gOTRsZ/dVarm4YyE5mrV7
	 iCeKz8xSILKZem71JXW2ISb9u5FOJ6RdZ3Mks2Gk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75662F800C7;
	Tue, 10 Jan 2023 14:58:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32594F800C7; Tue, 10 Jan 2023 14:58:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CFEAF800C7
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 14:58:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CFEAF800C7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=munQoUGv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 46D0D61717;
 Tue, 10 Jan 2023 13:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0D7C433D2;
 Tue, 10 Jan 2023 13:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673359110;
 bh=lF/saPJXboEiKAom+2j+crI83CaqhVkfm0qrNigQRTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=munQoUGvJ1wVnawEOm1XVAwqy9FchXaPwxlgUwY435kPFQ24oJieCz7c486ad4lyY
 nft95+w4qsRdpS+w27iTDIK3o3dEtcPbTV1M/fzMonNyLmxGz28ZZ5FeIYK8ejtyso
 qy0oQLxEJ77CnoW2HzPwqz5AfDCL2C04H/CMtpNHfH1PyUwksyrNBdVnLkStB6oFSb
 wmaoNvjDtl6uazVwh2m3FF4i/IviVtOAiDHvTJfoUz6DuZcv7GIOeKTQE8d0JwIrIX
 VKRpY3FAky59ooFjua8S8HQYCcKPkISdwLLfXT0rfaoGgwdsmUMSCf5d0l7qBOtVaY
 zNKwZOYQBboLA==
Date: Tue, 10 Jan 2023 13:58:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 15/27] ASoC: pxa: remove unused board support
Message-ID: <Y71vABj05MAYEbHJ@sirena.org.uk>
References: <20230105134622.254560-1-arnd@kernel.org>
 <20230105134622.254560-16-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mUO23bK4vSgaY15P"
Content-Disposition: inline
In-Reply-To: <20230105134622.254560-16-arnd@kernel.org>
X-Cookie: I think we're in trouble.
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
Cc: alsa-devel@alsa-project.org, Ken McGuire <kenm@desertweyr.com>,
 Arnd Bergmann <arnd@arndb.de>, Ian Molton <spyro@f2s.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Daniel Mack <daniel@zonque.org>,
 Mike Rapoport <rppt@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--mUO23bK4vSgaY15P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 05, 2023 at 02:46:10PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Most PXA/MMP boards were removed, so the board specific ASoC
> support is no longer needed, leaving only support for DT
> based ones, as well as the "gumstix" and "spitz" machines
> that may get converted to DT later.

This doesn't apply against current code, please check and resend.

--mUO23bK4vSgaY15P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO9bv8ACgkQJNaLcl1U
h9CmuAf/QrI3z3oJ4pU/rY4gmnY4otSvXcS25C5zSiDcRACA362DAnPbjJqs/ZNr
ZxkPTrMY1RIPLDZfZf6/BREI9LEw8GYOEMmkDVTys1mcT/cx7rd/4dhlD/uZjls0
7xITTtwxw7vQ++qTpoHClcgiuEg22MJcviMzFNg3lHd/4zVuTlA/O7fe+IfmV7I7
+b2Mx645/T9OALXfcXWa7xc6r8a++as0+sBn1T9wsk7ciqYGSUUEda3zPrf/DlvM
4t3WYY7WCWZ9m3kG37mKn/qPpCf3xG9nfUcjkJ3cOsqpj/M6z21IidSLRKq5mv9h
S7DQ4GBmjlPVPqZ7jzYrWwLyML9cWQ==
=uKo2
-----END PGP SIGNATURE-----

--mUO23bK4vSgaY15P--
