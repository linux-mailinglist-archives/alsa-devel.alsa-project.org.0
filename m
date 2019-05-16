Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 713D020348
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 12:18:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 139F716B4;
	Thu, 16 May 2019 12:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 139F716B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558001888;
	bh=x0wa7gGDfEZquSTDe9jYg6DEkvy2SwaNRHS9XRMUoRE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sZ6l+DxyhNQkdM+EKJyfiyFg73QO08eDmnNh2S60tcf3yiF3rIGI76XppEMaeqIh0
	 Kjk4RU4nW8LvjnrPa1AC1LeEXU+FARWFKm7xppS7EX0T+aC4DfEJ8io/Jx212fhVW7
	 lB4y9COV423IPNTkSnw5+nU6kmkCmvt7XowxYYxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6316F896B9;
	Thu, 16 May 2019 12:17:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 167AEF896B9; Thu, 16 May 2019 12:17:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9BCFF80C18
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 12:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9BCFF80C18
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="L3FKw62V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K6ArTVaZ3sb3Flcixm/mI6XBWANQIeL2DTuJraDTiXg=; b=L3FKw62VJI7hDp2XBhBIF5vkk
 4Qcw/AAQhHAs+KB+mdy7cUXsnzgbqqXrQjI67+Z+/GXFBba1mWzbB4gB/G5tjrhdqYM0/hEoQCeZM
 tV908oVIHYm/6XTP57aPocOUSW7axPGL1YvcRwVdqNES1lQqONdA8LWdU+z8CNCPvMEWk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hRDRV-00061w-L8; Thu, 16 May 2019 10:16:53 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id D92C41126D45; Thu, 16 May 2019 11:16:52 +0100 (BST)
Date: Thu, 16 May 2019 11:16:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Shunli Wang <shunli.wang@mediatek.com>
Message-ID: <20190516101652.GD5598@sirena.org.uk>
References: <20190516101515.4127-1-shunli.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20190516101515.4127-1-shunli.wang@mediatek.com>
X-Cookie: <ahzz_> i figured 17G oughta be enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, srv_heupstream@mediatek.com,
 garlic.tseng@mediatek.com, jiaxin.yu@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, kaichieh.chuang@mediatek.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Mediatek: MT8183: enable IIR filter
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
Content-Type: multipart/mixed; boundary="===============4180560286134393108=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4180560286134393108==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YToU2i3Vx8H2dn7O"
Content-Disposition: inline


--YToU2i3Vx8H2dn7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2019 at 06:15:15PM +0800, Shunli Wang wrote:
> This patch is to enable IIR filter when DMIC of PMIC
> is enabled.

Should this not have a user control in case the user wants to avoid the
filter for some reason?

--YToU2i3Vx8H2dn7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzdOJQACgkQJNaLcl1U
h9DQXwf/Q23Lgt4di48QYQEqFll73b2HKiTnqbNLzIJALr+aNJuawGT8eTPovS0m
t4g0WY7gHRWxfKYmBSDBsEmwhNsJG5Ns592Yzki1sSsHpoi//rerbgF48q4n56nH
6o6NfuwmS5YQjPHyd996bmb1VH3fi203Ah42ZxowYptPKjuQN1+INUvj2cneGC5j
7SLu/d/PYWIRs1sMpCrvPhDIlfryIWBmCFfLXnP3ncvT93UhjyEqLX0bRCLephGE
m/GNvqIhr8mPZAQV/wfLqcvj8EKRwz9z88eQkEaPftYTlxqrr2XE97HQPHYqEDSQ
Wae+Ct0I7PgfzFIvav+/NLiKBSOajQ==
=LsWt
-----END PGP SIGNATURE-----

--YToU2i3Vx8H2dn7O--

--===============4180560286134393108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4180560286134393108==--
