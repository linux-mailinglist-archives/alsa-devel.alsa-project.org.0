Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C94134C00EC
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 19:06:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63B9917B4;
	Tue, 22 Feb 2022 19:05:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63B9917B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645553175;
	bh=4rGunFeowv1Q7DwwOPcd8Fc+MZiAHpzWeM0Krnzv4VM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fSyEx2CxXzCYrIck+ghcl9P4ij9y/nr2BtVL+jtu3Ne3RqEa/iIEgguPbmXDIkGXC
	 7YYqb6DXUBZl1gcxnaNYXCoQBvKZKDUuwxE1c81wD34bXEAPHu8mFzS5gPeq1Mnn3C
	 rnSpCgQnduCpDtifqh12pmTMIGE9GwlAfJImWe80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04463F80118;
	Tue, 22 Feb 2022 19:05:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B41BAF801EC; Tue, 22 Feb 2022 19:05:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92516F800D1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 19:05:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92516F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HM7ygPwg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61F37614AD;
 Tue, 22 Feb 2022 18:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08619C340E8;
 Tue, 22 Feb 2022 18:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645553098;
 bh=4rGunFeowv1Q7DwwOPcd8Fc+MZiAHpzWeM0Krnzv4VM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HM7ygPwgt7MgTBoq2EwQ9W8wWn2YcRDZepg0PMGUEB5XnA/zV2IhUp8hVtJxxL1u2
 o648rmQHhU/CZX2bNh1McSd7PgMs6cjeJoeBIQY8xPn3fWyOnnFZ3ZKiBzM9JMRmFi
 7eR6mFk5zWq6luOdz58sjZNZ3PlVCIu3XY8/ZXMBdn1FLE3ABYXi45ZgDI5xpTkW/k
 4RACbVXMF6OpDgQRlMEEJ83ZiKpOtQGnOFRek8geYZutCY/ii88o6xzUNWaxbT7KMI
 fxSEpzZTDIKMN3qpWcK3bX8jlwUdmoSNdsIRMK57ddxoThA7Ul1zf3MFaVrPvxPRvG
 sclUXAwb9/W6A==
Date: Tue, 22 Feb 2022 18:04:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 10/16] ASoC: codecs: rx-macro: fix tlv min max range
Message-ID: <YhUlxX461J9bskg3@sirena.org.uk>
References: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
 <20220222115933.9114-11-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4fuKPQSv5bl+QP9H"
Content-Disposition: inline
In-Reply-To: <20220222115933.9114-11-srinivas.kandagatla@linaro.org>
X-Cookie: I smell a wumpus.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, quic_srivasam@quicinc.com
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


--4fuKPQSv5bl+QP9H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 11:59:27AM +0000, Srinivas Kandagatla wrote:
> on Qualcomm codecs gain tlv control specifies min max range as both
> negative to positive numbers like
>=20
> SOC_SINGLE_S8_TLV("... Volume", ..,  -84, 40, gain)
>=20
> However with recent boundary checks added in commit 817f7c9335ec0
> ("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw())
> setting a value above 40 gain will fail.
>=20
> So fix this min max range correctly to
> SOC_SINGLE_S8_TLV("... Volume", ..,  0, 124, gain)
> so that users can now set gain correctly

Are you sure this isn't a bug in the core?  -84..40 should be a valid
range for a signed control.  See Marek's fix in 9bdd10d57a ("ASoC: ops:
Shift tested values in snd_soc_put_volsw() by +min") though that only
kicks in for systems with a platform_max.  I can't immediately spot any
other issues for S8 but I could be missing something.

--4fuKPQSv5bl+QP9H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIVJcUACgkQJNaLcl1U
h9DDlQf/f2Ci6r9z/pr5qr0/dF0MmFwhyBNnZ33/mSONg5YGjV+uQQnjoVsAfTPT
30EXf2rI5VaRs6J2SrQIExE/fUhMJLkydyG4loHwr212AM4preDD9P00c0Mn8UkX
q/eVLRLvFDLg08uBD2+xz0EzaqgF9bPcJ0Cxir+UWJG87Ai6W4k+5xy6TG5K5C5S
QVuQZXuh2OKMRnlH+naPv6jjYhlHSRfIX3PwPdDvUluH/4fxJDhmZch71ogzkHsc
sVxjDB2Rt73k/YT+74BzMLzn/cWVNYN18ZbQud2Q+WedRzbnH/uEoSsJWUX4bGbU
tmv3Xzsr4xHQd9jeJcpZs5BCD13Qlg==
=y7ad
-----END PGP SIGNATURE-----

--4fuKPQSv5bl+QP9H--
