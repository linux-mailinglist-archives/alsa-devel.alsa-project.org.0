Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C2C3C28D4
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jul 2021 20:04:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A83115DC;
	Fri,  9 Jul 2021 20:04:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A83115DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625853890;
	bh=0rpHZ/44tEo7q2Fr1lzi+8S8T2KxhDfsy7EJpKqy4IY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R9TsrjaIlPCtW1pAUZJoyboCHd5yr6oKeCDjzgTsQqVzIGpcIAd5eKYDfY2bB4/vA
	 Kt5q76FczpmMq897X+om2xdRj5wSRFwyTg4T64bCndc7q0U0BKi8kFbMQTeJqUHQbD
	 ttdme7RPH+mBUI5tCnDpRrVYdN3vrPC7kPli5v6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 940D7F80171;
	Fri,  9 Jul 2021 20:03:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AE1DF80224; Fri,  9 Jul 2021 20:03:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 990FCF8012A
 for <alsa-devel@alsa-project.org>; Fri,  9 Jul 2021 20:03:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 990FCF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OCIi+UMh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4612B61283;
 Fri,  9 Jul 2021 18:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625853794;
 bh=0rpHZ/44tEo7q2Fr1lzi+8S8T2KxhDfsy7EJpKqy4IY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OCIi+UMhPWLRqJXHZGpWx68GrmjcApcOg+YlrbNN3ICs8MTtj3cbbgbf8y/G5NsKX
 k6TTesNCMpqfIelRnnyWHAOcGx2bLExk++SMXDbwMWkyPRIIir61DKiBRPKAB71CTn
 oF2lUPSdoS8CCIYjvlbVpycAu0sNoQBjhtrNjB2d8+bn3rFOfcBFYJgXdKJkBV6+We
 W2StNC+M96KqutlKlT4Tqy0Rc+qB33eRGMq2mEvqj+EDV1ANVkknTuPrqM8OjwkeCC
 nAO+OqI8OxXcAyHhWXYFjzlJV6LJvFFTskre+XiViZ4+Qna3vYMhk+v0X4atVhJj+t
 8tSuLxqAqoZjg==
Date: Fri, 9 Jul 2021 19:02:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Subject: Re: Issues using simple-audio-card driver with Xilinx Audio Formatter
Message-ID: <20210709180240.GG4112@sirena.org.uk>
References: <6c7635f59ea9b162999f060334eef48e0812534b.camel@calian.com>
 <874kd63oqa.wl-kuninori.morimoto.gx@renesas.com>
 <52eda9910822e7e854b049127e462bf468f912ed.camel@calian.com>
 <87r1g91ygm.wl-kuninori.morimoto.gx@renesas.com>
 <2cccca32d53e1d832df67d070bac9ca998a931c6.camel@calian.com>
 <87bl7cl20y.wl-kuninori.morimoto.gx@renesas.com>
 <20210709123854.GA4112@sirena.org.uk>
 <129f46987f79328edba109a800b522c6ddfec99e.camel@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Wtrm9ATX0sn6fFKv"
Content-Disposition: inline
In-Reply-To: <129f46987f79328edba109a800b522c6ddfec99e.camel@calian.com>
X-Cookie: This fortune intentionally left blank.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>
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


--Wtrm9ATX0sn6fFKv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 09, 2021 at 05:05:47PM +0000, Robert Hancock wrote:
> On Fri, 2021-07-09 at 13:38 +0100, Mark Brown wrote:

> > For something like this I think the driver should be able to figure out
> > the ratio based on the configured MCLK and sample rate.  For the most
> > part set_clkdiv() should be a legacy thing, it's very manual and hard to
> > see why a system would do something different to the obvious ratio
> > usually.

> Possibly the I2S transmitter should be implementing set_sysclk rather than
> set_clkdiv then? simple-audio-card seems like it would already propagate that
> through into the CPU DAI in asoc_simple_hw_params and then it could figure out
> the right divider value to use.

I think so.

> The tricky part is that the Audio Formatter (used as the "plat" component here)
> also needs to know what the mclk-fs value is. (I really don't know why it
> cares, I would think it would just push data to the output stream as fast as it
> was accepted, but indeed it does have a register to set the sample rate to MCLK
> divider, and if it's not set properly the I2S transmitter downstream seems to
> constantly get underruns.) I'm not sure if there's any mechanism for it to
> determine the value right now, or if something new would need to be added?

Given that it knows the MCLK if set_sysclk() is used and it knows the
sample rate it should just be able to calculate the ratio?

--Wtrm9ATX0sn6fFKv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDojz8ACgkQJNaLcl1U
h9A0fQf/RPh1xv38n2kjDtd954WQhsl/6QsVLW10/GCu/3BZCYmL19hfk7sC0NNB
NfyL/jvG8VLRjxrbJgUitQ6TBUZgCTnw1Pj0gWdIcuzDkWuv4xFR4uk3081Ui/wE
szpQjKhOBtSVYNZ7SwrJgHdFFmOVOcMAvpYJg5IbT9x0EMUeztkKaRnmbgEhPf3G
tilElGfEvOu3EUeUXOAn9GZerR9qU9DOm9/Jm7clTq062LtAuK25gQzsXrHzXosn
pygYrG8WVoes0KkzuuVc2Nvph61+B1Rw8QholjSR0wFv8Bnu96K7AcldBh5WQwzV
oFgu//YTgc+wyzZXjH4oU3AnaNKEqA==
=UTg5
-----END PGP SIGNATURE-----

--Wtrm9ATX0sn6fFKv--
