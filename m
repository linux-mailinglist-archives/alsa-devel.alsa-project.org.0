Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FDB611223
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 15:02:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95D051F0B;
	Fri, 28 Oct 2022 15:01:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95D051F0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666962166;
	bh=sZ4ZNjf/cBaX1w4dLi8MwgTB0O0ug+mmFH/68/wbeBQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ROqn8BvLd3bMOKLV841Hy2oe9DMHiAV3hcKA7Xg/DCieCtjaHcc6GafqTEzQ7E+ov
	 om7RIn4XL66wRkVQ+mI5+VDSjmUZSTgpknil6wwJCl2yfyY4Cy1Y9cLOvWv1GDrVes
	 UBfw4xsNnRYOug+puYzaEf1nqzP3caKEAxmDzZWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1979BF804BD;
	Fri, 28 Oct 2022 15:01:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1FB5F80095; Fri, 28 Oct 2022 15:01:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6986EF8016A
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 15:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6986EF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gmUDYsbl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B56A4B829B9;
 Fri, 28 Oct 2022 13:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E99C433D6;
 Fri, 28 Oct 2022 13:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666962106;
 bh=sZ4ZNjf/cBaX1w4dLi8MwgTB0O0ug+mmFH/68/wbeBQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gmUDYsblOxDs80NsXHKuUFuycP2tAGkpdpu10+draWkdkiUZ9AwyxOazRzfYhivhP
 QHOekOla/y0+0tCm547GHITIA842fwUeDRAJBTfxek8v3gDl0zyC2mIQJdDAmsBtWj
 1Gd+Y4t/wxGQH9lGrkpz7qfS4gcIw/BFhrDlC9w+iEFaRaE+wbR7wvO8sNEJGHuz1i
 WXpbN6IkUx+va3SVtdlUsDi2rlHkuHl0dI+ur7XU3hzBwQ+1/OkPzQulJz6cnG8BRC
 dleOZqSyzenWbcT6flZ00TbZeFX9voP/cjdxzG4dzZ8RynxARP9FeNXhVcqm2B1TIX
 OzjdgDtCYavSw==
Date: Fri, 28 Oct 2022 14:01:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v1 2/2] ASoC: dmic: Add optional dmic selection
Message-ID: <Y1vStD8vNYmdvPH1@sirena.org.uk>
References: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
 <20221028102450.1161382-3-ajye_huang@compal.corp-partner.google.com>
 <Y1vDxtdNGURAT850@sirena.org.uk>
 <CALprXBbTkj0Q_-3AL81Q1okRD5ZyDf_c=daPrkQstkM4_CNgGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Fc5e//HBGfgKdc7B"
Content-Disposition: inline
In-Reply-To: <CALprXBbTkj0Q_-3AL81Q1okRD5ZyDf_c=daPrkQstkM4_CNgGQ@mail.gmail.com>
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


--Fc5e//HBGfgKdc7B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 28, 2022 at 08:59:54PM +0800, Ajye Huang wrote:

> Thank you for review,
> I think it is appropriate to implement on audio machine side, like
> this I did before,
> commit 3cfbf07c6d27
> ("ASoC: qcom: sc7180: Modify machine driver for 2mic")

> What is your suggestion?  Thank you.

Doing that seems fine.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--Fc5e//HBGfgKdc7B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNb0rMACgkQJNaLcl1U
h9A95Qf/RAWnE6Y2m+kzFQRiw0jEfmsInSLiQXOqfF8ByYGq5HxCsEoOJQUz8FCT
OrYN6znnN0/Cj2vZP6ZMCyQP+Tawetbrn1XX2YU9RUgLQS35sPUrSTMXgyBuXEn6
2xrSN0IwzRR3TpmTGKUdDb3YtzvrFUCsQXvlbt37/CIlI3xSEPVSQCych7yUEnt3
yVEKP2kg8G2aHN+3aEygCNC8OvH98gUYPTil2wHAou2sa8/WBD5yP0+iJHKs5tY2
Uni784arkAKm5Pr2CYhS79Swx/Wzrf+r0skHgoEL/Ml4Gu2Y6xTbHaVfBITd+v1L
kGiIgWVmSbPSTv+jt6CjGcaj66zzVQ==
=iTcB
-----END PGP SIGNATURE-----

--Fc5e//HBGfgKdc7B--
