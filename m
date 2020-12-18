Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B58752DE337
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 14:19:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 385941772;
	Fri, 18 Dec 2020 14:18:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 385941772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608297547;
	bh=v6z69yu84QJf1R6RvlLOXcMX6c+Fwb3zy/Gr6WnNltI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i0GF2nAzAZ1uMHRNFZ85gAHBbmO5tUIlIT+cRBe/tFylzJ0cyiSNg8+/Uks4cwIwJ
	 JLVvv9ce3nCSDTcsUbasyRFAqSaxd4079w8srQOn+cTMlluAhjL+xOltkA5rSfgxX2
	 qzCrtSYzfpy4g8S0PgQ8sUXZnUWtD90wxy6qtcSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54F9EF80240;
	Fri, 18 Dec 2020 14:17:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DC9DF80171; Fri, 18 Dec 2020 14:17:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A24DF80103
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 14:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A24DF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K8gcgeKn"
Date: Fri, 18 Dec 2020 13:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608297443;
 bh=v6z69yu84QJf1R6RvlLOXcMX6c+Fwb3zy/Gr6WnNltI=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=K8gcgeKnC82VwJ4M0CQaQG76QT5VP10SRDtN8kNVWnNlu9I+CSCB07c6/MlHjQ0Uz
 UgHPhAhbKPEycfLmxUpE90p2yL9EEcFZB2xNdla2NOTYpt7Dvedq97d45Eke9KATbn
 P//PsnL7JlZCm5UW3XbqO8BpQots8yJ0Hvw9VmkWLEuVHMQ6ClLaHMe1M9wj523Qms
 GU5BMD3lgQIiQuNHn6YHpbMwYIjIBH9UAac0IYZo3CXmCZ3+QN0Yaw4Bs1HyzOjDlV
 e8ctID2YzuRNAFf3XpZ1a5+J+jjnmBAm5sfwb7gAk5F6fnqby1jOCOGCbGHp8OMyXh
 qm/zJM/YVhnoA==
From: Mark Brown <broonie@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
Message-ID: <20201218131709.GA5333@sirena.org.uk>
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
 <X8ogtmrm7tOzZo+N@kroah.com>
 <CAPcyv4iLG7V9JT34La5PYfyM9378acbLnkShx=6pOmpPK7yg3A@mail.gmail.com>
 <X8usiKhLCU3PGL9J@kroah.com> <20201217211937.GA3177478@piout.net>
 <X9xV+8Mujo4dhfU4@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <X9xV+8Mujo4dhfU4@kroah.com>
X-Cookie: Password:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, lee.jones@linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kiran Patil <kiran.patil@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rdma <linux-rdma@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 Martin Habets <mhabets@solarflare.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>,
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


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 18, 2020 at 08:10:51AM +0100, Greg KH wrote:
> On Thu, Dec 17, 2020 at 10:19:37PM +0100, Alexandre Belloni wrote:

> > There is something I don't get from the documentation and it is what is
> > this introducing that couldn't already be done using platform drivers
> > and platform devices?

> Because platform drivers and devices should ONLY be for actual platform
> devices.  Do NOT use that interface to fake up a non-platform device
> (i.e. something that is NOT connected to a cpu through a memory-mapped
> or direct-firmware interface).

> Do not abuse the platform code anymore than it currently is, it's bad
> enough what has been done to it over time, let's not make it any worse.

I am not clear on why you're giving direct-firmware devices (which I
assume means things like ARM SCMI where we're talking directly to some
firmware?) a pass here but not for example a GPIO controlled devices.
If this is mainly about improving abstractions it seems like the
boundary here isn't great.  Or perhaps I'm just missing what
direct-firmware is supposed to mean?

In any case, to be clear part of what you're saying here is that all
I2C and SPI MFDs should be rewritten to use this new bus - I've just
copied Lee in again since he keeps getting missed from these threads.
As previously discussed this will need the auxilliary bus extending to
support at least interrupts and possibly also general resources.

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/cq9QACgkQJNaLcl1U
h9Cf2wf/V/9ux9B/P6JhOdSp8/cnAt5M1bqV3QMIpBxKfkDzfpIhgCbQHcuTHohO
GadrjXD1DMJSWcpx/mh1qNjeEYyROMYnVN7UrxVgTgrCD/HN/MqpgvWlLA8ubGTH
S6/1XPHbMOsHIIXclMzGpmO4jA9hOwKz14gnvnWraHDojOhymTJV9Jl2wQ9UaOV/
FDPyY3zYA0fUvzSkIDkzHAcjhdpulnxztlYYH73f81R1L1NTdfMn1E4mZMBIBMMD
94BiLYMhjiFBXH2MkTbSugyxARIgOM9uKM3AIttLQq7l4deMDjvOX85wlcGA6JjM
/jmS76XyUz+UNO505l7CrvuL0X37jQ==
=ErBA
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
