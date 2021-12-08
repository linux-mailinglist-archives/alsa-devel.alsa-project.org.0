Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 973D646DCEB
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 21:22:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42E362590;
	Wed,  8 Dec 2021 21:22:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42E362590
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638994973;
	bh=rhq3YBDa2lcjLnARAv5KYohBVlKxOxXrI6n5L4BuWHg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PNYE9c10jbw4UfKwAQr5xI/+uG/xmF3CXNqfz3GnNe3pISUV3+jrla0q30QUM4C1+
	 Je0vezOVKpU+GgQPjSa1IJvdJa3e5/ihYHcSbX8W5xvl5ogCTen0hrDgaHcahqSmUC
	 628oCLxrAOVhw+FtwKYNkxAIZt8g/CQhGrgtdXP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1517F80103;
	Wed,  8 Dec 2021 21:21:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EA1CF804E5; Wed,  8 Dec 2021 21:21:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADBB3F80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 21:21:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADBB3F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mPOCHW/Z"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C95D7CE233D;
 Wed,  8 Dec 2021 20:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB580C341C7;
 Wed,  8 Dec 2021 20:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638994891;
 bh=rhq3YBDa2lcjLnARAv5KYohBVlKxOxXrI6n5L4BuWHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mPOCHW/ZnG3IarnyKwRIqvK8yh5fNAWRbivMHC9iyOtjx+Pzv+WW7E7LLYi6WqqFc
 ++UwE+uT7IV8X45wp/bIHedO6FOYCZPpGgUV05/Bt2BtiMnwGVhDJIKPMJR6mHAgJ0
 9ohzeo4vT6pOKYMOKhPHugrxZXCTAOUpkxAaHbgxyUs1K/8sasqrdBhC04yBUS/WEK
 tq+JuyxdvYRVYwuUjhF2Wpbox67dtUl+ZPvu5+D0mqLq0Rqspfdxdn/Q/C+LPodgTD
 ewVOSQIglgSDdny1wU8LhL/wiV+Scu1qh7Mwbpj2gfbYLh6bR1AFyTBtwye6u/6Zn/
 xImvXv/cP3bKw==
Date: Wed, 8 Dec 2021 20:21:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Subject: Re: [PATCH] ASoC: max98357a: Add mixer control to mute/unmute speaker
Message-ID: <YbETxcwa83U8WXTO@sirena.org.uk>
References: <20211208185850.1555996-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Nru0qQ3jsfsVj9cp"
Content-Disposition: inline
In-Reply-To: <20211208185850.1555996-1-AjitKumar.Pandey@amd.com>
X-Cookie: Alex Haley was adopted!
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com
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


--Nru0qQ3jsfsVj9cp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 09, 2021 at 12:28:49AM +0530, Ajit Kumar Pandey wrote:

> +static int speaker_mute_put(struct snd_kcontrol *kcontrol,
> +			    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct max98357a_priv *max98357a = snd_soc_component_get_drvdata(component);
> +	int mode = ucontrol->value.enumerated.item[0];
> +
> +	max98357a->sdmode_switch = mode;
> +	gpiod_set_value_cansleep(max98357a->sdmode, mode);
> +	dev_dbg(component->dev, "set sdmode to %d", mode);

This looks like it should just be a DAPM widget - it's just a generic
GPIO control, there's no connection with the CODEC that I can see so it
definitely shouldn't be in the CODEC driver.  Often trivial stuff like
this is done in the machine driver, though the simple-amplifier driver
is probably a good fit here.

--Nru0qQ3jsfsVj9cp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGxE8UACgkQJNaLcl1U
h9Bjfgf+Idtlzi+zebn2o/I5PxidR71VIpfcfx3wi84zBF17C35koKEMCxLD+lYg
ggmn+Av7y0UxKOlJH2dMbGjHppbIGObSXXfwZz4DW/EvkIB3txbM0P+g+3kZlC5H
Bb9UvdzotaSXfV5KdKA5s0Uv1ZPaCzBLbCJ5gHNR7l9avwKF1eNjHNjBUZnGd807
LnirgNeMo0WCM1XcgOWQIUcY8HvD7Z1Vf1UudXFhiRMOXZN5UpDbFImqxcTe666r
QL4+jcqKchLQ+7fgoizslapoNoGz6qPRV4P2usgG5DNh9fMaVO8cF0/skeG8ukq9
MhlVPlul0sAjPKYgPoteGWAJOku/2w==
=Ysd+
-----END PGP SIGNATURE-----

--Nru0qQ3jsfsVj9cp--
