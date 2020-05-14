Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543161D2C6D
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 12:19:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFF651671;
	Thu, 14 May 2020 12:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFF651671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589451554;
	bh=Hjnqtf6r7/XeH0rPJKhpaCd250LS4mEfzl1RNp4Sfyo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e8B5vwEqyVl3iUfjZdzvoi3O+5WQZgPuZ7zcncW5SojxwI1kgSdiLVzG/3wWU8s+L
	 ytivflMh4pjokk0XZIlzsflUKV30gF6+bq4Ak8S5dvsklaVxI9KqazuCrt+7QnrYEg
	 lA1oUTZxFbukBj8hDC6y3uOSh2YJRQzCwhOv1aHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EE12F800E3;
	Thu, 14 May 2020 12:17:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4E75F801F2; Thu, 14 May 2020 12:17:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21BAEF800E3
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 12:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21BAEF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D3zjKHn8"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1810F2065D;
 Thu, 14 May 2020 10:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589451433;
 bh=Hjnqtf6r7/XeH0rPJKhpaCd250LS4mEfzl1RNp4Sfyo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D3zjKHn8NR/8To9fLf0fHyreRT1kzJk58Z3fWsPILa95k5xHi5sL0y9TYFLy/u5Ep
 h7KFg/LqEovaeVIZR1hHa7K2rles1Q0eg1sKhJzdrbkdn1DjbBFRAGNkLLQwVomqNk
 LVXINSpYITqJsfUS0gxo9b8dgpaQQUYOItfCEdf8=
Date: Thu, 14 May 2020 11:17:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [V3 PATCH 2/2] ASoC: max98390: Added Amplifier Driver
Message-ID: <20200514101711.GC5127@sirena.org.uk>
References: <20200513074523.21086-1-steves.lee@maximintegrated.com>
 <20200513105144.GC4803@sirena.org.uk>
 <CA+Px+wU_tjgWgG_xPR6SNBC5oM3nzVnhxjD85mrxfZW+_w6mKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2/5bycvrmDh4d1IB"
Content-Disposition: inline
In-Reply-To: <CA+Px+wU_tjgWgG_xPR6SNBC5oM3nzVnhxjD85mrxfZW+_w6mKQ@mail.gmail.com>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jack.yu@realtek.com, ALSA development <alsa-devel@alsa-project.org>,
 ryan.lee.maxim@gmail.com, ckeepax@opensource.cirrus.com,
 ryans.lee@maximintegrated.com, Steve Lee <steves.lee.maxim@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, geert@linux-m68k.org,
 dmurphy@ti.com, Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 steves.lee@maximintegrated.com, nuno.sa@analog.com,
 rf@opensource.wolfsonmicro.com
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


--2/5bycvrmDh4d1IB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2020 at 07:58:12PM +0800, Tzung-Bi Shih wrote:
> On Wed, May 13, 2020 at 6:53 PM Mark Brown <broonie@kernel.org> wrote:
> > On Wed, May 13, 2020 at 04:45:23PM +0900, Steve Lee wrote:

> > > Changes since V2:
> > >       * Removed warn massage in max98390_dsm_calib_get func
> > >         and add comment.

> > The problem isn't the warning, the problem is that you have an empty
> > operation.  You should either implement the function (eg, by caching the
> > value written) or remove it and fix whatever problems you were running
> > into further up the stack when it's missing.

> The purpose for the mixer control is: to signal max98390 to start to
> calibrate from userspace.
> Thus,
> max98390_dsm_calib_get() -> do nothing.
> max98390_dsm_calib_put() -> call max98390_dsm_calibrate().

In that case it should probably do something like read back if a
callibration is currently running.

--2/5bycvrmDh4d1IB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl69GqYACgkQJNaLcl1U
h9DNxQf/QQdNXRHEhFVhciOu10vEivLtB4etHg6e0+9DlP5UaqQzSlo8qhxUVOLg
vvn1YSiYncGYeehx+d2wpZHDsRTuC7t6l8fmJPgX5dU9U8cuaCfEL6MpLTRxWvtd
70W0gvdgF06FJsCQQW/vdFxXMYQrnSULSVbsXP+WTSntRA1q0UgT39iVNB4oLLJa
YfnwI6H8B9V/0BLvGNJeQh0CeboCekKQxF02A1gPld096jo3CA0OYae75LLtgV9A
4rkEwexhCG14FuzijzZ56w2JSVjqaqgOHQXtZBcv6zMthny2y08q9Y1+iYTOydAY
O9da5PaWDFoscL0AYaMZemx8ryXTYg==
=hO61
-----END PGP SIGNATURE-----

--2/5bycvrmDh4d1IB--
