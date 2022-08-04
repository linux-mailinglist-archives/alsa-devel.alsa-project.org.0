Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA13589C74
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 15:18:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57966F3;
	Thu,  4 Aug 2022 15:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57966F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659619114;
	bh=pGAubC3p5cu8E3aqPdqw/fxyUjG67zf8Tpf1JKEF55w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kHO3XUUkmvvrmqbTIY2dP3iONXikornvZOrAFLSxIcfD4FoNA2sME96jw1T2PAw9+
	 AJNv2TXB+OlMNpGlDD8ZqECtjEogXV9yTmL1JQV9h/Xihgwa0DzrIu4SuZ63N3NIB6
	 2/fJDjApfsJvv2CIegnT4GGtG9sMampvw7KRRbe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B48D5F80212;
	Thu,  4 Aug 2022 15:17:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B07DCF8016A; Thu,  4 Aug 2022 15:17:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2BACF8012F;
 Thu,  4 Aug 2022 15:17:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2BACF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m6stWst9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E470B82492;
 Thu,  4 Aug 2022 13:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214E2C433C1;
 Thu,  4 Aug 2022 13:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659619048;
 bh=pGAubC3p5cu8E3aqPdqw/fxyUjG67zf8Tpf1JKEF55w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m6stWst9e41BreGAtGPuz0nAu0TXJwPKwlYdFFr82zphG4M14QXdbrLumphztxMuJ
 YDRDikw+/QifdRAghI887qlMaly1LeHw8FJsuERxDrwM3ejq344jv/6P8SI4qYYdJ6
 5Of9c4WpCS92Rl1VVFiCsroAA0eleXumCjmYnyo8IFRFv4y/qUerR/K5kbtnJ5LAIg
 UDbeeAdrYpjf3kwUPHCL5Z0qhffTosxBEGEg81cPe0P6vOxWBysZgF7P1CoL7ba0tt
 Us8sPo+r1mwRof5YQzLUBmLtUbQcZ4hxS5HMbkd31WBWTjRPaXzWomF7kb8cwcDSmD
 P4nOg8r8+XqwQ==
Date: Thu, 4 Aug 2022 14:17:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Chunxu Li <chunxu.li@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: Introduce optional callback
 of_machine_select
Message-ID: <YuvG4drwG/rYoozp@sirena.org.uk>
References: <20220804091359.31449-1-chunxu.li@mediatek.com>
 <20220804091359.31449-2-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3rmzYVoKrLLLmuXO"
Content-Disposition: inline
In-Reply-To: <20220804091359.31449-2-chunxu.li@mediatek.com>
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


--3rmzYVoKrLLLmuXO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 04, 2022 at 05:13:58PM +0800, Chunxu Li wrote:

> @@ -284,6 +284,7 @@ struct snd_sof_dsp_ops {
>  	void (*machine_unregister)(struct snd_sof_dev *sdev,
>  				   void *pdata); /* optional */
>  	struct snd_soc_acpi_mach * (*machine_select)(struct snd_sof_dev *sdev); /*
>  optional */
> +	struct snd_sof_of_mach * (*of_machine_select)(struct snd_sof_dev *sdev);

I don't understand why we pass this in as a function when as far as I
can see it should always be the standard operation provided by the core
- why not just always call the function?  We can tell at runtime if the
system is using DT so there's no issue there and there shouldn't be any
concerns with ACPI or other firmware interfaces.

--3rmzYVoKrLLLmuXO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLrxuEACgkQJNaLcl1U
h9C1FQf/QjsEtLV9fR8Iz6XmIP9rAebV+D6AS3pDxlY44Q3n5kTg2SprGpkW0N3X
PZVh1GJ4B4MWkO2ODQKF2X322Hr78Np7AzYSQQv0QrcRbRj7/IJHnn4zCs26DlaB
IOk/MGuxUw0kHzBERUoreV9XF2MjBJXTBURBc198Uw1xcb/WarVtk6OPRfmn8blp
5DQZ640pif50r6aQaRaOq9/c7RnUy+hAjsT78GNnIsbEinE1w5JOb2Xf9BTQAXZ5
slxV69bTH2+yDkqU/G92cqXI8RhuD6Sz6KP6gKnAF8n1DNUVTk+pAZeHrRIJ2cQT
pw8nMfmjoexKvLFc+FTsGrdNuJ2zTA==
=PLcm
-----END PGP SIGNATURE-----

--3rmzYVoKrLLLmuXO--
