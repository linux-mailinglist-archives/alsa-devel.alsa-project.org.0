Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CEA589E05
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 17:00:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 101781E4;
	Thu,  4 Aug 2022 16:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 101781E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659625244;
	bh=MG/OLbjvUhmhCpOzmNodao8upPyMUSDGDlCf4g1Eh8w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d715aAInnuTNutgdV8v9HkB7M1bL9RyZo50YY3UAcal5/NviBPsnRYiq4VYF/8n1U
	 NVabhXYqBV3ayn5UUNFr28EOvOPqkcfk78QYU5fWZXMc56IRJnVpUlLdLcangSZsR/
	 6r0HKEdmAKEQkVS0PQJJ7WQjpGqPhtAXEWGn9/i4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7908DF80212;
	Thu,  4 Aug 2022 16:59:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E33EF8016A; Thu,  4 Aug 2022 16:59:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C3ABF8012F;
 Thu,  4 Aug 2022 16:59:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C3ABF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c0CgKr7e"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5EC0560DF4;
 Thu,  4 Aug 2022 14:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3F7C433C1;
 Thu,  4 Aug 2022 14:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659625172;
 bh=MG/OLbjvUhmhCpOzmNodao8upPyMUSDGDlCf4g1Eh8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c0CgKr7ehUtGuS3wp8y8m8OtWbhfEOxk49tcM/MH4FlGcXmpiu6UyWwDl9JQLoS8U
 HNGhEvCTp4Ux90AuEx9zSWQLTkXTo5P1EZL9RJEUbFELp6pjuIqPjvieYGGJ3EMXi8
 jGO+iVCvN14kxXkFuuorjPcXDUUzlo0LHgWvcybGLswb4Ie/FstY+nsdybl8IxPPpz
 tkxl53aibDN5URDHncyDCfT3sVlxslwrQXBOZx99tGeH5lY7fu4KFi7ts5522MIV7X
 htz2sr7xYv82aOqR8tmW7XQDtQC4EdRb/h1Q6XqW8RcSo8PlevvXVrTQZ9j59UJ+Mk
 vE5znSwjnW5mw==
Date: Thu, 4 Aug 2022 15:59:26 +0100
From: Mark Brown <broonie@kernel.org>
To: "chunxu.li" <chunxu.li@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: Introduce optional callback
 of_machine_select
Message-ID: <YuvezrxOnAJTLKt9@sirena.org.uk>
References: <20220804091359.31449-1-chunxu.li@mediatek.com>
 <20220804091359.31449-2-chunxu.li@mediatek.com>
 <YuvG4drwG/rYoozp@sirena.org.uk>
 <644d24503899e6ed8b6a7321979e11e46577a610.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h0hDaRGCHYmaxJ2S"
Content-Disposition: inline
In-Reply-To: <644d24503899e6ed8b6a7321979e11e46577a610.camel@mediatek.com>
X-Cookie: Did I say 2?  I lied.
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 yc.hung@mediatek.com, matthias.bgg@gmail.com,
 sound-open-firmware@alsa-project.org, daniel.baluta@nxp.com,
 linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com
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


--h0hDaRGCHYmaxJ2S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 04, 2022 at 10:36:07PM +0800, chunxu.li wrote:

> Thanks for you advice, I'll remove the callback function, and directly
> call sof_of_machine_select() in sof_machine_check() as following.
>=20
> int sof_machine_check(struct snd_sof_dev *sdev)
> {
> 	}
>=20
> =09
> +	of_mach =3D sof_of_machine_select(sdev);
> +	if (of_mach) {
> +		sof_pdata->of_machine =3D of_mach;
> +		return 0;
> +	}

Looks good.

--h0hDaRGCHYmaxJ2S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLr3s0ACgkQJNaLcl1U
h9CNtgf/XRsA3q6DYLqEaEXV4tXIlM8fA/R/M0YDmHq6Ue+jq26vdS+Af5jl77wB
FIpNpuihB4hPSw02XTLtF7vyGr2FovaTLOCQcYI1YFv/HdKvw2e/F7CGKbopburY
DaP2S1j4l5n/cEGFht//jtFMR1wlmgLPcjcSCx62mZpAqvUulCjnjL5EMhyygC2W
n+80WJg3AH1EzsDtYEsvjs7xI7zswHcamarrPa3Wgl/FIiAS99nk1PH17AKIlncB
Gl/wOsK9p5nDKqiKGrLmVuC80G6DOC2NcvMmu+zgElXU6SmUsytHQQWuWxfJ9jpr
PQ16skJvJ9CihoHwi7dYaA8P6h3J5Q==
=uDFa
-----END PGP SIGNATURE-----

--h0hDaRGCHYmaxJ2S--
