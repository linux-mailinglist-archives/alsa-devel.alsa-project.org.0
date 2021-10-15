Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AA342F68A
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 17:05:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64A5F17F4;
	Fri, 15 Oct 2021 17:05:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64A5F17F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634310355;
	bh=SswMb9wzOxq0M9rtsUWefGhnQeZ9QlqXp3SndHLCDfk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LWx/xWc9tZPDfxnH7y7MtjlAd4SNnldC2aP2medKswCs8QHJX13y7Rzekky2BfdLA
	 BZ239UZMqjUuz++Tfojjd/uPy6jIKOPg649Ky/f3HnyoaBKB9xzabhrI9Xmu3lZKtf
	 hmHz88L3RnWX8SqHzZtzyYvuJ+9k2WI5ddIH6QwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 286CDF80167;
	Fri, 15 Oct 2021 17:04:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CBDAF80269; Fri, 15 Oct 2021 17:04:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7976DF80167
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 17:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7976DF80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qWgRNNZM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DFA1600D4;
 Fri, 15 Oct 2021 15:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634310271;
 bh=SswMb9wzOxq0M9rtsUWefGhnQeZ9QlqXp3SndHLCDfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qWgRNNZMwOCyuTCHLO5nFRrwGacGn1A6q2dl6GcaoHCPTgBfw89/o4nDKzghlrFUh
 ajRTJ3CyqR/sjkr8sVI+pwDLrMY0ObwiM34zndB1U2/8THkLuClBmrKy9WoQoTR3Kl
 /oSYnx6ir6Ur4+4tuE0G05PncEIjSNFxrKUH9ZCPCVBh3kSkWIix9VT2SUU0prrLUX
 SXUUXZApPytQZC71Ux+/aARqWvZM7iLNm31w13jWE4/Q6Yc/zg8Ze2lTcwDUAZGkja
 bYWg53wSMoYzG6BVKqYRuN7bcY8uZScZ82PBi5Uun02/cqzyz0XKhQqVDK2+qCSVQn
 rTYG0s8s/u44A==
Date: Fri, 15 Oct 2021 16:04:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 08/16] ASoC: cs42l42: Reset and power-down on driver
 remove()
Message-ID: <YWmYfYRNqyruBltq@sirena.org.uk>
References: <20211015133619.4698-1-rf@opensource.cirrus.com>
 <20211015133619.4698-9-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YEwHEeG4QLJiJTRL"
Content-Disposition: inline
In-Reply-To: <20211015133619.4698-9-rf@opensource.cirrus.com>
X-Cookie: I'm having an emotional outburst!!
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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


--YEwHEeG4QLJiJTRL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2021 at 02:36:11PM +0100, Richard Fitzgerald wrote:
> Driver remove() should assert RESET and disable the supplies.
> Previously this assumed that calling pm_runtime_suspend() would result
> in a call to cs42l42_runtime_suspend() to power-down. This isn't
> guaranteed - pm_runtime can be disabled.

>  	pm_runtime_suspend(&i2c_client->dev);
>  	pm_runtime_disable(&i2c_client->dev);
> =20
> +	gpiod_set_value_cansleep(cs42l42->reset_gpio, 0);
> +	regulator_bulk_disable(ARRAY_SIZE(cs42l42->supplies), cs42l42->supplies=
);

Won't this end up with an extra disable of the regulators if they're
already disabled?

--YEwHEeG4QLJiJTRL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFpmHwACgkQJNaLcl1U
h9AoPQf/VsuvOQOkub0xVouyjOI+TAb9UWlot4YRDNwT+tQavmkRxviZg2CAd3+8
Nb6tPe49xRCMEUhN5QuKa5By58FtHXNQxTJRJu5E5FkWVgiK+HQW05pTv3rGafEF
JybSqUBpfMqKta3RQ67dGqAANPl5falAqHhyn6nlX7QNIS0hVtAGgEKuge2FbAG9
vyQpbEZ7C+L1fRGt4TssRiuQUJHTkOhAmHD/meT7qWeh8gHlKlM7xblbT4Pv13mc
woUSNc0c6RP+XyleS1MGQ/+VU7042LP0uC6m/SQah4c9mXTdojEihWp4Mzve+OLQ
T4L780EV7YYfz6D0+Kq3eKQ35rDbXw==
=1u+2
-----END PGP SIGNATURE-----

--YEwHEeG4QLJiJTRL--
