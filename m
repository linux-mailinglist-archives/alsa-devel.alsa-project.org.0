Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A04476143
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 19:59:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B4A9191D;
	Wed, 15 Dec 2021 19:58:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B4A9191D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639594764;
	bh=76eb7VDWfPRd7pvYjeAKY4dcwiM5H0xLKfZAlmiztxc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kIvWhFCuj/Sf7Y7fx16aXbLSUqxefkTXaPIJlSTow7aB5vUS2UEec7gjhI6EyafF9
	 m4bxpxdNcT7lO3k7fBRBb4MVkUliOv/PFDTfe2XdjRVaHMZPpECVM16J5iUETJk/vW
	 SqMwAk+DSpBg8U90slJ2cb7Jr9tE4lKShR57Bqbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F039F801F5;
	Wed, 15 Dec 2021 19:58:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E529F8019D; Wed, 15 Dec 2021 19:58:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ABD6F800B0
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 19:58:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ABD6F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z0iSKh3v"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 11EA461A56;
 Wed, 15 Dec 2021 18:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADB1C36AE3;
 Wed, 15 Dec 2021 18:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639594684;
 bh=76eb7VDWfPRd7pvYjeAKY4dcwiM5H0xLKfZAlmiztxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z0iSKh3vKhdbFk1neCcrSe+Pzz9B7uk/gXVZqa7cqsyP5e3NuDNJ6g3TlIYzqioxP
 AsT6VSjdWNFxVYu2mzZyIhobGGJ3HWcSKXOmNHTIGdWY1eFuySt7/uVz3zlrPtmzMz
 KiCDM+GnCReT/Hi62TTcJXfML0VhsVLvJQYRPe93KdkP5Yxb13RLRf1GB1vO+mIxyE
 656/TTsEcb+IGbWvQ4YUj8y1RRZfJVcHlxwZ4hEOIo+7Kk7I16v/5gkbL8QyQSjniv
 S/YgMUg4h1cCmeud1uX5gJECCwHGHVlXCwHrq9aDuc55ANZuTgmJtNC3OyH9pgfMiJ
 ayYMGgNNP1Eaw==
Date: Wed, 15 Dec 2021 18:57:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 00/22] Support HDMI audio on NVIDIA Tegra20
Message-ID: <Ybo6tsnQM6OacoZs@sirena.org.uk>
References: <20211204143725.31646-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r8pMqbbDVxb335U5"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
X-Cookie: No solicitors.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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


--r8pMqbbDVxb335U5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 04, 2021 at 05:37:03PM +0300, Dmitry Osipenko wrote:

> I based S/PDIF patches on Arnd's Bergmann patch from a separate series [1]
> that removes obsolete slave_id. This eases merging of the patches by
> removing the merge conflict. This is a note for Mark Brown.

That's not in my tree so I'll need either a pull request with the series
or a resend after the merge window.  It's also not clear what to do
about the DRM bits, I guess it's probably easiest to just apply them
along with the ASoC patches.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--r8pMqbbDVxb335U5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG6OrUACgkQJNaLcl1U
h9CG4wf/R0NhMevfJzcrxbAImYtw8MIQXIBeRXJNM+viHozogArxj5HSQNArbEYW
VBlrS/tCW9uXaIoqZgIAAkU5UoH8r01iharsCnm/GLer4aFfvFJqYfc6KPZAVhgu
zu1AwsHPBiv59YBPE5eMNxwluv5AORqy98wy0i5eiyEBCpEeKgt3lLoFDr/GFIKt
tXWuheE/2fqKASDvQvTHfbQ75Nb7oiCqdc/0xRkjmUgJX6JDrUPPASiQ38YfHgHw
0X6L1Y2tWlLlGsQpdoXOceu0pnc0WdWWAxnLvJHjv6o+nMGECYBCZB/AmHYkqzrj
vAkNiHZXRi+f3RikU7TRzEHgXszS2Q==
=rihE
-----END PGP SIGNATURE-----

--r8pMqbbDVxb335U5--
