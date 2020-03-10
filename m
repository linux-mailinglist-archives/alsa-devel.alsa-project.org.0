Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9932180347
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 17:30:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D2FD1669;
	Tue, 10 Mar 2020 17:29:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D2FD1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583857805;
	bh=bY0YlrXe+z0B33TzYbdnT6Y3nRnk/0wddKXDasYDUfY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vzlh9Pk0Yg2kZtkpf0aFcyS+Swi826VcpYZ/HL4edhu+eZWQYhb+xcswtdXvPCz5S
	 Z4LiiuTQI9DJV/7rt3FFqvQkE+zfmGoEgiyoo5/T3iVI9olTonorBzo56gxQZD6lM/
	 7TJRR1UztUrZ/1l7Vw4fNBrX8HHXu6/4o+P5ZHIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CE92F800DA;
	Tue, 10 Mar 2020 17:28:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5BF7F80217; Tue, 10 Mar 2020 17:28:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E789BF800DA
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 17:28:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E789BF800DA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8ADE21FB;
 Tue, 10 Mar 2020 09:28:10 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FC453F67D;
 Tue, 10 Mar 2020 09:28:09 -0700 (PDT)
Date: Tue, 10 Mar 2020 16:28:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Kevin Li <kevin-ke.li@broadcom.com>
Subject: Re: [PATCH] ASoC: brcm: Add DSL/PON SoC audio driver
Message-ID: <20200310162808.GI4106@sirena.org.uk>
References: <20200306222705.13309-1-kevin-ke.li@broadcom.com>
 <20200309123307.GE4101@sirena.org.uk>
 <69138568e9c18afa57d5edba6be9887b@mail.gmail.com>
 <20200309175205.GJ4101@sirena.org.uk>
 <8113837129a1b41aee674c68258cd37f@mail.gmail.com>
 <20200309191813.GA51173@sirena.org.uk>
 <1165b736-d0fc-1247-6f46-94a51d392532@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WR+jf/RUebEcofwt"
Content-Disposition: inline
In-Reply-To: <1165b736-d0fc-1247-6f46-94a51d392532@broadcom.com>
X-Cookie: In space, no one can hear you fart.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Scott Branden <sbranden@broadcom.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 bcm-kernel-feedback-list@broadcom.com, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-kernel@lists.infradead.org
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


--WR+jf/RUebEcofwt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2020 at 08:49:08AM -0700, Kevin Li wrote:

> > This is not how any of this is supposed to work, it's unlikely to work
> > well with other devices.  If the device supports both master and slave
> > operation then you should let the machine driver pick if the SoC or the
> > CODEC is master via set_fmt(), randomly varying this at runtime is not
> > going to be helpful.

> Maybe the name "master/slave" is confusing, these names come from internal
> chip signals and do not represent the state of the i2s bus master. Our SoC
> supports only master mode in the i2s bus. The Rx and Tx block each have an
> independent bit to indicate if it is generating the clock for the i2s bus.
> The i2s bus clocks need to be generated from either the Rx block or the Tx
> block, but not both.

Right, at the very least this needs to be better documented in the code.

--WR+jf/RUebEcofwt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5nwBcACgkQJNaLcl1U
h9A6pQf/bT2lCprxs3DA2/Vx/yM3Ff2ZDC3VmEzFcFoscpWNx2hOh9KohpTKb48l
laXl5M87VISWnaTdNMb1uBh1FPljBqHfYdE8IlUbr9qU0i88TJ883m9YxTPQ5xv7
Xt27ndFU/3gzEzDrpwKB/tbCCcYKoCwMIgPTs5eRNUzN+TY46HcgnxFFQ6ztGQ99
lh/5tl7Bgchn3Vy0GgBJKj0LDxkZta0GAI8MMt5M4pMOBUFJSG9ULQfdyNhB1n8D
ev0H3RU4FWKIfJx6CkWwwhnb/BrdZ+xPTF1kTYaGmkXeL7dJgjwJe6rfsSnDWbOU
01yQDtxGqZZMUMHy7OA6TlHLpyd5UA==
=Pkro
-----END PGP SIGNATURE-----

--WR+jf/RUebEcofwt--
