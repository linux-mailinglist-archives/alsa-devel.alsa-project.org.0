Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 643E92791CD
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 22:13:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4DE61904;
	Fri, 25 Sep 2020 22:12:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4DE61904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601064826;
	bh=coPcB8xrH+9meR5yV7FB/exsUpDLvMonBsmvDaDfFpE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q4eVcoNSii3ZYmx7S0EXs4zvQKwscVS/NbW1zhMWjEQsvkMj270DOllofnBs9qyNi
	 v/hFd9TLFp7MCLOoBuycijPPFg1HarKZvFcrcYtYBRDWDW6WkBTdUHwB1NJUn6/S9d
	 DZuT8v5lJpIbz9v6D1joE5zamJ/tiVLOqg0cqSZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00422F801EC;
	Fri, 25 Sep 2020 22:12:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B324EF801EB; Fri, 25 Sep 2020 22:12:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6504FF800DA
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 22:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6504FF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UDc2OTni"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E46812399A;
 Fri, 25 Sep 2020 20:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601064712;
 bh=coPcB8xrH+9meR5yV7FB/exsUpDLvMonBsmvDaDfFpE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UDc2OTniUFlc27E7Ad+6ELpSQiZ1V+fcn2ie6PdPNRWbEksExnuOwiypvXAIsrMzz
 OXZjF0tnhlnzE3v+A5x9Ila04/sD2IbPF5GU+bltH1rbPrHfpM8inwp59KdGGn1om3
 Eg19cPFh+nlifKR10qcm95PGzFEN3r1wOkQn5UGg=
Date: Fri, 25 Sep 2020 21:10:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: More Generic Audio Graph Sound Card idea
Message-ID: <20200925201057.GI4841@sirena.org.uk>
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
 <097e3fc4-4a84-e101-e6b6-045c3e9e5bfc@nvidia.com>
 <87imdczd4i.wl-kuninori.morimoto.gx@renesas.com>
 <87blhuljkb.wl-kuninori.morimoto.gx@renesas.com>
 <20200925192202.GA9831@sirena.org.uk>
 <aceb1334-9b3f-7a62-60e9-6028059d4bf7@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QxN5xOWGsmh5a4wb"
Content-Disposition: inline
In-Reply-To: <aceb1334-9b3f-7a62-60e9-6028059d4bf7@linux.intel.com>
X-Cookie: Onward through the fog.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Sameer Pujar <spujar@nvidia.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, jonathanh@nvidia.com
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


--QxN5xOWGsmh5a4wb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 25, 2020 at 03:04:37PM -0500, Pierre-Louis Bossart wrote:
> On 9/25/20 2:22 PM, Mark Brown wrote:

> > difficulties today.  I'm not sure if we need this for more modern buses
> > like SoundWire, I'd hope we can dynamically assign slots at runtime more
> > easily, but ICBW.

> SoundWire doesn't have a notion of 'slot'. Instead you program the data
> ports for the type of audio data to be transmitted/received.

...

> In most cases, a sink port receives exactly what it needs, but for playback
> we have cases where all amplifiers receive the same data (we call this
> 'mirror mode', and each amplifier will be configured to render a specific
> channel from the data received. This is useful to deal with

Channels are essentially the same as timeslots on a TDM bus TBH.

> That said, the mapping of data ports between CPU and codec sides is rather
> static, mostly because devices typically dedicate specific data ports to
> specific functionality. SDCA will not change this, quite the opposite, the
> mapping between ports and audio functionality behind the port will be
> defined in platform firmware.

> It's a bit of a stretch but conceptually there is some level of overlap
> between SoundWire data ports and TDM slots, e.g. if in a TDM link you used
> slots 4,5 for headset playback, you might use data port 2 on a SoundWire
> link. It's however a 'logical' mapping, the actual position of the bits in
> the frame is handled by the bit allocation.

If a device is hard limited to particular slots we can presumably
discover that (either through the spec or by keying off the ID
registers) and do the right thing?  In any case if we need a firmware
mapping for DT systems it sounds like something that works for TDM
should be mappable onto SoundWire channels easily enough.

--QxN5xOWGsmh5a4wb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9uTtAACgkQJNaLcl1U
h9BZjAf/S1FSvmZTSs+LnEkPs60AAPJJQGOJaid9IbZP3zDhLBIIl2UIWDO1jh89
Myh9rDJzVFjGd9somY0fxQbS7RhcCi0hrfE3sXHOnGVYdUMeTRr5s29TZMCj/5kC
boZUkIxJVgtq9mfq7ytR9MWi9tIvQ2zf7nVCeyuIJ8vKGXmIyOyp6I9WOPWNKptX
6r+TWtZvhpz+JqyvkpBWGFBM7SajXxwNA0vRZQufxn/hVhrQZHKuaKt1en8yJnrt
3HsJhyUj6OHDNv55enLQ3hd98AGsjnrEj1C/hIBGuy8qgfNyQDrGxVfs1kNxNiJU
FIs344XhMygjCpTgrCQw6YdySDzZZg==
=CjHP
-----END PGP SIGNATURE-----

--QxN5xOWGsmh5a4wb--
