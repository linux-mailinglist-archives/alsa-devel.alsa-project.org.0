Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA04B520553
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 21:31:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67F4E16CB;
	Mon,  9 May 2022 21:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67F4E16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652124693;
	bh=iKkvMkx3TWErRse2gRWZPu0JgulYvhKzrWv+sdCjmE8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B/ZnVaTjeQF0VI6KRi3F8DCsvRK5IuPTx28kV2Vq52IIj4YAP8/BXUKrNEd9mUmhk
	 Ruj668kqHMULHb3jmUkkUjoga4OGKi+toY5s+BhACs1pgQjj3Wlv1IJob62kjjWnA6
	 tUlhfeuVXVmQ3QCeoUqB4w31GNNFZrZij8Skujlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFA0CF80269;
	Mon,  9 May 2022 21:30:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84851F8025D; Mon,  9 May 2022 21:30:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7E81F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 21:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7E81F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IK/sF6Kk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 18DE7B8190E;
 Mon,  9 May 2022 19:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1DDC385B6;
 Mon,  9 May 2022 19:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652124625;
 bh=iKkvMkx3TWErRse2gRWZPu0JgulYvhKzrWv+sdCjmE8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IK/sF6Kk+Mmg3QyNwrtOTr+pjEeOgaRRiBxd5mGbEgdl6TIZAf74uXf69zcZdpjPR
 GrOTjJNZbrIWWywvp9xtiipmVmf8owX4J9QeNgeJIl/yLzhhtM6Zyf0zWluQBomnrI
 quF8JWTpkjY++RxkqYtWb05duVOCRWsaFYhM4NwGmpCfKR4+k7Zc8l/UH7bCUVana5
 5hVLJeLEvwZt0MIdhVF5ymNCnDF2hO+zm6AVb33UZRzH4GrE5kOpQeYpjdOxUZjrkU
 0ZazWkkwAakuyprfGxn1YaocXBqzTUMI+FIbo4ksqLuCPd4quQeR1k5mufnJA5oWNg
 9505VHnOXvXUA==
Date: Mon, 9 May 2022 20:30:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Kirill Marinushkin <kmarinushkin@birdec.com>
Subject: Re: [PATCH 01/38] ASoC: soc-component: Add comment for the
 endianness flag
Message-ID: <Ynlryv8fgKiHYXUt@sirena.org.uk>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
 <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
 <ec86bdc6-b3c4-e595-02c8-e0687c442fd3@birdec.com>
 <20220509083729.GX38351@ediswmail.ad.cirrus.com>
 <901cb995-4a82-741e-00ea-a1c0b22ae749@birdec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sFYP38gXZ2zPTepc"
Content-Disposition: inline
In-Reply-To: <901cb995-4a82-741e-00ea-a1c0b22ae749@birdec.com>
X-Cookie: Boycott meat -- suck your thumb.
Cc: oder_chiou@realtek.com, steven.eckhoff.opensource@gmail.com,
 alexandre.belloni@bootlin.com, lars@metafoo.de,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 kuninori.morimoto.gx@renesas.com, chrome-platform@lists.linux.dev,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, srinivas.kandagatla@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, codrin.ciubotariu@microchip.com,
 alsa-devel@alsa-project.org, bleung@chromium.org, cychiang@chromium.org
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


--sFYP38gXZ2zPTepc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 09, 2022 at 09:22:42PM +0200, Kirill Marinushkin wrote:
> On 5/9/22 10:37 AM, Charles Keepax wrote:

> > This sounds like an error on the CPU side of the DAI link rather
> > than the CODEC side of the DAI link. The formats that will be
> > supported on the link are the union of the CPU and CODEC supported
> > formats, ie. a format must be supported on both for the DAI to
> > support it.

> Yes, agree, both sides of the DAI link should provide only endianness they
> support.

> This works currently, but, from my understending, it will break, after we
> set `endianness = 1`.

> As soon as we start setting `endianness = 1`, the function
> `convert_endianness_formats()` will extend LE to (LE | BE), right?

> If so, setting `endianness = 1` is the source of an error, right?

If doing this for the CODEC side of the link causes an issue it's just
exposing an existing bug on the CPU side of the link which may already
be affecting other systems - like Charles says the CODEC is expecting a
fixed bit order regardless of the memory layout of the data.

> > The CPU I2S hardware should be sending out the bits in the same
> > order regardless of if the data you feed it is BE or LE, as I2S
> > specifies an ordering for the bits.

> What does the endianness in the driver configure, then?

On the CODEC driver side it is meaningless.  On the CPU side it controls
the in memory layout of the data.

> > If this is not the case then
> > the host I2S controller is claiming to support an endian it does
> > not, and the problem should be fixed on that side by removing the
> > supported endian.

> I think we have a misundersanding of my example.

> In my example, i don't mean, that my CPU part of the DAI link is broken.

> What i tried to demonstrate - is that if i set the unsupported endianness, i
> wouldn't expect that "the CODEC probably can care about the endian", as the
> message in [PATCH 00/38] suggests. I would expect, that i will have no
> sound.

If the CPU side of the link is fine then there should be no problem, we
simply start supporting both endian settings all the way through the
chain, if userspace chooses something that wasn't supported before then
the CPU side driver will look at what's being configured and set up the
hardware appropriately.

--sFYP38gXZ2zPTepc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ5a8kACgkQJNaLcl1U
h9D6Pgf9H2WDFXnhOVxdcfuLzbr5M39VEldhVxs3V67Fh3LEY2eoRJS3zHp1Gu8C
T6Cw+l4akBqpSfcKuvq6qQpuyC3XeNHQvjLAKeNvAdB2uqx6YgsxZS2RkXA6a8/e
eU9u8oxZk2PKCaE2egLuOT+JqSfn9qASLhhC0hesETMlYyoAIVFNlW4vGbOlWMDh
/ex/ytCjP2A1sHScIuCKNJlDItoSJfztx03QHuoVK5iBzrAtc86hrsvr8nVOz8tj
jvNOR8n0N3xc8+KvLGXUD9hfKkXGGPTMz8ijZFo2tYyy12ITuoxQKtRJrxcC6CcS
C7NCPO8SrHd1mWVHeMjz5jQYTmnGhQ==
=3nBv
-----END PGP SIGNATURE-----

--sFYP38gXZ2zPTepc--
