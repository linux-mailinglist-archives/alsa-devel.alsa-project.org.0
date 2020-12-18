Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5242DEA42
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 21:34:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D866417E9;
	Fri, 18 Dec 2020 21:33:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D866417E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608323653;
	bh=k7mZa1Db33KpTT5s4Uwf4FgA1fS6r85FOeZ5aqVIEIU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rEqZIMrbdGjYmOtkSVztyXNuzn1B+4pVFCXjRac+Orh/tfymIf+dTw2bCgamG23AV
	 Fe7Pxt3xfiHrPIlH7ZAtkUFJGgbrSC4Y6F1syA3UFWmihw90ejPVxZ1429e1CzPmN0
	 suv5AjgENvtE8MhBobVHB0J8wskvAv/FU8eKl9bc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46308F80240;
	Fri, 18 Dec 2020 21:32:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C859CF801F7; Fri, 18 Dec 2020 21:32:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D20FBF80168
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 21:32:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D20FBF80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Tl4HfRDB"
Date: Fri, 18 Dec 2020 20:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608323545;
 bh=k7mZa1Db33KpTT5s4Uwf4FgA1fS6r85FOeZ5aqVIEIU=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tl4HfRDBx/GegI5g9piovvRek4amjx318VmTrnZ9w4OwIXuIG3DF6PIuju1dw4PTX
 prtq7Fp1Xf2K1AuILyHN3i7QpNbptNKr+IIXp9D9tosc9dsPwvB/t1xvOjNCG6Y/H0
 YkLqYOhXohLoODT1sQcuTbD3pNThLnuFtq28bim5QymPLb9pN/aklDplHJcCAnUb2G
 L8Bv59ttURYon0zLZlyU4UflQ5bmQID9ajYNGpObnyDzPa/wKtN9htk5U+nVm08sEg
 m1c0v4+gdvRgVDUywWkmKvIX34hWsljD6dfshxYLlWUc2VxqOkI4YYqz9icxASM+es
 YJdDWBHoBXI3Q==
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
Message-ID: <20201218203211.GE5333@sirena.org.uk>
References: <CAPcyv4iLG7V9JT34La5PYfyM9378acbLnkShx=6pOmpPK7yg3A@mail.gmail.com>
 <X8usiKhLCU3PGL9J@kroah.com> <20201217211937.GA3177478@piout.net>
 <X9xV+8Mujo4dhfU4@kroah.com> <20201218131709.GA5333@sirena.org.uk>
 <20201218140854.GW552508@nvidia.com>
 <20201218155204.GC5333@sirena.org.uk>
 <20201218162817.GX552508@nvidia.com>
 <20201218180310.GD5333@sirena.org.uk>
 <20201218184150.GY552508@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PPYy/fEw/8QCHSq3"
Content-Disposition: inline
In-Reply-To: <20201218184150.GY552508@nvidia.com>
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


--PPYy/fEw/8QCHSq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 18, 2020 at 02:41:50PM -0400, Jason Gunthorpe wrote:
> On Fri, Dec 18, 2020 at 06:03:10PM +0000, Mark Brown wrote:

> > If it's not supposed to use platform devices so I'm assuming that the
> > intention is that it should use aux devices, otherwise presumably it'd
> > be making some new clone of the platform bus but I've not seen anyone
> > suggesting this.

> I wouldn't assume that, I certainly don't want to see all the HW
> related items in platform_device cloned roughly into aux device.

> I've understood the bus type should be basically related to the thing
> that is creating the device. In a clean view platform code creates
> platform devices. DT should create DT devices, ACPI creates ACPI
> devices, PNP does pnp devices, etc

Ah, so we *used* to do that and in fact at least acpi_device still
exists but it was realized that this was causing a lot of effort with
boilerplate - like Lee said board files, ACPI and DT are all just
enumeration methods which have zero effect on the underlying hardware so
you end up having duplication on both the bus and driver side.  Since
this applies to all non-enumerable buses this process gets repeated for
all of them, we wouldn't just have an of_device we'd have of_i2c_device,
of_spi_device, of_1wire_device and so on or have to jump through hoops
to map things into the actual bus type.  See eca3930163ba8884060ce9d9
(of: Merge of_platform_bus_type with platform_bus_type) for part of this
getting unwound.

