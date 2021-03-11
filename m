Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC1E3379C4
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 17:44:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 261BE1765;
	Thu, 11 Mar 2021 17:43:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 261BE1765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615481056;
	bh=/6vQFL+YC53+oP6/fdeoiyO4ZhYeLe3QT/YKKRdQyYY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fJZfEJRUK7LQwOq7TFRVZlg5WQT+tH05iYob5tuATNAMlVa0iwKQByDMq9Y2uByBg
	 jxamLKtakRjQr9+G9yWaffN+RkxTwsys+rW9Pzy6KxXlrh4eg43JWohgBggmoNlxmt
	 WhykTf7QG1mtEZb1GAvLTPdkkfrgBcFePWYuB35Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90487F8019B;
	Thu, 11 Mar 2021 17:42:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4132CF80227; Thu, 11 Mar 2021 17:42:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E296F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 17:42:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E296F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eR71nWvd"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4193864F9C;
 Thu, 11 Mar 2021 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615480953;
 bh=/6vQFL+YC53+oP6/fdeoiyO4ZhYeLe3QT/YKKRdQyYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eR71nWvdnbgmZqCoFZFfpumRGVzmdJTDmB64hingCLqVQQRXFhTLfcutl2Bfsxy01
 28MHy50cfVkV4BQeNI1j4muoeiVmyUbFZmmFI5HyicrY7tSRG15MqLD1xwvt704x9O
 8Zm5HWkhWFUI07wObuNbzQHeYgxuARESL4yTNGHOjX5bOumTWAesVqQnk7K09G9O16
 GZA3troXIT6iGqun/ydwipRCYdN1Y3PuuVmAWzdjsfC1snmJYfcw9rZdO5PD+GK70h
 mRbXGC4DNt0VNFS5UWyRYTklKGLqSLWDYNwJhURI2IwTRw0+0nkuIbmhw54rVRWNGm
 pjOXWwstfsySg==
Date: Thu, 11 Mar 2021 16:41:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
Message-ID: <20210311164121.GH4962@sirena.org.uk>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <eb26f8e0a4c99d0c9de9d92612102718@walle.cc>
 <fa654e7a-80cc-7ae8-15c6-780e7fa29bb1@nvidia.com>
 <cadc59f29bbb2e0d02235d4c10cb7f4d@walle.cc>
 <36c37df5-dffb-9168-d92f-4b3e482602fa@nvidia.com>
 <d4947632a8b3ebefff7fb6751d05a9bd@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gKijDXBCEH69PxaN"
Content-Disposition: inline
In-Reply-To: <d4947632a8b3ebefff7fb6751d05a9bd@walle.cc>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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


--gKijDXBCEH69PxaN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 11, 2021 at 04:43:20PM +0100, Michael Walle wrote:

> This could be a last resort, yes. But I'd rather see a flag which
> indicates whether the simple-audio-card should control the (first)
> clock of the codec or not. Because until now, this wasn't the case.
> And I don't know if this was an oversight or on purpose. Kuninori would
> need to comment on that. And with the "we change mclk by default", we
> break codecs with automatic sysclk generation.

It shouldn't break anything so long as the clock ends up correct via
some path.  Where there's multiple options we can also try going through
them in some order, preferring the clock in the CODEC would probably
make sense from both a compatibility and quality point of view.

> > > And its fetching just the first clock, doesn't it? What happens if a
> > > codec has two clock inputs?

> > Yes, it would have been more descriptive if it were specifically
> > looking for clock "mclk". I think the original assumption was codec
> > takes one input clock (MCLK) and uses it for sysclk.

> Yeah, I've just noticed that the clk_get_rate() also only works
> for the first clock of the codec.

simple-audio-card isn't really intended to work with complex devices,
it's very much only for the simplest of use cases.

--gKijDXBCEH69PxaN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBKSDAACgkQJNaLcl1U
h9BNawf9GPsQcYK9qmE3//5SNFERoM69/yBv84rbvNTtsS0rkB4/XlhUxFM/yrhI
6PbCDI9RiR1smLwcBsrRv9z3/NPQ2sVeW8uOWvWQvXjPMWxSqNSU6XRVUBFBwuZv
m4UZqd9ldjRxLGajUkhVCWKCAJ4cx0hx3TvwBjAbKYCfsfFpC6Xx+UcNxsOnMeXt
FuzFO4NZ7zmnCBRpsa74nvjfoWdb+FCvh15SVz4anlEeD8fagk5Nf4QZT+KgE+nD
xyqchbWdLgFDs4lLfHlxAt/Pu62fPs8gcNPbfVFO8m4Ge638UVbFipmEhoMaubt0
TsIEC7GPWF9EMTk0JQs5kHnrAAAoQA==
=EORL
-----END PGP SIGNATURE-----

--gKijDXBCEH69PxaN--
