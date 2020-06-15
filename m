Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 494EB1F96CE
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 14:42:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D31F0165D;
	Mon, 15 Jun 2020 14:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D31F0165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592224924;
	bh=EO5ZRYBpH1C4C5qa2NcbMw592fMRBuFirZPGlbFWgZM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AwwBSv5qhfgADrxNuz8Reaf/w6a6w5COlKt8LFqOuMynMQytBpaPm4PueU7II4sOD
	 2dNLlAyQm29UI1V5agjKMrf+GQyQqwJ8fgvwNzP43enL67TZKL05/AeehaeK4tV3md
	 lX7MXnMBtb0gB1yjHuUINDV5XZlTfqGCVLIErisw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03E86F80162;
	Mon, 15 Jun 2020 14:40:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C14BCF80171; Mon, 15 Jun 2020 14:40:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70623F800EF
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 14:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70623F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oL7MGWqx"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCA07206D7;
 Mon, 15 Jun 2020 12:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592224814;
 bh=EO5ZRYBpH1C4C5qa2NcbMw592fMRBuFirZPGlbFWgZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oL7MGWqxb7/sHBciJkrGU8DD+KZlRiKzHJ74HIG12Az6wHonwsHTNTgtloHbnGRcj
 /QwdGybYjHazzpVxdUQsYIm4bLsnRA5KW8pOQwTqgJDVshFRmE6VWUuBA7bQe8LRSF
 CpA46qSwmr6OmDHrvC9yir2bl19Ej1Vcl5GQH/74=
Date: Mon, 15 Jun 2020 13:40:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonathan Bakker <xc-racer2@live.ca>
Subject: Re: [PATCH 1/3] dt-bindings: sound: Document wm8994 endpoints
Message-ID: <20200615124011.GQ4447@sirena.org.uk>
References: <20200614202411.27843-1-xc-racer2@live.ca>
 <BN6PR04MB066019A8783D22F1C4A588B7A39F0@BN6PR04MB0660.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0pkK7MCEo5hACTvx"
Content-Disposition: inline
In-Reply-To: <BN6PR04MB066019A8783D22F1C4A588B7A39F0@BN6PR04MB0660.namprd04.prod.outlook.com>
X-Cookie: Offer may end without notice.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, sbkim73@samsung.com, linux-kernel@vger.kernel.org,
 tiwai@suse.com, krzk@kernel.org, robh+dt@kernel.org
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


--0pkK7MCEo5hACTvx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 14, 2020 at 01:24:09PM -0700, Jonathan Bakker wrote:
> The wm8994 exposes several inputs and outputs that can be used by
> machine drivers in their routing.  Add them to the documention so
> they don't have been duplicated in any machine drivers bindings.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--0pkK7MCEo5hACTvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7nbCoACgkQJNaLcl1U
h9BsHAf/R6p55ub66+PR9VoeILZ3Cel+cYNBquoO9QHAW7l3ZzoLyIGqAp3+HqMz
CDspNYVkwDTh/lheZ5gCxCJojyx+XZIv7ypw7jk8qmPlq4ICg3Mfr8CYedv0iOWt
3lllvjaGn3onurgnp5AL086sjlU04BVyfi5NVt6RtCxYVTZM3lmJbOvS063tcHIf
+95X95RPCersu7prWaUarL/MD+PKPMdLvzQqWo8+YZ5CmtdJULDPPfk6l6trGiuH
nCLjvbWMZu8OGLAqcgf2bWDbu6RbaCCIO9SmGfl3oBOS1aTyoCHk5uMhuhCBxRfn
3q3R0h86r0xl2NoEBOrRZ+gCE7y4vQ==
=Qt7u
-----END PGP SIGNATURE-----

--0pkK7MCEo5hACTvx--
