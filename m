Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32361611026
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 13:57:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1AF721D6;
	Fri, 28 Oct 2022 13:56:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1AF721D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666958242;
	bh=GajkIQuzrXIIDnBsaZvhN+ecuRXsqOWV5zsQ+wIwrZw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gsuMrvhAnDlBu9pgdDYXdi6b6ubHYn4oF9aBXykqQ1woOm3dYY2fNeFnqad3EGzJ5
	 vC6vDG+xT/Dlk2NCYefKxaSdDymLrZjf6CRvOELZTocdiAiQHv/HZr0CftZ3EVbEtO
	 MB8pRipQ3FiftPMOR1F7bOT1tPKv/hyWjavFxiUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39498F8025A;
	Fri, 28 Oct 2022 13:56:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79441F8024C; Fri, 28 Oct 2022 13:56:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CF25F800E1
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 13:56:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CF25F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AE0J/FU2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DB724B82941;
 Fri, 28 Oct 2022 11:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB70CC433C1;
 Fri, 28 Oct 2022 11:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666958182;
 bh=GajkIQuzrXIIDnBsaZvhN+ecuRXsqOWV5zsQ+wIwrZw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AE0J/FU24uj2MBHn9UKB06iauoLTCYWYWPC81msDpshmPXPB1LYtdXl7XVj+je7Yq
 DP27Q6rkf7r2lxMHPbGNAIMajkevaZ8CCXnVsYDBri2b0fKA4SRJpaNzwYoESzV0KP
 6nntRtx11lz4UmsbkZP7v11aLyKiCzKvzNgmuYcf6Gkt2QULmMor4SwKdS72vmSUpG
 +IxnnVOR1glgwyjZ1kyD/RVVRMDrsCzSwQxCfEcuc00fgMQGCW2jWpN1fZEVq5WnE0
 waVTUbiny3BfTG59K91selF+MDJPuov8GFSFskn2PCd+OUJvLWucAc/6vXv9E1efk7
 BW8uFfueYPmwQ==
Date: Fri, 28 Oct 2022 12:56:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: Document dmic_sel-gpios
 optional prop for two DMICs case
Message-ID: <Y1vDYNOwZNOco1hq@sirena.org.uk>
References: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
 <20221028102450.1161382-2-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="M+JJnzUDip9rx8JE"
Content-Disposition: inline
In-Reply-To: <20221028102450.1161382-2-ajye_huang@compal.corp-partner.google.com>
X-Cookie: Life -- Love It or Leave It.
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, devicetree@vger.kernel.org,
 angelogioacchino.delregno@collabora.corp-partner.google.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
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


--M+JJnzUDip9rx8JE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 28, 2022 at 06:24:49PM +0800, Ajye Huang wrote:
> Document dmic_sel-gpios optional prop for switching between two DMICs.
> Ex, the GPIO can control a MUX to select Front or Rear dmic.

> +  dmic_sel-gpios:
> +    maxItems: 1
> +    description: GPIO for switching between DMICs, ex Front/Rear dmic
> +

If we're going to do this we should also allow the bindings to label the
mics appropriately so that the control presented can reflect the actual
hardware.  It does feel like it might fit better to do this separately
to the DMIC driver as a mux between the DMIC and the DAI it's connected
to but equally with the way things are at the minute that feels like
it's probably disproportionate effort.

--M+JJnzUDip9rx8JE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNbw18ACgkQJNaLcl1U
h9A7JQf+MkRMavqrw/+lt93KD/xfx0zvIziXhJJ3+MlsSpvWpJmxEX1nDEEu2I2g
C3wW4SWf4Um/Y1k/eHZYy/KpGJe0ceGE3pmMdrZynpXT2CIWFnGAyLkZAtlRajY9
3wn7V68sQ/A+py5pQOPY1/uDrOkQH2NwHjR9lLvUE8uT/yF1fKmDSMfQTPqHXIVJ
osuU/f+QuIC6JRvu1KcLLk4k0e+Urkm8Y6rck9P3qmbSFM2JqvTm7ZGIIFnmIakd
U4r5I/ex9DN8Qnc002dKHTVM+1Q3AmE6TCnrtnh6F009WvQV7XFLiFQck1b7P5HQ
CIoF98dhQQ/K07h+K2mhTr9xu1ScjQ==
=QJF2
-----END PGP SIGNATURE-----

--M+JJnzUDip9rx8JE--
