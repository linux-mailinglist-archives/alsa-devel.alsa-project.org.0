Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D44D8F5B
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 13:25:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F8E01614;
	Wed, 16 Oct 2019 13:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F8E01614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571225139;
	bh=dkEcqsCxmLB3O6N4bQpKDxjgU5DSik7tFbCdw//iKfI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dXSLo/qvfBxKYK06qodh1Sa9y3fMsOu5tgQovnjm60sxPGVBO0k42sake6TdWMWO4
	 oPTtnit50TzduAZSoQyfnXatDMvak6VNNoD4sg5ru1SazeVJMKNTF0hNi88q03UFY7
	 QFGTjqYFOKdCC4dJzw846mDEF9US6jkLoZuxvjC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 220ACF8036C;
	Wed, 16 Oct 2019 13:23:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BE3AF80362; Wed, 16 Oct 2019 13:23:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A95E1F80276
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 13:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A95E1F80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FiGJR/IN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0vANeeDyQtPmx+5mQNXjnxxo4BVybpPeSFsiHuQfSj0=; b=FiGJR/INm2/EUCsgZ4SVaqbWV
 yASvmjFiPtR4UGEDRDaKxcLu3WEU6zcP4VAxkvnZntR6O0nuPbQmM/fXr5NIN5y7DTUfNWsWhiUha
 2x3QWn5Z18AenxXeh9n+taMsJUTvCchJ3Cz/x7dxibAKmQagETju1CDFtD4gwUB/yRgYk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iKhPB-000599-Mc; Wed, 16 Oct 2019 11:23:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1FD9C2741FD5; Wed, 16 Oct 2019 12:23:49 +0100 (BST)
Date: Wed, 16 Oct 2019 12:23:49 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Message-ID: <20191016112349.GC4881@sirena.co.uk>
References: <20191016085845.11672-1-shumingf@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20191016085845.11672-1-shumingf@realtek.com>
X-Cookie: Serenity through viciousness.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, cychiang@google.com, lgirdwood@gmail.com,
 derek.fang@realtek.com, flove@realtek.com
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1011: Read and apply r0 and
 temperature device property
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
Content-Type: multipart/mixed; boundary="===============9095244605882834273=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============9095244605882834273==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Content-Disposition: inline


--NKoe5XOeduwbEQHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2019 at 04:58:45PM +0800, shumingf@realtek.com wrote:

> +static int rt1011_parse_dp(struct rt1011_priv *rt1011, struct device *dev)
> +{
> +	device_property_read_u32(dev, "realtek,temperature_calib",
> +		&rt1011->temperature_calib);
> +	device_property_read_u32(dev, "realtek,r0_calib",
> +		&rt1011->r0_calib);

These are new DT bindings and need to be added to the binding document.

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2m/cQACgkQJNaLcl1U
h9AvZQf/UNaddEaKZEW2trC5IU3n3cZBlAL6CVt0zwDFNm3PIVjPaGgkF9NCmOVh
+zTNx+rltOVT06XTJoCZDu/2hioSjh0UTd0Mgecwo1qaahFvBVr1QvBpCe85foEK
A7scV5CAploy/VyusSy+j12WayZSmWBHF2UwPSYqCXhpC8k+BsXS+lBEcZUPgJTo
bJZVF9v6UDf156O/G5yJ+zOJPhaPE6YuSCGAlydglDSO8aboHKojI4crrY32NAjG
pDzfLFaVNGW+3jYfPMSbr0tkOahLnHp1fDLGMlg5lK/37dkHRbGN46uOFRUjYM/5
dzeN/eLPIt35TpCwnAoBfKzv+aBigg==
=cqax
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--

--===============9095244605882834273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============9095244605882834273==--
