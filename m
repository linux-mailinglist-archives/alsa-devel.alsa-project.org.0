Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC2E17468
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:01:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEF541929;
	Wed,  8 May 2019 11:01:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEF541929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557306111;
	bh=UhPjbJxHFKZgd1ZnrRKd2ttXJahwh7WU1vnMZnUnAHY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W7dHpbH+7j3ZSgrVk4fEIqwn7xO08NtE2VQ/pVh3reweIYgB70cPRHsGvN24PPZ6/
	 kzu9S64zs3KsLnEHPVe69Qyo7KTP4z5MJlanXQW45Ql5O5dZYwmp3y3RjGqEFzzyUh
	 h9fTMmxPiFNVz9+0KPAFpCSWruhYYYkk/025LQGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 918A0F896FD;
	Wed,  8 May 2019 11:00:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B353DF896F0; Wed,  8 May 2019 11:00:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C7F0F807B5
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:00:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C7F0F807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="W6sIRAto"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rb32hdeeKWw8rsEaY+iBCFIhc0R0aisTqdYtsPTPAmc=; b=W6sIRAtozwOmGUmXrhKluiLsy
 OuPaROv1SkrEAogYrzctytq18suypT3M7cLVyZD6Ez5nQBPwr46BuYP5UlLhC+xi7tVkJaSAn9KCI
 5T+kTs4ihB9BiiCG/DWT9/yb7NfCMzniUm5jg4cvyB23BHh4iKW+c14N87qpm1eg9c5y4=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOIQh-0007dC-Cx; Wed, 08 May 2019 08:59:59 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id C12AD44000C; Wed,  8 May 2019 09:59:53 +0100 (BST)
Date: Wed, 8 May 2019 17:59:53 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190508085953.GF14916@sirena.org.uk>
References: <20190427175938.GJ14916@sirena.org.uk>
 <s5h36lxpcbd.wl-tiwai@suse.de>
 <20190503064729.GF14916@sirena.org.uk>
 <s5hk1f8m2f1.wl-tiwai@suse.de>
 <20190506042625.GK14916@sirena.org.uk>
 <s5hsgtr6h5y.wl-tiwai@suse.de>
 <20190506140506.GQ14916@sirena.org.uk>
 <s5h4l674n9g.wl-tiwai@suse.de>
 <20190508081006.GZ14916@sirena.org.uk>
 <s5hk1f1nyyh.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hk1f1nyyh.wl-tiwai@suse.de>
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
Content-Type: multipart/mixed; boundary="===============9077892183590915916=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============9077892183590915916==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="siaTt5BtGpUbPgBZ"
Content-Disposition: inline


--siaTt5BtGpUbPgBZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 08, 2019 at 10:16:06AM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > The GPIO/IRQ equivalence thing should just be a purely Linux internal
> > thing - looking at the driver it appears that there's no need to look at
> > the GPIO status, Linux can tell if something is plugged in purely by
> > reading the chip registers so the jack status function could directly be
> > the interrupt handler.

> But it can't see the button status or detect the headset type without
> reading the codec's magic registers...  So some help from the codec
> side is required, and the irq handler isn't in the codec side because

The whole thing should be in the CODEC side.

> there is no i2c irq assigned but only ACPI gpio, as far as I checked.

You can map through an ACPI GPIO to an interrupt without worrying about
the fact that it's mapped as a GPIO in ACPI IIRC - if you can't there's
lots of other drivers are going to have issues.

--siaTt5BtGpUbPgBZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSmogACgkQJNaLcl1U
h9Cxmwf9E//0XZbVYq6CQrhljPmCtuPy+/5jOA+n4/M/Iqi+Pi8k3a/jpZCjVRd7
PHhaifIvqtsNN19tw3t7I+8DF2l8Yp8QifwOg/E74VuXtOKvy0Uss6jIsl3nCKPG
+ppEq0C6i/viaUMNcIccJWbIEAQ5mNhD3Qw9Qqq6lbnwXttysudjNlz0zkwmEZOK
TWS+O9s/bUTXzdI76A02OddVdPcyYSwUTtgysIUX5Kuo0nnejxzlXAR0DcDev8b3
9Thk3RR2HmA9SpDv/lrv69xX0kF7z8vh4oGQqcBtZOa8OPgtWr6kSY6m2P5o0nbG
yGD5idGqpaHpu5LYaUWfXH0YaDEWZw==
=UCPA
-----END PGP SIGNATURE-----

--siaTt5BtGpUbPgBZ--

--===============9077892183590915916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============9077892183590915916==--
