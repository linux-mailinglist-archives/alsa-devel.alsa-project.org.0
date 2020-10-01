Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D24F32807E2
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 21:41:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 526F81920;
	Thu,  1 Oct 2020 21:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 526F81920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601581298;
	bh=mjHWL6zKQHHScvFiEsEv1ucoF3dQpgwhfnHLnvym6f8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PUTzDJMfRKWB8THRjDpkTtyrzdsCCf2L7xOH+CFQCe+Jn0QdcgCXn3zpP5T4yT+sm
	 BziwFONoFibH5zxRXTKjdZ1yQNJmKt0qiv2oGAPffimImQMiqHe9ZNEtqgs/xRiLqY
	 ogEqbYf63VL4zpNANoW9LhDUvQLLTQRZ8GFe7uOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8430CF8020C;
	Thu,  1 Oct 2020 21:39:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86441F801F5; Thu,  1 Oct 2020 21:39:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6796F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 21:39:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6796F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hkw9Hf86"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BEC520759;
 Thu,  1 Oct 2020 19:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601581185;
 bh=mjHWL6zKQHHScvFiEsEv1ucoF3dQpgwhfnHLnvym6f8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hkw9Hf86gYZUfnUMROBbbfQslEY+J+Mq0SmJbb1+j7hAI9muYViWvBGgxllIutPvC
 27XjnyFWRtxxgEbqrFaLh3xaZZKtNaF8l3GdX8Db752Iz4LSc0jyCfOP243KotdRof
 KNpNQdSaCj9mOiyounf2TD0473U2cbxhOzGqmJkM=
Date: Thu, 1 Oct 2020 20:38:46 +0100
From: Mark Brown <broonie@kernel.org>
To: "Ertman, David M" <david.m.ertman@intel.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201001193846.GW6715@sirena.org.uk>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk>
 <20201001131252.GA2382269@kroah.com>
 <20201001144019.GJ6715@sirena.org.uk>
 <20201001153207.GA2414635@kroah.com>
 <20201001160316.GL6715@sirena.org.uk>
 <20201001181624.GC3598943@kroah.com>
 <DM6PR11MB2841EB2B3699578E9FE2AB7BDD300@DM6PR11MB2841.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oAjj1ZwgLg4oRN9q"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB2841EB2B3699578E9FE2AB7BDD300@DM6PR11MB2841.namprd11.prod.outlook.com>
X-Cookie: Stay away from flying saucers today.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
 "Sridharan, Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>
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


--oAjj1ZwgLg4oRN9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2020 at 06:29:58PM +0000, Ertman, David M wrote:

> > I would like to move those PCI MFDs away from that, and into this bus
> > instead.

> > If there needs to have a way to pass/share resources, great, let's add
> > it, there's no objection from me.

OK, if we can add resource passing then no huge problem from my end
since there'd be no case where you couldn't use an ancillairy device.
It's still a bit confusing but there's no cases where we're supposed to
use an ancilliary device but it doesn't have required features.

> The sharing of information is done by having the parent driver declare
> the ancillary_device as an element in a parent_struct that also contains a
> pointer to the shared information.  This way, when the ancillary_driver
> is probed, and a pointer to ancillary_device is passed, it can perform a
> container_of on the ancillary_device and gain access to the shared data.

> This keeps all requirements out of the ancillary bus code and it can be
> as flexible as the implementer wants it to be.

This means that every device has to reinvent the wheel for common
resources like interrupts, including things like looking them up by name
and so on.  That doesn't seem ideal.

--oAjj1ZwgLg4oRN9q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl92MEUACgkQJNaLcl1U
h9B7Fgf/am2PMveFLjOytE9Sv6x15g5CMQR90vT0XigIDzTtC2I2FU8QKPxKDRr3
Gm2wvJKX8y2WsqVn7EJb7vfiUtSbnI/PwdxYrXk0MZGQCK3GJi953MUljMO7VvMY
qPvHpMRbsvSCUjCCtv1WfAdElVk3Gu74VW+zQMeczzTtmwhla+hOZaJFFHfbJ10h
XpHRz8BdLwRu1QUcrrWsBSwI2F+9GypIwXqak8AN0OR7cYGeL5fRhenlcELh896V
DVjfvZlLRIHB4xThd4UhCjQFh5UIcZovqLiFARQOxYdIehA6ehj7ptzNgWDTawT/
rHBjWTW3/OFzwPALIe8b/ZL+V/ryTg==
=BV/W
-----END PGP SIGNATURE-----

--oAjj1ZwgLg4oRN9q--
