Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E98BC2DE3ED
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 15:22:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89EB01791;
	Fri, 18 Dec 2020 15:21:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89EB01791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608301331;
	bh=Twtxz3CdLx+TMONIubg7E6ojPF7qRVa0EUIUWEAZg2Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fBjHJmrejfA7CDrTgNVziQQMkwPEcacL5hg+n4a1EMwTtCkZPpwDvw09rYXfQ5xr5
	 +paQ9RhqQI0kbDHSR2GHaTELiOVYv4E6za36uTqT94McaInXw7FWHPWGsXikoDy5W8
	 z4/ykvrj5c0H1aupO7gYZjEFwscknETTYcLFnfv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C40EF80240;
	Fri, 18 Dec 2020 15:20:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83D31F801F7; Fri, 18 Dec 2020 15:20:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 069A1F8014B
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 15:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 069A1F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lqR2VgQm"
Date: Fri, 18 Dec 2020 14:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608301223;
 bh=Twtxz3CdLx+TMONIubg7E6ojPF7qRVa0EUIUWEAZg2Y=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=lqR2VgQmrIuYy0qdUnNvVSdt+33BYqPw/41xKPo1cyRqzCvQXlJ/JtodgYR7ircIL
 8nRUeE+1kQOYWlil+nxLXQXcV8JU6V0aGGvCaTI4l+ueNJJgFsIYmxV0fgw0MfuL2N
 rMEw8iiY5v6Z/k+FmYGdJrqSQQs5WZwNFBcFa7T4rOJ6cM5roMaQ8gOtq79Vh8hmu2
 5csun4QlvrYTAcbQori5UZ7EZfAlsVEeN+rdisvB4v4gVsHSfuinNCams2Yk3+oNrx
 IlwJPsCsxv/cNb936aK1/TU5jIPUHStg4Q3S0x83xQMsWpSOB/cdJuyjpDgdK+xjpv
 /fVYRQT0J6DpQ==
From: Mark Brown <broonie@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
Message-ID: <20201218142009.GB5333@sirena.org.uk>
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
 <X8ogtmrm7tOzZo+N@kroah.com>
 <CAPcyv4iLG7V9JT34La5PYfyM9378acbLnkShx=6pOmpPK7yg3A@mail.gmail.com>
 <X8usiKhLCU3PGL9J@kroah.com> <20201217211937.GA3177478@piout.net>
 <CAPcyv4h-jg0dxKZ89yYnHsTEDj7jLWDBhBVTgEC77tLLsz92pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline
In-Reply-To: <CAPcyv4h-jg0dxKZ89yYnHsTEDj7jLWDBhBVTgEC77tLLsz92pw@mail.gmail.com>
X-Cookie: Password:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kiran Patil <kiran.patil@intel.com>, alsa-devel@alsa-project.org,
 linux-rdma <linux-rdma@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Martin Habets <mhabets@solarflare.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fred Oh <fred.oh@linux.intel.com>,
 Netdev <netdev@vger.kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>, lee.jones@linaro.org,
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


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 06:39:55PM -0800, Dan Williams wrote:

> There is room for documentation improvement here. I realize reading it
> back now that much of the justification for "why not platform bus?"
> happened on the list, but only a small mention made it into the

It wasn't clear from the list discussions either TBH, or at least the
bits I happened to see (I did miss several versions of this).

> document. It turns out that platform-bus has some special integrations
> and hacks with platform-firmware implementations. For example, the
> ACPI companion magic

Could you be more specific about the problems that these cause for users
of the bus?

>                      and specific platform firmware integrations in
> platform_match(). It's also an awkward bus name to use because these

Going through a bunch of possible firmware interfaces is standard for
buses that can't be enumerated, SPI has almost exactly the same code for
example.  Again, I'm not clear what problem this causes?

> devices do not belong to the platform. The platform bus is for devices
> that do not have an enumeration mechanism besides board files or
> firmware descriptions.

This is the one thing I was getting from what I did see, it was an
abstraction thing.  I'm still unclear what the abstraction is supposed
to be - I had thought that it was supposed to be purely for MMIO devices
but in a parallel reply Greg is suggesting that it applies to at least
"firmware direct" devices which I guess is things enumerated by board
files or firmware but that makes things even less clear for me as it's
kind of random if people try to describe the internals of devices in DT
or not, and ACPI goes the other way and doesn't really describe some
things that physically exist.

> > We already have a bunch of drivers in tree that have to share a state
> > and register other drivers from other subsystems for the same device.
> > How is the auxiliary bus different?
>=20
> There's also custom subsystem buses that do this. Why not other
> alternatives? They didn't capture the simultaneous mindshare of RDMA,
> SOF, and NETDEV developers. Personally my plans for using

At least in the case of SOF they were getting active pushback from
somewhere telling them not to use MFD.

> auxiliary-bus do not map cleanly to anything else in the tree. I want
> to use it for attaching an NPEM driver (Native PCIE Enclosure
> Management) to any PCI device driver that opts-in, but it would be
> overkill to go create an "npem" bus for this.

This is why everyone is using platform devices here - people were making
custom buses but people (including Greg!) pointed out that these were
just carbon copies of the platform bus.

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/cupgACgkQJNaLcl1U
h9D+3Af/cJECsvChdGecO5/0wRbeZDfopKmuaCEBnnT9BfHNPXohXL5Vf/tnSgr1
+EXf6ehtmxNg/UlEs2l4uqVHQyZ3g8zDX1M1zynfBfHtyLSm5wlW30hxtsPhyeMt
+VqcRxwWqUC2jLzBD5Aob+3AF5UYnZhh4kqkZ4Ow2UxTcXlDJ5GUn40UvaOkF8Tq
uzilWabfZOPRyqwVYQ/s4oRqa9NlokjAWkiLOEChZtA9vOsZ0Gpfm+HLC4EC0ajI
Eu6rfbm5s1YD7zqC2nSaG8ALGMDg/yjrc9aVVM5+nf3vJns3z6U0ityhhR6EaCi1
9dcy2WqWnZC2M2OdkAaaW4Q27F5tOQ==
=h7cR
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
