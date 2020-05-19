Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 760161D9543
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 13:27:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 292EE173C;
	Tue, 19 May 2020 13:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 292EE173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589887658;
	bh=/81E5Snrji/f51Qdmg/KESc7VcU0vfxfytSswtZJ5ng=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HvBE3KJIsu/9UZ3Mn0/9HNUpAE3UUiB3owU4OsKf1bOXRvQSakT5rpmTDR/2fgqve
	 98F3jF2qwp9rqLQhH2Rfbg6kk/RR5c5l3OT4Dg8kXdwlCUIbmNA7MSy/VIlgrTKZwv
	 kWsTzB58Lp0+CmRmBBRvdcCKYhLENM6ylqbDU/SQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4827F80291;
	Tue, 19 May 2020 13:19:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0891F8028E; Tue, 19 May 2020 13:19:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88F08F80161
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 13:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88F08F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z3Jx7Vx+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 59D8320708;
 Tue, 19 May 2020 11:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589887149;
 bh=/81E5Snrji/f51Qdmg/KESc7VcU0vfxfytSswtZJ5ng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z3Jx7Vx+f3zDTZQQdjj/CB0eEfsrJn4NxkC2LRTiiQhB+wD65bRzKDlg1WhMZHVp6
 5A1raoqGOuckKumUP0/49h6CEdGOGEwRAoX4eHUvz0xpzb4+E3r4vCqS4AejrMz2L3
 XFajur+vs1jaLtAOovRMKfhE+hsf15api8u6zXT4=
Date: Tue, 19 May 2020 12:19:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH v3 08/14] ASoC: amd: add ACP PDM DMA driver dai ops
Message-ID: <20200519111907.GD4611@sirena.org.uk>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
 <20200518171704.24999-9-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3Pql8miugIZX0722"
Content-Disposition: inline
In-Reply-To: <20200518171704.24999-9-Vijendar.Mukunda@amd.com>
X-Cookie: Do not write below this line.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, Alexander.Deucher@amd.com, alsa-devel@alsa-project.org
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


--3Pql8miugIZX0722
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2020 at 01:16:58AM +0800, Vijendar Mukunda wrote:

> +static int acp_pdm_dai_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *dai)
> +{
> +	struct pdm_stream_instance *rtd;
> +	unsigned int ch_mask;
> +
> +	rtd = substream->runtime->private_data;
> +	switch (params_channels(params)) {
> +	case TWO_CH:
> +	default:
> +		ch_mask = 0x00;
> +		break;
> +	}

The TWO_CH define isn't adding anything, and I'd expect there to be
invalid channel configurations this is rejecting - at the minute this
just boils down to an assignment.

> +	config_pdm_stream_params(ch_mask, rtd->acp_base);

Does this function have any other callers - is there a need for it to be
a separate function?

--3Pql8miugIZX0722
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7DwKoACgkQJNaLcl1U
h9CEWgf+Kgd2XrgM3Nqtu8xm2RdwZJTfi84AmxAKGR708At+7UeUbEq6AgDGD4Yy
DIRSFLzSAmR6a4rW68/9jEOdQi8ktygSXQXp+e+jNE6Q8HhpG7t+hbND1+q5eGzk
5ZveuSvJKxICd2iH5n983W1pK4HowUsF6er7Zcr0SYw82H9OfUsYIbif52EJTD5H
4werXD6ZmFRbkd/fe6j71n/vzV0MKRMaDc3yGT0glg1IfwjRsLUsqOFCOJ1Ie0KZ
s63stiaQz6qTOe4KFSB2CnMS+kwtmeKXTRrbgkHgugevOVmaoubNK7QvQxYr54JW
HAUi0AcGrv1vIQ86S9HvjCILznWjgw==
=Wjd3
-----END PGP SIGNATURE-----

--3Pql8miugIZX0722--
