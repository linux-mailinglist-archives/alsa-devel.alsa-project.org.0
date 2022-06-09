Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 152DF545157
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 17:55:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 977091A9F;
	Thu,  9 Jun 2022 17:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 977091A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654790110;
	bh=d6IpKcReOM0BAzYys8GQhWOY3da05wd4CwqGIOwNcnY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pzp6skQHd8zzv7kIhRoqhvxHmG+lXLCuyLlNSJcX/Y/0Me45q6S+WnAeVCUkIKu2H
	 AZMWHhhQQmL8toHZ9086On4LLskW/sG/Qcw8np65AGo5Al4aAWMz6jMShb+q8kPYOg
	 j+WBaZlYboZPkyQEFtVL3wWHF4GYaDJgXzvjpZPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BDD4F80116;
	Thu,  9 Jun 2022 17:54:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 390D8F80240; Thu,  9 Jun 2022 17:54:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8818F80116
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 17:54:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8818F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Db15ot9l"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AE516B82E1D;
 Thu,  9 Jun 2022 15:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E221C34114;
 Thu,  9 Jun 2022 15:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654790045;
 bh=d6IpKcReOM0BAzYys8GQhWOY3da05wd4CwqGIOwNcnY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Db15ot9lABxO3UDTeilr4THVUTIhS5xY67yd39M0pz3GRSLiVbaUWWzAqu3M8vDpl
 eZ1Jw4GN7i49o6r941HRcZ31gj0EcToE6PjyDn/1IT39g3MDPXc7Ef+EHdo5+XThCj
 65tGwXPC/wqgbmiUQ5mdFDio+QFPuNpFZBUIjyIBHSzrf/6C9K3cQCkva6OzChTm3J
 i8hgY7BZkrDYydCMFPTWdPam//3L6igIRKdTXs+KseTpoZvFoagI5jImY+D1s6dVji
 XgJzO9/uuSA4lR/zr4S+fJBUDBoSGMpzCnECkyjAVWIHS+nFuuT5amgxmWlYN4rjjC
 0ITOxZtE8FWiw==
Date: Thu, 9 Jun 2022 16:53:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [RFC PATCH v2 0/5] Apple Macs machine/platform ASoC driver
Message-ID: <YqIXlwTzQWwtzbdN@sirena.org.uk>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="th3PZ0FiY0ufDWny"
Content-Disposition: inline
In-Reply-To: <20220606191910.16580-1-povik+lin@cutebit.org>
X-Cookie: Space is limited.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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


--th3PZ0FiY0ufDWny
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 09:19:05PM +0200, Martin Povi=C5=A1er wrote:

>  - The way the platform/machine driver handles the fact that multiple I2S
>    ports (now backend DAIs) can be driven by/connected to the same SERDES
>    unit (now in effect a frontend DAI). After previous discussion I have
>    transitioned to DPCM to model this. I took the opportunity of dynamic
>    backend/frontend routing to support speakers/headphones runtime
>    switching. More on this in comments at top of the machine and platform
>    driver.

This looks roughly like I'd expect now, there's some issues from myself
and Pierre but it's more around the edges than anything big picture.

--th3PZ0FiY0ufDWny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKiF5YACgkQJNaLcl1U
h9AlNgf7BPncxFpRN1RmT8l9lbVRvoJyMKLO0MWxXCBeHx7bbO/8GXmDIpg/VmXO
J2vqhrtWSMijrffbeG4efWXldQMGhUAhz/GgB1FFgAdwzgE+6ndaNCEP8HGG9dIP
xUlcJxbPK9XGpJEgqG+ihrsaA9WjcXD0HaH96yjCoL687emR3fOXtKSjOC/Dqebp
GOg1+ilWEn1BRvCdj+CtBWLiPWcrY9AD8ObLl0fYql8FH5KYoF2FWNsfaGWE5Qh8
He2vyrMlaFwsqPZcUuznV0PPE8tF/cq8syXxk4ReXHeq8WPp1ttG+egBd0fTlRys
YKpwyOdMaqdnrDwryruzRc9I0CrW/g==
=YWSx
-----END PGP SIGNATURE-----

--th3PZ0FiY0ufDWny--
