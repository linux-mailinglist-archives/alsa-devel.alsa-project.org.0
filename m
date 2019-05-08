Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 948BC17357
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 10:11:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30EE61854;
	Wed,  8 May 2019 10:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30EE61854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557303118;
	bh=Tqh7j9neGQXLtkkKwvWk6XHB7yy+lQyGmXf5N4KLyF4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E5LHYl7seplIlaLynbT7Ri5HL7w+8dgh3w/7YTXpOv9tftnb/4UD/QCdKaBkHFzEe
	 nMikYJu5vMe7qVPncUlvEywUh8UdJkQe9PqD9q6xPAv3SJXRwkxjU8xRLsYt5LwrLq
	 QaXiqu/i6XjRr7jYHak860tfntrB6hurwkk0PglM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1088CF8970E;
	Wed,  8 May 2019 10:10:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8329BF80796; Wed,  8 May 2019 10:10:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3711DF896E6
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 10:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3711DF896E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NHVlzDt6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mhBoTIxXPLAn2puAnT+rzp4jDFe3fdZKE4E2GAKxDFc=; b=NHVlzDt6adP/e1CvEk17BXD+k
 bl7JLVpCy+oGTefxIUUcUPIcoI+mOVYzMmwtq8K1CKSxeZWkewqxzGgjOSeG57wbDxqH0vOsiWI81
 p9htrZbnYDLU3LCpLU+qyHqdtUPD//qZhTFY4boKKHu5fqYt8BQW5nnnS/5E8QNmGzri0=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOHed-0007Qh-JR; Wed, 08 May 2019 08:10:24 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 75C2F440034; Wed,  8 May 2019 09:10:06 +0100 (BST)
Date: Wed, 8 May 2019 17:10:06 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190508081006.GZ14916@sirena.org.uk>
References: <20190423141336.12568-1-tiwai@suse.de>
 <20190423141336.12568-2-tiwai@suse.de>
 <20190427175938.GJ14916@sirena.org.uk>
 <s5h36lxpcbd.wl-tiwai@suse.de>
 <20190503064729.GF14916@sirena.org.uk>
 <s5hk1f8m2f1.wl-tiwai@suse.de>
 <20190506042625.GK14916@sirena.org.uk>
 <s5hsgtr6h5y.wl-tiwai@suse.de>
 <20190506140506.GQ14916@sirena.org.uk>
 <s5h4l674n9g.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5h4l674n9g.wl-tiwai@suse.de>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: Add support for Conexant CX2072X
	CODEC
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
Content-Type: multipart/mixed; boundary="===============7741747885046584711=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7741747885046584711==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="93p3Mfsbf6DTJ78q"
Content-Disposition: inline


--93p3Mfsbf6DTJ78q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 06, 2019 at 05:26:51PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > Like I say if the device is using the fact that the pin is a GPIO
> > there's quite likely something wrong - that shouldn't be something that
> > the user of an interrupt should need to see.

> Yeah, unfortunately we have no reference, so the only chance would be
> to test with another board that has a different setup.

The GPIO/IRQ equivalence thing should just be a purely Linux internal
thing - looking at the driver it appears that there's no need to look at
the GPIO status, Linux can tell if something is plugged in purely by
reading the chip registers so the jack status function could directly be
the interrupt handler.

--93p3Mfsbf6DTJ78q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSjt0ACgkQJNaLcl1U
h9CjYAf8DHvaYxkZbQ7oaFnpZ8ZGWrYVJcJ+gplAOz1SsdDuF9l9x4szd//g2Gn9
14A+VN/G4Dy4EVWOjW+VoDcCAwfHHYmeFD2fuXEu/iMHvEbEovt5fTLcP43GUCjF
fV0bfs2vbkQV+kcynR6aJy7g3aOx0vWMLHuTvUL6X2lz2i4bZSXgdcTZo8Nzo43W
rzIlKO5pqt8G7QQ21CEdFvfORj3RZgwOsD76quvioVkOaFNBQRbYJ1MK+jWlgOOf
M9K2f2s9KpqgU6p5Xk3vD6skkVt2gjkdkKvSln/r8NC0uqKKG3ecxlgRQow377pi
vZFTeT2yM5X1Mk2mMLTAVYnS54vlJw==
=rcaF
-----END PGP SIGNATURE-----

--93p3Mfsbf6DTJ78q--

--===============7741747885046584711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7741747885046584711==--
