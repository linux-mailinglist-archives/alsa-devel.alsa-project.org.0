Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B2F12A8B4
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2019 18:48:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA93A16C8;
	Wed, 25 Dec 2019 18:47:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA93A16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577296093;
	bh=MPZj3rxuz9NGLoVhc3PjfxAxwWZpaTKpBIs1NJLbMQE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UZfujMnQHq9ECXxo1UatlZee1cCJciEpLx7rYEFz8WGXt8MMoiHpCqMd+irNN+1Q4
	 kcs5Jznn4AHpkvoR66ExrD90IV8h68JnBWssJVrfdoDghyc3k46r839MMA6OVfmmUb
	 qJBaUt27pnvjyr93UfV56N4A1BxkhQjXpd6j1TvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B19F6F8012E;
	Wed, 25 Dec 2019 18:46:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFE5EF80131; Wed, 25 Dec 2019 18:46:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF1CBF800E3
 for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2019 18:45:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF1CBF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xh2L9IAY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sqZ9HRtCdnjD8DXcSEjuElmOGdM4XxRfBfU9GjfcdkE=; b=xh2L9IAY8F6aToclrkfPNsiKO
 R8JsvHw7bcWKqp0cboXhHjwtyrucBbi1vATkutReqRA4LzuzYDlH02xLmnb8ciFJWajJdZIgafPTZ
 U/yVAsVzL3fUesDItZipgPIS4Ije67vI/Ktfkce9tGLz6u/jKaG116BPMHbDjrM8DMOXU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ikAiu-0001hl-Qx; Wed, 25 Dec 2019 17:45:28 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 14D67D01A22; Wed, 25 Dec 2019 17:45:27 +0000 (GMT)
Date: Wed, 25 Dec 2019 17:45:27 +0000
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?amVmZl9jaGFuZyjlvLXkuJbkvbMp?= <jeff_chang@richtek.com>
Message-ID: <20191225174527.GB27497@sirena.org.uk>
References: <1576836934-5370-1-git-send-email-richtek.jeff.chang@gmail.com>
 <20191220121152.GC4790@sirena.org.uk>
 <7a9bcf5d414c4a74ae8e101c54c9e46f@ex1.rt.l>
 <20191224235145.GA27497@sirena.org.uk>
 <938f562e322849328d5a7782b2c1de97@ex1.rt.l>
MIME-Version: 1.0
In-Reply-To: <938f562e322849328d5a7782b2c1de97@ex1.rt.l>
X-Cookie: I have many CHARTS and DIAGRAMS..
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Jeff Chang <richtek.jeff.chang@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Add MediaTek MT6660 Speaker Amp
	Driver
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
Content-Type: multipart/mixed; boundary="===============7255265524406368182=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7255265524406368182==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 25, 2019 at 01:45:43AM +0000, jeff_chang(=E5=BC=B5=E4=B8=96=E4=
=BD=B3) wrote:

> This is adau1997 driver on upstream branch

> @ sound/soc/codecs/adau1997.c

> // SPDX-License-Identifier: GPL-2.0-only
> /*
>  * ADAU1977/ADAU1978/ADAU1979 driver

This is the result of an automatic conversion which wasn't
reviewed, it's not ideal.

> It seems not whole comment use c++. Only first line at source file, Right?

Please do it like this:

// SPDX-License-Identifier: GPL-2.0-only
//
// ADAU1977/ADAU1978/ADAU1979 driver

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4DoDMACgkQJNaLcl1U
h9Dp2Af/aU0nU+b2UxZTkVGZHR3/l8NBevpw5Tzd3SGjZgaPfnLnnupSxFRHbMJh
AYQybA/K1pTWIJsLSNcPjn0x/YstXMil9in42PqCANDLY6qQxi1nHQpqWo26S2+O
u6x9f+rSrJA5zzbjVcbxvBFaEjUtl/O7DTfvf6LNKZ2Nr6DtIlO4vyX8Q5RjhtG8
zvotyES221ovg8TpQ9uv140oUlNtxDyBzstcRQhNXK7gaKqTIHde082f7uqmTspi
xdwhz8EVLpe2LDDYLO5lFH5TKDeektnfhFfelKj26AJ3aFj7Qfn7faKPSNJR3Udy
kXcrZVVgsxfIAjdAGGxzwXGoqw7gLQ==
=YJiP
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--

--===============7255265524406368182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7255265524406368182==--
