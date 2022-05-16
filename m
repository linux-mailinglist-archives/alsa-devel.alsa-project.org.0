Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 987CF5287E2
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 17:03:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 095411E2;
	Mon, 16 May 2022 17:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 095411E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652713423;
	bh=BrYg+P0E76QFC+K+QlgC5bvnhhpGso5mTlZran5yFn0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q9G678ZDpciBBJle7qXmjpxFKy/bMD99lhoJDhJZ8cKkl0JajQ8KHbleWYGBZ1T58
	 8RD8kNOTPo/BDQyjrIHXkLemYAvbEk9XvQtL7fJPdc4nShAUvzRfFesK9/MbGqWRAv
	 lV4BrMXnWoLG7KFKKkAINBTXu1jREVPO57/g+Cr8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 719CFF80171;
	Mon, 16 May 2022 17:02:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD4B4F8014B; Mon, 16 May 2022 17:02:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03DF2F8012C
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 17:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03DF2F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GVy9NZlx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BA4C6CE1407;
 Mon, 16 May 2022 15:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06E2C385AA;
 Mon, 16 May 2022 15:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652713355;
 bh=BrYg+P0E76QFC+K+QlgC5bvnhhpGso5mTlZran5yFn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GVy9NZlxVi2S7kRNO3iFcEM/OKeHQmnKzyHXYl1CpDZh5ap4dSxopYPEQuxJRCL8p
 Lc74BM+vfewteyA1lUiFR3IR6+BwiyYjIXGtvzr2PDUY3QNWB95aWxAf3/eWS6eoVo
 +9+RnxHJ/logeTxspYuP8Py6CL2MxNLo+8NGQsHroOd2Hs6eDmcTvgQuHPYl4QrSpg
 UJX68Z8B73ov64eyl6wXZFIPjaMCoh2JZS3RWVfHZh3gy2oJjIRpT+kwG4aW91zveg
 x30jmjRu2uIdX4D9zhGOEdXjDKxdRcRLF1Om+4zT41XCvA83Jj4iwYPebx60ewnCSw
 qTSNrzanBQmjQ==
Date: Mon, 16 May 2022 16:02:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Siddh Raman Pant <siddhpant.gh@gmail.com>
Subject: Re: [PATCH] selftests: alsa: Better error messages
Message-ID: <YoJnhulbKk49rZsw@sirena.org.uk>
References: <8598037d-0e24-9bc1-3f2c-a2751ec8e871@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cH4kqHwkCNRl3JMX"
Content-Disposition: inline
In-Reply-To: <8598037d-0e24-9bc1-3f2c-a2751ec8e871@gmail.com>
X-Cookie: May be too intense for some viewers.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
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


--cH4kqHwkCNRl3JMX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2022 at 07:10:57PM +0530, Siddh Raman Pant wrote:

> This allows for potentially better machine-parsing due to an
> expected / fixed format. Also because of eyecandy reasons.

As I said in reply to Takashi's mail I'm not convinced about all the
changes in here, a lot of it's really bikesheddy at the best of times
and to be honest there's more here that I don't like than do.  The
changes aren't entirely consistent in the final style either so
presumably not great if there is any machine parsing going on.  It'd be
much better to split this up into separate commits for separate changes,
that'd be a lot easier to review if nothing else.

>  	if (err < 0) {
> -		ksft_print_msg("Unable to parse custom alsa-lib configuration: %s\n",
> +		ksft_print_msg("Unable to parse custom alsa-lib configuration (%s)\n",
>  			       snd_strerror(err));

I'm really unconvinced that replacing : with () is helping either people
or machines - the form we have at the minute is probably more common for
command line tools?

> -				ksft_print_msg("%s getting info for %d\n",
> -					       snd_strerror(err),
> -					       ctl_data->name);
> +				ksft_print_msg("%s : %s while getting info\n",
> +					       ctl_data->name, snd_strerror(err));

Why add the space before the : here?  That really is not idiomatic for
Unix stuff, or just natural language.

> @@ -542,11 +541,12 @@ static bool show_mismatch(struct ctl_data *ctl, int=
 index,
>  		/*
>  		 * NOTE: The volatile attribute means that the hardware
>  		 * can voluntarily change the state of control element
> -		 * independent of any operation by software. =20
> +		 * independent of any operation by software.
>  		 */

This should definitely be a separate commit.

>  		bool is_volatile =3D snd_ctl_elem_info_is_volatile(ctl->info);
> -		ksft_print_msg("%s.%d expected %lld but read %lld, is_volatile %d\n",
> -			       ctl->name, index, expected_int, read_int, is_volatile);
> +		ksft_print_msg("%s.%d : Expected %lld, but read %lld (%s)\n",
> +			       ctl->name, index, expected_int, read_int,
> +			       (is_volatile ? "Volatile" : "Non-volatile"));

I don't understand the comma here?

--cH4kqHwkCNRl3JMX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKCZ4UACgkQJNaLcl1U
h9CEbgf9Eps4RQf5GwgggebMWvlsEDS4AHT1wMUSZOns3d44DpU8Em6Fg9BHGF19
Y8qy5envpJ30adNWBZNS+hH/Cr1mzHsP4CXYxADNBTMLDvwHAT7v0xDThc5lGNhi
TjMNxnYssD4uk5vwqEDjfukpqQ8ee2U5Mteysg3nNfvUK0Y4Ty7rLU11wHPdpsib
iuwVlm56PbJwhJz/++DDj5JfAQKz+7K5ZMWmTYNyf4flwB2UyWdueeKknrNh7HrK
etvB6eYnOddvoP1fLzsZxFWE6Kamk2Fb7UPfdmc9HX26XhvrSpQlre5e+Otbs9Ft
cLadxKCsaQ6kn9eKdRiwUQwfDNvXEg==
=9XeY
-----END PGP SIGNATURE-----

--cH4kqHwkCNRl3JMX--
