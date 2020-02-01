Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B13A14FD01
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Feb 2020 13:02:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBD5D1683;
	Sun,  2 Feb 2020 13:01:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBD5D1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580644939;
	bh=sSVRJoS+vjOzj5t184mJ4xLowbmOFmwLRSN7zzbmsFM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=doZ84lPYCBwvBdrPCI5BgymkVRgDU02vfcW9f95+6VXINFkTdMHzYjgrQfBSi+3ZI
	 qbuh07oXII1L5cpTcC/gnseN3ZruyJm4HlcGVUHZO6N7pYpAsRJGO3T/tDdiBs/zUl
	 tITasXRVEHUFDHny0855q90MVQWe9isIcMDEi0nI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF2A4F801DB;
	Sun,  2 Feb 2020 13:00:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48E1AF80162; Sun,  2 Feb 2020 13:00:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DATE_IN_PAST_24_48, DKIM_SIGNED,
 DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4284BF8015A
 for <alsa-devel@alsa-project.org>; Sun,  2 Feb 2020 13:00:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4284BF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cO/wD8KU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/8I4PJVyzRO2zKgNQXcEsMEOQYRmKEwmQb/+v3+hXck=; b=cO/wD8KUbcDx253Djn0XRFYqV
 8iCdytlEdwJ3NUWSoQWdd3Gt3nbkUEWl16iWqag5vIkEg/XoPHuEz/Lo7Zk84ICR3goILfGSOhlLu
 CsRrpJQZCNsSGNa5CAcJLS54EI8zau9xQK6Gt9RgdKw4prliZAKBar4IdVoLdgSY0I8+8=;
Received: from [151.216.144.116] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iyDvT-0006pm-EH; Sun, 02 Feb 2020 12:00:31 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id BF079D00E4A; Sat,  1 Feb 2020 11:27:37 +0000 (GMT)
Date: Sat, 1 Feb 2020 11:27:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <20200201112737.GS3897@sirena.org.uk>
References: <20200131091901.13014-1-jonathanh@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20200131091901.13014-1-jonathanh@nvidia.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH] Revert "ASoC: tegra: Allow 24bit and 32bit
	samples"
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
Content-Type: multipart/mixed; boundary="===============1069964369161965379=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1069964369161965379==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wty5iWagpjJlozQq"
Content-Disposition: inline


--Wty5iWagpjJlozQq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 31, 2020 at 09:19:01AM +0000, Jon Hunter wrote:
> Commit f3ee99087c8ca0ecfdd549ef5a94f557c42d5428 ("ASoC: tegra: Allow
> 24bit and 32bit samples") added 24-bit and 32-bit support for to the
> Tegra30 I2S driver. However, there are two additional commits that are

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Wty5iWagpjJlozQq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl41YKgACgkQJNaLcl1U
h9C48wf/XDYc+rP2dIu/vZ21qwktMH3XJC7y6d0I2npbH96AkZTpWmJd1Xni6LMO
X9XDm6w29xXEQvMvkQ+p6n7q74ZdCwfwNgHdPujzyQNEY33uSWkQ+gFzFyDKrec7
EGgzNKoCogdGHBTu6SED3em04EGbLIulAi2qwOd5jJ8ZCXErpBqUvwvFBRx9qQmK
Fy2RivEzWysEXqYe/Icsn4wVgZ4Nm5vyNQDEDkiigGKISdDMYqS5Y3W2Yg43Mpx/
KfLeQqxI7JZ3rodqfkpksVuzzhdvT/nyWuU46TOXyri4WhQMI75HewY/ZFKzQ9R0
38NCD8W5/kRbbfv8Y8+x8j423SX3dA==
=yaIF
-----END PGP SIGNATURE-----

--Wty5iWagpjJlozQq--

--===============1069964369161965379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1069964369161965379==--
