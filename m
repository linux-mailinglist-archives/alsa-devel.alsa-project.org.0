Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DE63089BF
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 16:11:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7B461698;
	Fri, 29 Jan 2021 16:10:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7B461698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611933069;
	bh=y7xQIqg2z9dfuZc5jwPD2+d3OZZRAdHFhZUs79bH5S8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aoYT2TPID4Pi2gLFd+W+Hmr8LgqSigN+64MaTsmHdLgGhdT9p3bYS17tN9ymBaDwJ
	 pP0kFNp/80BFltoLuUdYwNnejYL5tYMVs2xX4gnbW9ycXf4OlGNrg57nUMepsm+vHh
	 a924Eri1eKTlQn0Kh3Vfc/IqpISuIZdlnUlta030=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38E00F80130;
	Fri, 29 Jan 2021 16:09:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63EEFF80259; Fri, 29 Jan 2021 16:09:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07877F80130
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 16:09:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07877F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Nvj+/hgz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF3A964E02;
 Fri, 29 Jan 2021 15:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611932968;
 bh=y7xQIqg2z9dfuZc5jwPD2+d3OZZRAdHFhZUs79bH5S8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nvj+/hgzr7/wdR+XoE+bkUHkdaSAgCq1fYjQSAEb/g7zQ41ijO2+wMnsoK1EJ/hLx
 rsUyfbdOzBflhv3+vxVUTlZrGjCiYpyBS2BPC8iPyoGvqW4Y/C5EpHF07q8D8GIgfn
 14+zg0RJydJaojbnF4vT9eyylha2R9pSTedmmagLxojeO/QgDbpuc3mIiTwfKrM47b
 5LLaso+HPscG+j74WlLFDdkXKtDFAeIBhZO7Thaw3VRpagWRNJUQ3P7AfX0VQS/2Nj
 hguCy0N0FcA4TlYpnBtY+iTxnNA7VCh9fmg8QlAb2vZjP3j/tJ2I6ZG5zBsfrT0aEM
 oUfw96Mh3wHFw==
Date: Fri, 29 Jan 2021 15:08:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/7] ASoC: codec: lpass-rx-macro: add support for lpass
 rx macro
Message-ID: <20210129150843.GC4560@sirena.org.uk>
References: <20210128141929.26573-1-srinivas.kandagatla@linaro.org>
 <20210128141929.26573-3-srinivas.kandagatla@linaro.org>
 <20210128160718.GE4537@sirena.org.uk>
 <2e1888d9-2ea6-67df-f61f-34062bf7aeee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Content-Disposition: inline
In-Reply-To: <2e1888d9-2ea6-67df-f61f-34062bf7aeee@linaro.org>
X-Cookie: One organism, one vote.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
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


--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 29, 2021 at 01:32:38PM +0000, Srinivas Kandagatla wrote:
> On 28/01/2021 16:07, Mark Brown wrote:

> > > +		if (rx->rx_mclk_users == 0) {
> > > +			regcache_mark_dirty(regmap);
> > > +			regcache_sync(regmap);

> > I'd expect this to be joined up with whatever caused the register state
> > to become invalid, this looks like it's inviting bugs.  This also seems
> > to have only one caller...

> Few lines below we are moving the digital clock from OFF to ON which will
> change the state of registers. There are two callers, one from DAPM RX CLK
> widget and other from soundwire clock gate! We will potentially enter this
> path when we are resuming from clk pause state!

You're not syncing with whatever invalidated the register state and
caused it to need a resync, or if you think whatever invalidated the
register state is in this function you're resyncing before taking any
other action which means there's some kind of ordering issue.

--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAUJPsACgkQJNaLcl1U
h9AZegf/VzoptZ9o61fKZVPbz94Dfr599dcAvfIQB6LgVeeYkDQILpyhkMmlNxZk
xWavufRPmWfs+JQFHLUi3DrOaebll0xlui6yhx7S2XRCEBzEJes4i4lG9tep/oDf
EbD22TS/iO2yuiU3JSCPxRUWCGoUD7YJ27Z6T11OkyFMo0swpmF1UYm/21hzfb0P
LWtVfdZk6RvDmNT2a+uQEjkrZfs9//8PdHNOJLyijwh3/3bC9KaB/Wsgr7vxn3nM
ibfCVCKjYbHMuOoZMpTHlrcWCkGW1ok38XiN37PpSptZAIgmYnNnMZ6qfLvjUQXP
vGXCBwVqi7eXyocK40ijyGBOf6D/Jw==
=sTX3
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--
