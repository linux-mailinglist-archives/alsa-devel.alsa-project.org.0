Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A42814C4FC5
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:41:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 291C11DE4;
	Fri, 25 Feb 2022 21:40:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 291C11DE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645821682;
	bh=zxDATE5T4nAxC32Whq1+k2Ts5ipceAvf6DKKgR9mfUQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2eEt+YZtXY6hqkrSgdZmnrLAIgZQDOLp7YQWVSGfdodgAh/kArpN9r8143/FukGb
	 oLQGXNOwbrWiBgq5lmtmZ7rlqFRDfhN6cJtb8OUpvKc4E6viqbB5dL207xJIWmLU9T
	 U3j9T3vD0P3HV7aFXHREQea+m/KXqGQ80beP1qjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F12AF80159;
	Fri, 25 Feb 2022 21:40:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B2FAF80132; Fri, 25 Feb 2022 21:40:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2393F800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:40:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2393F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hrpQ7YwS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4497E6194B;
 Fri, 25 Feb 2022 20:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0684FC340E7;
 Fri, 25 Feb 2022 20:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645821605;
 bh=zxDATE5T4nAxC32Whq1+k2Ts5ipceAvf6DKKgR9mfUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hrpQ7YwSeh5sscihYcV+TYDt1O1t3NgWkx5jOWu+WSlXp+Glrz/YlfV/x9AGEUQg6
 KW9W50yPmmkhpl2dCQJ0UDYT7ii7otMq7bmriBAqifVREs7SPVMS23+SEdHRrtZje3
 z9M2gTLBRQM8x7BKzkHa0SNpLuxLbHVHOp2TplWn22MqP2g5SVymEik2ZlDYeeaVWU
 Q7aIfqk04dAzRpjaf0i4035gtcx9EXtZF4e8pC0GxOyG57/2iwlZMdTioq4R+5bOOx
 JquN1ANWyZ5kGRSBF5Co235A8oZWLEDB+br1bEpCLNuZzPbjenRGpAOyp44sFk89Xr
 YzoaR6mZz0L4A==
Date: Fri, 25 Feb 2022 20:40:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH V2 1/2] ASoC: dt-bindings: audio-graph-port: Add
 dai-tdm-slot-width-map
Message-ID: <Yhk+oFJBMAqYNc6r@sirena.org.uk>
References: <20220217134835.282389-1-rf@opensource.cirrus.com>
 <20220217134835.282389-2-rf@opensource.cirrus.com>
 <YhgCbKzfPXEVauwW@robh.at.kernel.org>
 <7d11f36e-4b56-8c17-a114-d024f76f3b9e@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/T0XV2S4I1DB6qKN"
Content-Disposition: inline
In-Reply-To: <7d11f36e-4b56-8c17-a114-d024f76f3b9e@opensource.cirrus.com>
X-Cookie: I smell a wumpus.
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
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


--/T0XV2S4I1DB6qKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 25, 2022 at 12:08:00PM +0000, Richard Fitzgerald wrote:
> On 24/02/2022 22:10, Rob Herring wrote:

> > Is there a need for specifying where in the slot the data is?

> I don't believe so, all the protocols I know of have the data bits
> transmitted first followed by padding. There's no harm adding a
> reserved field to allow for this info if it is ever needed, but it would
> be unused at present as there's no kernel API to do this.

It's part of the general format for the bus I'd say.

--/T0XV2S4I1DB6qKN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIZPqAACgkQJNaLcl1U
h9Ajhwf+J82kl/TOlVA+wFKSsRgst+nXorJvUGgpk40srNqnLsDbtFdEl0VhpVMb
9dQGF5YwjfvOI52ERTvwRrlYrAcUZom76BY2nCDuPclvHmpKkL1WF9CVPfLPszpc
NOcd8gYtM3M52wSSgroFI2crtlFuY6G+qCsrp9+p/7oMyzALrt4kjmrksAAmb4lv
92Q974Uc2MX9t0meFmZFKUqYuJFsn7FzNlVjuFZbpPEM8i4GVbdjEfkMr3cMrQMy
JaZmgPVoEdsM609PprJ4LxbUHwNrEVIXMecDZ1L/GU/SMVYYC6gKlxUEeJs3Arcv
gfInPtVf4G9xCM6SdPWqFtTGzIcmtQ==
=/qfj
-----END PGP SIGNATURE-----

--/T0XV2S4I1DB6qKN--
