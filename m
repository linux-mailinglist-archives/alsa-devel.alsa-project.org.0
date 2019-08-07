Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 704E185372
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 21:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F125186F;
	Wed,  7 Aug 2019 21:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F125186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565205075;
	bh=zZJbAuq+Y6ISA3se6zKDaBPUCuzZpStURU8gBCAmKO0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iuc8vkjlML1i5YyjeJ5z6iRaFOP8aCM6rbY2q4gddHjHglhUFYRbEbIe9tHNtEyBg
	 aVKJ4CkBmB4+vU7wc5CC70EPFbSvQcujgGXNaV2TWQ5TVwXkirtpf5gN5DH4g/4Iax
	 1HwQG9PqM5MC5fJW69dv8IkXr1kOPQru6NXC0vSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3129AF80227;
	Wed,  7 Aug 2019 21:09:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F5C2F80290; Wed,  7 Aug 2019 21:09:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30BA0F800F4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 21:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30BA0F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ikBpsz+q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CXHaHEJXstFHVGXsaMRkGDgj2vzdFlugILr5Qa0FLNM=; b=ikBpsz+qWT62Q1D/1GPoL/kBv
 /aykvlnfnzRjcqSuohssVwp4Qh9gS6S8wxtZVHM6ny9J/rLDJ4sIJpY9iCdLOKAwKlShFLH7WMXB2
 qplis3TX0xH5vE9FSG03bESDuZdGb53FpxKbMjtUJH4Jv8qKWBnsDnPQTP5lojTBEHBHQ=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvRJH-0008SR-7z; Wed, 07 Aug 2019 19:09:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9D0AB2742B9E; Wed,  7 Aug 2019 20:09:17 +0100 (BST)
Date: Wed, 7 Aug 2019 20:09:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190807190917.GL4048@sirena.co.uk>
References: <20190718230215.18675-1-pierre-louis.bossart@linux.intel.com>
 <CAJZ5v0g5Hk9JYLvRXfLk5-o=n_RVPKtWD=QONpiimCWyQOFELQ@mail.gmail.com>
 <52a2cb0c-92a6-59d5-72da-832edd6481f3@linux.intel.com>
 <20190807175646.GK4048@sirena.co.uk>
 <5a7473a2-83c0-1a09-0cab-31fcc5b21302@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <5a7473a2-83c0-1a09-0cab-31fcc5b21302@linux.intel.com>
X-Cookie: Dammit Jim, I'm an actor, not a doctor.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, jank@cadence.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH] soundwire: fix regmap dependencies and
 align with other serial links
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
Content-Type: multipart/mixed; boundary="===============7720788052472061041=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7720788052472061041==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m+jEI8cDoTn6Mu9E"
Content-Disposition: inline


--m+jEI8cDoTn6Mu9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 07, 2019 at 01:17:20PM -0500, Pierre-Louis Bossart wrote:

> I don't have the knowledge or means to test what I suggested initially for
> the other buses, and the optimization was minimal anyways, so this patch
> takes the path of least resistance and aligns with others.

> if there are no objections it's probably easier to push this patch through
> the SoundWire tree, with the relevant Acks.

Makes sense I think

Acked-by: Mark Brown <broonie@kernel.org>

--m+jEI8cDoTn6Mu9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1LIdwACgkQJNaLcl1U
h9DFBQf+KQtyCfkxOfIv1rEOZ7sfj9ypg/0DsSRjVwhmqS8DoTwcpPwzJlVJFRs1
1Qg9wUYGxMpwhkiYJ66KhJs7Ugtb1XYdGiYzvhjAbxsB9YZ3z1kCK+h91jkMXxS+
4DX6U8/hLEqR4DpwnBYTo91TAJnJi3Bj/xp8qsViOsacjECpiZG11E9FmYTSPUFi
pKgyVB7nWj0kpL7aaEyweJJcSwrF7Fy7/+1KLgpVmewCepH1BooSaJI6ymEEz6+P
RAAKwUwDIksuajG5KVJduJf0BsSTZ2GFLE3pomj8o+OuMMABvnzmwbYofQmWHu2n
0/p+EPuDpS7b+n4obTY1DL0audj1HA==
=Ercr
-----END PGP SIGNATURE-----

--m+jEI8cDoTn6Mu9E--

--===============7720788052472061041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7720788052472061041==--
