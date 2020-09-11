Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F0B265E50
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 12:43:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4153F167E;
	Fri, 11 Sep 2020 12:42:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4153F167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599821001;
	bh=o4iT0OGz+KU6cUzw5o+rXotFzwfpp2zNezX1E5M8nVg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u1ioHEF2cwPRhcrCoaGc9YofW2zeIVw1q+5zPeNEu89Amvase1oWo2teOFfkh73UL
	 2YzJVjM79h6Y0ciIzoe/uahE87+1sD08+2cjZJK1BSiLfrh1sz8zeCkIXI/OPBSplj
	 LFR1MGH+wo/pFkm9/AyfMENL44Sxwwc5uMqIVLwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54CE0F800E9;
	Fri, 11 Sep 2020 12:41:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DA7CF80227; Fri, 11 Sep 2020 12:41:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1516AF80100
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 12:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1516AF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0KbcUO5T"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 042FB208FE;
 Fri, 11 Sep 2020 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599820889;
 bh=o4iT0OGz+KU6cUzw5o+rXotFzwfpp2zNezX1E5M8nVg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0KbcUO5TxttHkb5NcOnbxmLKEXh0D2bj5JDgMIVW/rXr+naF82XnhFlm6jtCg9ieg
 crAUbKofM8zbTHFvZyVHSiRv99A3yUBWOFejSE6jDZmBlFAs38y6/RfKta73E0lFar
 uGTxSzljHXm4vTP5SB9qNataW9byEDRgrTi6Busw=
Date: Fri, 11 Sep 2020 11:40:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: ak4458: Add DSD support for ak4458 and ak4497
Message-ID: <20200911104042.GC4895@sirena.org.uk>
References: <20200911083048.29055-1-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Content-Disposition: inline
In-Reply-To: <20200911083048.29055-1-shengjiu.wang@nxp.com>
X-Cookie: Only God can make random selections.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2020 at 04:30:48PM +0800, Shengjiu Wang wrote:

> Add a new kcontrol for ak4497 codec for ak4497 has a specific
> pin selection.

What exactly is this pin selection about - is it something that will
change at runtime or should it be configured by the board in the DT?

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9bVCoACgkQJNaLcl1U
h9AnuAf/Wo+SWWpKso1LHcylf5Ds4Qlw8dHZhBAgb7IOBySG5m5Ls1ivvqhfrryx
+wr844cdInVpsnQcdBIc1LDnAO0t7T6dtTuvgzhI2FalnR+1hjtYJorai6J4J34D
O3fD6fzsJmjbtE9yeh2/kntEMYeqXTW01g5/knxSkrqPJbhG2U5V7U9UtUJU42hX
fQjdMWZfeOwB4pzr8IPmW7l1wcqX849+HYDM64K2JMl6pPyIS/r/wEgWq2O/juNi
IX95paqCHhA4JGl8bAv6ORr0zV/ozW92rjEbvq0VDiUdlhmLUOpPk+61ikYUtK9Z
WnWuiL+qOHpylWp9mNbsHik5i8WuFg==
=Fsq/
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--
