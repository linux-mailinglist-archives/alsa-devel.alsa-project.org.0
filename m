Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4005126701
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 17:33:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8788166C;
	Wed, 22 May 2019 17:32:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8788166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558539201;
	bh=Ji4m8FPAvCgQzXKDtMGEUA/6VUkQmNdlSKgO11FMIow=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GOY8UOvopemX41cm7/3j8NhooxLIptdSQ3hGd026tZNcJqbJdx7JNH6fvE57ykzQ+
	 xxMBmBTuZb71dBbb8BRQ3ZoQIDOwHfYUq3U2X5diGbhaw1bI8PkqOl+NRWIX+6pMqy
	 sapr7dWj6E9f6qo2FGFBBvXgPiRVwysc9reBVMaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 186C5F89625;
	Wed, 22 May 2019 17:31:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F2DEF8962F; Wed, 22 May 2019 17:31:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99EBCF8079B
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 17:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99EBCF8079B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NyAGaU9e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y0wAuH+J9bz8OMWTI/FBBnL4RhujAAk8vLbf7HYUQY0=; b=NyAGaU9erR8MOL0XJ/sAxmoHH
 DU1PbmCpRFUoxu1N2XjQ9l//0fV1Gk28RpO8rMeBNDllzuUdPS1w/BU//EUXfuYCH3V4hSdtVOIBV
 yv0axdT+SEzMWdyEHAaNpkCyU2NXdK+L8IoeaQShQgBul6I0HtDPjqubuY4JjuEJG4KO4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTTDF-0004bL-8d; Wed, 22 May 2019 15:31:29 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 8C77C11226BC; Wed, 22 May 2019 16:31:28 +0100 (BST)
Date: Wed, 22 May 2019 16:31:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Message-ID: <20190522153128.GF8582@sirena.org.uk>
References: <1558536724-18293-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1558536724-18293-1-git-send-email-jiaxin.yu@mediatek.com>
X-Cookie: Does the name Pavlov ring a bell?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com,
 srv_heupstream@mediatek.com, garlic.tseng@mediatek.com, tzungbi@google.com,
 linux-mediatek@list.infradead.org, kaichieh.chuang@mediatek.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Mediatek: MT8183: enable dev runtime
 suspend and resume
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
Content-Type: multipart/mixed; boundary="===============1979129659672657977=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1979129659672657977==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pyE8wggRBhVBcj8z"
Content-Disposition: inline


--pyE8wggRBhVBcj8z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 10:52:04PM +0800, Jiaxin Yu wrote:
> System suspend will power off audio, so we need regcache sync when
> system resume.
>=20
> Remove pm_runtime_get_sync in dev probe and pm_runtime_put_sync in
> dev remove.So that audio dev can triggle runitme suspend and resume.

While allowing runtime PM to run is good it'd be better to have a
standard system power management resume function as well that ensures
everything is restored after suspend to avoid unfortunate interactions
with user configuration of runtime PM.

--pyE8wggRBhVBcj8z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzla08ACgkQJNaLcl1U
h9CTmAf/aR+hpSMlz7odh/3zH6QgA5d+Q1r6lg/BubEjiLp6YWSBxnzUsz+fOcYh
zJ66EYLu6KsH/PT/vkYXdxAvt9n/agC6ZRHcpZJOuMiDhItY94ZYTFjZvbt8krx2
DxW2O9b6OrFu8jaPle0D5NvWWA+F1az9oaGxBicgJ4Qh7Cput5ArKP6v7mbaveuU
Prc01/wsk81KuqObX0PchyxHabyR7ntaGf/SjrGUdcpQBLfPBKspfh5AZHo3wtRj
vwEj5YGoXInhcVFvUEJCqmVVI3v8y9peD2BmPrz3fvE6J2UiRMAHLiPq8WzUydzR
tK1wpu+piOp3gK0fJEydVpnjYMTHnQ==
=mS3Q
-----END PGP SIGNATURE-----

--pyE8wggRBhVBcj8z--

--===============1979129659672657977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1979129659672657977==--
