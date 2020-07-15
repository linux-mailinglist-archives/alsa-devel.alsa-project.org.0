Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9933220ED2
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 16:07:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50B441669;
	Wed, 15 Jul 2020 16:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50B441669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594822039;
	bh=OsRhntqAyN9mOY8U9CdqOwYBY4i2l3Qux14A9WHRYhY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EV/axhrJjowcUEiENafFg04EDafGvdEfhXhn3cAp5SaUtvC1n4RHesbTOvMjfzgMX
	 n4Y7SBv4cZ8kuontqOWGZOSYU/Wba/zNoTYyd3hSjg7A8PS1UDTo3ZM7PC0YDNmexi
	 fvm0hWHP/ziIM/u7qgXNR8AJE1WymFkLBOxHTE2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77508F80227;
	Wed, 15 Jul 2020 16:05:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30870F8021D; Wed, 15 Jul 2020 16:05:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B12D9F80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 16:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B12D9F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kUxdDYMr"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0B6C205CB;
 Wed, 15 Jul 2020 14:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594821929;
 bh=OsRhntqAyN9mOY8U9CdqOwYBY4i2l3Qux14A9WHRYhY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kUxdDYMrISxD5G0l2FMnWPMBLh3uWpKF5s/SbJgKqgjvDzTGAPs3JxlKjcV16/wh6
 Zg+RfOOP3sXzrq2Es0XaPWd+8TyDG0a9msLnNCGT3Cac6iOBFrkHAgza/TUMjSIA6H
 CW4oT2uw0ZQV/X3UI0Vqiv7USca/rfpN+XvUOP6g=
Date: Wed, 15 Jul 2020 15:05:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: fsl_asrc: allow selecting arbitrary clocks
Message-ID: <20200715140519.GH5431@sirena.org.uk>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
 <20200702184226.GA23935@Asurada-Nvidia>
 <3f39a0bb-a766-f646-28b3-a51cf9983c6b@collabora.com>
 <3fea8912-63df-ff27-0c29-6284a85107ab@collabora.com>
 <20200714201544.GA10501@Asurada-Nvidia>
 <20200714202753.GM4900@sirena.org.uk>
 <20200714205050.GB10501@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5vjQsMS/9MbKYGLq"
Content-Disposition: inline
In-Reply-To: <20200714205050.GB10501@Asurada-Nvidia>
X-Cookie: 40 isn't old.  If you're a tree.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Timur Tabi <timur@kernel.org>, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>
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


--5vjQsMS/9MbKYGLq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2020 at 01:50:50PM -0700, Nicolin Chen wrote:
> On Tue, Jul 14, 2020 at 09:27:53PM +0100, Mark Brown wrote:

> > The nominal rate might be the same but if they're in different clock
> > domains then the actual rates might be different (hence the desire for
> > an ASRC I guess).  I can see the system wanting to choose one clock or
> > the other on the basis of some system specific property (quality of the
> > clock sources, tolerances of the devices involved or something) though
> > it's a rather fun edge case configuration :/ .

> Thanks for the input. Fox i.MX6, I don't feel it would be that
> drastically different though. And both SSI1 and SSI2 can simply
> select the same root clock source to avoid that happen.

If you've got two radios that both need to sync to some radio derived
frequency it gets a bit more entertaining.

> Yet, in case that we need to support such an edge case, what's
> a relatively common practice to allow system select the clock
> source now?

Honestly for anything that fun it tends to be a custom machine driver.
A property would seem reasonable though.

--5vjQsMS/9MbKYGLq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8PDR8ACgkQJNaLcl1U
h9B3vQf/f9mEX7hrtyk9FWvaZgsqLq+mUUNALFg5rWK6DoRHzdL5zBIlHuZUkcxD
dwIy0B20CLI43Xtu8/yIkVbPb9X5f2FfoJ0Jo9+R5I6yP6QIMR7ZVVbFwpsCoMGe
nuf4HosTeun7cv9MbTQe/wMbF2kWdX/xPZyEN/DGDvXLs1e/vQHjg0g92LZYLK/A
5tLPFNHJQULz/QKxzHxCdgwNKeA5jKvSZK8I6jNBa+7HKFXbZl07pUGHpSEQ6aFI
iuvyUH8NtvVj+P9f41yHAj3er2TEmpEg98M0JEmE61dahy+oGSivEyqcmJlfKxxd
4nn2FfBH1xDjNZn2ShW+vYcooN+k0A==
=X4/g
-----END PGP SIGNATURE-----

--5vjQsMS/9MbKYGLq--
