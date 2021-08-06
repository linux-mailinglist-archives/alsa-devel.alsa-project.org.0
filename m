Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9203E2991
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 13:29:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56F0416E1;
	Fri,  6 Aug 2021 13:29:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56F0416E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628249395;
	bh=49mJJpkP7jJeQdk4rRiPSuGcgUo2/mtXGQECWbZUU3w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tPO19Rzf+aQ7Xl6dAb+VzlAnbUXk3gG4cEU7U14vhK5WKWdKxDrNagMVxZkpLFPXc
	 y7J2KCgwJGoHintkO4bm8vcBPrsL3nIZg4XmEnl24Tc/bIWT6LiMUJnhl2Y+DaCmJV
	 b8FUvm+XAVpnovnYBBlPMTklmvrMjw0cVHB48gyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA898F80169;
	Fri,  6 Aug 2021 13:28:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18775F8025F; Fri,  6 Aug 2021 13:28:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A686F80169
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 13:28:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A686F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XK4nulXt"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CE0760F70;
 Fri,  6 Aug 2021 11:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628249295;
 bh=49mJJpkP7jJeQdk4rRiPSuGcgUo2/mtXGQECWbZUU3w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XK4nulXtxvL5HkMZ3FpmZ0r6LMzqzDkQEPHtfgCggTUj6OdKfoGi1HR2KILAy+dSr
 iEBysDKYeaa1bNtJ2yAqpLze4PzHDgikegXsS65OQqFyY7wKVNwaZCZoICDVAQjR5Q
 GRxyznQsFECV7bFc1yDSK+BJpTtkTAZgnscDaJxs7rfmfTieV3MHxc28s0VjwGhM8v
 xlJmrqP2jLeaFme3yine4d8yweRNDzzbXazGTvqYuecgMa86TuPA8ZKjXIx39ghsIF
 EjAuavSFJ+20AuMNGi4Nc2IBy2pWLQRCWJT0S7dxGLKGoWzoY1aqEQWUz6Gh15xkea
 uokxe7XBJDz7A==
Date: Fri, 6 Aug 2021 12:27:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 1/3] ASoC: sh: Add RZ/G2L SSIF-2 driver
Message-ID: <20210806112759.GX26252@sirena.org.uk>
References: <20210806102930.3024-1-biju.das.jz@bp.renesas.com>
 <20210806102930.3024-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+mSjbC2tVdWE/Wop"
Content-Disposition: inline
In-Reply-To: <20210806102930.3024-2-biju.das.jz@bp.renesas.com>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chris Brandt <chris.brandt@renesas.com>, Biju Das <biju.das@bp.renesas.com>
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


--+mSjbC2tVdWE/Wop
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 06, 2021 at 11:29:28AM +0100, Biju Das wrote:

> +static int rz_ssi_stream_init(struct rz_ssi_priv *ssi,
> +			      struct rz_ssi_stream *strm,
> +			      struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +
> +	if (runtime->sample_bits != 16) {
> +		dev_err(ssi->dev, "Unsupported sample width: %d\n",
> +			runtime->sample_bits);
> +		return -EINVAL;
> +	}
> +
> +	if (runtime->frame_bits != 32) {
> +		dev_err(ssi->dev, "Unsupported frame width: %d\n",
> +			runtime->sample_bits);
> +		return -EINVAL;
> +	}

You should be doing *all* this validation at the time things are
configured, not during trigger.

> +static int rz_ssi_start_stop(struct rz_ssi_priv *ssi,
> +			     struct rz_ssi_stream *strm,
> +			     int start)
> +{
> +	struct snd_pcm_substream *substream = strm->substream;
> +	u32 ssicr, ssifcr;
> +	int timeout;
> +
> +	if (start) {
> +		bool is_play = rz_ssi_stream_is_play(ssi, substream);

...

> +	} else {
> +		strm->running = 0;

...

> +	}
> +
> +	return 0;
> +}

This is two functions merged into one with zero shared code, just make
them two separate functions and then people don't need to guess if true
is start or stop.

> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +		/* Soft Reset */
> +		rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);
> +		rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
> +		udelay(5);
> +
> +		spin_lock_irqsave(&ssi->lock, flags);
> +		ret = rz_ssi_stream_init(ssi, strm, substream);
> +		spin_unlock_irqrestore(&ssi->lock, flags);

It's not clear what this lock is intended to accomplish.  It's only used
in trigger like this and in _stream_is_valid().  In trigger() we're
already in atomic context so don't have to worry about simultaneous
calls to trigger() while in _stream_is_valid() we're just checking if
there's a runtime present but since the lock is taken and held within
the function the status could change before we've even returned to the
caller.  The two uses don't seem joined up with each other and neither
seems to do much.

--+mSjbC2tVdWE/Wop
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmENHL4ACgkQJNaLcl1U
h9CFUAf/ZuHOAM0zjQxIdmxcvmfIalUNx2feYVhobCztja3Mvufl6Rg+OHwRQ7aJ
ZXCjY+qeltf7EAmdNEiftnW13g8YLawZWDzZhnk172lwqKOxYAvsQfnLdZHLOljp
U39Xg77d+swsHhhgS2cjUTLRGhbv/QdQr4cc77xYWwZY4me4xrhFR+HQaSv+JVax
ye9+bDqQGuUPmBrZ4x1sgoOI920Gry3bl4uwMqV0c2i9q8ziFhYqU7SI8MJbhuwc
zCOhBAridzGSSpS1zYGpQS5PpYZcUsJenas4vjZFvSR5Qw6jbWEWEBV4x5N8bWV3
rMEmou6riADGPoQo6NNiRpdrbT23hQ==
=k+yj
-----END PGP SIGNATURE-----

--+mSjbC2tVdWE/Wop--
