Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D016A1E8674
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 20:18:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66CE7179E;
	Fri, 29 May 2020 20:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66CE7179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590776280;
	bh=GH7xgOfWGLC1xYWHZL51BlZXClwRjmPTGXTEkgGZCAc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fnUbt7MKmTwj/ncPN70PqykCwv9fZrWMRZvopdgc0ijaHyCs5lZVRVB339zloh2/c
	 KPamKaJ9ttSFmkDisr4F4XWEDR2GurJw5AE2pYmedHedrGfGRxIaNPxPl+8g3J2kC3
	 6u+4mzox9G/f/SYVzf+T2nOTVphr7HkgJ96F1W8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70CCDF800FF;
	Fri, 29 May 2020 20:16:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0045F8016F; Fri, 29 May 2020 20:16:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3CE4F80125
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 20:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3CE4F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rs/5+UaB"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E96E3206A4;
 Fri, 29 May 2020 18:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590776170;
 bh=GH7xgOfWGLC1xYWHZL51BlZXClwRjmPTGXTEkgGZCAc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rs/5+UaBczGURiLrYQDpbv1FEsswVSL+V7v/G+hW1TcMvv846K+Vqn5aLBaf0Zth3
 fKZGLUa+ZDpzeu3pWLeubWt+46pbK9QSLhmRNRxYJwAmddJfx/XAE+WX2bhO/qkD1V
 RDEIci3V4TGyCD05zXZeC4PH9tOmCjRw2P5giNv4=
Date: Fri, 29 May 2020 19:16:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] ASoC: mediatek: mt6358: support DMIC one-wire mode
Message-ID: <20200529181606.GU4610@sirena.org.uk>
References: <1590750293-12769-1-git-send-email-jiaxin.yu@mediatek.com>
 <20200529110915.GH4610@sirena.org.uk>
 <CA+Px+wVSwJK-=75chKLjSEe3bPRtV2wD95W5D_pdR0Pw0G470A@mail.gmail.com>
 <20200529130539.GK4610@sirena.org.uk>
 <CA+Px+wVhXoU=BdBmMW0sdPtUrnQH+Kn6dkFdW-n67qEDGceCEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oP9at/Ymg5VWhwKB"
Content-Disposition: inline
In-Reply-To: <CA+Px+wVhXoU=BdBmMW0sdPtUrnQH+Kn6dkFdW-n67qEDGceCEQ@mail.gmail.com>
X-Cookie: The Killer Ducks are coming!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 howie.huang@mediatek.com, Takashi Iwai <tiwai@suse.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
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


--oP9at/Ymg5VWhwKB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 30, 2020 at 01:26:20AM +0800, Tzung-Bi Shih wrote:
> On Fri, May 29, 2020 at 9:05 PM Mark Brown <broonie@kernel.org> wrote:

> > I thought that was normal for DMICs - is this selecting between left and
> > right or something?

> Not sure what is the common name but use the same context here.

> MT6358 accepts up to 2 PDM wires for 2 DMICs.
> If one wire mode is on, MT6358 only accepts 1 PDM wire.
> If one wire mode is off, MT6358 merges L/R from 2 PDM wires into 1
> I2S-like to SoC.

Oh, interesting - so it's essentially a mixer?  Not seen that before but
makes sense.  In any case this definitely seems like a good fit for a DT
property.

--oP9at/Ymg5VWhwKB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7RUWYACgkQJNaLcl1U
h9DzCAf/eSG8ftQqt2zLUXgVK2VdTkdi/4wwtHrEUTnLh92NVK3qVJo7AlDSmwxK
nq/ophHJqVsYmeXUCott6BaJKspd6r+KnrnyJRupzBixtLTx573x7VdREPful5eW
6cVUHkoI0quLHqspblBrZFW0kvt6iwuol2dK0pIORn6rRiaaQlzB9kTmE1BI5Clt
GZrYuFcCzsW7IHYLPWD3Mbl9IsTFius8mjWym4jiglkPFu+8c8bgXRLJE7wGgoGz
x60eHOnNmXwuzOBkrao6njQPWLX+/jtRU5aw4mQ5csVzf662KRmsciNScxyWLHMV
v00PW1FlfI9AGrtQdlSKb1UMyO+Rpg==
=ODhy
-----END PGP SIGNATURE-----

--oP9at/Ymg5VWhwKB--
