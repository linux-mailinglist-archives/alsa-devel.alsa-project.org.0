Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF9F46A5C0
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 20:35:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EFDB219D;
	Mon,  6 Dec 2021 20:34:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EFDB219D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638819334;
	bh=MpNp33FRQt4X5JC52WOHMDRVybEDW8+FSs2zS4j+/qM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mk0V9VtoNYis4QTAINjYHPa4HTst09LAb7enuX68L/SV6Up0/ev4fTWVQNsDIB82e
	 4STh+6v4jzm5L7Rb1XvbMR3G0VAxqGqsSnhGuZKhmWwKCpKFUs7HS4Mu9UXJ9zKcrr
	 cpv64I+isNVvFOEVw06rGOlGgGtr6EjKfJXK1ARE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A037F804AE;
	Mon,  6 Dec 2021 20:34:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D01D6F804EC; Mon,  6 Dec 2021 20:34:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A8F5F80118
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 20:34:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A8F5F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TOKi7z1V"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 81CEACE17C1;
 Mon,  6 Dec 2021 19:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7E6C341C2;
 Mon,  6 Dec 2021 19:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638819243;
 bh=MpNp33FRQt4X5JC52WOHMDRVybEDW8+FSs2zS4j+/qM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TOKi7z1VGDcAd98bcg5mvwK4V8bEtX5bFYS0R1zi2o7YQ58CWN8QgkKAeUaNmiJrS
 VXNn3dVeePVrXUnynjSy3KOVXVLeKzGCVX/vzGunofyc+6UqsKyiPou1WYtbUuBE5B
 LSgcr17CRLpDsB9IqxF7AcEnFIpm4WYCDJmH0/9UMQIE/67vw4WOWXV7WTEuEYEuu5
 H1Ez83GiOGu/ZyYIWatfaG/keyy4TNXu/GEUbF4D/ql5AGCcJE0dXqPE6r6LdLnVLz
 HRWKMxR4N/4qWtaSvkwu0JOmyX0jDHfCe3BARi6LTQIszlg+VHqYLKLBzRtKNtimeS
 4L0zJEqD6wpDw==
Date: Mon, 6 Dec 2021 19:33:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Subject: Re: [PATCH] ASoC: soc-core: add the driver component name to the
 component struc
Message-ID: <Ya5lplIoyhKsqFmZ@sirena.org.uk>
References: <20211206095920.40552-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FM2QS3cTpx8xgnOf"
Content-Disposition: inline
In-Reply-To: <20211206095920.40552-1-kory.maincent@bootlin.com>
X-Cookie: You will soon forget this.
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
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


--FM2QS3cTpx8xgnOf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 06, 2021 at 10:59:20AM +0100, Kory Maincent wrote:

> If a non i2c driver register two components the function will return the
> same "device_name" for both components. This could cause unexpected issue,
> in my case it is a debugfs error which tries to create two directory with
> the same component name.

Why is one device registering multiple components in the first place?

--FM2QS3cTpx8xgnOf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGuZaYACgkQJNaLcl1U
h9AR0ggAgWCzMNYbiu5GrIrZ6Ce6pNfcrP5Sq9aSOJ6aPayUDqd6mmqIznyjzChJ
sLCG0AwUUZ/+Ek2Jks4Mt5Js1Wk1bkhncPBcqPzc5OMt5t5YzC1o/zzCsLUetJky
3Bf3EShBgFxg4mI9Z+sygUJeXLTL16lZaxl2chcqRgaHDJyV21zyaFJ9F6I0grin
vmfdjOX+yIACSN1oNyXN847EmGojT0gSUEb3jJGmQqJ0MJ6vkHHsQ0xgNyCKg9Cr
Q1AobyIHm7GIqbdHVm/c29gOLUsSOgdS5/+Y3i2ljsa9wao7U/V5sn33u9eMm2s1
W/InZtDSBrvIovF9PDLRgv4CJLHsTg==
=pKKX
-----END PGP SIGNATURE-----

--FM2QS3cTpx8xgnOf--
