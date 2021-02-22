Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD503220C1
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 21:22:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 794C9950;
	Mon, 22 Feb 2021 21:21:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 794C9950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614025329;
	bh=IRinsFTIScAOT+Z3d/AgrlLMPmgST6R4mc7rA9DWmc4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cyAZ2djjqR3x1+ECOeXeOi/md1i72xTBKY6WVS8QinbQbsrCnfOG2woSW3rqP7Qsn
	 59iQ02akrsOBjdxivn4mGAsanMMC+OzbaT/EPBLIrHJNL+shtlZhyN4rpWcR8B9gRj
	 I2FI+db1f7MVEuma2XByxro2fLI5Yfh9Aa6mof+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B637CF800CE;
	Mon, 22 Feb 2021 21:20:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11E66F8016C; Mon, 22 Feb 2021 21:20:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6501BF800CE
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 21:20:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6501BF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ks2WupQR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8978264DFD;
 Mon, 22 Feb 2021 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614025231;
 bh=IRinsFTIScAOT+Z3d/AgrlLMPmgST6R4mc7rA9DWmc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ks2WupQRVtufpv4xhoOqSKII42oju6II9zLB6s6kXAY2UZ//Mo2ch9giE67fTKpJl
 DS0xKhhkD6A4oJkhd2XBJxrWV5TDOV9AwYNvt/33yHrPiotTiKyIPzDmvES9He/tnX
 GhghXLhEuIrRUylHIWblR8MS7XZPexAPF7bh17CWgkH5s/NuQQJUj2etgcwBZ9rBHr
 MDfOh+jTIONTNztRljgrzQLwSuwTTKMkrIcDzwpL+p4Wqa5sJ8Kr9uW3S6g3MSdCbH
 uOmqUPMVB5qo81nvq7wAlk9Y4LdA12t4GBVXwb55/NZlewdpAuzuHlwyydJ8Z/Zddo
 8cacJ97J5UoJw==
Date: Mon, 22 Feb 2021 20:19:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH 0/6] ASoC: samsung: remove cppcheck warnings
Message-ID: <20210222201929.GF6127@sirena.org.uk>
References: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
 <161401004266.2538.5738460015320431431.b4-ty@kernel.org>
 <CAJKOXPe6LZuuL0ntPAEwudEtMcGreBLMHzBFg5jw_3=DpG8KVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OzxllxdKGCiKxUZM"
Content-Disposition: inline
In-Reply-To: <CAJKOXPe6LZuuL0ntPAEwudEtMcGreBLMHzBFg5jw_3=DpG8KVA@mail.gmail.com>
X-Cookie: A motion to adjourn is always in order.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--OzxllxdKGCiKxUZM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 22, 2021 at 06:31:15PM +0100, Krzysztof Kozlowski wrote:

> Hmmm, I had comments about this one so it should not have been
> applied. The check if (ret || !args.np) is still not good (or
> confusing) because args is an uninitialized stack value.

Ah, I saw the "this is actually a fix CC stable" bit, the bit saying
there were issues was hidden - it looked like you'd just not deleted
context.

--OzxllxdKGCiKxUZM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA0EdAACgkQJNaLcl1U
h9B79Af+OgeiU+jU8yAShBd7x2L39x1dQPspsU/HTwY/X0HG6JYXqnOkkyIWPC9V
qFM17drHLEMi1c2XGkEYFsXwk8VB9QmjwqgAXeZPDdenh7Mt4eDPI1AhBLqFuCWd
N2C6FeQMVxHGtW6Ih22kFyQYy/z1mpToaAHysc+Xz77RB4w+Xta0DBpxwCSd80Aj
xO5Kf5rD2ZTjdxqXll7T9R0KipybP6uPmypeEIo73sVZeVvopHWAYb14geYTtC/Y
cKkTW9G6SzajnxfXKqHiUSYtToioXRRsI7/9tAjym7HPrBfRzk+0/TL0CbA2DIfz
qm0UnyZrwkjuZ/x12R/aLnBK4n7QpQ==
=HMDX
-----END PGP SIGNATURE-----

--OzxllxdKGCiKxUZM--
