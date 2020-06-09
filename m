Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA741F3CCA
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 15:40:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 631DE1677;
	Tue,  9 Jun 2020 15:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 631DE1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591710021;
	bh=c0OwCgBXDYZKJ1bTf4iaE8DDFLh44k0ansKGhE69SoY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AK48gCT71dgejAGN6z/ZWl0CTat0b5d5RMGk12XFwIbqppwt2qXS3MusSs8YBE3Vn
	 Bme8POcifYpXL+3CIbUuEvaJbCI4GFh86CvSwkSLlDsYK+7VQkBbrt8iFrFmk7w9we
	 y9GDyeYdyBIZts2lgRd0E8W39Plmf3xYnXgqVqo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 846C8F800F1;
	Tue,  9 Jun 2020 15:38:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26147F8028C; Tue,  9 Jun 2020 15:38:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B61BBF800F1
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 15:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B61BBF800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Azm+HQ8C"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29D2120760;
 Tue,  9 Jun 2020 13:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591709911;
 bh=c0OwCgBXDYZKJ1bTf4iaE8DDFLh44k0ansKGhE69SoY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Azm+HQ8Cvap+GR41MccrslGmK1cjeNQz0YCBLQXuyD/zcBfK/MkIjuoZvjO6vCvLz
 AjzqmbZAZ9LVkqwdsBdRDNJAQ6Jj95FX9DMPNGvgsU6Labl8nJVCDDpfZhajr0I9fd
 aoVRSSY/NhDHnp8FE3LRbdhPQWIkYiziI7lu9tHY=
Date: Tue, 9 Jun 2020 14:38:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] ASoC: rt5645: Add platform-data for Asus T101HA
Message-ID: <20200609133829.GH4583@sirena.org.uk>
References: <20200608204634.93407-1-hdegoede@redhat.com>
 <20200608204634.93407-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/9ZOS6odDaRI+0hI"
Content-Disposition: inline
In-Reply-To: <20200608204634.93407-2-hdegoede@redhat.com>
X-Cookie: Be careful!  Is it classified?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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


--/9ZOS6odDaRI+0hI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 08, 2020 at 10:46:34PM +0200, Hans de Goede wrote:
> The Asus T101HA uses the default jack-detect mode 3, but instead of
> using an analog microphone it is using a DMIC on dmic-data-pin 1,
> like the Asus T100HA. Note unlike the T100HA its jack-detect is not
> inverted.

Hans, it'd help if you could send cover letters for multi-patch serieses
- it makes it easier to pick up tags that people send for the whole
series.

--/9ZOS6odDaRI+0hI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7fkNQACgkQJNaLcl1U
h9D5igf9GtLf+wOHdalC+iyYGQFxhdxygiY3qToOKyLnEBLiucYBzA/W5ZqAzf/Z
GYSz2OTXUFGGWsROa/uF4XYc7OpzfDDRhGMIW/xuxPRSIjEkeqgzeofjhsWfHxn1
7yJK+xlwrMBnkwjAF+O2Duzb61m51b6DwXiYi5yYG5pxOFfuI2U1GfajerSY6avC
0m+N3fS0FTVFjUY3PfshPxgGh6ZbF2vVH1BMGOb0FjxV04wI8Zhnp6mIdDC+Maet
IpFpFBXxwr2crE//M0GtKze0NBdIPpqQ57OcUGb0bk2r+9/Z9rS9vD2nQIT6O3NS
ogoAUUkTKDh6XW6bkg3piSVL7sZLhw==
=crho
-----END PGP SIGNATURE-----

--/9ZOS6odDaRI+0hI--
