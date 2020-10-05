Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED04228419E
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 22:42:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6462717B1;
	Mon,  5 Oct 2020 22:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6462717B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601930530;
	bh=Tw5KULanY4YexA63SZNUNo1AXNoldcn5M+KKL9eUnfg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YJLmHVZfayOi9ayUXGJY26TMYQ7NpRZN71bNbLIv2oFZakqih2WD6l5dTGhX0x/C2
	 Vyel4VbfPOFkC1s94G049HD0qvVzW8sBbqRgB6ckBxEcDpHe+OK7eiGfyQOUaLMYPB
	 Lhuys5Cvb9Ye9VV6tvm6/yp2D89TuqUsSrIA83u4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 974CCF80245;
	Mon,  5 Oct 2020 22:40:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 736FCF8025A; Mon,  5 Oct 2020 22:40:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBECFF800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 22:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBECFF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U3390sRc"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51587204EA;
 Mon,  5 Oct 2020 20:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601930420;
 bh=Tw5KULanY4YexA63SZNUNo1AXNoldcn5M+KKL9eUnfg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U3390sRcvgMWyNsPBssmfUmIqltIrcLvxg2i5vX9mc1Ect6N3g0REQ+CizsmPuAYM
 /o4eBP1j5p9BO8wE8kC9dzEX9BX0F8cxRsHU6/TwjD7u9qMDJRBg3hu6Be/foPFOt1
 T4gH6dqJVQzq/KY+vaORPjREa/UnRUGjOejI41nI=
Date: Mon, 5 Oct 2020 21:39:16 +0100
From: Mark Brown <broonie@kernel.org>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH 03/13] ASoC: Intel: Remove rt5640 support for baytrail
 solution
Message-ID: <20201005203916.GK5139@sirena.org.uk>
References: <20201004100128.5842-1-cezary.rojewski@intel.com>
 <20201004100128.5842-4-cezary.rojewski@intel.com>
 <20201005164041.GA29181@sirena.org.uk>
 <ca16b4920db44e0789d2786634531df2@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7ArrI7P/b+va1vZ8"
Content-Disposition: inline
In-Reply-To: <ca16b4920db44e0789d2786634531df2@intel.com>
X-Cookie: Most of your faults are not your fault.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "ppapierkowski@habana.ai" <ppapierkowski@habana.ai>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Proborszcz,
 Filip" <filip.proborszcz@intel.com>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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


--7ArrI7P/b+va1vZ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2020 at 05:25:26PM +0000, Rojewski, Cezary wrote:
> Hmm, not seeing any problems when applying these 13 patches on

> broonie/sound branch: for-next on my end.
>=20
> For for-5.10 branch, I see that 'git am' failed on:
> PATCH 04/13 ASoC: Intel: Remove baytrail solution
> i.e. couldn't find sst-baytrail-pcm.c node (probably changed in between)
> but this is certainly not the 04/13 patch.

> What am I missing?

I probably just replied to the wrong patch.

--7ArrI7P/b+va1vZ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl97hHQACgkQJNaLcl1U
h9CbEQf/TuExlJyoNZ10IT79Hvz/THYjgYTTx1C+MSTauUDqnYUd3TRK6w+7rF2F
vjJ5gcrYeGW4pSB68u1x+IXjhi/UvuSSXmgqUOcoLFDLgdxJTDTY0U+sliYfTA4I
DkrFBObr2+wAGbJI6ioTLySH/FkCkawq9BS2AXXAjCABuNpFZMT5QfYNFt0mnSms
kdBIpv+ebPTtv9ebHga4j/rNstH9uosE5KNlV7XrPc2SWEX6liyO5JJTDPBg+/b/
kzOXcDfn3252jr+cLHPvBzJ/LYNtljexEJOmMd4gGmF9ArVZXe6hlcE6SHTFuD90
zFeYMMQnmV8vb4PSGel6Zui/DWO5/g==
=f2xl
-----END PGP SIGNATURE-----

--7ArrI7P/b+va1vZ8--
