Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22924262FFE
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 16:50:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9072A16F5;
	Wed,  9 Sep 2020 16:50:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9072A16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599663050;
	bh=0XUCT7ffc5+Ld4ULucF2hBrd1CjYitXF/ovl6zpogk8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j70QWAnq9a6e0ImSy1Q9LiDwfaPG2N6Uhhx5/+puNOUDE+A+84RLPucE3OuNLAH83
	 o4TtiPCMOqI7FkpccxGGHxEcbyxAfJfB6wgmUBqd4xDkqONGT52W4KQAQL98a3Cb7Z
	 AUYDKirY7dlLBDC7i+6ZA5amQkkdAU1V3QK/+xEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC8F4F80240;
	Wed,  9 Sep 2020 16:49:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78414F800E9; Wed,  9 Sep 2020 16:49:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E295F800E9
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 16:48:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E295F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="E8islaca"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD14622261;
 Wed,  9 Sep 2020 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599662935;
 bh=0XUCT7ffc5+Ld4ULucF2hBrd1CjYitXF/ovl6zpogk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E8islacanjkFMkKsaoFao4mmdPlyXNsFXxUwr+yC9vDtJ76PdgxQMJF2MM6vVqzcW
 OFkOSXCWsMflKMcbUDdAwoj6M5RnkaXbcT+r/mvC/H+uTwSktHvEcK8qYNv2vANIKK
 x9XawygRVwxnJ5el+Vt46CbT7DRI8q8Vj6WiBRK8=
Date: Wed, 9 Sep 2020 15:48:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/3] ASoC: fsl: Replace tasklet with work
Message-ID: <20200909144809.GE4926@sirena.org.uk>
References: <20200903104749.21435-1-tiwai@suse.de>
 <20200903104749.21435-2-tiwai@suse.de>
 <20200909141659.GA55051@sirena.org.uk>
 <s5h7dt3rpxs.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ILuaRSyQpoVaJ1HG"
Content-Disposition: inline
In-Reply-To: <s5h7dt3rpxs.wl-tiwai@suse.de>
X-Cookie: MIT:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>
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


--ILuaRSyQpoVaJ1HG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 09, 2020 at 04:21:35PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> Did you merge either Linus tree (v5.9-rc4) or my topic/tasklet-convert
> branch into yours beforehand?  There are tasklet API conversions
> landed in 5.9-rc4, and these patches are based on it.

Yeah, since sending this I think I got your branch - I'd misread the
cover as saying it worked with that not that it was a dependency.

--ILuaRSyQpoVaJ1HG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9Y6ygACgkQJNaLcl1U
h9AMcQf/TCKB5+coo7qjlEPNwYR2E05tpKekhu8axeLs40dPn6FWRoRory5doqag
iakYT7FbYV6FshvadrS8p5ICc8BQxm9aXqVAh2O9ZZtPmULs7EoZx4jjGpC9INQ6
d7xXFyC1Lh8yFuWSWdPLjmONAk9YeduzFzyGXAkTvdWDzbc3e83Q6ylT2ouqmvhw
xbA7a7IIQonUr6RAvqAfmCKBozJ6AvsT3ST6qMgu6v9JL430ix+ZzAHGBmd9nOdg
pcLQw1GHDX5rDGTOay7e5IKzaHkvonTA9qRBkc+ZPHyGSitnKvP/4o4UdJ4CpT/L
ilhRpMt0d+/xf4Did95+/i0IwlkpzA==
=jBib
-----END PGP SIGNATURE-----

--ILuaRSyQpoVaJ1HG--
