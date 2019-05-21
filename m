Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA840257B5
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 20:44:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3700A165F;
	Tue, 21 May 2019 20:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3700A165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558464278;
	bh=mW4zow1qwr6ujC/ijCIcmqleZ7TyKLfdkQImybIt86U=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nzrZxpyikMj6FbXBBK+kmVaZTM/uqn5ZYqaAvekHhITGWwVnRYkTzzOYpqrfclglk
	 1mbh1RvVzoVpdkNrX3Q/Dxb7bJ59mxYTs2Fcvy9Gp690vIgPi56/BYvqx59LNRAbmO
	 6x24QSXCpJV1Ovahxfi9r5W7L3s0ZdceWSF6a0lY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E4B0F89674;
	Tue, 21 May 2019 20:42:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D20D8F89707; Tue, 21 May 2019 20:42:50 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26AFAF806E7
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 20:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26AFAF806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="eUOpJyRT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CTyNreucewdu2RpztcLhlTxC74rAgc09HcC0cR7dWXk=; b=eUOpJyRTdZw46iPce5zA7Trri
 Ku0fSmEoTddwTAkQ9Rme4WYEXCXVLvMP+cscUzco1V2+Eagy2Fin3dpLcPU3y4fsuRaEwXH4YY31J
 RecHAByXqu2dno/d/mVbPEQrHaNEUMDBqtdzXJ+UvuJs0C7cFx54rXzenrzhziglHk84s=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hT9Z8-0000Un-5u; Tue, 21 May 2019 18:32:46 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 3DC201126D13; Tue, 21 May 2019 19:32:42 +0100 (BST)
Date: Tue, 21 May 2019 19:32:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190521183242.GC16633@sirena.org.uk>
References: <87imu939x3.wl-kuninori.morimoto.gx@renesas.com>
 <0ba565ea-2f61-015d-f6e3-63124f94e78a@linux.intel.com>
 <87pnoeyo9f.wl-kuninori.morimoto.gx@renesas.com>
 <513fa7aa-60ca-dea2-1888-1d9df531f478@linux.intel.com>
 <87d0kctzwb.wl-kuninori.morimoto.gx@renesas.com>
 <5d16b18e-fd21-931a-ced6-f682afffc5b8@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <5d16b18e-fd21-931a-ced6-f682afffc5b8@linux.intel.com>
X-Cookie: Do I have a lifestyle yet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Vinod Koul <vkoul@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH][RFC] ASoC: soc-core: WARN() is not related
 to component->driver->probe
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
Content-Type: multipart/mixed; boundary="===============2969139787793035730=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2969139787793035730==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Content-Disposition: inline


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2019 at 09:22:47AM -0500, Pierre-Louis Bossart wrote:

> I don't know how to help further. Doing this change will result in the
> warning being thrown in cases where it wasn't before. and since no one knows
> what this warning means in the first place, either we leave it or we remove
> it, changing its location would be very odd.

It's fairly clear from the commit message what the warning means - it's
trying to catch drivers that had buggy probe() functions that left the
device powered up when it was expected to be idled.

--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzkREkACgkQJNaLcl1U
h9Dm8Af/bmXmRN5vMf5QNJ4HF13lG7ZP1MTfDnXMA/C86c8Sn02/y8veeOI5bXY8
BJMgxYSAgChCdmSPM/O4RGpvwopbVu2LNZWSCOduChiqb98GEi52sob3WJETjMA6
b6NMhvV46Hfbr/TVC27Bw0bRujmZDlVtbBfQ51Tw0ZJKbsx6kEul43JJ6KZjTg91
ETCdKBEAceCHM0VWxEINqUcYVcaoYdewjIhcLp8pq71OxgKdcCXMjp65sVyULnZ1
CvgyKM0oevSmOow7k4REipUJIznGkUz3oepucn+RpXpyqgc001UhDQHNgDY2hesE
qKMO3435h00P587Z/877ZPJ+bGJTQA==
=5x+g
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--

--===============2969139787793035730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2969139787793035730==--
