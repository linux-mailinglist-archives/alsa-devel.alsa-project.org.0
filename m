Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8E21D405
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jul 2020 12:54:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 062971669;
	Mon, 13 Jul 2020 12:53:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 062971669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594637646;
	bh=lvbFaXFQbR/7umDrIr1GanWR2tymD8YjdnO6h+nUkkw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kivGRi3ltKsRJF+gQvEwr8DV8wU0oSqX4FU7KIAKaf1YBqMyBPx1LlIUz6/qqnK8K
	 KdznwWMKG48USHT9tQf8JOtiU58T+v7YNtlvBh7fb336ndjnIE0XfgrC/DCSSfM8G9
	 4QBfC645WBkTJxM6WqyrOkc21PEGS3X5PJiteIrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 297EDF800B2;
	Mon, 13 Jul 2020 12:52:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBA74F800B2; Mon, 13 Jul 2020 12:52:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E27EF800B2
 for <alsa-devel@alsa-project.org>; Mon, 13 Jul 2020 12:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E27EF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ocP4Ux2C"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0353A20758;
 Mon, 13 Jul 2020 10:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594637533;
 bh=lvbFaXFQbR/7umDrIr1GanWR2tymD8YjdnO6h+nUkkw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ocP4Ux2CUAYvjXjjQsB9zFl0IWNu+EQRqcrvcsAdVW3Z9zY8JwQAQAi5bobGb9ASq
 6ZURIa/5HK/mNNKQpYKvNvZKs5eK4du3/lGgDNK2a5xidsQWUf9bRFnMjPnIhhS8iS
 Bnm9LVG5hXtV12uvHOLPzHf5xfU/cZtDlsnvEXXs=
Date: Mon, 13 Jul 2020 11:52:04 +0100
From: Mark Brown <broonie@kernel.org>
To: "Agrawal, Akshu" <aagrawal2@amd.com>
Subject: Re: [PATCH] ASoC: rt5682: Add fmw property to get name of mclk
Message-ID: <20200713105204.GA4420@sirena.org.uk>
References: <20200707100825.24792-1-akshu.agrawal@amd.com>
 <20200707103053.GF4870@sirena.org.uk>
 <a2cf09b4-5f49-ba74-060f-bec9a49d21a6@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
In-Reply-To: <a2cf09b4-5f49-ba74-060f-bec9a49d21a6@amd.com>
X-Cookie: Fast, cheap, good: pick two.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Akshu Agrawal <akshu.agrawal@amd.com>
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


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 13, 2020 at 06:46:29AM +0530, Agrawal, Akshu wrote:

> clk binding is present for AMD ST platform and using the same.

This is something you should be doing through UEFI forum as a generic
ACPI thing, and if you need to read the name from the firmware that
really does sound like something that should be raising red flags as a
binding.

> With recent submitted patches I am making them generic for all AMD
> platforms.

> Please refer patches:

> https://patchwork.kernel.org/patch/11658505/

> https://patchwork.kernel.org/patch/11658507/

It looks like there's clock names hard coded into the driver?

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8MPNMACgkQJNaLcl1U
h9Cm5Qf9HSdUmLAUKpOpEqWwQEPxscyY/1nC+8x22/phOhDS2GHVlDxezrpymhGg
ge5ftP74TKyK0vbz4mzL8tkaHuQoAGx8vfzUQl/ei4d6XyuW2YDA7g3/Q4mzJbEg
dVamLafpcr2dOl0dA/SsOxjgJBuUi25izLhYtvBakigGFYgs884gck6+XB0pgJ4V
CnumvVcUglSVbx90fxuhmKHyR9CcvKETocFjdFp7a8H462o7fSEKNXkbnsBwY3K6
VbBmF0lveiNZh5QlCoIyc8ie5B4tb9sMLvt9uVKGoeP/PCCCbhM4jQxIf7P9yh1D
D6fXetAl84iaEuHHIyRONHcCClXfiA==
=lj5n
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
