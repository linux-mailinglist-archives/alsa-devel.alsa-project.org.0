Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CD5537C0A
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:30:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC6D31B1E;
	Mon, 30 May 2022 15:30:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC6D31B1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653917454;
	bh=CTVEltGsmxIEL6MxUHji7KOQ/E2ixbrRp3Q2HZWeXhE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c3HBDJldvSw0+SmynbygJvXOcPrnNwXuaUIEJr6HqaaeWxY2Um6s5PK7Amkt5iqvk
	 xJqAA4QjdNtqC+L+g2NFP/1doSobNc3UKmj5ecdrdWTiVDys5dJqzuIf+F5801beOO
	 sIYmptqEB3zdR1UnYKc3AmPlXDUGVOjg4u2WeM10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA44FF804EC;
	Mon, 30 May 2022 15:29:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F0F1F800E5; Mon, 30 May 2022 15:29:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AC89F800E5
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AC89F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KHsjf8DL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA67160EDF;
 Mon, 30 May 2022 13:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592FFC385B8;
 Mon, 30 May 2022 13:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917391;
 bh=CTVEltGsmxIEL6MxUHji7KOQ/E2ixbrRp3Q2HZWeXhE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KHsjf8DLrpo1UCFuVBej34UCl3inCkFTCyD0WmOVBo2JMq/EdKoP4Bs0YY6cv5oSW
 wpnDEXZt0MGHh+BYSDJJN0c1OZUmLe+5JE0oNQNDd2+d7jM9Axhii1och8W4CG2N84
 p5yv0eMw5rebhh0WCXWsMA/Uem1A/3zmGe2VJoJBLKaxJ+srnYH1zGMnLMYglIDd+b
 I7VepnpkEIklFsttGzRQmaaur6qriTG1UuRWzzeWcRJc4zIXO1vUbtGud7GyxhFN5P
 PA2JNkEATLM+729EWoDo+8xzPewbe6pkXfUCIEtS1vPygxpny2fk/CpnDoIGdPAPzR
 OYMib+AgTCwAA==
Date: Mon, 30 May 2022 15:29:48 +0200
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: Intel: avs: Fix build error on arc, m68k and sparc
Message-ID: <YpTGzFNeZe+pGM2j@sirena.org.uk>
References: <70daa951-4f77-3336-0567-e72e9e5e36c6@intel.com>
 <20220529141250.1979827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s9GNLvoQIEOcrVPW"
Content-Disposition: inline
In-Reply-To: <20220529141250.1979827-1-u.kleine-koenig@pengutronix.de>
X-Cookie: May your camel be as swift as the wind.
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 rad@semihalf.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 hdegoede@redhat.com, lma@semihalf.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, Guenter Roeck <linux@roeck-us.net>
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


--s9GNLvoQIEOcrVPW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 29, 2022 at 04:12:50PM +0200, Uwe Kleine-K=F6nig wrote:
> On some platforms (i.e. arc, m68k and sparc) __fls returns an int (while
> on most platforms it returns an unsigned long). This triggers a format
> warning on these few platforms as the driver uses %ld to print a warning.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--s9GNLvoQIEOcrVPW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKUxswACgkQJNaLcl1U
h9ByOwf8CGhF4PXy/HlSD8OE7Bpvm9TVyjeiVFGHkNKSqdz/RFVKw1ejDotT1TM9
wEn9kMo9p20gDKwK2BMEaVQYaEw3frqLMzSBT7ytWhsKkVs9Vz9UjmYflrKVfzaN
6SWb8KGAQ7WppGb3M+WWGdvlctecgANjHSdOxsJRVQQDrJNicrzEGowX5xZ9Smdx
l13XVjhw3OrOBv0dpaow+Z8hDxB5hLICecpt79GHZERJGL7yxTy1NNl5TguysbM/
yi9DdqXK5BLzvo3tEP7ALdwIqPbZ34puM/fyRpvD+D5tcb/eZbLZ23wje0Vxvw1Y
+B83fVPNx/WH3RM14JNCORe/T4pFhw==
=YmCo
-----END PGP SIGNATURE-----

--s9GNLvoQIEOcrVPW--
