Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0A6544E91
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 16:18:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CEC61B2A;
	Thu,  9 Jun 2022 16:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CEC61B2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654784330;
	bh=sX8Pt/a3TTJmaI7w+Ef/bE8wur8yI9TLQ06dLxubKFk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aDP/OujTDbYvkPJQBCMLgCvEElk2Zb2U4Hpd1uzLpcEg6UfhETqPU2zNLP9a5Hs3i
	 Cx3s2tXK1Ol3syfNlsLX/hbBlih1Agxu7ISPeHO/K1CQ0DYx0XRaytdKEmlrel68II
	 H1sQPrRISrkp0VCol5SNjShtIlx3vnJ65W9WrEUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6E07F800C7;
	Thu,  9 Jun 2022 16:17:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FED0F8019D; Thu,  9 Jun 2022 16:17:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AD5BF80116
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 16:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AD5BF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d7ccdiR0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE26C61DC5;
 Thu,  9 Jun 2022 14:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E27C34115;
 Thu,  9 Jun 2022 14:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654784265;
 bh=sX8Pt/a3TTJmaI7w+Ef/bE8wur8yI9TLQ06dLxubKFk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d7ccdiR0u2LRgFgjyc9iVdg0xOyhNTdNN4sG8GsUL/cLW4kveyXXPTdzaD4qmQz5Q
 cpGdFqdHx1NUKv0mOesXEt4iiEtTcTHn7+ehv/qHRc/LztHnwTAnvtJDJj7B3obbyN
 C3NeEaRfWR01D4yx5SFF+df87K/jz+IkqF3I9WQNZAQopyoOFLfcqVigen5BDhZbk0
 5FV1HNInrYPAN/4lr+H6S2VMqVI1lW2rz948TwBaOZbo8wkRIG1c2Txd/yjuW2lOYH
 JdjnFH4xyT08H1iO8L14zxptf3kFkdULfI9OE83sHrTmojaGgxET4sW/DY/TDowQZg
 b6HQkbOMRhBVw==
Date: Thu, 9 Jun 2022 15:17:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 04/11] ASoC: codecs: rt274: Move irq registration and
 cleanup
Message-ID: <YqIBBGuSen61OEnp@sirena.org.uk>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
 <20220609133541.3984886-5-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ooVO84OvLexuBgxN"
Content-Disposition: inline
In-Reply-To: <20220609133541.3984886-5-amadeuszx.slawinski@linux.intel.com>
X-Cookie: Space is limited.
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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


--ooVO84OvLexuBgxN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 03:35:34PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> Currently irq is registered when i2c driver is loaded, it is unnecessary
> when component is unused. Initialize irq only when we probe ASoC
> component.

No, this makes things worse - we should acquire resources in the device
level probe so that we handle deferred probe more gracefully, triggering
a defer from the device trying to acquire the resource makes it clearer
what's going on and reduces the amount of work we do on deferred probe
attempts.  Having an interrupt registered has no meaningful cost.

--ooVO84OvLexuBgxN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKiAQMACgkQJNaLcl1U
h9DuhAf+J1PgentaTUp6mPl8bQKR8HlSxKPej1icR/nsri8KOYcfAbxJjbRnQm0m
hVKjqEz5Rkvm9Q844ffxyOV1x7iBYOIpPmj0G5FJkcs4nr6n2UICRB9zjXB8n+Vw
3np4LQdu5xmR+j8onv2fCFHWA8h9JJlUSNPBYmRzZtKeyiKaQvMNKuHzwRJWsf/r
HroIXWuko0EjLj7Uxs7R3JxwNstLeyxN9Gr37oA8Y7mYTGfSz/0zC96rsr1y0Qr4
qhcCn8fFnfykBldlFEunh9F9XVW2RbPQzxmkSVsJWd57xQoubWUlh/S9xjvXRSPi
/PKnsOVjCi0vTfACt7EjxpcezNPiKw==
=Dhmy
-----END PGP SIGNATURE-----

--ooVO84OvLexuBgxN--
