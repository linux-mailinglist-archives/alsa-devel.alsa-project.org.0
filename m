Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CB3638E5A
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 17:40:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53CE51760;
	Fri, 25 Nov 2022 17:39:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53CE51760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669394419;
	bh=zVQuLd3xpn1r3J0Croeg/y3AKxR/ZMXPyRpOSGkGOTo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PhUVBG1jlUTwAt4CCJfEKR6x/Zj+//kj5yJaj/TliOOPqCF4hURw5IUBAKqFl0/uw
	 BW6i0LK9+0IKaIKkHMsNTsKgxz8raTn+11fgdmwbgrt6C4bz241agiMq25bhLXttkq
	 7806OmZn/PfvwpNj+JIyKwj9Xc2vbsR/qM3krp08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 078D0F80171;
	Fri, 25 Nov 2022 17:39:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 945A4F80236; Fri, 25 Nov 2022 17:39:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DAFCF800F4
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 17:39:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DAFCF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pCEhc/Q8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D098B82B4F;
 Fri, 25 Nov 2022 16:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1C3C433C1;
 Fri, 25 Nov 2022 16:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669394357;
 bh=zVQuLd3xpn1r3J0Croeg/y3AKxR/ZMXPyRpOSGkGOTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pCEhc/Q83yg9znwZ6PfqpjIDkFfm3GqyOFbXQ+UqU97vwz/1b19A78xU4sARMLHgn
 9T2nSTvNIIPbSqpFRTVaBX1azQUGcPtt2hSLRqxIbfi5o/M7NVWED5q2QDIE6J57Ib
 qHZAy6o4uVdH6zUyNAKlneKb8k1NwZ/4si6HLJuRlKMB3z7fRX/NYt7Nfep5G/1/d/
 v7KrG2hvFfFWJn5VDOT7doX8FMLk1cT1Ud2VqxDhS7FUsU33lQLmFTnKE0b+rENBR+
 Dx9f3opt1iKNwW3+JVfX/DXbuBtkG7pclp8Kp31tCZ54699MoPi56L/nYxsgH+Ipid
 +u3eg44cRCLzw==
Date: Fri, 25 Nov 2022 16:39:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: ops: Correct bounds check for second channel
 on SX controls
Message-ID: <Y4DvrsMyTZjPmvdA@sirena.org.uk>
References: <20221125162348.1288005-1-ckeepax@opensource.cirrus.com>
 <Y4DthUIxViHZnh/Q@sirena.org.uk>
 <20221125163509.GG105268@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZaLhVnTV656g8HC5"
Content-Disposition: inline
In-Reply-To: <20221125163509.GG105268@ediswmail.ad.cirrus.com>
X-Cookie: Time and tide wait for no man.
Cc: alsa-devel@alsa-project.org, guille.rodriguez@gmail.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, david.rhodes@cirrus.com,
 james.schulman@cirrus.com
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


--ZaLhVnTV656g8HC5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 25, 2022 at 04:35:09PM +0000, Charles Keepax wrote:
> On Fri, Nov 25, 2022 at 04:29:57PM +0000, Mark Brown wrote:

> > You probably mean 97eea946b93961fffd29448dcda7398d0d51c4b2.

> Sigh, sorry about that will send a new version.

No, it's fine.

--ZaLhVnTV656g8HC5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOA760ACgkQJNaLcl1U
h9AbGQf8DU5taCni14mMU6fynqkh7yKurRTLz9mFlcMRLG8sITPW111j63OVvyMz
3YYoM82KHpSn/a5OARqwJv5LBbWd622n9j7fA8FlSQUDVwTLpR5p2QP7ZO9xsObf
hqO+2JD3l2GJ3CaxqGoJirsvgVoeToXsDLJ1Neu/lcTcI+CY+JTqbZn/MjkGPKkD
nRzOvRDc20W+RmJPy0pnh/G/XprEjKAcXMRQPhOy39+L/o4URAO+423ZWQ6W8JPa
UXx65xHsByvPfB6Wpqi7LyU+kpBimoJPCF/tmgM6lXnIophTr+NXMRK6adtIg/Yd
P59oEi7WuAZxofvfyl6FAyCh91aTXA==
=vHoo
-----END PGP SIGNATURE-----

--ZaLhVnTV656g8HC5--
