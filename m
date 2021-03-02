Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 582A0329F76
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 13:52:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D983416EB;
	Tue,  2 Mar 2021 13:51:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D983416EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614689520;
	bh=WmVH+zXDxgTi+YtrZbgW5+vNGhWdHs8/AxaMBHbxCdQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kKgLRhRDSTdVAH2YOcKNAQFLal8kzelmsjceIfsc0bCvyIlpKnFdg3LrqpUT8wG51
	 nkE4dS0NyjjB+EseJrnHpQV1KzHASjy8ci98fLi1aE4GdlWYM9jPfVErnu8JnpvxeB
	 4KFa5DYL0qEhNyiwwSReLBTtYUvzLZRKA+0KTp+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18387F80273;
	Tue,  2 Mar 2021 13:50:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B659F80269; Tue,  2 Mar 2021 13:50:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BB8AF8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 13:50:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BB8AF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JOBXeQ9V"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4B6664F64;
 Tue,  2 Mar 2021 12:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614689420;
 bh=WmVH+zXDxgTi+YtrZbgW5+vNGhWdHs8/AxaMBHbxCdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JOBXeQ9VgXV/INC2xKi/GmKK5Jz8qBkQE1lP2pI7N7hra2/rj3o82DhBbnmejOsD+
 kS3mZQmhKgrVKhM5r5CkDmzN72lwR8HHeEx/nOaoukXsrnWGrd9kRF8HeUN+1A/Fbn
 LHlWGVaY+jiXAyxfGUsnshRfCYHVUv2BFKKGDt85aaO7JSbcLc1z2AiEJtn9wQoQBb
 VdWkv6Njxgxdm1EcBOGRJM+Asw4knR4E12b6uMezB08a+u75W/faj5qrkcChDq/rjB
 1tadEPDuDCjI01DDPQKS7Rw5SyRrOgFk2PAW9lTZ5IzvuyowpogOYOTkMLnR6mF9ER
 8SyvF+No0caLQ==
Date: Tue, 2 Mar 2021 12:49:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] ASoC: soc-core: Prevent warning if no DMI table is present
Message-ID: <20210302124913.GC4522@sirena.org.uk>
References: <20210302092712.310705-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline
In-Reply-To: <20210302092712.310705-1-jonathanh@nvidia.com>
X-Cookie: Friction is a drag.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
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


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 09:27:12AM +0000, Jon Hunter wrote:
> Many systems do not provide a DMI table and on these systems a warning,
> such as the following, is printed on boot ...
>=20
>  WARNING KERN tegra-audio-graph-card sound: ASoC: no DMI vendor name!
>=20
> If DMI support is enabled in the kernel, there is no simple way to
> detect if a DMI table is table or not. Note that the variable
> 'dmi_available' is not exported and so cannot be used by kernel modules.

We could fix that, or provide an accessor function?  Or only warn if
we're on an ACPI system (which we can check from a module).  This really
does feel like something we should be warning about on systems that are
supposed to have DMI information available as standard.

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA+NEgACgkQJNaLcl1U
h9CQDAf/Z48cJOMLdkoZSxTL6NDL7fNrb3cLcBfyh2VSzLXYRiPg9xSEGtxMEtZH
Nt77fAQr36jGJj5+ArLxHIZp3t0baGveNLoWOLR+0V2nq3ySxgUfKElwV5gQ/Xwy
NJLtb0s9AzeYnM6docqPn5mdfTHKidIEVtcdprYrPo4TGT5XwUayn5Nj037keTda
HFDHscgSyFqEwFEQs6qwAHfNocGEakSbtsmFD+tC2GCupq1gx3pJm1i/rS50b4U6
jiEj+pP2OPhGKj103UKc+wNByNfGPVo5p0fhKqrklHnAFC1B4ZXXWHqU7Xa/soVq
v1Ou/xkvrjI+ckyeeLLDpPMx2bjaYg==
=zWGP
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--
