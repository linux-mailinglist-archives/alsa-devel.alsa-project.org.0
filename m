Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 045094CD45
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2019 13:56:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 889C31664;
	Thu, 20 Jun 2019 13:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 889C31664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561031779;
	bh=b/jGy8xwhNrsPjStbeFjpe3PDkF4k+IG7FPKzAPztFM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XZL0/5MBBJ8lFCj3XwtX+6VRJKduPFJL5Ho8nD9M9TRwBTOHQWEps1o4c0MrgpTnJ
	 IxnlnFUf5NM3A5LcqVAbT083RLDGP4HJUwXkdVIwmsz1TN1xf42EaHt8JiieCX0TOb
	 X54cKgz0NcXpLsVS6JgXw+hxYgjt7uCs0XcRSrdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D45A9F89717;
	Thu, 20 Jun 2019 13:54:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F06E2F89717; Thu, 20 Jun 2019 13:54:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE94EF8070D
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 13:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE94EF8070D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="QZIDLCZc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J8ewhzjA+rp4DLvVMuIMPeYFoaW8YVpyKcHpU11Oyo8=; b=QZIDLCZcXPt1i2EG2+5/6LBD9
 A5e6OQfT9P1uwa2m8HriE/umx90hsbOvnW2phub9C08YeDt0jub3nTWCrXftP79Mp74Ohez7EmGCn
 0oCKXptuwbKvSKwosm6UcUsh0rq8sAw55ylz3UEAVG/af39CEX1M/sGx3BEIC2um8jtl0=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdve8-0000Lp-I9; Thu, 20 Jun 2019 11:54:28 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 3299F440046; Thu, 20 Jun 2019 12:54:27 +0100 (BST)
Date: Thu, 20 Jun 2019 12:54:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190620115427.GC5316@sirena.org.uk>
References: <874l4mt525.wl-kuninori.morimoto.gx@renesas.com>
 <20190619114332.GR5316@sirena.org.uk>
 <87v9x1rt8o.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <87v9x1rt8o.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Question about pinctrl_pm_select_xxx()
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
Content-Type: multipart/mixed; boundary="===============4845403699590494932=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4845403699590494932==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/NDiA4DbghPWII0p"
Content-Disposition: inline


--/NDiA4DbghPWII0p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 20, 2019 at 09:35:06AM +0900, Kuninori Morimoto wrote:

> Thus, calling it from DAI only is very enough, I think.

I'd expect that only the DAI should have pins so probably yes, but we
can't guarantee that this won't break anything in practice.

--/NDiA4DbghPWII0p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0Lc/IACgkQJNaLcl1U
h9D5Pwf/WdET1vLbTr07YNnnxHuqOASP7skpwuVh1A3eNFmEeGTvF8uTuK/Trp6t
8jlccsykvbb1ZhOOqDk9Qp23PLAFN4nGK14H2AK1+rHcovR7IR1mnyOur1WkgqXw
ypHrFXF3flTiZCSa2UaOmxG5jmBmVjzdjHE6Pw68rJAfma/Z4lm1QnJg6IOSosnF
FhXETpxZQZoDt1exUpVHpFjEW7MF/zUA1BTlAuhSZV+1mllA28O7EjUI+R3eRr0k
fiFRJJCD42OA3wIzRBcqfna8E9LuGuQwC0Dd6HlQGqesmNjJojxmZCRk7tZbNucs
+TkT3uA40+JC78L/gjeHlW5F54PoYg==
=eaP4
-----END PGP SIGNATURE-----

--/NDiA4DbghPWII0p--

--===============4845403699590494932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4845403699590494932==--
