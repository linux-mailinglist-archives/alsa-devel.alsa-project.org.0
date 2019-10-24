Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F83E3BEF
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 21:16:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F8791730;
	Thu, 24 Oct 2019 21:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F8791730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571944611;
	bh=QKp/wpqHPc0F3pCj7TRDWewHHHl1CJ9VONqCOQPcilI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KW1SNzI5Colqc9I4JdT+z1Kkx2sQnXw19Rz8nDX5gEYehgcA/Y697dbBgx4qBnv4G
	 JOMeFIuZm7KEJd/8hfdo10jo3YmoSCsKbqtXX6fTjBhkarxNcRlLIYYy5Zt4fu+txq
	 K0TyWGYMok43d2ps1SGeoA4EFUT8VN3dNwX7NQxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE148F8036E;
	Thu, 24 Oct 2019 21:15:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24DB5F8036E; Thu, 24 Oct 2019 21:15:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A23CCF80274
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 21:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A23CCF80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="R/AcCHF8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y1dht5p5mAjwCiyZ0iNYmzt2NPb2N9d/+3ldaoV8Q5I=; b=R/AcCHF8+28CcnCNmwLyztNze
 WGT14UQQ6suxUc2cO2ryop3D8z8G8nBFT3QAMgeXMOv4UsGnlad/ggKiASvr+Ju+DCxKAM+2/H8rW
 dn8WtFg3ZhohnJKRkCIW1tM6ymg1AM4BIxxlYd+BxIAgzvxQlwcebig+wUS56kwwTXyrw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNia6-0003xu-Oy; Thu, 24 Oct 2019 19:15:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 21BBD274293C; Thu, 24 Oct 2019 20:15:34 +0100 (BST)
Date: Thu, 24 Oct 2019 20:15:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Patrick Lai <plai@codeaurora.org>
Message-ID: <20191024191534.GI46373@sirena.co.uk>
References: <20191009181356.GO2036@sirena.org.uk>
 <20191022185906.GZ5554@sirena.co.uk>
 <204150f3-2d0f-e2df-e4d0-7324b4788e99@codeaurora.org>
MIME-Version: 1.0
In-Reply-To: <204150f3-2d0f-e2df-e4d0-7324b4788e99@codeaurora.org>
X-Cookie: Filmed before a live audience.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, alsa-devel@alsa-project.org,
 Curtis Malainey <cujomalainey@google.com>,
 Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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
Content-Type: multipart/mixed; boundary="===============6757563398537507653=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6757563398537507653==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OfrWf2Fun5Ae4m0Y"
Content-Disposition: inline


--OfrWf2Fun5Ae4m0Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 24, 2019 at 07:20:02AM -0700, Patrick Lai wrote:

> 1. Gapless playback handling between two playbacks with different format
> 2. Passing timestamp along with buffer for both playback and capture
> 3. PCM device volume control
> 4. Unified audio graph building across multiple subsystems

OK, let's add these.

--OfrWf2Fun5Ae4m0Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2x+FUACgkQJNaLcl1U
h9B6MAf+Pt3d+J5mSX0ug/VYa3XFa77+D+dC6PdApl5b+m+iZa7JivCJHG9ylciC
diEFllRKhVigqgnpsjpDbby8m4ZmJOf+wH7kofruRva/O9VXmHMSeEI6ROOuwDbF
UPcgO6M7kowCQ+iYAeSWhDHAjHmNxzx/wbbfJamWuS5t6IuePOq+wYIwde7VQe7e
7HwW93cZO0B/82wFh+yluGOgnyTmYrbp3UzFAaVhIhgx9cB6s0DtCvXmq3b/8tHi
13hJ90tR9ZNWOCAANc0c3/dHoU3B04CZQK2Uh1CKE9wWsVDTcUBaAjIU32bIEai/
5GFrsoyLZybgUVrWk3Iyx2taFhkZqQ==
=szu5
-----END PGP SIGNATURE-----

--OfrWf2Fun5Ae4m0Y--

--===============6757563398537507653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6757563398537507653==--
