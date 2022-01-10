Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48405489BE9
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 16:11:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4C7B1860;
	Mon, 10 Jan 2022 16:10:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4C7B1860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641827492;
	bh=MGzC556nKR0dVQ6gSVYjbaWQh+60dstnaOHoo1NOZjk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jx8fhC/2p299mR6b8NpjkRtwMm54XdHk67AFWZ6EW0X/IjKVmIuGYzopPY7bw4i/t
	 QFKQGPOSwtkWIDX/8GAdPuQrtLoVs6Xk+FoaG+IPERd1cZHS7f6hzoGhvRdNUQ354x
	 TagcR9xdC4JxymWXpV4zHHuFQT9rLNRSmtj+B0FI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2FE7F80118;
	Mon, 10 Jan 2022 16:10:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FE8CF80118; Mon, 10 Jan 2022 16:10:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9224F80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 16:10:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9224F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ARKO1tgo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 434AA60AC5;
 Mon, 10 Jan 2022 15:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44546C36AE5;
 Mon, 10 Jan 2022 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641827413;
 bh=MGzC556nKR0dVQ6gSVYjbaWQh+60dstnaOHoo1NOZjk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ARKO1tgoRALqL8E1t3ipqW7VNh5E4qbeBt2kv5w7xgrpce0bq5ZC81GitpTuxN8f0
 qPKW03UQ6pRzvOiZ63FTqjtIaw8r3IVqBz+xS0HRxysB8iogY6mMIvN0W7AC6z7PtD
 thQbcgtHf8ypL+N9nHHfo9RyHtH9onnw+c+xDlP+N0dxRA8YS3w2zt2ZIL5wNytCyo
 gzLOkgPu1BGzQmgEm1ReBS+20es/e2Pi9a7aeI6Q9iRdsbgSfdB0MJ3smmvZroKtLX
 yETANUY+ZcXNM8s6owxAxe5W4vw2lXQuzCp1SJVU2Izrd78FjxekwvMC54FJRZM11U
 mWZa5SeMFhcpQ==
Date: Mon, 10 Jan 2022 15:10:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 5/5] ASoC: sh: rz-ssi: Add functions to get/set substream
 pointer
Message-ID: <YdxMT02wvvWw85Bn@sirena.org.uk>
References: <20220110094711.8574-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220110094711.8574-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Y4b7ElNLAh3ZTjz4"
Content-Disposition: inline
In-Reply-To: <20220110094711.8574-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Cookie: Do you have lysdexia?
Cc: alsa-devel@alsa-project.org, Pavel Machek <pavel@denx.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org
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


--Y4b7ElNLAh3ZTjz4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 10, 2022 at 09:47:11AM +0000, Lad Prabhakar wrote:

> +static struct snd_pcm_substream *rz_ssi_get_substream(struct rz_ssi_stream *strm)
> +{
> +	struct rz_ssi_priv *ssi = strm->priv;
> +	struct snd_pcm_substream *substream;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ssi->lock, flags);
> +	substream = strm->substream;
> +	spin_unlock_irqrestore(&ssi->lock, flags);

This locking doesn't seem useful, we just take a copy of the lock and
then immediately return so the lock isn't protecting anything in
particular - the caller can happily continue using the substream after
the variable has been updated.

--Y4b7ElNLAh3ZTjz4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHcTE4ACgkQJNaLcl1U
h9DPAAf+IAkg3KteUe/ieJ1Mvb5V/kn7FqPeS1zDEmVPRr1WAZks5Nw5wudB7zLY
3uXD6RwCJxdiQghBfPTxt8bRSFY2NYKa75uNjnSda+npj7R2lxFiztz9lnVuAV/+
qFbrDSNncJViJiW4eKECDiqauxti2L4uh7BRpJQvoFqj3HZI7e8aBXlrq5NE7FWj
dLCfj0j1LewVsyssuYTaUhon9Z6brx1ruUF1Ywm+WpAW452UO9YWEzmzew1x6CBF
DTMjtJxRB+gL5NWTZwEUDL1j+g+IVdY8qF3u4NpMIhxAXru5QGqn8Rz0KnbmWv+x
a/sWc17NS+a12yyyoTpR47X7pUPmPA==
=HvrJ
-----END PGP SIGNATURE-----

--Y4b7ElNLAh3ZTjz4--
