Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F183D22BE
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 13:30:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0534916D0;
	Thu, 22 Jul 2021 13:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0534916D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626953413;
	bh=fCVv3/+dlMY3y/+mpAxrj94W1uAP+lRGIT1ypR4LDxg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r4asQABzJGImK7MwpvKQo2e5D+kNE7PfZIkCbU0/W8KgPjBUVldY/uxPpcnVqdhs9
	 6Cl72MEFuM4vVZ/b8Gg03A07Ktk195FWMN+DjunGY0LC4t4jznFJ3+zn8AvsSl1aAg
	 vmHeQusSxb0u0xMTVv0usC9FRLmgsZs4VBG+7/AE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B160EF80227;
	Thu, 22 Jul 2021 13:28:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 392F6F80227; Thu, 22 Jul 2021 13:28:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93C80F800DA
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 13:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93C80F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cMq7UMdU"
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADA3A61248;
 Thu, 22 Jul 2021 11:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626953299;
 bh=fCVv3/+dlMY3y/+mpAxrj94W1uAP+lRGIT1ypR4LDxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cMq7UMdUri/LB5WS0v3Pgw2daNBKkWPuc0gZcI8fhnoYVaGG7zGht63mAPB6wl/92
 XXucQwQ1IMQDOOzGZgljraqdOPxuhaQ1ZrhqReyYLSfJYaALfKhtZhTQKhRtjet0F3
 NdHlXqLxiY/waMWjGr6PQ3mBslo/wr31KGduNhbNNOXIEycpW4h2wYuB4kHAP628pQ
 uExBtSoYiePQidZDRKWyzKKzWNIwPc9hrjNCbYWtnNlA2kr9PA5FbI4oDJhvPGRFjF
 tP9jj7wCE4f2Uvk+DqkChq7AseozutXdxfzLmOQsqI2HK9R3ypcZm8MkI+drWxZk/b
 hsiRnxqJu2MqQ==
Date: Thu, 22 Jul 2021 12:28:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] ASoC: amd: renoir: Run hibernation callbacks
Message-ID: <20210722112812.GB5258@sirena.org.uk>
References: <20210721183603.747-1-mario.limonciello@amd.com>
 <20210721183603.747-2-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Content-Disposition: inline
In-Reply-To: <20210721183603.747-2-mario.limonciello@amd.com>
X-Cookie: Who's scruffy-looking?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2021 at 01:36:03PM -0500, Mario Limonciello wrote:
> The registers need to be re-initialized after hibernation or
> microphone may be non-functional.

You've sent this in reply to version 2 of an apparently unrelated patch,
please don't send patches in reply to existing threads especially not
unrelated ones - it really confuses the tooling.=20

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD5VksACgkQJNaLcl1U
h9CXOggAhfBmWeUF2/EfX1aJtZCLTaiatB0G6j+5xm3ocw3trOTeI7xmNNHFJSyE
wGRkK+RC4TQ+qH8alFiGxUXP2ROx3+E1ZF3GmM6UDvni9YMkqLvTYpyLWIrocfLl
v0aa7zYuizgfr+Eo07EwQ9FfXuY/arJPwUIKAeoQk5m8bzkQBAUBdFpzPpGc+t+C
47kwZmpBmHtmkQqURsfqsYG3JMqUYDUnQEAK/u+7+WLsWd2gnmiizihvGCYSrAZR
sslZX7icw5B6PqWEFMDrjjITEGSKQq+vut9+lRNQVoOOLq5N0E3kM5ykFM9CJaDS
BtTKiK29rVVVUO0IkWvAI2mK6XWpkg==
=TXSB
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--
