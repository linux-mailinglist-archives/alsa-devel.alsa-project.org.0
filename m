Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F22AFAE7
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 12:56:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DCCC1730;
	Wed, 11 Sep 2019 12:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DCCC1730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568199375;
	bh=xF3dwXdpxFfMRZ0b9JchDMS90Qv0h1nx7TIzwLunNVc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j9tfnF5DT1zsJPdXsXjrjrtYx77QgBGUFz1+wBR7hwpLoVqlAp0KGDGRpGMU5nZEg
	 VMGoT60s37nyye5bcDG4V29z2o/0LDmZbYelN6Deg1E65JRX/6VoQjt32/K52nxhTe
	 E+0NOKfzk/s8MqEVDkgkLUslD24WOwpZvJf3uZow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8818F804AB;
	Wed, 11 Sep 2019 12:54:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54599F80323; Wed, 11 Sep 2019 12:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E526CF800A9
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 12:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E526CF800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Sv+bqGXQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+tc+0K0aaQMkVCc+cJ+gW5Y/WYMAIsgBND3Ak5lySLc=; b=Sv+bqGXQqnJqN5lPvfod2VlWL
 iLIq7WJetBngds47vWsYWXN+oaA1EQPfYPiMGMxHL6GMmOSQi/QMsrEBISMZTZGijbSClOnd2VctJ
 tiTH8Mygt49YPzz61RbSxoQ6kZze+8zmN/Y/7ghneD3LgHiRgLXXeqZagO05wnBb3d33U=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i80GV-0008Ky-Kd; Wed, 11 Sep 2019 10:54:23 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id EFB27D00330; Wed, 11 Sep 2019 11:54:22 +0100 (BST)
Date: Wed, 11 Sep 2019 11:54:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@chromium.org>
Message-ID: <20190911105422.GZ2036@sirena.org.uk>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
 <20190906194636.217881-13-cujomalainey@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20190906194636.217881-13-cujomalainey@chromium.org>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Bard Liao <bardliao@realtek.com>
Subject: Re: [alsa-devel] [RFC 12/15] ASoC: rt5677: Transfer one period at a
	time over SPI
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
Content-Type: multipart/mixed; boundary="===============1288178933922205769=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1288178933922205769==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yYeq/WQYi/kuVVbm"
Content-Disposition: inline


--yYeq/WQYi/kuVVbm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 06, 2019 at 12:46:34PM -0700, Curtis Malainey wrote:
> From: Ben Zhang <benzh@chromium.org>
>=20
> Rewrite the ring buffer transfer functions to copy one period
> at a time then call snd_pcm_period_elapsed(). This reduces the
> latency of transferring the initial ~2sec of audio after hotword
> detect since audio samples are available for userspace earlier.

This is fixing an earlier patch in the series, why not squash it
in?

--yYeq/WQYi/kuVVbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl140l4ACgkQJNaLcl1U
h9Ai/wf+JndNu2HkSuTEkHv14m6QxOsYugPUvoZ9RAEA4UT6B3CYzwcApr/Dyzxb
NsujdH9m6bWRUJnMWr9wfUj9tMU8fAWXhr/AC39jp7B3IaRqHaFs+x49BHsm2IBv
lQBqVUYb7VGWQTRDoz0egGW2O4cWnFAv/hxFMSQsmlWGAGn7jDREt1EWaB9k/Blf
8pBmFbuDyJbsX5AiFbci0viXUlS8iPMsoaDJTPbqYQEVbhwVYnUPpSu6BDEj85uS
UmViZeQn2EAnD3sUeu/BXg4wtOZXwHzD5QvUzNyulQxYgopRK4XMoNxFniAxFXIv
ZL1zKzrcTGuiUdKE3zOmePD5NREHZQ==
=Uv9v
-----END PGP SIGNATURE-----

--yYeq/WQYi/kuVVbm--

--===============1288178933922205769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1288178933922205769==--
