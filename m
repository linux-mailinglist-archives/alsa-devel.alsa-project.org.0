Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 743AE499A37
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 22:49:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 012F62811;
	Mon, 24 Jan 2022 22:48:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 012F62811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643060969;
	bh=50+UALUPVbunurEjC0UVh84iQHXJWlzJWNwUTawoMqU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pU4Ve5f4sjCCiJZYBIDrEInaW376TtUbsZi/JV/ZAIyRVmdrSFLw/IOQjRYMFG90I
	 Bota2vcX+ZSae4eef1EWwySjF2VYsIGlSPg5+v9ucktcvDBhNP9290E7wb1zLpno8N
	 yDZr7i804SHacjxQPbdnlNWb7dSBOQJshrpp7gpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EFF8F802BE;
	Mon, 24 Jan 2022 22:48:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE94FF80083; Mon, 24 Jan 2022 22:48:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D00BF80083
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 22:48:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D00BF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sjCI9I/r"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DC32CB8119E;
 Mon, 24 Jan 2022 21:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F6DC340E5;
 Mon, 24 Jan 2022 21:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643060897;
 bh=50+UALUPVbunurEjC0UVh84iQHXJWlzJWNwUTawoMqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sjCI9I/rT4m54QNqL9HGwwiZqJa8/a7nXn/vZ2DxiC2j3bi7+sRMUBLdzPiQO1LW8
 lAcUSGvVHG7uQAiscQ189Ho5dl/NBLQTYu7D1DEmyKYc3O+3We565pIMhxa1PPBzjg
 8lbJnaDDN8AM6lRGdeKheQCGLKXg6rpIkY6utCThiTEpAfo0JIHO0L2UOQI8cnz5PR
 3O6iPvAsjYof8oBNIqz/H0qulq/ptdpVFXuABt9o6cAPld2tt/xyxnLm3P7+NoBBZ5
 L4u3ZY3LLEnnK2CkGoeDQgB+XrZzy04bQmW2yw26XD73rkUSPdVUVrrWmEapZKKs6L
 DbV22dxB2D8oQ==
Date: Mon, 24 Jan 2022 21:48:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] kselftest: alsa: Add test case for writing invalid values
Message-ID: <Ye8enGjqmiUB9HTw@sirena.org.uk>
References: <20220124151410.2715572-1-broonie@kernel.org>
 <f9a0addc-9e81-b2c2-e5c7-d5e69dae26cd@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cwaJp+ta+0NJ0ix2"
Content-Disposition: inline
In-Reply-To: <f9a0addc-9e81-b2c2-e5c7-d5e69dae26cd@linuxfoundation.org>
X-Cookie: The second best policy is dishonesty.
Cc: alsa-devel@alsa-project.org, Shuah Khan <shuah@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kselftest@vger.kernel.org
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


--cwaJp+ta+0NJ0ix2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 24, 2022 at 02:35:53PM -0700, Shuah Khan wrote:
> On 1/24/22 8:14 AM, Mark Brown wrote:

> > +	/* Restore the default value to minimise disruption */
> > +	err = write_and_verify(ctl, ctl->def_val, NULL);

> Why not read the value and then restore the value, in case the value
> before the write test is different from the ctl->def_val?

That's what we're doing - def_val is the value read from the device at
the start of the test program before it tries to do any writes, we then
restore it at the end of every test to minimise the chances that the
device configuration will be messed up if the test program falls over.

--cwaJp+ta+0NJ0ix2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHvHpsACgkQJNaLcl1U
h9DTkwf/cU056WrJZ2F9IyNRorjNUrNAm2Fmlihu3pVp1r5qqN6evIhVF9j7vuPe
Ym/WtIXTeqZmAczFWVCtG5H70D7WmJ1feUbFTO94Aw22Q6ufP94VdX7ccRcNBEA6
aXEiLKbZON0UnnLQud5OyApNZ9K2qNZtGbvzmQA3Y+3EyeX6InVSU9kgK6wo7YUh
3AB/I9CchMRRis4kgnWb7SvfwLNLgj6ZF6YOT4IwTB/aAnaODhChoe0VG3JUxIJu
YlRSDYWp4RI2CNhDpLQDiSqKkrvkcuF5q1ru0KOeN+dqMmKhrnt5ptB1G4IRNI4w
NUo2GsLuibsPEIuLNlTrtsrh+sYKPg==
=vBl0
-----END PGP SIGNATURE-----

--cwaJp+ta+0NJ0ix2--
