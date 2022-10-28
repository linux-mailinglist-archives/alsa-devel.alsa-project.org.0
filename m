Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F6161120F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 15:00:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E16AE1FCD;
	Fri, 28 Oct 2022 14:59:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E16AE1FCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666962002;
	bh=0OuRNaJ78R/mLvCq80DBKbhmiV+fSFGKAstd5WM5vug=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AswUK6/BSfQac/iP+p6Wjc8EUk5c7optWcqg236TWeVCcuJ7rnYpXqV7+l35II9/e
	 uZz184krgHqujtaGXATtHS7uY6bWdS/KoGTIEVwI+7ErOG6mbAJn23RyB995cn9RRV
	 JBS4gg7mLazvpgpPChFaNTaeev0gEQ0lF8dAY82U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F8AFF804BD;
	Fri, 28 Oct 2022 14:59:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB753F8025A; Fri, 28 Oct 2022 14:59:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C175F8016A
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 14:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C175F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qKQNetHJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE7F16283C;
 Fri, 28 Oct 2022 12:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F43C433D6;
 Fri, 28 Oct 2022 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666961941;
 bh=0OuRNaJ78R/mLvCq80DBKbhmiV+fSFGKAstd5WM5vug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qKQNetHJydStVEqBe9ZNgpMuy9y/d0TgcvmXrEmO892sy0/lkzS3WSuFqE6XnL7mU
 lILcEyYWTOhRLn7aAwI+UjLN1UBYcoSflxfY9NJOWRH3GaYAlcD5szjoAz1ZfM4Obw
 CygTTp3g3aByqlK1wbJQ1zzYSQvoFWnESbuclLeJoxy6m/hT5MSD5QbBWTCqgKpLSE
 XJXl9NnbOGaGMJR2fPs5U/Fky679BJdxiIepuIhkMBg6hermIsXJVTgmAo/7PpSMwN
 M7e8ACMgamfmlUyH2bVLiI5tZ9wshOuF2iwzbwtyffRTYrPAtK4i9dmvDbKTMBzeWR
 rcl90ExEBwWGw==
Date: Fri, 28 Oct 2022 13:58:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v1 2/2] ASoC: dmic: Add optional dmic selection
Message-ID: <Y1vSDyZlZBaGyJyb@sirena.org.uk>
References: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
 <20221028102450.1161382-3-ajye_huang@compal.corp-partner.google.com>
 <a7275ee4-c6ec-c0e8-c49d-dec9ca367d9f@linux.intel.com>
 <CALprXBavrYqWxKUgEJMWNXGCuBnKNjKk1n_4eFOeo+=6=juHYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n8nKVFG6JPSjBYcl"
Content-Disposition: inline
In-Reply-To: <CALprXBavrYqWxKUgEJMWNXGCuBnKNjKk1n_4eFOeo+=6=juHYQ@mail.gmail.com>
X-Cookie: Life -- Love It or Leave It.
Cc: robh@kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, devicetree@vger.kernel.org,
 angelogioacchino.delregno@collabora.corp-partner.google.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
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


--n8nKVFG6JPSjBYcl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 28, 2022 at 08:54:31PM +0800, Ajye Huang wrote:

> Yes, the original version I tried the implementation on audio machine
> driver, but one person gave me an idea for this dmic.c
> Do you think it is appropriate on dmic.c?
>  If it isn't, I will add kcontrol into audio machine driver.  thanks

It's definitely a better fit somewhere else - like I said in reply to
the DT binding it's really a mux that sits between the DMICs and the DAI
so that's probably where a generic version should be implemented.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--n8nKVFG6JPSjBYcl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNb0g4ACgkQJNaLcl1U
h9CD0gf/VGTxWpUIDsoJ4AUiYKI4vSNrXJ0zpMUqTQlqcYkQzsq+SdksyZCL4pOW
RQFIU00TL4GhmrO8To/dUu1hSCA3RbjPu/otwIk/xc6jPtp5G9Ui3jVBUkpcdySH
CIgURtbgD07Yb9KUA6Vvh1E6UoHS6K8WzJUmKslYaRFuWGTgdix7BNN1qKxvUuF6
37vfN1YFz69sxPCaKLbai0OztLxt5J7LV3OCDObnA2MRifSpcPum/iVoB59YndOj
fZOPU8mPBnqP/dKAPALq1eonmXcJ1ckVZafYKOKShECXIhhcrMN8EqVzRho9HIpw
dwNl6exiTpQC28EYMk0EdA2y/ULU6w==
=wipj
-----END PGP SIGNATURE-----

--n8nKVFG6JPSjBYcl--
