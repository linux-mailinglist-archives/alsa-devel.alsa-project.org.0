Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5FA413319
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 14:03:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D18ED1616;
	Tue, 21 Sep 2021 14:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D18ED1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632225803;
	bh=okJ5Wv071gm/kqPX80JwwLPKBFkmOu1Wfy85JkuFJxE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YRlHheZwX03lPi6wlBNlz6IpjEvYsAT5d3Grv3KA/QFPXut3iCC/8rD1Ymwg0VhvK
	 Tl3dw4KrivFBMUrWVkMeX4aNDMT1QVg5WBZBBnsqqtGW4bnaCsPVGzOAB/nhzJAQqf
	 gMW+Asn9qGKaMgfMnrvzKT4YwLABRxrmbULx941c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A16CF80124;
	Tue, 21 Sep 2021 14:02:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEDCCF80268; Tue, 21 Sep 2021 14:02:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B55BF80124
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 14:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B55BF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KiHMVTOb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4AEDC60F56;
 Tue, 21 Sep 2021 12:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632225717;
 bh=okJ5Wv071gm/kqPX80JwwLPKBFkmOu1Wfy85JkuFJxE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KiHMVTOb17nzr8fZcDhOLmICRm3Ht+Fg4Pt0UNJ+Qg2jcUREcDV1HVSwWlaQatRPT
 yzPgyjZ3nE3t9avSqUysWS61wLkk6jOcHWPjDFsFH+4g17aF0ObV/l7sKF5TWfuTqt
 v8Q3Ufk6LmZLmZDE0SeMTyJGoroYaWrtlPS+sVhUmBYz/lSmLw5DsL9jHqg3A2z8T/
 oOjJzctrYT071xId9PLdaKsuKrnusLLDP8ZQCd1K/zUi+H8/CtHjXjZV9lui0otPyP
 5cmjTLEDr1bRWZgzoj+vh8p0GXmHtohmtR0RE8yvhCSRsLVwBzOsoq6ArNXg9Z2Ccf
 93wgIUImozJTQ==
Date: Tue, 21 Sep 2021 13:01:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH] ASoC: pcm512x: Mend accesses to the I2S_1 and I2S_2
 registers
Message-ID: <20210921120113.GA9990@sirena.org.uk>
References: <2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se>
 <ae4b25f1-2b2c-d937-e23d-0f7d23bdf0c4@gmail.com>
 <815cbba4-60d6-8d97-c483-146c2f7c3912@axentia.se>
 <7537b141-0ef1-fb44-7e02-27b4dd1e772b@gmail.com>
 <d9850534-df41-a6b3-48e2-34823f5866e9@axentia.se>
 <27f903d9-a74e-182e-b715-4124cf666f45@axentia.se>
 <8b96eb7b-8829-443f-481c-ab1772ece098@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <8b96eb7b-8829-443f-481c-ab1772ece098@axentia.se>
X-Cookie: Will it improve my CASH FLOW?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kirill Marinushkin <kmarinushkin@birdec.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
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


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2021 at 10:48:01AM +0200, Peter Rosin wrote:
> On 2021-09-21 10:10, Peter Rosin wrote:

> Ok, so the attached works for me as well. But I don't know if it's
> appropriate to resume/suspend like that?

> is:
>=20
> pcm512x 0-004c: Failed to set data format: -16
>=20
> The root cause is that the chip is in Powerdown mode when
> pcm512x_set_fmt runs. So, bring the chip out of suspend for
> the update of the format.

How would this work if the device looses power while in suspend (eg, due
to the regulators being software controllable)?  If the data isn't being
stored in the cache then it'll need to be stored somewhere else and
restored on resume.

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFJyYkACgkQJNaLcl1U
h9AcOwf5AbVSBdEhOQkB4TQMM2DFgVXIoGbmpI2PtDL+he2gx06CBr8GyNLXelfF
Kq3B/YaaA0YEX0xOlJwbZqYJBtjqCj2K0RqsTvZE/H7hQrNcpwSX5EHb4lv3E8W7
mmJRUKqVGK4mn/fhOe9+XQJkqyyt/xz8tkfu1hm8QdzBOQqtNa3bNsOOBHoR3VUK
35zbG0qaxVoTZmOqRDh8bOfv/7RroMkkEb/TEwe41DsoB8RaTgPFcXmiSayPdJrO
EHMUQ78SgY/VeWrDmXIVkbAClbNb2uUlhswfd6h0WN5utTl1WheCS2iUrtZQqiM/
Ip7mX9Rb9eu6dj/7WtnVE69TOvm9Bw==
=EZ2J
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
