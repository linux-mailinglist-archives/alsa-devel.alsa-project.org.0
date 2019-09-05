Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A75DAA99D
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 19:02:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C5511671;
	Thu,  5 Sep 2019 19:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C5511671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567702924;
	bh=7GtCm3qr4lPTt+i/TWTupThvMbo0Q0b16xU8/u5098o=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Db1fEVm3VdyHWvMKF0tJiWzKtC9aAovYRBUaZeKaUd59pjVkTQSM4yWzHX6xHTkOI
	 D+5kzZ4CQev667G78n5N4tvTzvY6FNwzDt1sHyS9fIPkUj0kGCY0+Zp0r8nSH8G1e/
	 psryIbtTfsgag9xE7pEvVCaW2AMx19txHq5/e/DA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F27DCF80448;
	Thu,  5 Sep 2019 19:00:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD1C9F80448; Thu,  5 Sep 2019 19:00:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1354AF80171
 for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2019 19:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1354AF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="OhQEtYy5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RMR7yLB7eLVOGQ40Lw2gegmrpDn0f2yyxFNY+57x51Y=; b=OhQEtYy5rpuuDT9cChMUICtrE
 V0tW7BD+A9HX+F/z9hBZQftsPGgvm/R5izgSEJ5VVldr9cr5p9E+7tESNq+lMRmSejsru2MBm8ut0
 yXuPoNi1M9cL7+OeNlgKQa3w/+b5U2esN4wwxhLSiHfRzBf23qdvo7ilXoRjkGdoCuptI=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5v79-00055J-N9; Thu, 05 Sep 2019 17:00:07 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3D7032742D07; Thu,  5 Sep 2019 18:00:06 +0100 (BST)
Date: Thu, 5 Sep 2019 18:00:06 +0100
From: Mark Brown <broonie@kernel.org>
To: "shifu0704@thundersoft.com" <shifu0704@thundersoft.com>
Message-ID: <20190905170006.GF4053@sirena.co.uk>
References: <201909051335040840918@thundersoft.com>
MIME-Version: 1.0
In-Reply-To: <201909051335040840918@thundersoft.com>
X-Cookie: You humans are all alike.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel <alsa-devel@alsa-project.org>, lgirdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, "Navada Kanyana,
 Mukund" <navada@ti.com>, tiwai <tiwai@suse.com>, Dan?Murphy <dmurphy@ti.com>
Subject: Re: [alsa-devel] [PATCH]Add tas2770 driver code
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
Content-Type: multipart/mixed; boundary="===============0911556022574506543=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0911556022574506543==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MZf7D3rAEoQgPanC"
Content-Disposition: inline


--MZf7D3rAEoQgPanC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2019 at 01:35:04PM +0800, shifu0704@thundersoft.com wrote:
> From 5b539e7dbebebf7e58c38a6b54f222bc116d63f3 Mon Sep 17 00:00:00 2001
> From: Shi Fu <shifu0704@thundersoft.com>
> Date: Mon, 1 Jul 2019 11:00:13 +0800
> Signed-off-by: Shi Fu <shifu0704@thundersoft.com>
> Subject: [PATCH v5] dt: tas2770: Add tas2770 smart PA dt bindings.
>=20
> Add tas2770 smart PA dt bindings.
> ---

This looks like it's a whole patch series sent as a single mail, and
there's some confusing with things like Signed-off-by and general
formatting.  Please see submitting-patches.rst in the kernel source for
how to send patches, it's worth taking a look at other posts on the list
and trying to ensure that your mails look the same as them.  As things
stand it's really hard to read this since whatever happened with the way
this has been sent seems to have mangled the indention so it doesn't
look like normal kernel code unfortunately.

--MZf7D3rAEoQgPanC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1xPxUACgkQJNaLcl1U
h9Auqwf9FZZMYjmrZdhmxYDfmduqhmJnimUlRbiugyYCzlakQ7QRyMF9tIfOOgtt
RENe5mq1GM1/FQHJyCvbc8Ws4+98/6YIVqKuMoV4FtvOP9Tyfr2t33FgWWtfsy6u
jbOYYpI8i4pTO9xaKSrovleO0se/6l8idMr71swiwLuzmByhS63/jBeiQNf1oTi+
iC617tpwGRmTdPOppZXBvcBby+SOS6I9DkmhdHDhtjLQUHw/rE3umFxsL0hGwCDJ
ePJIjWF7pQWvflzNTbD+lE/JdzqU0u9emaO4Lq9qC/uAJ3QXxRzlFnqJjnG2dC+T
TBowIwKHWmZ5r26JpGhbWkVS2ZUicw==
=K8ao
-----END PGP SIGNATURE-----

--MZf7D3rAEoQgPanC--

--===============0911556022574506543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0911556022574506543==--
