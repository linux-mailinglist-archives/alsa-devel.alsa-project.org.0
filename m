Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 521A6AD719
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 12:43:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4EAD1669;
	Mon,  9 Sep 2019 12:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4EAD1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568025828;
	bh=AA5/m3tGHANCCGofjkOe0o5j5V77GAekXzdYwJZUYpU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=st6JRMy1e/lPnAnmE8I1L/oPDa4KKMOlZSFKaklhroh96PMVt8KGqlc0YCNOspXfT
	 aaYQuhcwHA7JSI7TNdYWR+F7V5RCGiWiD8W8iC3UhwRgTuFNVSp4tqiw/KNecOx/mr
	 OrddYRkidWS3Rim0zJZ4GXMoh6C0qVLVjPFr1aNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C165F8060D;
	Mon,  9 Sep 2019 12:37:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DADBBF80094; Mon,  9 Sep 2019 12:34:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D2FCF80094
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 12:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D2FCF80094
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="EO8nZ4UD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b4ZpsOtsT9oakTy1DlaGjMBo5th15wS7bOPjyoTPPDs=; b=EO8nZ4UDoHqSdWRnO3MZBbxWT
 5TfymryQF3FuFICo8TRatzzBSXog06YGAp6ac9Z9/5scUbrVpS3z4f2CIgjS/rLytDNeQI1RON2c7
 zKcGM2NMkag+iG1XbEdKYGRrWJ5uPeW76vQ3TR6/TfFX7XHRU0E7Wm0u8yLgx6lAt+7KY=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7GRw-0001mY-ID; Mon, 09 Sep 2019 09:59:08 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id C81CFD02D18; Mon,  9 Sep 2019 10:59:07 +0100 (BST)
Date: Mon, 9 Sep 2019 10:59:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190909095907.GB2036@sirena.org.uk>
References: <877e6oq5nv.wl-kuninori.morimoto.gx@renesas.com>
 <87r24wor0z.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <87r24wor0z.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH resend 11/11] ASoC: soc-core: self
 contained soc_unbind_aux_dev()
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
Content-Type: multipart/mixed; boundary="===============8676238845261352007=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8676238845261352007==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Content-Disposition: inline


--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2019 at 09:15:40AM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> Current soc_unbind_aux_dev() implementation is very half,
> thus it is very unreadable.

You only just added this in the previous patch!  :P

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl12ImsACgkQJNaLcl1U
h9AX+Qf8CCWYyvLwhhU5dx61pMTeK4xSxOQoSYdZyXa5Ck7+Y4wbdeNfHtZhESlj
KjWt58cj2g86xfg3s/CaQ+noZsBaqQLSPRFR0p9E0yuSnCGltwnanKKhOBYCb5vB
3AsKa/N20tEAYJuz91m7liCMIY3PmrGalFHqazeHAVeUkz0sOi4hPjIaYA5pkjZu
NmaObAK172cBtFAQZZDA5ifQd8eECHa3Q9gt2vAI9iNF0SUno/vCYKjqrF959LPD
KMIhVLs5csad4Nk8inR5fbtA/hbvQGT7p9vajlZIz3x1lEpTiuaJHJkDlSwNKhN4
hI84umH25q4MV9Ui2T9nMvyU/BFBFg==
=4UOr
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--

--===============8676238845261352007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8676238845261352007==--
