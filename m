Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1096F4193A4
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 13:52:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51F6216AF;
	Mon, 27 Sep 2021 13:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51F6216AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632743529;
	bh=+6STobOuOlzOXWTxDK/LtFOOOoG8G2+aHSnbuBCAJho=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NTZHjQQ1PgtZGJfU8s1NhFLSACRhMcPBpOFv1CasBh1thl6VT9Jen6bRtU/OufD7H
	 nVDVTOBSlJHx/SmTcfoMhkZbawpnbNVJ//W9uW+KeuX6SAjUoBhdyqSN21rnfAsOcc
	 4pIBvaIRsvaXfLyA/O9+hB+o8Ph1ufvzl4FNqPtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3FAEF8026D;
	Mon, 27 Sep 2021 13:50:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0273F80227; Mon, 27 Sep 2021 13:50:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25627F80147
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 13:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25627F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L5kgPclR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0008260F6D;
 Mon, 27 Sep 2021 11:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632743430;
 bh=+6STobOuOlzOXWTxDK/LtFOOOoG8G2+aHSnbuBCAJho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L5kgPclRUtZE9bpW9xN3xybcRvXEmbvbUAmGAMvdgoF9VFvVYaaRswEKGEuhlf/ns
 N8d3HyPVxp9QgAJBk67VgjLOz7I9a3Hhydet3ZKctnRrVgPhnpfuqxRpRy0FENtv0I
 AFfssP2NovJslPPq8RFHnIukWyN2sbsJRQZZ2iyd/X0CopRnPsM7vFv1+iXtCBicaK
 cOFenmlJsr2bbuMz+JVAh94sb6rm1aG2d6nZK4LB+69Toqf+X8CMa7APpMMfbBLwJC
 BwEmT24eo+SJi3SOmWfTMhUST/1KOnCOVkSQC2/GEO1/obr35tNXFMNvIxWP1j1yap
 m9wARgw1tkyCw==
Date: Mon, 27 Sep 2021 12:49:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l42: Add HP Volume Scale control
Message-ID: <20210927114942.GC4199@sirena.org.uk>
References: <20210927111244.17906-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Content-Disposition: inline
In-Reply-To: <20210927111244.17906-1-vitalyr@opensource.cirrus.com>
X-Cookie: 98% lean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, linux-kernel@vger.kernel.org
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


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 27, 2021 at 12:12:44PM +0100, Vitaly Rodionov wrote:

> +static const char * const cs42l42_full_scale_vol_text[] = {
> +	"0dB", "-6dB"
> +};
> +
> +static SOC_ENUM_SINGLE_DECL(cs42l42_full_scale_vol_enum, CS42L42_HP_CTL,
> +			    CS42L42_HP_FULL_SCALE_VOL_SHIFT,
> +			    cs42l42_full_scale_vol_text);

This looks like it's just a regular volume control that adds/removes an
extra 6dB so I'd expect it to be a normal Volume with TLV info.

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFRr9UACgkQJNaLcl1U
h9CZOgf/f3f0pV80Z4P705daQFFWTtqcIqeFI3iyFeVm6ZdU+3nOGW4QGICifIEd
OZDcitqkMNsdjJ0nY8eAlWwsLIvN+BRddOhWNC5Olb4eDRm8akI8I+9JApOU3QC7
5hyUMRleFuTCH4Nwfyt1p56xVC8/lrDfX9Fy1mEMMyHdhbe/KvQ2Ae8oPe4tD2+6
BxCLruymgeuVMo2GeQUvmSLIvApHyXEgm98lH6DGoRjIwsb3yO4kafedXufsK/sW
2GQcI2SW+AICehFbhkxeN0ixZQVR+FJ6bkyE1JUib+EWWiN7xCOmpdgW/M3hQdMq
TUbrujHVtMXt3NTvKix1s6myspABCw==
=yWuI
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--
