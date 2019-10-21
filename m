Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F70DEB3F
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 13:44:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FBA09F6;
	Mon, 21 Oct 2019 13:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FBA09F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571658294;
	bh=byZp6Gx5VeW/5vfevOsxxkavURguDVdB/EYFMdF5160=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o5xyWbjBBgylkoTaibepunIfORGax6gGBRoV44Vx3BYA3CFtlyuY2AlFBO1nKQXRi
	 kYG0xybGW+Yu0uei90hT7shxtLD9MCUZm5+hGJFBRE2Qd0LmCidwNhct5FbxU/e+aX
	 sBkhzwhOOGJCVYZSW80ej3LhSgKqnZNaniT9zCyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1893F80368;
	Mon, 21 Oct 2019 13:43:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59E0FF80368; Mon, 21 Oct 2019 13:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FA1BF800C0
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 13:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FA1BF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sSLQpV4x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GIa05QdeyCuYiBMjtkuXZuPCEqcil/OB3E8X/KRg9f8=; b=sSLQpV4xgyAY6dGcffk45c5DN
 bYwSDBX9NRH33Pns3dCDeOvLco6ycKmY/ahSJuIy5T7lZ9ecs24N9EONYDHm/F4DiFsYxihmc3ZkR
 RvzbewdbHw/epKuNTuI/2Aj9JLy2vxScz5OIoWgYrY84aYdhvWrAyP97RHO5Meb44fCbA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMW5Y-00043p-PN; Mon, 21 Oct 2019 11:43:04 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C3B31274301C; Mon, 21 Oct 2019 12:43:03 +0100 (BST)
Date: Mon, 21 Oct 2019 12:43:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <20191021114303.GC4691@sirena.co.uk>
References: <20191019070254.23870-1-tzungbi@google.com>
 <20191019143504.1.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
 <659a3d1f-a8e1-268d-5e95-b328aeed601b@collabora.com>
MIME-Version: 1.0
In-Reply-To: <659a3d1f-a8e1-268d-5e95-b328aeed601b@collabora.com>
X-Cookie: Why are you so hard to ignore?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: gwendal@google.com, drinkcat@google.com, alsa-devel@alsa-project.org,
 cychiang@google.com, devicetree@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@google.com>, robh+dt@kernel.org, bleung@google.com,
 dgreid@google.com
Subject: Re: [alsa-devel] [PATCH v5 1/4] ASoC: cros_ec_codec: support WoV
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
Content-Type: multipart/mixed; boundary="===============2958823846666932974=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2958823846666932974==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DSayHWYpDlRfCAAQ"
Content-Disposition: inline


--DSayHWYpDlRfCAAQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 21, 2019 at 01:26:04PM +0200, Enric Balletbo i Serra wrote:

> Mark, once applied, could we get an immutable branch from you containing the
> following already applied patches + this series? We need as we have patches that
> could conflict on platform/chrome.

Ugh.  You should have mentioned this before the patches were applied,
they're on the development branch that has everything in it like I
normally do which I don't want to rebase (and I think I did a merge up
of the fixes branch since then anyway).  Hopefully Linus will be able to
figure out any conflicts that occur.

--DSayHWYpDlRfCAAQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2tmcYACgkQJNaLcl1U
h9CS3wf/aZHpcuMrsOi4FzUhmUl9hMRd9hqhGnfEHe9j8lh09mRayr3O3K95jNkR
fijdwh59O4VQIfKSR3bvz/dD9ygmkmgFleqzkgelhzDGkkFaKcuJ2z8c1WGZYfrK
2vRdnZ+pcYAWE+ZkmNkjUJG/6ee+xmn8WlHrzs0IqCqUFoqrSVsUVCpd6h/lm9AQ
g2q9pCWd0mOwHmmEsd0FvppZtGg3kuJCSq7kKVPGRV3b4pNO0woxG5+DpcDGpHN9
VWZwEDvJhiYCZkuLZZnhKG8F5srHoUMBuCc48Utl/QF1cOFIL6tINWzj3R/1Y5q9
sB0BPV6JxMe5fiVi6IA4pC1oFiL2Rg==
=YCnq
-----END PGP SIGNATURE-----

--DSayHWYpDlRfCAAQ--

--===============2958823846666932974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2958823846666932974==--
