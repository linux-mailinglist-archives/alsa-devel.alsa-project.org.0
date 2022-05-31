Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB865390AF
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 14:26:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 674AF1F37;
	Tue, 31 May 2022 14:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 674AF1F37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654000016;
	bh=iTGr1P845DzIaHqJ26zm6vhLif6W3Fd+VDJS1dHX6ZA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U7BfR/Wb1ljP4PGRE3OknlOPe2fdKSPTm3oHhNmfXF6sJJQVvAhrTri8Te0+HGMb2
	 vcOqIMsNn87ghucCp/a36iOMGDWpH0NecP1Nk657ugzZ/PcFCZwfHLDWjtLx21pdgu
	 k3mDMpmcSx183YzgD5g9fs56kPw03RfR2wy0WjKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2AA8F8019B;
	Tue, 31 May 2022 14:25:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEF7BF80161; Tue, 31 May 2022 14:25:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BFFDF80129
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 14:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BFFDF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UBcnGCJd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16AC361178;
 Tue, 31 May 2022 12:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F274C385A9;
 Tue, 31 May 2022 12:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653999951;
 bh=iTGr1P845DzIaHqJ26zm6vhLif6W3Fd+VDJS1dHX6ZA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UBcnGCJd2CF8hCgvyJBVGPBeWn1R9iOFvQAfnZ6tGVVKkqCDpUiy37IrJMjFlrNgh
 plf8TZwcGS2TD8P2LZribewV6sajbZTZpwbEXOO11SixYEhMQV4FenDiEAjC7Uxzp9
 AwM6cIDrx66fs1XVdX5C4ENmYYFSm/UoHAB7sVla9eIrYvyyKBT1dukP/ZhHTgR7pi
 +R8gzyS805NTzDmjzxYbMuTVNdbL3tbaB9QCSn75xgP5RREIzj23SqTvjOQy9WHho7
 vMKmzEjpzjxUJdcwPFIEHtbwCJJPOzMOco+TqkmUDjO8t86OCzZSGiU7pv5FuD9Z4B
 QArkqfoJ3CKPg==
Date: Tue, 31 May 2022 14:25:47 +0200
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: About Cleanup ASoC
Message-ID: <YpYJSy4h8mvPSnGh@sirena.org.uk>
References: <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
 <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
 <87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>
 <349ddb89-6f1e-f087-2399-795cf82b92b3@linux.intel.com>
 <87ilptqbvx.wl-kuninori.morimoto.gx@renesas.com>
 <021e4cc3-f67e-865f-0d8b-5b07fce97623@linux.intel.com>
 <2f60063a-4c99-89f4-4e14-938bb9383844@linux.intel.com>
 <498833ad-dd6a-8952-d569-d1ed726f4eed@intel.com>
 <3861ca9a-6444-6f23-f447-64cd610b4d34@linux.intel.com>
 <87a6b3a2px.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kESFw8hMLSq4HFgy"
Content-Disposition: inline
In-Reply-To: <87a6b3a2px.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: May your camel be as swift as the wind.
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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


--kESFw8hMLSq4HFgy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 27, 2022 at 06:50:34AM +0000, Kuninori Morimoto wrote:

> > Because there will be at some point an ACPI device for the machine
> > driver. I can't give more details on a public mailing list just yet, but
> > the approach based on the PCI driver creating a platform device is NOT
> > future-proof.

> I'm sorry but I'm not well understanding what does "machine device"
> is meaning here.

The card (eg, audio-graph-card).

> If [DeviceA] doesn't need complex DAPM/clocks control,
> my indicated style can be one of the solution for it (?).
> But in such case, *general* DAPM/clock solution is difficult.
> One note is we can still use AVS style on this style.

It can definitely work for some simpler cases, but working out
which cases and making sure that for example things don't break
if someone improves the driver for a piece of hardware gets fun -
things might not be linked up with current code, but the hardware
might actually have more features that cause some cross
connection.

> If my indicated (remove Component vs Card restriction
> as fist step) was correct direction, and if we can agree about that,
> I'm very happy to work for it (not including DAPM/clock
> *generic* solution for now though ;).

On the one hand there does seem to be some demand for it, on the
other hand I do worry that it will end up eventually just running
into things that mean we're effectively pulling everything back
together into a single card again, even if what's exposed to
userspace looks like multiple cards somehow.

--kESFw8hMLSq4HFgy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKWCUcACgkQJNaLcl1U
h9BQPQf+M6Ge4D+VhA1H0JZ7kAvVkIWQOkPT4zTbAWBwguadK8S7XXl+/GJHp0eE
ZM3r/48UIBg/IyeN2m0wf2ABI4+MJPrGjrmrpOXIuK7vtWzUMQLKZmHT13Z6JP3c
58UKMyyXKzViNJ/0KsZHrhEnYQQZ+3UQjag9iHikToVA9DmE8yIJaelkBZ0Hsp4Y
sZwxsHuZSR0e5Lenj/TbTCEEiSdhhziedTKBd/GVsjvFZbUBremmWW5lKwganEVX
EqVabbXMsNw7ER53+rot9i0AojbBwBuDpJrGSKz9nYsLRLXW8QUKBJ49XKiNrDoQ
iWr2yX1+37DeFqgXuiiTk5luQhBShg==
=0fw2
-----END PGP SIGNATURE-----

--kESFw8hMLSq4HFgy--
