Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C391D1C58
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 19:34:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EE6C1666;
	Wed, 13 May 2020 19:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EE6C1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589391266;
	bh=c5W9rpD2+UW166Uji2V1vo4DwDd8jq/A5/RA+lqaeOA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D8TGZFQBYjlxh8NQSOkQbh9XsNlJoVPLJsYwONZIK3Zb/n4z5xkqUj/XApwUJ/VLB
	 h2gqbK7F5P+Bx5QuqUwnbfomF5b6kHsx08dwuvMf18vskF8ltQOaCib1P03h3U3oi0
	 d+v2dmj07GgApcuaiehAVorlSrmF9u8u/Y3g29S4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE7C9F80253;
	Wed, 13 May 2020 19:32:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3644F80247; Wed, 13 May 2020 19:32:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17DE1F800BD
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 19:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17DE1F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xEvS/dWb"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CEC622053B;
 Wed, 13 May 2020 17:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589391154;
 bh=c5W9rpD2+UW166Uji2V1vo4DwDd8jq/A5/RA+lqaeOA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xEvS/dWbRyHtWlK3l/oGbVdx56XevYH1jTt0hMLnyX4/m+Aow4Q38GA3cw5/TY5c3
 k3EPy/1b02NyJiPHWx6bctoA6uFOD9fMnVNzJ3Kc/HCOMrHSugXPypnW2YbhsfqXbp
 cbujCVqTMXaI4vg+JpFD8prueEPyO5ecgFVIpKYI=
Date: Wed, 13 May 2020 18:32:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] ASoC: tlv320adcx140: Add controls for PDM clk and edge
Message-ID: <20200513173230.GQ4803@sirena.org.uk>
References: <20200513144746.14337-1-dmurphy@ti.com>
 <20200513153243.GO4803@sirena.org.uk>
 <d2e3741e-ba06-7578-b5f3-2af75e1e33c7@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5AmtYbcgdBTTPS58"
Content-Disposition: inline
In-Reply-To: <d2e3741e-ba06-7578-b5f3-2af75e1e33c7@ti.com>
X-Cookie: Long life is in store for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--5AmtYbcgdBTTPS58
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2020 at 12:16:03PM -0500, Dan Murphy wrote:
> On 5/13/20 10:32 AM, Mark Brown wrote:

> > Are these (especially the clock and polarity) things that are going to
> > vary at runtime?  I'd have expected these to come from the hardware
> > rather than being something that could usefully change.

> Some microphone support low power modes that use a slower clock.
> Polarity will probably not change at run-time, but clock speed can change to
> move mics from low power/low-resolution to higher power/high-resolution
> mode.

> So polarity can be made hardware specific but clocks should be configurable.

> I can break these out into separate patches if you want.

Please, and make the bits that can't usefully vary DT properties.

--5AmtYbcgdBTTPS58
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl68Ly4ACgkQJNaLcl1U
h9CN9gf+LkILaGICghjpyYtgNi8Z1pw1uWaWndqzZEEguZbVV7lq3S55zJEgKHkG
SEmCM4aDbuFfodDBs0RVwFZMfdCik6RgsT5rZCUev3geNx/uUGF/XiQ9xFCAXuLM
PMuhkRked9SPFeJB0sYEJMkYMJxqkCciMNP33zmgr+zCSQeUPwhBCy0OSi8rf8wn
LViBXCeaSV894LtQGThe+I+KPvI8kQTGW8O1nIZu+fedQqy8bi3YDy0O/Xh/s+7u
qDUpYHACSE4fxtBAWvgEUVKVcd5oCapyixQ46e6RbsGStKUdpHhdF3VpVBOcq6jt
g1i790FIk3cQ/QxupbQEmwo62lvntg==
=tAtH
-----END PGP SIGNATURE-----

--5AmtYbcgdBTTPS58--
