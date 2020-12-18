Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC382DE6FA
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 16:54:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2454917C3;
	Fri, 18 Dec 2020 16:53:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2454917C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608306841;
	bh=hh6kmTaYw7S1ycwZ4+Gi2lG2vKviQu4KRDfzNgRJMMs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O2xcAUB5SBmpVZ6qyjRI3NUHJd86ZpIMvZRvpaCBeaLK3ttpbDIPmAzzrlL3+9fRV
	 tl5u2WlEiMJU2wOo6xQT4R87M1eW/qePTEF8AHkhJPDt1fnw5789PChsx2TTdzMAKP
	 nBvustrrx19qDRA6Bw/gJKyP5lD/n0iK8l2Sriaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 876ABF801F7;
	Fri, 18 Dec 2020 16:52:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39A90F80171; Fri, 18 Dec 2020 16:52:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAFDCF80103
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 16:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAFDCF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UyU1MPj7"
Date: Fri, 18 Dec 2020 15:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608306738;
 bh=hh6kmTaYw7S1ycwZ4+Gi2lG2vKviQu4KRDfzNgRJMMs=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=UyU1MPj7dIcBqLmjerLEZsmEzC9n1onWw7rJnwndCFVtu521SPmOch8eA090w9V2H
 ebUvciuQh2tgliNsbPhJ+d7famGJ5HrWsYQXOFYFawsqG7YFaYaENY1wZ3I+lQvhM3
 sBTMAP+TWsAs/Y2hGXv08Pw61G+jsbNEjrvVOliXG1QnXFRMS7pL33FrykEC15cAbc
 2EPJnk8WkKwkraXP8CJjbdl6y+P9OpU1+fs8usTsCYpva/XnIg5e4tdCor3867HRms
 tVOavWiyg+wnpW7nD1Pb2LmOxcN9bu82ySjirX3es0l64KZmVFEC9qMU+j+GVrqdxQ
 J63Ghc7zBNX5A==
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
Message-ID: <20201218155204.GC5333@sirena.org.uk>
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
 <X8ogtmrm7tOzZo+N@kroah.com>
 <CAPcyv4iLG7V9JT34La5PYfyM9378acbLnkShx=6pOmpPK7yg3A@mail.gmail.com>
 <X8usiKhLCU3PGL9J@kroah.com> <20201217211937.GA3177478@piout.net>
 <X9xV+8Mujo4dhfU4@kroah.com> <20201218131709.GA5333@sirena.org.uk>
 <20201218140854.GW552508@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline
In-Reply-To: <20201218140854.GW552508@nvidia.com>
X-Cookie: Password:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, lee.jones@linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kiran Patil <kiran.patil@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rdma <linux-rdma@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Martin Habets <mhabets@solarflare.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Netdev <netdev@vger.kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, David Miller <davem@davemloft.net>,
 Leon Romanovsky <leonro@nvidia.com>, Parav Pandit <parav@mellanox.com>
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


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 18, 2020 at 10:08:54AM -0400, Jason Gunthorpe wrote:
> On Fri, Dec 18, 2020 at 01:17:09PM +0000, Mark Brown wrote:

> > As previously discussed this will need the auxilliary bus extending to
> > support at least interrupts and possibly also general resources.

> I thought the recent LWN article summed it up nicely, auxillary bus is
> for gluing to subsystems together using a driver specific software API
> to connect to the HW, MFD is for splitting a physical HW into disjoint
> regions of HW.

This conflicts with the statements from Greg about not using the
platform bus for things that aren't memory mapped or "direct firmware",
a large proportion of MFD subfunctions are neither at least in so far as
I can understand what direct firmware means.

To be honest I don't find the LWN article clarifies things particularly
here, the rationale appears to involve some misconceptions about what
MFDs look like.  It looks like it assumes that MFD functions have
physically separate register sets for example which is not a reliable
feature of MFDs, nor is the assumption that there's no shared
functionality which appears to be there.  It also appears to assume that
MFD subfunctions can clearly be described by ACPI (where it would be
unidiomatic, we just don't see this happening for the MFDs that appear
on ACPI systems and I'm not sure bindings exist within ACPI) or DT
(where even where subfunctions are individually described it's rarely
doing more than enumerating that things exist).

> Maybe there is some overlap, but if you want to add HW representations
> to the general auxillary device then I think you are using it for the
> wrong thing.

Even for the narrowest use case for auxiliary devices that I can think
of I think the assumption that nobody will ever design something which
can wire an interrupt intended to be serviced by a subfunction is a bit
optimistic.  If Greg's statements about not using platform buses for
MMIO or direct firmware devices are accurate then those cases already
exist, if nothing else a common subfunction for MFDs is an interrupt
controller.

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/c0CMACgkQJNaLcl1U
h9AEzwf+O76Uw7BDG33tM6xhLOwoq847RdyVqkI6RrFlyIlLsFlIt49fbXRIuXTF
Pviz3SUZ268ihxH3NrtuGLDtkdVL70oKo26hEppOtp877dhmkjK/BCnnkqIiERro
4Hpxo/eoIjqT0lnx+ah2ge9q5cDhT9s1mMH8vkvdOSGa2a9z71uYEzOARmvUbXy9
LK4/z9VmLS0wmO6YPxwc4Nq6afaa0m/yGhGFxu2aKT9aKfzbBIywl6WFllPz1Y1H
G+ZxfgLJ6sZON36FToD7/FEDUuZxBUGjA5d2txOX0xpx/ZsnvapoRypEvotufObZ
ZVX/PBjkUnHdClRckKl3LHCok9Xw1w==
=lhpS
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--
