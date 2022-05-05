Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B42551C341
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 17:02:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E6691777;
	Thu,  5 May 2022 17:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E6691777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651762964;
	bh=UUh4IAYvnUeRl0+FGz9aUqMk1V1C/5Mv1s6gce1m4PY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GvZX0hrgxs+fN4Jcu4Jl/m66+MKr27RTLVKKWOGVTHAuV4MGBsXnhE30doBdg1rAR
	 tmY2bXfXH9v0ohb56ph4l0MxY6RrP9/QCHHM+cOCoI84Z8K4Pr688V5ttLMPFDCR01
	 4FMEn8AFSSDAaxUm6UaHTijoBvGh+ToKJ9pSyOxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B1D2F8049C;
	Thu,  5 May 2022 17:01:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FB02F8016B; Thu,  5 May 2022 17:01:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 495A9F800D3
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 17:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 495A9F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S8Y4NKxo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A1783B82D82;
 Thu,  5 May 2022 15:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14047C385A4;
 Thu,  5 May 2022 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651762894;
 bh=UUh4IAYvnUeRl0+FGz9aUqMk1V1C/5Mv1s6gce1m4PY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S8Y4NKxoe5tibidDLQ1YsIqidmaB/VrEldK+Y9cbMH5jS/+MM5rgrPY10yHnZuKpA
 Vx9PHYyx0ctjGVYN0AW2U+dj9sQF9nYeW19rmlBAaro91ZcvrnCEvQGSa4AOhWe4F+
 AORKwgkynESpVtUsLkKVDuj91k0fG9nqnFkW+X74VADC85jI/SoExoUCj45dBUkPpw
 Xi936/6T6rBsBBkB/rBLDpE8NcvgzDUFSfZGqCKN4nIruGHpACikgCGzflWOu6DwGI
 kpfzOf2U/DAZwBv3TrR1gbINOSQxTB6NUvESyu3p4jsN3Y180ej0joxdrI7Y7frWDd
 SCwA7xo4UFLIw==
Date: Thu, 5 May 2022 16:01:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Codrin.Ciubotariu@microchip.com
Subject: Re: [PATCH v3 6/6] ARM: configs: at91: sama7_defconfig: add MCHP
 PDMC and DMIC drivers
Message-ID: <YnPmyEujwByeFDdp@sirena.org.uk>
References: <20220307122202.2251639-1-codrin.ciubotariu@microchip.com>
 <20220307122202.2251639-7-codrin.ciubotariu@microchip.com>
 <d84e0e48-cf35-ae1a-e384-067d361457ba@microchip.com>
 <77c2b348-b7a6-458d-21b6-68c54efc317f@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="V6OcCftqYTAkRMmU"
Content-Disposition: inline
In-Reply-To: <77c2b348-b7a6-458d-21b6-68c54efc317f@microchip.com>
X-Cookie: Real programs don't eat cache.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de,
 tiwai@suse.com, Nicolas.Ferre@microchip.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
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


--V6OcCftqYTAkRMmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 05, 2022 at 02:47:04PM +0000, Codrin.Ciubotariu@microchip.com w=
rote:
> On 05.05.2022 16:58, Nicolas Ferre wrote:

> > I'm fine with that, but I see that some Kconfig entries "select" this=
=20
> > SND_SOC_DMIC directly (amd, intel, mediatek, stm).
> > If it's absolutely needed for PDMC to work, what about doing the same a=
s=20
> > it would prevent some broken configurations?

> The only way it makes sense to me to have this driver selected somewhere=
=20
> is in a sound card driver, used for a specific board, which we know it=20
> has PDM microphones. Since, for now, we use the simple sound card for=20
> our audio interfaces, we have no place to add this select.
> The reason I do not like to add this select under the controller driver,=
=20
> as some of the vendors did, is because, in the future, we might have=20
> different PDM microphones that might not work with SND_SOC_DMIC and=20
> might need a different driver.
> I don't have a strong opinion on this. If you think I am overthinking,=20
> please let me know and I will change this.

It's unlikely but possible that there could be some other device
connected (eg, you could have a DSP or something that generates PDM
output).  If the driver doesn't directly instantiate the DMIC itself
then it's probably reasonable for it to be user controllable if the DMIC
driver is there.

--V6OcCftqYTAkRMmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJz5scACgkQJNaLcl1U
h9BoAQf/RxATTm9oBfzFYiQDmMZnY6nSvVtROk9XiCIp4BRvt4ezstNodFEGlLKQ
fWhTWfMmr7rGF9Syj1Zb6W/2Fahc/R04bml6dXcDHBKeW5a9Tnslg4U0brWHd2oT
SeE9ZVLQzoFgUcCh6DrwxpYIkfbPrZwrBS0YNHHgjw3LAc2voYJiNm8njcOXop9i
+kpz1RZs60mULxSPGoNOr/9HNfNc2H3lZcSG6ZkdjkiXMJ4TjedzB5YpaOFGrYLN
hCy9jHw/mzCFq9EnV8ubaTI05RFwIusQd0doLtRxlgrrS94+mwNqHggZLnFK95Z/
BnnQHFiY+49FUwRU4NPZhfcFayakzQ==
=TVpY
-----END PGP SIGNATURE-----

--V6OcCftqYTAkRMmU--
