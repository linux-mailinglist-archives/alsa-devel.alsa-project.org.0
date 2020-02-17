Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CEF16159E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 16:11:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07F5F3E;
	Mon, 17 Feb 2020 16:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07F5F3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581952285;
	bh=VrDlbWz3JqeymI9UrIB55PlCStCb348wDLkSvHiThRc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hAYbjEG4/DN9wrcP30aFXcwIkI3+YKsd1jjgmxAM4deB/t/RdFI+zpRWRgcp1GU9y
	 7fPTCxfXJRj6R8RrKpLzixk0p9Vpqs0p5Fel+WW5EHP0vc8xpPhKFsag8pZUs+dcvH
	 z5Hx7ybxw60IpIfHebMFUU8LEUT4EpyLs8jDRrEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9B8BF801F4;
	Mon, 17 Feb 2020 16:09:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9C7DF80172; Mon, 17 Feb 2020 16:09:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 3BA45F80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 16:09:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BA45F80096
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D841630E;
 Mon, 17 Feb 2020 07:09:37 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B7BA3F703;
 Mon, 17 Feb 2020 07:09:37 -0800 (PST)
Date: Mon, 17 Feb 2020 15:09:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Message-ID: <20200217150935.GJ9304@sirena.org.uk>
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-9-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20200217064250.15516-9-samuel@sholland.org>
X-Cookie: There was a phone call for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>,
 stable@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [RFC PATCH 08/34] ASoC: sun8i-codec: Fix direction
 of AIF1 outputs
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
Content-Type: multipart/mixed; boundary="===============3212100216559896468=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3212100216559896468==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4vpci17Ql0Nrbul2"
Content-Disposition: inline


--4vpci17Ql0Nrbul2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 17, 2020 at 12:42:24AM -0600, Samuel Holland wrote:
> The naming convention for AIFs in this codec is to call the "DAC" the
> path from the AIF into the codec, and the ADC the path from the codec
> back to the AIF, regardless of if there is any analog path involved.

This renames widgets but does not update any DAPM routes from those
widgets which will break things if this patch is applied.

> Cc: stable@kernel.org

Why is this suitable for stable?  It's a random textual cleanup.

--4vpci17Ql0Nrbul2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5KrK8ACgkQJNaLcl1U
h9Ab9Af/b8sQj3zwynBYYxusscd9/aduwhw7qF+DAdPBw6PYNIA/g/Ts6oULrx9/
F9O4MHo55RlwYbfi8iuyYJ8LpLv4y7txkM5x5y5oauIL+soV6TB8bszuwBvk5jHu
qMxAhPDo6mD2D1QYL7GJeWvid+lBr7MGrlzbxg+0uW1jEw3pEJjXL4WTXu0e2l4T
cTZ4Am744vhS15WDE0s/wJSvB2rxPn6xVVi93LtdEE9+YgE4lE9Y7ruezZibMFQb
hrTkWC0l92y8sbIkHpAzlo5gh5qNn6UahJRlr+wCILtXuEJMgPEEmx0DoTciwQUr
su1mRVq9kOQOtpw4mjBq3iDo8MiP3A==
=UkmS
-----END PGP SIGNATURE-----

--4vpci17Ql0Nrbul2--

--===============3212100216559896468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3212100216559896468==--
