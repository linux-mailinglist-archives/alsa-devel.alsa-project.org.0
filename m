Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FC613ADFE
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 16:49:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CCCF181B;
	Tue, 14 Jan 2020 16:48:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CCCF181B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579016969;
	bh=1Y5O7Mv9balNtFqOkRHDWCqMrhRwVRQtQT48q9lQ4nM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L4ZIt3zrbqP/1sWhXB58XR/oCRnUm0gLoOoK5w1R9PtkMbRyoLgWXgJhO5AeGAFvX
	 o0qnoUw1SfE8HVBxXsyMwvb7nuPo/XdOnfregihaJGJEtFmKyLjMG90OKUNGbEmHUH
	 usxGHdVgkG0eYvkeNr1Vw7U0P4EYKOd3AgJOCsNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36DCFF80171;
	Tue, 14 Jan 2020 16:47:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43584F800E9; Tue, 14 Jan 2020 16:47:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCAB7F800E9
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 16:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCAB7F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vHNXwfDL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U2GRLT2Y1GTtPgMPfqBDKRnILV6O1Eygahoq8V/yKzs=; b=vHNXwfDL5Ffjqv/J0lNQa9KhQ
 Is3FqPW76Zh8j0rSV8lyjYiPJDAoPSZUozWZiia32AVCo9w/OoUImaepCBzFoho3KQz30t4Mfcwst
 frzoKk/p+ZeDWC8BUzRjwGqju0NysA2t8I9oF4dtWqOFuMcR353wLoL3yHCshTILbCeqY=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1irOPr-0000Ns-EO; Tue, 14 Jan 2020 15:47:39 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 253C5D01965; Tue, 14 Jan 2020 15:47:39 +0000 (GMT)
Date: Tue, 14 Jan 2020 15:47:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard liao <yung-chuan.liao@linux.intel.com>
Message-ID: <20200114154739.GA3897@sirena.org.uk>
References: <20191225191501.23848-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20191225191501.23848-1-yung-chuan.liao@linux.intel.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, bard.liao@intel.com
Subject: Re: [alsa-devel] [PATCH RFC 0/3] ASoC: Add Multi CPU DAI support
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
Content-Type: multipart/mixed; boundary="===============0386175631192334453=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0386175631192334453==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UEW5kU42M6+IO/TD"
Content-Disposition: inline


--UEW5kU42M6+IO/TD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2019 at 03:14:58AM +0800, Bard liao wrote:
> From: Bard Liao <yung-chuan.liao@linux.intel.com>
>=20
> As discussed in [1], ASoC core supports multi codec DAIs
> on a DAI link. However it does not do so for CPU DAIs.

This approach seems broadly fine - I see you'd already agreed
some updates with Morimoto-san which look sensible.

--UEW5kU42M6+IO/TD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4d4poACgkQJNaLcl1U
h9DAgQf+J889Ggyc6CfzdY6wl9E0TeXAvuFyYFPr1pEsRZBxWPlK2AsKpdpbRTEZ
WCtBQwAViycdVE42JRM+Cy02UUPxrlo2Uqatp1+9jQU+shj9QUo2/tWsPJZHSZUR
65A+hkBCDHsBuW+9SmA7wjupNgCuaQ5ICez/hsjgZr64WazKAvns6cl/ZK8/4RIK
Cj65eyb+kZw23xnI7FrOch4CQ9a54tnu0lL1VgAZ2wPbUB/jxNtBn4Kn8+apJIRW
XevxuZbtkChF1cervOQcQI6LfWXKWVvB/07p2oa6csfHJyQx8f7sZhyNBerOPMW4
UYRygPACtATr+UOcoZCLvuvetJ64Bw==
=RKST
-----END PGP SIGNATURE-----

--UEW5kU42M6+IO/TD--

--===============0386175631192334453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0386175631192334453==--
