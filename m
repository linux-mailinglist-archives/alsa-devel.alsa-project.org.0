Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C08621F4400
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 20:00:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31D1B1664;
	Tue,  9 Jun 2020 19:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31D1B1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591725642;
	bh=J8tlTkffI9vT+ZtetPjpRh4/bBL9Hh7emd0zTozTyXI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aBcN8fkqD1rynUoFh2z4r5VdYVjPGz8kJZ7Tes8C0e44U1VuCDv6c7jaGz3v1f76x
	 exzK0V44EP9CUyp+NW8iC+Yrvgg3ZY8emAP4EeFVUXW87dmWtZOwtQC5nUJV+wAYsC
	 KNQpuZ3LAsSBPsYUDaUfmjpRZE7hPbIhR6QPjoUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D778F8028D;
	Tue,  9 Jun 2020 19:59:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E15EF8028C; Tue,  9 Jun 2020 19:58:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C8E0F80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 19:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C8E0F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qF1dpbq4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 777A720801;
 Tue,  9 Jun 2020 17:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591725535;
 bh=J8tlTkffI9vT+ZtetPjpRh4/bBL9Hh7emd0zTozTyXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qF1dpbq4r6LixfMDbilCvEkZ/h6ZYJ1hJewkW/W1R/P4ihpjzb1aQ6Vqyu57/RnlE
 1SXfvJeSswwlhZftcwITa7SGOlKrsZaPDX+PAwZ0JDQDw7COQCJH0tNaPuFmyJDIZ2
 y1et7/fTJBDLN5J5sfQf0qMqwE6qExDOFqlvAYFs=
Date: Tue, 9 Jun 2020 18:58:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: tas2562: Add firmware support for
 tas2563
Message-ID: <20200609175852.GQ4583@sirena.org.uk>
References: <20200609172841.22541-1-dmurphy@ti.com>
 <20200609172841.22541-2-dmurphy@ti.com>
 <20200609173143.GN4583@sirena.org.uk>
 <bb7cff87-f814-1b37-c9eb-e68919e3c077@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JaBjgNvtdKe5H086"
Content-Disposition: inline
In-Reply-To: <bb7cff87-f814-1b37-c9eb-e68919e3c077@ti.com>
X-Cookie: Be careful!  Is it classified?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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


--JaBjgNvtdKe5H086
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2020 at 12:35:50PM -0500, Dan Murphy wrote:
> On 6/9/20 12:31 PM, Mark Brown wrote:

> > Why not just use a standard name for the firmware?  If the firmwares
> > vary per-board then building it using the machine compatible (or DMI
> > info) could handle that, with a fallback to a standard name for a
> > default setup.

> The number of firmwares can vary per IC on the board itself.=A0 So you may
> have X number of firmware files all with different names all targets for
> different TAS2563 ICs.

> Also TI will not be providing the individual binaries to the customer.=A0
> There is a customer tool that the user uses to create the binaries.

> So the output names are arbitrary.

> I was going to mention this in the cover letter but did not think mention=
ing
> the user tool had any value

That's all fairly standard for this sort of device.  You could still
cope with this by including the I2C address in the default name
requested - do something like tas2562/myboard-addr.fw or whatever.  The
concern here is that someone shouldn't have to replace their DT if they
decide they want to start using the DSP, and someone making a distro
shouldn't be stuck dealing with what happens if multiple vendors decide
to just reuse the same name (eg, just calling everything tas2562
regardless of plastics).

--JaBjgNvtdKe5H086
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7fzdsACgkQJNaLcl1U
h9BKVQgAhwdvHDREJ2LZnjNuwAcY2lCGKrqH/sZ5zCuez+GTC3OioTnr1/2fRJP3
oeO4H/IRo6/PsE6dhcl48e+/CVM8p9IBC4J7eLYtvwC3iOd5qZGUXq1HqoYQaYYp
cJ22lWuYmG6EXPtcTM7eflfBIEdgbluyeksxIc1WSTccPFpEOkc8tElhlNN4eowI
34B18qXdsfvX3eOghVWTAD/IoyTPmyvWLzOkrRSpk+oPKsiqJnx0g7wEAg95sBKg
luhCZTAe1gaTpMC44kBIMN1ZVd22wZIGCJqXKY434H4xiVImRvv2/uqxbm0GsQQy
4Wqt+BFO7MwvkNsDYTTFA/Uj8xQ++A==
=re6H
-----END PGP SIGNATURE-----

--JaBjgNvtdKe5H086--
