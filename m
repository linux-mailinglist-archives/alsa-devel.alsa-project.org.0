Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB6EAE94A
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 13:39:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD3611669;
	Tue, 10 Sep 2019 13:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD3611669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568115588;
	bh=zygJBPRTO2I3VHs08cbD8dY4tw6DqTfViUnAuknij8U=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NESNeG51MiDLHd2i180UNDRoJMFwjSi1pvnlobmeJjOAur3BB6E1tLM1GfIqx7Ijy
	 Bp/ufjsQQydWt1A8EKGKvsr8mdwWvBJIii5QIpzgVcIrDoJd6nGxdxj+TrEYZmYhY5
	 RINK82xCDJfuh25KyorzL7fw9pBWjrjWClW00PcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 459C8F80368;
	Tue, 10 Sep 2019 13:38:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A862F80368; Tue, 10 Sep 2019 13:38:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 934BDF800C9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 13:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 934BDF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wksF6c6S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dHsV/RZwls+pHHVDbGZCAK0HFYsQemt5oRt7DrcnlWg=; b=wksF6c6S+zT5Y0cM11IjPsTuP
 LpIXR4wYPcts1I3/JK/nEWllT9nXWCSBAs943ICstbB8zZ+0TUFj8X5Zq1xmQmlnCJhjZEkA8hbk3
 VxGGGPiaBvoWAT8ezRiV3LD7Tg3cEvUgpj8yvP9sFPQFBAi1jAx3NTbzJnk4Kol98jFH0=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7eT4-00070T-Cb; Tue, 10 Sep 2019 11:37:54 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 4B64ED02D76; Tue, 10 Sep 2019 12:37:53 +0100 (BST)
Date: Tue, 10 Sep 2019 12:37:53 +0100
From: Mark Brown <broonie@kernel.org>
To: shifu0704@thundersoft.com
Message-ID: <20190910113753.GO2036@sirena.org.uk>
References: <1567753564-13699-1-git-send-email-shifu0704@thundersoft.com>
MIME-Version: 1.0
In-Reply-To: <1567753564-13699-1-git-send-email-shifu0704@thundersoft.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, navada@ti.com, tiwai@suse.com, dmurphy@ti.com
Subject: Re: [alsa-devel] [PATCH] tas2770: add tas2770 smart PA dt bindings
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
Content-Type: multipart/mixed; boundary="===============4384057841217958623=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4384057841217958623==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fpolVoprVozDR81Y"
Content-Disposition: inline


--fpolVoprVozDR81Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 06, 2019 at 03:06:03PM +0800, shifu0704@thundersoft.com wrote:

> + - ti,left-slot:   - Sets TDM RX left time slots.
> + - ti,right-slot:  - Sets TDM RX right time slots.

This looks like it's duplicating things that are normally done
with the set_tdm_slot() callback.  Otherwise the binding looks
good.

--fpolVoprVozDR81Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl13ixAACgkQJNaLcl1U
h9Bzigf/QbdVHbADoNlxGIhXNjlodxB2+bXhJ+BOngKzGbZFOfmv6pyKAz/RWIps
hlFrlJ1zF0V9g3qkuoiapWwq+jMZBnLVEXmMn7Y0oLXeck5AaWyv0PI178l6Qu8h
Pd37fRgJme/Ks6Fz9uH0xDaTl+93bSV9fR2nioiLi9C9GsU6fBE+YTEizQuPL1Lc
MEHUL3KlTh8qaMNpiqowHRNoy9VwzwkYF7mdmYe3XOKimJOb7l4VNb1mhPhBxoUI
b6hmfiS5lIb0d894W/u30vabn52L263Chhtnp3yKvUe+cE0PacHCoEdjrH9P6dr3
yBjOWhfmWmIxQQ2RsWveZ//xCi5vgg==
=Tj+k
-----END PGP SIGNATURE-----

--fpolVoprVozDR81Y--

--===============4384057841217958623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4384057841217958623==--
