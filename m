Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CE6638DFE
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 17:00:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D27911752;
	Fri, 25 Nov 2022 17:00:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D27911752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669392056;
	bh=kdumfihSJADK+Kq+yJKT9k5SPIezgficIYgrrEDbVJg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wh3Z6a+rtygcaGgskteVA8bozWZ2sXuTm4jc4vTXyBIwqJ6wR9QIBls2RWsFpDoNU
	 jaurOXYw1wi4jdFVvWn4rWk3gDySSi3VN2QAaSuENQtLc2+vId4vt4ekFCTwHtW7TB
	 0rSDjJJ5MWSiNY6sWGpgiyz3rrufr4s8+2opLCEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A30CFF8047C;
	Fri, 25 Nov 2022 17:00:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 406C6F80236; Fri, 25 Nov 2022 17:00:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB88BF800F4
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 16:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB88BF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kA7vO9Si"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3608DB82B50;
 Fri, 25 Nov 2022 15:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F04C433C1;
 Fri, 25 Nov 2022 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669391996;
 bh=kdumfihSJADK+Kq+yJKT9k5SPIezgficIYgrrEDbVJg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kA7vO9Siw3wMoxdG/yBf5+vK5r5UxqFnQURWId3gUqTP1wTZHongrFakTL+Q53/3B
 peRvSDajDp+wUYr0ds6tXMZuJRxHj4IG8TRAfAp2RxRFMQETQGJ9Kg501FVvoCAV4q
 UuU96Q08c1BkvIeWaZsLkalgE5ZzzVwmUITpdSyybKm77ayLcZAcb7OBSb1miTPzPc
 sKvU/487rDCgHh77V6DRUlBBidpfg/82Pg0pwS+ZYfB4EHv8ROAzh204kInrfqkuf9
 AXIYfqaa2TVq9rp73KplQiFdct44Gu6go7e8BFYez/xyX17YcVPPms8Df9FT0lUZVr
 GMlIjBWHBs7qg==
Date: Fri, 25 Nov 2022 15:59:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: SOC_DOUBLE_R_SX_TLV controls broken in cs24l51 driver
Message-ID: <Y4DmdmMUCkHkAAQh@sirena.org.uk>
References: <CABDcavYdsk-O4x3oPX4i4+T5wsoZV26_kpEq6JvpD8A_cAGHxg@mail.gmail.com>
 <20221124111336.GE105268@ediswmail.ad.cirrus.com>
 <CABDcavbRryENG58LO7+gbJeKbBBPP1uG1Xc00yXUBNzspWpWoA@mail.gmail.com>
 <20221125155023.GF105268@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iliBHVfTx4YPr1QE"
Content-Disposition: inline
In-Reply-To: <20221125155023.GF105268@ediswmail.ad.cirrus.com>
X-Cookie: Time and tide wait for no man.
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 Tan =?utf-8?B?TmF5xLFy?= <tannayir@gmail.com>
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


--iliBHVfTx4YPr1QE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 25, 2022 at 03:50:23PM +0000, Charles Keepax wrote:

> Yeah they definitely should, I have resent the two patches
> including that fixup, lets see what Mark says. You are CCed
> on them so be great if you could give them a test too.

Please send the incremental fix (which you didn't mention in the cover
leter...) as an incremental fix.

--iliBHVfTx4YPr1QE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOA5nUACgkQJNaLcl1U
h9CeMwf/YLf31WS/3Nn6O7G7MbZ3p2lo72AkUx0WAB4cHcoGqV0XeoxYEkHP64mJ
uRlnP2TG+ObCt+sdsQQ1msxNxnrUKCgJhI8zLm4eWB28fbAzqLn8q1FFjvtM4xPc
17CVOWwB5UtOGBUAp+LKrgttAdq9AXVRX8PHHquEsxko+xNAjraZYmFPH+mtuQSl
yeIo7Py5P8bHH/I4QBb+6VIAYoHnq2PR0NoyyV9q7caK+RgxMU9WKL41vJ+HuwaC
DE/Pyp+r2ejfd3BFT4dj8+6kOO2sHfRbbRXoD1a5QAkCljs+0RKir4e+nsI+lk6h
OlgTFcYJc4rxFDZLxelvcrR6uEEopg==
=sdYP
-----END PGP SIGNATURE-----

--iliBHVfTx4YPr1QE--
