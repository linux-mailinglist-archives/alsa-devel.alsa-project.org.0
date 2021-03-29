Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C3A34D41C
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 17:38:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78FFF1685;
	Mon, 29 Mar 2021 17:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78FFF1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617032330;
	bh=JoT17RUzmEzCGHKgkRSQKGmXYHKi/JxzqsnHs7rlp9c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SmLMemKyr4MdqbGpc8oF+sF0Tj3n9qPT2y0/wYYH1q0aJgWOJv63si9rqfb+U//4p
	 RGdRE2mArC3mmqDYOIl6VC0i6wNqDUCTRJ9gCmh/gXg4iHnHgvXtrudAlsM/6WDka+
	 mPRpG3zfQumFHGmNNLrRpKTY9YHN0a7WwQ0XVNRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA384F800B9;
	Mon, 29 Mar 2021 17:37:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59B6DF8015A; Mon, 29 Mar 2021 17:37:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A02F6F800B9
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 17:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A02F6F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QxffaRHp"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4C0C61932;
 Mon, 29 Mar 2021 15:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617032233;
 bh=JoT17RUzmEzCGHKgkRSQKGmXYHKi/JxzqsnHs7rlp9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QxffaRHpgTzGiHxwoJsjnGkbA2O9r49K1Saf4dtwP7iKLvwn1SfgA5YxB0zYSRDR+
 LUtWjrN/bF5oXEsOwJmXn4S3MV6y+q3dvhr/3cKDCoQ7VpeyrX1cIO3S7J4WtMyaje
 1Wqo/TlNLDibZ5aI7gV/FwJ7B/RX6LMPm7W6WyQXjCCdidFMkH2FhmFoMIXTHadH//
 0y/NY0Qoq5oao7+lSmcrTsrvw+VxnUbR2Ysr/zozTCKX9cMvXhJfRy/+FMPu/19Y58
 ZMgCtbOYbrQ0EcMuzLfWH9/AT6d4ZnaOUKqvHdYk1bkh8deDsF6K+8y4/4AWAdo8H5
 urZT3Q1KC7LpA==
Date: Mon, 29 Mar 2021 16:37:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt1019: add rt1019 amplifier driver
Message-ID: <20210329153702.GC5166@sirena.org.uk>
References: <20210311025809.31852-1-jack.yu@realtek.com>
 <20210326203407.GA3815424@robh.at.kernel.org>
 <1b6969cffa9e4a65be0d2df114d2ef21@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Content-Disposition: inline
In-Reply-To: <1b6969cffa9e4a65be0d2df114d2ef21@realtek.com>
X-Cookie: Never give an inch!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Rob Herring <robh@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?utf-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>, =?utf-8?B?6Zmz5pi25b+X?= <kenny_chen@realtek.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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


--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 29, 2021 at 08:09:26AM +0000, Jack Yu wrote:

> > Bindings should also be sent to the DT list. get_maintainer.pl will tell you this.

> 1. Does it mean I should add my name in MAINTAINERS?

It means you should have sent the patch with the binding changes to the
DT list and maintainers as well as everyone else.

> 2. Is below warning message caused by #1 question?

No, it's the content of the change that's introduced problems in the
binding.

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBh9B0ACgkQJNaLcl1U
h9BbTAf9Gg1YAtdn/PW+txjIl8HXOT1dS0nVmB1UZIgPwmjBJnrJUE/bYPYDS/D1
12ZnhTdJ2tu6t2PBUMv6Zzj0yWronG/svA9uv3mV2SXgDbhTjIgxNHOwaHMkw3ui
OfEP+hi5aHLgsnd3sH2MCccWoZbOv8wet3b4VcA7c7lHj4e8I2JaqTWi1ik1GJ9E
zc9obDRUNZO67VdQIg5/abVijFAX01e+VopBRXyXAQweABygXEnNuSgvX2jPl7RM
kQRcttczzmWquaQXp+tQHTbsspqUvOhY5jo5I1KKhYD66E3cwtcjPJmBATFb4VeU
2Z6jKCmguAMvCP79nqG0YOC6PtoOhw==
=/OHi
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
