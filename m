Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9231F7C9F
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 19:48:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 912D11680;
	Fri, 12 Jun 2020 19:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 912D11680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591984125;
	bh=T2ujSUMcw4VznKUQ1es+CI7i3QTbNB8CVewQY5nNbNI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NZXz6D2+PQTRZfBbkjhha+/D/P2xgbiRMkUxiOHgTvB/DhUPck0e6JGdg9kgJkXsV
	 Ij9e2hhHrjF0JUaq/Hf092LmFFrRSdokSYVpn8EHmJOU0J5AX0B96wax2j6ncYce+C
	 9xA4THRcc8d1fhiWbx3t1ixByB49zFeKDlVZOiS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A58A8F8021E;
	Fri, 12 Jun 2020 19:47:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C18FF8021C; Fri, 12 Jun 2020 19:47:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14024F800CC
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 19:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14024F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S6N2mh/9"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE3D4207F7;
 Fri, 12 Jun 2020 17:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591984015;
 bh=T2ujSUMcw4VznKUQ1es+CI7i3QTbNB8CVewQY5nNbNI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S6N2mh/90Xu0MjOiCpqZWkF6PpPcmr1PDAz+Gl5c1U+4/1oooNbiJZh4TZBkxNxX0
 KGRHd2UGLYovhrhZCV95FWPBxQjOuBmh0EFuWTC/Df9tkIocYfscJ+NJBx5UAu+Ixf
 xQ4woHSijHizGRYsLjkDEsxqODznfDDbsIL0TAag=
Date: Fri, 12 Jun 2020 18:46:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH 2/2] ASoc: tas2563: DSP Firmware loading support
Message-ID: <20200612174652.GQ5396@sirena.org.uk>
References: <20200609172841.22541-1-dmurphy@ti.com>
 <20200609172841.22541-3-dmurphy@ti.com>
 <20200609175000.GO4583@sirena.org.uk>
 <f9601516-2091-322b-85ff-7cea484fd933@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PPxI8paQBs33t8dK"
Content-Disposition: inline
In-Reply-To: <f9601516-2091-322b-85ff-7cea484fd933@ti.com>
X-Cookie: As seen on TV.
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


--PPxI8paQBs33t8dK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 12:30:29PM -0500, Dan Murphy wrote:
> On 6/9/20 12:50 PM, Mark Brown wrote:
> > On Tue, Jun 09, 2020 at 12:28:41PM -0500, Dan Murphy wrote:

> > > +		/* Reset Page to 0 */
> > > +		ret =3D regmap_write(tas2562->regmap, TAS2562_PAGE_CTRL, 0);
> > > +		if (ret)
> > > +			return ret;

> > Why?

> Well the reason to set this back to page 0 is that is where the book
> register is.

> So setting this back to page 0 set the Book register appropriately.

Oh dear, usually the paging register is always visible :/

> > This manual paging doesn't fill me with with joy especially with regard
> > to caching and doing the books behind the back of regmap.  I didn't spot
> > anything disabling cache or anything in the code.  I think you should
> > either bypass the cache while doing this or teach regmap about the
> > books (which may require core updates, I can't remember if the range
> > code copes with nested levels of paging - I remember thinking about it).

> Yeah. After reading this and thinking about this for a couple days.=A0 Th=
is
> actually has contention issues with the ALSA controls.

> There needs to also be some locks put into place.

That's not too surprising for something like this.

> I prefer to disable the cache.=A0 Not sure how many other devices use Boo=
ks
> and pages for register maps besides TI.

> Adding that to regmap might be to specific to our devices.

Single level pages are in there already, TI is a big user but I've seen
this from other vendors too.  I do remember some discussion of multi
level paging before, I think with a TI part, and I *think* it already
happens to work without needing to do anything but I'd need to go back
and check and it's 7pm on a Friday night.  IIRC if one paging register
is within another paged region the code manages to recurse and sort
things out, but I could be wrong.  I agree that it's a bit specialist if
it needs anything non-trivial and something driver local would be
reasonable.

> > > +	tas2562->fw_data->fw_hdr =3D devm_kzalloc(tas2562->dev, hdr_size,
> > > +						GFP_KERNEL);
> > > +	if (!tas2562->fw_data->fw_hdr)
> > > +		return -ENOMEM;
> > > +
> > > +	memcpy(tas2562->fw_data->fw_hdr, &fw->data[0], hdr_size);

> > Should validate that the firmware is actually at least hdr_size big, and
> > similarly for all the other lengths we get from the header we should
> > check that there's actually enough data in the file.  ATM we just
> > blindly copy.

> I will have to look into doing this.=A0 I blindly copy this data because =
there
> is really not a viable and reliable way to check sizes against the
> structures.

Yeah, that's reasonable - I was just thinking about checking it against
the size of the file to make sure it doesn't actually overflow the
buffer and corrupt things or crash.  Obviously sanity checking is good
but there's limits on what's sensible.

--PPxI8paQBs33t8dK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7jv4sACgkQJNaLcl1U
h9BMlwf/cj1YHjgwLNHXDgZjBK7TERfRpzfITO0GwHt/Qh5/Rm3okvB6pnAZOVqO
OUCX2lQJnVWAavciTR5byOJjB2I5dPrNYgPzOoFtm4N99uLVDecWckSJMw8OK0+k
FoVcg2KRbKEllkA757zrQccDj8j8nG6Q9jPNMgS3AO7tBG4nz1c0px6mkIs9WK3L
V56H/5IzZyCVnFEYJfMMlGPTiIBGHRRfKDuDMfJZJ1YdGMH2TonKZtgVkgvRHAWG
r/m6zWIx6ZK1JTMzMtA8RpItA4zjOULJjl+OJvqDw3r9r8VCTGzDXugk+md0HJcg
Q4u3PD3TpzBfB3cl6wWBYmrmgLPbtw==
=Stm+
-----END PGP SIGNATURE-----

--PPxI8paQBs33t8dK--
