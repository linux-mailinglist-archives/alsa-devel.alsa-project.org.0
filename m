Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3960613F41
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 21:49:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D1001666;
	Mon, 31 Oct 2022 21:48:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D1001666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667249348;
	bh=O1v863hX945DEcIME2b4UEzO+vPVa0QHCHXH0He84SE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DVFvZUOc/XCi/94UNk2qkKqYRC4wgTyawnTJrVX6qp/rmKbDF35b5hMHYeEyz6f5k
	 8G0d7kl6DCQAys2tDn8+nJD3iCSY2Jg7zp/SulSrSwTu55hudP8Z2P9v3SWe+BWCMi
	 36oHVaTzJzZ0yKOY+sjmfmjwxUv4mA1BXChh5+sk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2DFEF80163;
	Mon, 31 Oct 2022 21:48:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46332F8015B; Mon, 31 Oct 2022 21:48:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CBE7F800CC
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 21:48:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CBE7F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lKpgE8UB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74D4061453;
 Mon, 31 Oct 2022 20:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DF4C433D6;
 Mon, 31 Oct 2022 20:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667249283;
 bh=O1v863hX945DEcIME2b4UEzO+vPVa0QHCHXH0He84SE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lKpgE8UBzPnYE8ZIlS9EGGNr9CAT9sceJxbPtgUhThoajOrAecoZ0vPcZ8ah1tWo1
 hwwfXUyEGcWhpin0jwG2LpHUKnLoWDkeEinaP8h1zHn1wjd108e3It0LMrjKFaKPuB
 kEH+FKBQl3Mpu6OG6PU0OI0bpDhsuv5dthQFr70iA5QuxE1hdHRHNHkU205EX/ZBCF
 Ir1vIX7jv80QzH/dGbThZzXqy0evDjw2D5OVZEUYL8y1yNAuybCgA016r4lax0U8fB
 XJcXsFZrCfM89PUTMI1reDy2MKSlWcp7+qbo4FiOEwPVWw4wgv2M3nWJBZ7g4Bw08w
 RVOvVfQdjVhEA==
Date: Mon, 31 Oct 2022 20:47:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: Document dmic_sel-gpios
 optional prop for two DMICs case
Message-ID: <Y2A0fdwnHTqw/NDw@sirena.org.uk>
References: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
 <20221028102450.1161382-2-ajye_huang@compal.corp-partner.google.com>
 <Y1vDYNOwZNOco1hq@sirena.org.uk>
 <20221031184343.GA3235956-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pRY+kIEVcpKIGhxD"
Content-Disposition: inline
In-Reply-To: <20221031184343.GA3235956-robh@kernel.org>
X-Cookie: Are you still an ALCOHOLIC?
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 angelogioacchino.delregno@collabora.corp-partner.google.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
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


--pRY+kIEVcpKIGhxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 01:43:43PM -0500, Rob Herring wrote:
> On Fri, Oct 28, 2022 at 12:56:16PM +0100, Mark Brown wrote:

> > If we're going to do this we should also allow the bindings to label the
> > mics appropriately so that the control presented can reflect the actual
> > hardware.  It does feel like it might fit better to do this separately
> > to the DMIC driver as a mux between the DMIC and the DAI it's connected
> > to but equally with the way things are at the minute that feels like
> > it's probably disproportionate effort.

> Are there other needs for DAI muxes? We already have a mux binding, so=20
> defining a DAI mux would work for any type of muxing control, not just=20
> GPIO.

I suspect that anything that is more complex than a GPIO should be a
full fledged CODEC with the muxing internal to the CODEC and just
described that way.

--pRY+kIEVcpKIGhxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNgNH0ACgkQJNaLcl1U
h9CPiQf+LUWw1ke44xSDRkole2tffbqEgGrQ0COXYU/ML5N5/q7uaKxeDi1B+9d6
d1ApwJ8uynaEU6uxxoBlgI1DECj4+1nKYVTujWBinU9jHlqNqbHld6urtcqC/CLC
eNUAl/BvuvlgbPDnZVuRL5452ra73bPqZShjx3ZHEgDRBvBQ0Rk5sAms8TGIdg51
yI4FY9XhHr3XCF/4GfZj2wKjip1mszPFOTvvwlmu6Dm1GQtTHffyMH5N2/u59MAy
7F0qRipL6HTKkJ0aiPPOULHJfWX72vCik1o5VvlDTRGswbw/+9UWR2rM9Mj00F2F
sv6gCaIhR0tvygxrEokN2LZkfFK9Lg==
=gzmB
-----END PGP SIGNATURE-----

--pRY+kIEVcpKIGhxD--
