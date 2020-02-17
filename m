Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF114161621
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 16:26:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72A641672;
	Mon, 17 Feb 2020 16:25:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72A641672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581953171;
	bh=rE/hG0cfjxvN8w3fIGZZT2pTC0Z07YtHBGOI4Qh4SBc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bUz46MYLcDwtTRA9vVR+NWM7FsSUOIKInMcpZbtQQ05UU1Ii6x74FKKwNQ0itM01D
	 MckQOd+xTZ41OakzLs2XUiuBvjN+GNWVWQQBuAFoKP8PpVrwVU14T7LDU76djn9LOv
	 i6FYbghyy9bl3IA4VzqeDRqO4DmRqTPshmsUF1as=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FB61F80096;
	Mon, 17 Feb 2020 16:24:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C46F7F80172; Mon, 17 Feb 2020 16:24:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 07D03F800C4
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 16:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07D03F800C4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F112530E;
 Mon, 17 Feb 2020 07:24:22 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74CEB3F703;
 Mon, 17 Feb 2020 07:24:22 -0800 (PST)
Date: Mon, 17 Feb 2020 15:24:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Message-ID: <20200217152420.GK9304@sirena.org.uk>
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-10-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20200217064250.15516-10-samuel@sholland.org>
X-Cookie: There was a phone call for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>,
 stable@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [RFC PATCH 09/34] ASoC: sun8i-codec: Fix broken
	DAPM routing
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
Content-Type: multipart/mixed; boundary="===============5296854945196220754=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5296854945196220754==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="opg8F0UgoHELSI+9"
Content-Disposition: inline


--opg8F0UgoHELSI+9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 17, 2020 at 12:42:25AM -0600, Samuel Holland wrote:

> This commit provides the minimal necessary changes to the driver's
> device tree ABI, so that the driver can begin to describe the full
> hardware topology.

> Cc: stable@kernel.org

You're changing the ABI and trying to CC this to stable.  This is
obviously not at all OK, this would mean that if someone got a stable
update with this change the ABI break would mean that their existing
device tree would not work.  The code should be making every effort to
provide a stable ABI over new kernel releases, never mind within a
stable point release.

--opg8F0UgoHELSI+9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5KsCQACgkQJNaLcl1U
h9DlOQf/fnliV8i6hOsjjmuPNKhYpYFB0CpQahOVaYcseah4KRMxgLYafPDPCBFi
YOG1uPOnbNmX7j2Vk4tA4fobq2c9iAJjVUafUWsNm6qiftRtSKHw8NgpDcH/i5+A
hQpjcJoW+zdzoV3a/l0/lA0Ntot3eligdLNJZEukfJTWU5KndAo0k6jJH0WNj3zw
xjiw6WNJee1j6xkOZEWzHoIZNZ+eXQjebMa5KbArSwzBXVS3SeaYZ9eMCzph7OpI
CXcIBWJssHvQlSxZeCjB64bwsBCbzUuRW6doz1Ikjn/IdAfjudwjwODeRENTKykJ
JCEiaoF87UkEhPoF68ycyKTgcgrxRA==
=pmEj
-----END PGP SIGNATURE-----

--opg8F0UgoHELSI+9--

--===============5296854945196220754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5296854945196220754==--
