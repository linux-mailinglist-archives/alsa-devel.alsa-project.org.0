Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8C05E7B36
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 14:57:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEB863E8;
	Fri, 23 Sep 2022 14:56:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEB863E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663937821;
	bh=1AHtxy60QleDVD9NG40eYAlgwUJqxDcaAonYKdtbXn0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ialMjM4sKZnePSl4HcQI07LYbk+k/TsCtth8UcuqG2v3voxwoHnEtehY6xkkBCxCt
	 wYTJSLZm8E0w+9Gm7PSYT772xPZR6zr1OecJgFofU7FnW76OFGtscLmyzF2dutelXB
	 a4XNYPrOJjw26ERUpd1QQi7ykbHmhs53I3J0a2Ig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 422B5F80107;
	Fri, 23 Sep 2022 14:56:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAD6AF80269; Fri, 23 Sep 2022 14:56:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6226FF80107
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 14:55:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6226FF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V1zRraBx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83AD3B81F15;
 Fri, 23 Sep 2022 12:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3163C433C1;
 Fri, 23 Sep 2022 12:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663937757;
 bh=1AHtxy60QleDVD9NG40eYAlgwUJqxDcaAonYKdtbXn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V1zRraBxwAAshLMED09wGIIrrLHErx7oZUMIDkJS08HkaS6MGA+E06BDRlIQAtEKw
 KI8KURd3STN4s8YtbAQUChDn3tVj3K6dO8PrXvz/tWyNtaT0oEuaW9Ws08d4OKQw/N
 zGgTshRiV8eKUBv7ctxRGV3FxJZy7HxLydUgEcGJaPc4XaSt3K+pwsUrdviwUSUsPX
 Wcg4vTI5/yc+AI26d7R8X2rZkmWVB9dC19Lrm4BTfA8dMS5TkzFASmREPc89BsU4mb
 VJDmOClZn1kCidYvfSY6R5Qv8YR4leiYNVlr870ficdNHiH85jxrze6NsR54d7OM/R
 NaFgNTxT6vI7Q==
Date: Fri, 23 Sep 2022 13:55:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Zhu <jason.zhu@rock-chips.com>
Subject: Re: [PATCH 1/1] ASoC: soc-dai: export some symbols
Message-ID: <Yy2s2PA/C1ngeb//@sirena.org.uk>
References: <20220920034545.2820888-1-jason.zhu@rock-chips.com>
 <20220920034545.2820888-2-jason.zhu@rock-chips.com>
 <Yym2aURe2+pA3ocn@sirena.org.uk>
 <dfeac54a-a264-835a-f155-90eb8f093314@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="K0csnROHqbjCpuAg"
Content-Disposition: inline
In-Reply-To: <dfeac54a-a264-835a-f155-90eb8f093314@rock-chips.com>
X-Cookie: Heisenberg may have been here.
Cc: sugar.zhang@rock-chips.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--K0csnROHqbjCpuAg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2022 at 10:37:06AM +0800, Jason Zhu wrote:
> =E5=9C=A8 2022/9/20 20:47, Mark Brown =E5=86=99=E9=81=93:
> > On Tue, Sep 20, 2022 at 11:45:45AM +0800, Jason Zhu wrote:

> > > Sometimes we need to make some dais alive when close the card, like
> > > VAD, so these functions must be exported so that they can be called.

> > I'm not sure I fully understand the use case here - why wouldn't
> > the core know about the audio stream being kept active?  For
> > something like VAD I'd expect this to be just working like a
> > normal audio path, if there's a DSP consuming the audio stream
> > then it'll keep everything open.  If there is a good use case I
> > suspect it'll be clearer if you send the users along with this
> > patch.

> Thanks. For example, we use the VAD(Voice Activity Detect) & PDM(
> Pulse Density Modulation) to record sound>. The PDM is used to
> record and copy data to DDR memory by DMA when the system is alive.
> The VAD is used to detect voice from PDM and copy data to sram
> (The sram is small) when the system is sleep. If the VAD detect
> specific sound, wake up the system and continue to record sound.
> The data can not be lost in this process. So we attach VAD & PDM
> in the same card, then close the card and wake up VAD & PDM again
> when the system is goto sleep. Like these code:

This sounds like a very normal thing with a standard audio stream -
other devices have similar VAD stuff without needing to open code access
to the PCM operations?

> When the system is waked up, open the sound card. The data in sram
> is copied firstly and close the vad. Then use the DMA to move data
> to DDR memory from PDM.

Generally things just continue to stream the voice data through the same
VAD stream IIRC - switching just adds complexity here, you don't have to
deal with joining the VAD and regular streams up for one thing.

--K0csnROHqbjCpuAg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMtrNcACgkQJNaLcl1U
h9CQnQf/dustlZ08QbdnRyuEszl3B5WPTjnYSw6Upf0jSTHASh7NVyEXt6OMa3wT
I9aDsXvxKjjmFWk+YzxzvfY5iaqAhDcYYvow5NfFnqmGm8SMMqROia+ye/MubTEF
2myOtZ/lw4PJmDRSRc/Bu5W4RyvrTHUxN1v9XouZ0MD/hC8p6LgjkSZTZMa6HhJD
6tyF7MgskgHDChyu4AgPJcLfi4FiPcP1mcrX2bydOEc2R9TjQWX8twaswpncnCJF
lvAa1NRFKjdPjqQMbdoo5hfjf5AzoSce3eFHngiHIZo2sTgJpTj1ggVZBxoYRTw3
u440mFQkvVz1K757SIK7f8pi7hWb6A==
=w0wX
-----END PGP SIGNATURE-----

--K0csnROHqbjCpuAg--
