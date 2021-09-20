Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 396A041280C
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 23:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE68916DC;
	Mon, 20 Sep 2021 23:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE68916DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632173470;
	bh=OlkMXkh2s33OM0B7hD3sf+exmaErS91ze8eL+MBOpUs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kbKPO2D+PtEeIOEhYP99ucv5WXstDZWXydO/Gv/ZH62SyQBei4uhEucodF1Xuks89
	 iRE5/7K88qcwi7Pj0/egTU1+B2VGyOsVRDUl80VEWqBzxZoHgZDP6LhuWbyAll308j
	 WlD/Unur4ymVoHZKfvZ6a3JpSAioPtLyKDsjMOTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08AA2F80279;
	Mon, 20 Sep 2021 23:29:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05B68F8025D; Mon, 20 Sep 2021 23:29:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03AF8F80129
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 23:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03AF8F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="lLSQ/n2e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OlkMXkh2s33OM0B7hD3sf+exmaErS91ze8eL+MBOpUs=; b=lLSQ/n2eZtJJQBQxqbUfL6Idza
 pecYvfsJ9tqE95+y202bnfcSUAW7Dg49qhm4iaVwBiOXLhDG4o+zixTqUWmE4UvZSyjk+HLd26G2m
 cvL7tJf6/jhzMStMzBl11oR20v2PacLsYomMPyW/G++TOEBKs3K9prIIzXW8z4fbYQt8=;
Received: from cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 ([92.233.91.117] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1mSQqj-000eWz-DW; Mon, 20 Sep 2021 21:29:18 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 2A43ED0E9AC; Mon, 20 Sep 2021 22:29:18 +0100 (BST)
Date: Mon, 20 Sep 2021 22:29:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH] ASoC: pcm512x: Mend accesses to the I2S_1 and I2S_2
 registers
Message-ID: <YUj9LqNTH6A4CQcj@sirena.org.uk>
References: <2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se>
 <ae4b25f1-2b2c-d937-e23d-0f7d23bdf0c4@gmail.com>
 <815cbba4-60d6-8d97-c483-146c2f7c3912@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ttkamqm76OfwgUpe"
Content-Disposition: inline
In-Reply-To: <815cbba4-60d6-8d97-c483-146c2f7c3912@axentia.se>
X-Cookie: lisp, v.:
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kirill Marinushkin <kmarinushkin@birdec.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
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


--Ttkamqm76OfwgUpe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 20, 2021 at 09:37:37PM +0200, Peter Rosin wrote:

> compare if the update was needed at all. But marking volatile wasn't
> enough. I also tried to set both a default and mark as volatile,
> but it seems every read fails with -16 (EBUSY). I don't get why, to me
> it almost feels like a regmap issue of some sort (probably the regmap
> config is bad in some way), but I'm not fluent in regmap...

Having a default for a volatile register isn't really a sensible
configuration since the whole point with volatile registers is
that they change underneath us, I'd not be surprised if we had
some error checking code in there that was trying to tell you
there was a problem though it does seem like it should at least
be more verbose about it since returning -EBUSY isn't exactly
helpful by itself.

--Ttkamqm76OfwgUpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFI/S0ACgkQJNaLcl1U
h9ByPwf+IyJ6E5k6G/3fuo7gN/7fle2sFUihfDabf6PJ4A9Ie0udY+tJ3Uhrn3MN
yErjkmqtG4/FHWW9peKpDZ6G5JKqzuJhhjLOENnonbTE27dPkrfqzZ7sSklocdYl
xU6c9EHN/8JOaoe4pu0nFbYauHwlEYaRnD6B34lnHGvjJb4ruuz280qE79ddobQY
08e8SwRYjVrWFhNUP/gc+OlHScnH3GuL9sDIuaAYvL+g6NEusF8oTPVQjYuJItdq
DayQfrZ7M9VaZsLAPMsdm8l7Q9ab+2liGpFWDxMq+8ZaEjs/cORX/EVjxtjz1Snc
boO8iQg8HZ4H9sCo62fIq1mvADMzcw==
=sL7d
-----END PGP SIGNATURE-----

--Ttkamqm76OfwgUpe--
