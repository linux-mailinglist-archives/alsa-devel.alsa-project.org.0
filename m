Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A8C1760B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 12:33:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 222241AAB;
	Wed,  8 May 2019 12:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 222241AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557311632;
	bh=UPSvfX90x5Kq+YdONcekOdU8CAABKTd7jItMRpqlPh8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q0th8VlqprX7mjpDO6n6Baw/5q6Lwsyhx5IYF2qxEx6qo/h2mDcmy3xYV3nHTSwA2
	 lhrdlSR7QUirp8jHQXnCHd00wvHgpLLDIL1GFQK2opN+P/qOSPcZhEgIX2y+RbiAw9
	 vrDHg9QKQEaw6BPJPi3zH06swJUffvpvN5NS5IQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07CE7F896F0;
	Wed,  8 May 2019 12:32:08 +0200 (CEST)
X-Original-To: alsa-devel@Alsa-project.org
Delivered-To: alsa-devel@Alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31891F80796; Wed,  8 May 2019 12:32:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB245F80796
 for <alsa-devel@Alsa-project.org>; Wed,  8 May 2019 12:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB245F80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Ni9uCfoL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4NM0CRXvPo7lg4g2l1j+JQnx6ShTK+m9YrgZWQ6kXu0=; b=Ni9uCfoL+CzI7G/eOs4N/0qcq
 rm/uJGjPm71En4ZU8rRIuixagUXhREoZjKoAWEUyH8LlEdgcn0ASQU09RpZCtdgcg9ofzmpPVKmVN
 9Q1l+0OgcdQCLiMDD6UilIsVTC2+NzqKKSt4Z37UtPs03gVYvbIDSs3iwz7u9Cdyg+1oc=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOJrh-0007sp-Qz; Wed, 08 May 2019 10:32:00 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 5F2FD44000C; Wed,  8 May 2019 11:31:50 +0100 (BST)
Date: Wed, 8 May 2019 19:31:50 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190508103150.GP14916@sirena.org.uk>
References: <20190508094554.GK14916@sirena.org.uk>
 <s5h4l65s0kr.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5h4l65s0kr.wl-tiwai@suse.de>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@Alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [GIT PULL] ASoC fix for v5.2
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
Content-Type: multipart/mixed; boundary="===============8219550671014921984=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8219550671014921984==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q2l42ZpTeLjzDHJr"
Content-Disposition: inline


--Q2l42ZpTeLjzDHJr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 08, 2019 at 12:27:32PM +0200, Takashi Iwai wrote:
> On Wed, 08 May 2019 11:45:54 +0200,
> Mark Brown wrote:

> > Emil Renner Berthing (1):
> >       spi: rockchip: turn down tx dma bursts

> BTW, is this commit intended to be in sound git repo?
> Or was it applied to a wrong branch?  Just for confirmation...

No, that's a mistake :/

--Q2l42ZpTeLjzDHJr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSsBUACgkQJNaLcl1U
h9A7IQf/ZOwYLcPp4MChO4RmQcqiQgWQMT/yO1HGijjWYHWWEVWi87kKXKWmXAWO
s9sPpTQUwf0P8A0pLwej2raGZvNS1qUOAxHVNfaW6dnYU2SDaaEaRMOOl9LPmnKn
bkx5nO/A7aIMxGUEy7CPW6+LzNbYHYG/HHG7eAXklhOJu1jriNa5PxFxzyaxmMR2
QYfz0SalwsCWifjLKzcDjWiXaAlSFfspJnsOzgg/T0GpBJvXx9UfpS0tGCWzKabO
EWlYftKsUS2jA8uIZ4zc4sjU6co/qrXasMPdOv96ySTjc+2wI7/XL1k7b7xCG3LA
s9V29X8ELjggUJlcUagbg4KkaGPitg==
=zueD
-----END PGP SIGNATURE-----

--Q2l42ZpTeLjzDHJr--

--===============8219550671014921984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8219550671014921984==--
