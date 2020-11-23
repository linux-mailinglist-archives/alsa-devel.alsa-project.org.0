Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEDE2C05D1
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 13:39:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC32C167C;
	Mon, 23 Nov 2020 13:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC32C167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606135176;
	bh=E3ZUW9YZtx9seOajOdKsI9RWDaX+VTD1RTCK4Pn1HfU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WRMeHUC9B/h0+PD1WoJrsA3M5TohhImBfpUPHEw7Qgs7T0neMCVaLZ28wHbVWM9YI
	 eb8+4ADv/X3rjJVtAXwpPQzNokRiYQkAeZt3phGRsq1f49h8eCLEnKchdwktLG62F/
	 If7+iOwS9Yj+riCJvj4VtX3+sJdHlP+W+vuu+xWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47158F80113;
	Mon, 23 Nov 2020 13:38:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66EBBF80255; Mon, 23 Nov 2020 13:38:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC638F80113
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 13:37:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC638F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Jc82OpxI"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6852E20857;
 Mon, 23 Nov 2020 12:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606135074;
 bh=E3ZUW9YZtx9seOajOdKsI9RWDaX+VTD1RTCK4Pn1HfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jc82OpxINzA6CJC9QtsMQkXto1eCPNnZVLgaTuBLQMU+4un/Bq3CEFIdc3tvJj5+y
 xOF+W3AvJAS9M+8vhlLng4yZg7iD6iu+b/BXl6rumt0EpEVCzAdCtkXDYId/R49ydg
 TOVDcovB+saJUfi2WEa59QeB8Leu9AgDvQl2avEY=
Date: Mon, 23 Nov 2020 12:37:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 01/38] ASoC: ak5558: drop of_match_ptr from of_device_id
 table
Message-ID: <20201123123731.GA6322@sirena.org.uk>
References: <20201120161653.445521-1-krzk@kernel.org>
 <20201120165202.GG6751@sirena.org.uk>
 <20201120194245.GA2925@kozik-lap>
 <20201120200429.GJ6751@sirena.org.uk>
 <20201122105813.GA3780@kozik-lap>
 <20201123104832.GY4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <20201123104832.GY4077@smile.fi.intel.com>
X-Cookie: Dry clean only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Takashi Iwai <tiwai@suse.com>
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


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2020 at 12:48:32PM +0200, Andy Shevchenko wrote:
> On Sun, Nov 22, 2020 at 11:59:20AM +0100, Krzysztof Kozlowski wrote:
> > On Fri, Nov 20, 2020 at 08:04:29PM +0000, Mark Brown wrote:

> > > Surely if that's the desired outcome the fix is to change the definition
> > > of of_match_ptr() such that it leaves the reference with CONFIG_ACPI,
> > > perhaps hidden behind a config option for PRP0001?  That seems better
> > > than going through the entire tree like this.

> > That could be indeed an easier way to achieve this.

> ...easier and wrong in my opinion. Not all drivers need that.
> What the point to touch it in the driver which is OF-only?
> (For IP which will quite unlikely to be present in ACPI world)
> Or if the device will get the correct ACPI ID?

That feels like something that should be done with Kconfig dependencies
like a direct OF dependency (possibly a !PRP0001 dependency?) for the
driver or possibly with having a variant of_match_ptr() for things that
really don't want to support PRP0001.  Just removing all the use of
of_match_ptr() is both noisy and confusing in that it looks like it's
creating issues to fix, it makes it hard to understand when and why one
should use the macro.

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+7rQoACgkQJNaLcl1U
h9Ab8Af/d/f50Mie+21uU7IEYil1gbm/kfHMT4a3x03IfjU4EMbn9cWpgxbYJZeF
Ji7PrF9Pz6/uLhc3c92BFVw3CQFz5xm4VupqS4TCaQym5WU8sFjQtknzWYDkW91N
/IfkuCjG70Kg5Gp9Waa/wY50tF8c6WdnxJJ6XnNjTpwGBTrTZpcQF9sxo3Xp4ZbW
7KOc49fYkdlcjn1q7qTYv2s0RTGyOxOlBvKyu/hjNbYy3jWifeH2BJ4SOk38FtPS
FwoSIIR3GdrDqPjaG4seE6rdts4eIoFKzpt/Jhzas5m27n6Gojjs5c6fJ4ch6hrV
Ms7NDaWTa0cI4iSxV8YUL59UAerGpQ==
=BTCH
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
