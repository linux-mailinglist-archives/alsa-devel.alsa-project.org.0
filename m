Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A07BC2CF36E
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 18:57:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A4111894;
	Fri,  4 Dec 2020 18:56:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A4111894
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607104665;
	bh=DGPPjQakk2QYVZs5/HFXfiJD6R1v9incDwcxpfkANks=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TiJO1/EnXL2aZSDjLOG5u8yc9aUcqBAHC7H/5bIWUJmgZKgsXbiuOI18uWCGrixPE
	 j+dQPvGA6cJtURgzALMkXv54Vs/xlDHUBQSlkoDVTbLUUofYuO3n2vh/lMF6EaFPAs
	 QeQRrHYj6vcT5O9WbeSvU9mwyZ2caxpDK3CnIcak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54F10F800E8;
	Fri,  4 Dec 2020 18:56:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F017F80273; Fri,  4 Dec 2020 18:56:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95117F8012A
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 18:56:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95117F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Sl55beJX"
Date: Fri, 4 Dec 2020 17:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607104565;
 bh=DGPPjQakk2QYVZs5/HFXfiJD6R1v9incDwcxpfkANks=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sl55beJXzEMCXxppaqAQe9lAuQs1cE9nKRFqEwO3EZ3ShQhhVWpQL5TIyER9iYYYn
 KbKTHL+DavkJOXlraEOSDgTAT29Hj7J1q5Q3reH3zlw6pRuk9GyKfL54N6EvJZ4M6H
 g7rROEAa3hQF6g/VBrNlHi/9Mcky4f2YESLX0jhlKQjZZgWxqjycZ43MWE2uBXwT5M
 ysn64XMb3xhI+ITSUKHLm9scvrW9mIIreQwwgJ6Y4Xv7fTcBcK14AP+fQQmpzWAnzu
 WND7m3nJIQLqdi4UCYi7DO91hkq9wN/BZgl7HUMK8Klg8B4LOTu+vPXr4MH98HiB+8
 RJnPRCQ23DBsw==
From: Mark Brown <broonie@kernel.org>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Subject: Re: [PATCH 1/4] ASoC/SoundWire: rt1316: Add RT1316 SDCA
 vendor-specific driver
Message-ID: <20201204175601.GE4558@sirena.org.uk>
References: <20201202143845.18697-1-yung-chuan.liao@linux.intel.com>
 <20201202143845.18697-2-yung-chuan.liao@linux.intel.com>
 <20201203123802.GD4700@sirena.org.uk>
 <8b585fdb0b624ec892c55c0139d61e75@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bi5JUZtvcfApsciF"
Content-Disposition: inline
In-Reply-To: <8b585fdb0b624ec892c55c0139d61e75@realtek.com>
X-Cookie: Not a flying toy.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "Flove\(HsinFu\)" <flove@realtek.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>
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


--bi5JUZtvcfApsciF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 02:42:54AM +0000, Shuming [=E8=8C=83=E6=9B=B8=E9=8A=
=98] wrote:

> > > +/* RT1316 SDCA function topology */
> > > +#define FUN_SMART_AMP 0x04

> > Full marks for picking this constant!

> Sorry, I don't get that point. Could you give me a hint?

The name is funny - "fun smart amp".

--bi5JUZtvcfApsciF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/KeDEACgkQJNaLcl1U
h9DkKAf+PI+92Oa/UIoPctkxx1DydS4VNwTE6kc3uiVxRh40dMJPZvMYANtuC6Dg
aaLeiUCuuLGsP6q8wpzFezapSwnQDaBIDoJ49tw1GJW6grA4g73ug2CtE+C/PifW
zhByWkSuj5TzqUhZULmPRysWgKxobIg6ArnVoo1kcTppmiWIWGHpvQHRa0cYc5pB
Nigu305rMTbPew79zzoZsCtoOARHOKtICXUBeRiyeOtZUD9JX1wM9DFgz2PvZOy1
4/33qy+zRh3+sDBnzTCDjIaqi8GWh2Xd/HDTBgjXLflt7BgVbU37wRAhrwm7fJHe
+xzPU9BeB0hPxwoF6pZ/UsqhwCxe1w==
=KeYE
-----END PGP SIGNATURE-----

--bi5JUZtvcfApsciF--
