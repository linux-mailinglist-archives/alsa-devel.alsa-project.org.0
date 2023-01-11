Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A29A665C1E
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 14:05:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D33EAE6BB;
	Wed, 11 Jan 2023 14:05:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D33EAE6BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673442357;
	bh=2nPmER6dDDP3Hd+5xChKX8yrvFkX1YePh8FS7yjYDLA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ocoHWXnbf8GAJ/v8mGBakKQ79zt/JugC6U0oFUinTrgotuusJ90chw/m/1ikB1OTf
	 TMbg4mXTtPQpJB2fIk2z7c7/EyCNE7Yyf71eTgLAsaLe8ZXvHUEmBz1MG6o1XCSQqo
	 R+jnHy34jK04Za1/mv27f/lZCuwA1fWsAh9PVkrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 309A5F8016E;
	Wed, 11 Jan 2023 14:04:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4BCCF803DC; Wed, 11 Jan 2023 14:04:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 223E4F8016E
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 14:04:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 223E4F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dKFxMjop
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 294CEB81BFB;
 Wed, 11 Jan 2023 13:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23445C433EF;
 Wed, 11 Jan 2023 13:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673442292;
 bh=2nPmER6dDDP3Hd+5xChKX8yrvFkX1YePh8FS7yjYDLA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dKFxMjoptpafvuFWZQ2oDf050RWxoHah5j0+EZpjgf2u96fn2u8S2EUo0UrIQHA/R
 U+rb/Z97ZG48APof4QCjVsHmJkQemShjQK6b5+eDMdX32gx5KtK0DUFg2j1mTpvOz8
 3luuSSHhceVzg3pNX3rI+jA7RRobBDTjDF+l13iUtSYrF8SEUHtydTK++b5mE3wCpr
 d7vvUUMjhyhEcQtQnlclOjs4ZJxKi1ezg7fk4kPg/aZ9+Y7zSESv2VCYa3vCi7nUA1
 OgZQLEcp5bCRHknvWpkegEMScGotvx677bvbZbeQ/8fOOgYbkdkiomBqB/5jobpWFc
 bvLr7ywB9sy3A==
Date: Wed, 11 Jan 2023 13:04:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 08/19] ASoC: amd: ps: add soundwire dma driver dma ops
Message-ID: <Y76z7uYb2/2BUSfl@sirena.org.uk>
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-9-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ag3m81g3IJWqkKTr"
Content-Disposition: inline
In-Reply-To: <20230111090222.2016499-9-Vijendar.Mukunda@amd.com>
X-Cookie: Life is not for everyone.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, vkoul@kernel.org,
 Mario.Limonciello@amd.com, arungopal.kondaveeti@amd.com,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--ag3m81g3IJWqkKTr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 11, 2023 at 02:32:11PM +0530, Vijendar Mukunda wrote:

> +static int acp63_sdw_dma_start(struct snd_pcm_substream *stream)
> +{
> +	struct sdw_stream_instance *sdw_ins;
> +	struct snd_soc_pcm_runtime *prtd;
> +	u32 stream_id;
> +	u32 sdw_dma_reg;
> +	u32 sdw_dma_en_stat_reg;
> +	u32 sdw_dma_stat;
> +	u32 val;
> +	int timeout = 0;
> +
> +	sdw_ins = stream->runtime->private_data;
> +	prtd = stream->private_data;
> +	stream_id = sdw_ins->stream_id;
> +	switch (stream_id) {
> +	case ACP_SDW_AUDIO_TX:
> +		sdw_dma_reg = ACP_SW_AUDIO_TX_EN;
> +		sdw_dma_en_stat_reg = ACP_SW_AUDIO_TX_EN_STATUS;
> +		break;

Not super urgent but if you're respinning then it looks like the
register selection here is the same in _dma_stop() so they could be
shared.  Indeed it generally feels like it might be nicer to have a
table of structs listing the registers needed per stream so all these
switch statements can be more like

	sdw_dma_reg = stream_registers[sdw_ins->stream_id];

That'd make each function smaller and I'd expect it'd be a bit easier to
add new streams for new hardware that way.

--ag3m81g3IJWqkKTr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO+s+4ACgkQJNaLcl1U
h9DLbAf/Y4NTcfbaVytJnLOHnw0v/nbCxi1SzVDhzKx3adrIi2mK0rjmw1rH8Ic/
OX1xBbmsovdG69oGTI3m7stFElnvH8/xOhKPjyzN1KcDIe9fxCUTmvblRGdBfkE3
jWUSbT6JI+d7b8LxYy7aEclwebLOmbhvDZiGYTasbF9POtj1msqx9J1w++XVpRj0
PS8pKMs/VIGrO+dsyYxmQwR/jkadmkecR1vpcnhy7cYGDJC0UBlh//LEwiM4E6Ta
sIRPq6ExQl3Vt21Xq7be5DFHueF3hgnqochCD5Kx/UmudA1b5iPzvIApPoTmNPUm
j4jObBg8qnHUvv03RkbfqEBsuGGAjg==
=PM/9
-----END PGP SIGNATURE-----

--ag3m81g3IJWqkKTr--