Fundamentally this is conflating physical bus type and enumeration
method, for enumerable buses they are of course the same (mostly) but
for non-enumerable buses not so much.

> So, I strongly suspect, MFD should create mfd devices on a MFD bus
> type.

Historically people did try to create custom bus types, as I have
pointed out before there was then pushback that these were duplicating
the platform bus so everything uses platform bus.

> Alexandre's point is completely valid, and I think is the main
> challenge here, somehow avoiding duplication.

> If we were to look at it with some OOP viewpoint I'd say the generic
> HW resource related parts should be some shared superclass between
> 'struct device' and 'struct platform/pnp/pci/acpi/mfd/etc_device'.

Right, duplication is the big issue with separate firmware based bus
types particularly as we consider all non-enumerable buses.  I think
what you're looking for here is multiple inheritance, that's potentially
interesting but it's pretty much what we have already TBH.  We have the
physical bus type as a primary type for devices but we also can enquire
if they also have the properties of a DT or ACPI object and then use
those APIs on them.

Consider also FPGAs which can have the same problem Alexandre raised,
there's the parent device for the FPGA and then we can instantiate
bitstreams within that which may expose standard IPs which can also
appear directly within a SoC.

> > > The places I see aux device being used are a terrible fit for the cell
> > > idea. If there are MFD drivers that are awkardly crammed into that
> > > cell description then maybe they should be aux devices?

> > When you say the MFD cell model it's not clear what you mean - I *think*
> > you're referring to the idea of the subdevices getting all the

> I mean using static "struct mfd_cell" arrays to describe things.

OK, but then SOF has been actively pushed into using auxiliary devices
since there is a desire to avoid using mfd_cells on PCI devices rather
than the fact that it wasn't able to use a static array, and of course
you might have devices with a mix of static and dynamic functions, or
functions that can be both static and dynamic.

> > Look at something like wm8994 for example - the subdevices just know
> > which addresses in the device I2C/SPI regmap to work with but some of
> > them have interrupts passed through to them (and could potentially also
> > have separate subdevices for clocks and pinctrl).  These subdevices are
> > not memory mapped, not enumerated by firmware and the hardware has
> > indistinct separation of functions in the register map compared to how
> > Linux models the chips.

> wm8994 seems to fit in the mfd_cell static arrays pretty well..

I can't tell the difference between what it's doing and what SOF is
doing, the code I've seen is just looking at the system it's running
on and registering a fixed set of client devices.  It looks slightly
different because it's registering a device at a time with some wrapper
functions involved but that's what the code actually does.

Clearly there's something other than just the registration method going
on here.

--PPYy/fEw/8QCHSq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/dEcoACgkQJNaLcl1U
h9Dm3Qf+LvCppUIG0y7HXRZYLp+1HOlN8M+sp19Wq4MznAs+tmiEitSg2oduI6VS
IU8r1EmDjL95wDsXFirSPzs+HbNxhOiTd/5vqgA4fBypxy3TYyhnhd1DWyq18T+t
Tskz/3SktXCO9x7LlPrWbrEbIKJOkQz65dKIrQ+KpDZ62flhnNlE/vMeGOY8vTmg
LfNSdEAdHETxzvBCGqinCBv2NHJT38RXrB/IC89cl6Tep0PUXt6Inqlg1C1MtwFT
9QtQZpn9lznr2oxUB6gTbZwmnYABHnK00a4uzU5rqMedWTWYuJoTECjYfZAAvu70
nn1zTw/DzitPu9qhkCb83kMTBgL7xg==
=BJk5
-----END PGP SIGNATURE-----

--PPYy/fEw/8QCHSq3--
