Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A4D1A38EA
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 19:31:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 789DC1670;
	Thu,  9 Apr 2020 19:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 789DC1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586453510;
	bh=gwCMVgI55oBxZeA/ZAEGuRvjk4DQBHRco/poNeClq98=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KF3KSUNXruvM/6PwJr73v44bz1VmGlH1ZriVyCXzDEyB5501wVu4Dd5i//ExYx4HB
	 YHXAPQcI9UMrKgqvDxHhMNROP7YnzL8/BB1ZbO6qQ2ZeOdu44HS+vIXGFBlhApNRuM
	 s6v0WpmaOrPvhIIleLKJTxcNMbd5IenGoZp9IKkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53418F80107;
	Thu,  9 Apr 2020 19:30:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42C8FF801DA; Thu,  9 Apr 2020 19:30:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39C8DF80107
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 19:29:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39C8DF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KkdOASzN"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E22FD20753;
 Thu,  9 Apr 2020 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586453395;
 bh=gwCMVgI55oBxZeA/ZAEGuRvjk4DQBHRco/poNeClq98=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KkdOASzNiq2YKxftkzZx9j78sH3gxPhCTlGpCnRqbkDC13mBU2Wnc5AOSeCbBXjVE
 7IOD/AJ4lvMVE8hNnDGwhMQP7kTdPfD24CW8SDOik2z8gjk/LHklzeYFuIVod9MGyx
 g6J/6HB0KqtvYhAPRiiSsLoG9WpNJRliUCZE0hXI=
Date: Thu, 9 Apr 2020 18:29:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 0/2] Support headset on Tegra boards that use WM8903
Message-ID: <20200409172952.GG5399@sirena.org.uk>
References: <20200330204011.18465-1-digetx@gmail.com>
 <5c9c995a-a571-e543-e680-30739cb1561c@gmail.com>
 <848cc6c5-e8e4-2796-3ee1-3e12a3e92c54@wwwdotorg.org>
 <a7159a8e-4987-0c08-ce3a-fa82d926218e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OFj+1YLvsEfSXdCH"
Content-Disposition: inline
In-Reply-To: <a7159a8e-4987-0c08-ce3a-fa82d926218e@gmail.com>
X-Cookie: HUGH BEAUMONT died in 1982!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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


--OFj+1YLvsEfSXdCH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 09, 2020 at 08:13:54PM +0300, Dmitry Osipenko wrote:

> The code change doesn't affect any of the old users, so it should be
> safe anyways.

> I understand that you don't feel comfortable to give an ACK if you're
> unsure, but I assume that Jon is in the same position, and thus, I'm not
> sure how to move forward.

> Mark, could you please help with reviewing this series?

It is currently the merge window.  Nothing other than bug fixes is going
to get applied until the merge window is over, probably Sunday or Monday.

--OFj+1YLvsEfSXdCH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6PW5AACgkQJNaLcl1U
h9Aipwf+N3qaJUOkv/KorzxIyIDYSsyZPSVUq0X/6TbEkyjM6GDU3cnm2Q1KI4PI
hVwyBmoXuz87lGD9Xr46fpZ6J/Z0KX/wih9fsA/IEfas15FlfHG5Ps0wUPdgCFJV
3k39OnaYCVcvr+9mTfqNDmZiaOUu/6S6NS3c6NQ19ZeIXDCJORE7Mu2jhw8QJFSe
YRIYQUC3ftEKoKvJKca7dQdgwlmCt3QDml3vn3E6k3WqL2zeRciJ9lq+do/re+OR
zUCxHfY8vcJwDhPPOx8SCAf98O3XbgRddqQNXVZ2hVW/gWX+RnD3so6MK6jfyeUW
olmfljKWY4JZP+Uf/9LHZn5VEdGyyg==
=U7om
-----END PGP SIGNATURE-----

--OFj+1YLvsEfSXdCH--
