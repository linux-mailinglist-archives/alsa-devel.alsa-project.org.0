Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A30390344
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 16:02:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CA53173B;
	Tue, 25 May 2021 16:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CA53173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621951330;
	bh=QbUs3FwUWEWx4dGbr2cU2AbRI9rmpLzqSQAYDeVh5UE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sD6r56869Njcm/JnyuCXOYFlwWX483ndHKaLH1Nv75rxmtUoaOMmnOHssZxOENTEO
	 MQyD9fQYtwLWbyYfsAA62PKK9AEsENcqlonNkKRIXw7th+1VCjWqRfQLH53/mOnsHu
	 Y1m+EDFA29FI7sWz63EOKoaA0zDyy2fW9nW98i5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 377C9F800AC;
	Tue, 25 May 2021 16:01:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71CC9F800C9; Tue, 25 May 2021 16:01:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 950E6F800C9
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 16:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 950E6F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Z9EkHLsF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QbUs3FwUWEWx4dGbr2cU2AbRI9rmpLzqSQAYDeVh5UE=; b=Z9EkHLsFyLIuOeS/emwGDwlHe0
 PGbpf6gZ4rT694iKYXWr7t2+epWCgNGaOgbgzVksAFPuBp/CcfC4rsJ8+yPzSa6YiTfQfOoiXNeJ2
 fTknSt8V9aBq1pzWcSLshWu3ZapmlPIQg7pg/N3ijeCNepGUtEI1RBU6/L/2A3l0kppc=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1llXcM-005kzZ-C1; Tue, 25 May 2021 14:01:10 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 5F39CD0045C; Tue, 25 May 2021 15:01:40 +0100 (BST)
Date: Tue, 25 May 2021 15:01:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.12 30/63] ASoC: rt5645: add error checking to
 rt5645_probe function
Message-ID: <YK0DRL1hXkWnIjOA@sirena.org.uk>
References: <20210524144620.2497249-1-sashal@kernel.org>
 <20210524144620.2497249-30-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2wMylynYITqWoqAf"
Content-Disposition: inline
In-Reply-To: <20210524144620.2497249-30-sashal@kernel.org>
X-Cookie: The wages of sin are unreported.
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Phillip Potter <phil@philpotter.co.uk>
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


--2wMylynYITqWoqAf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 10:45:47AM -0400, Sasha Levin wrote:
> From: Phillip Potter <phil@philpotter.co.uk>
>=20
> [ Upstream commit 5e70b8e22b64eed13d5bbebcb5911dae65bf8c6b ]
>=20
> Check for return value from various snd_soc_dapm_* calls, as many of
> them can return errors and this should be handled. Also, reintroduce
> the allocation failure check for rt5645->eq_param as well. Make all

I also don't have this commit and can't see any sign of it
having been submitted upstream.

--2wMylynYITqWoqAf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCtA0MACgkQJNaLcl1U
h9Dfbwf+KaMar+1CO8920nxRtUJqzucHBUts1+0EjlJ++ZLVnGMX2G9HDslPDRwb
GPmS/4xmpbFo2WZtJjfxhh7JxHMUDUALBUaduCen8x4TlrErtQxxn4cdJ5TszAnB
mdiq38gg2ZY0zlA8nt48SkbcO/96EtcwS62Kj0KSsv3aiGI2czPRDCN3B3CIS+nb
Gralf+WmT6RdGUcHdXBA9LZulaGi4iWGQKaJmhZEoZqXyE/LWkbTSCR/aUSlMqxs
a+l68zxxp96/xYjBIj2+8k0AIG2nPGfBisn18BJflMqUO6UCXVWy7EQ/Ipgf4NnA
IYGQQTaQdve9dRRN04g+4oC2nItgwA==
=7W8q
-----END PGP SIGNATURE-----

--2wMylynYITqWoqAf--
