Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 674BA4C0195
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 19:46:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEBAF1843;
	Tue, 22 Feb 2022 19:45:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEBAF1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645555609;
	bh=1C8QDrO2OtgLwZNTF58GfOVs6sAo8lISdzMgO8lSpDQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AXyPnX/dtqvFaN4A3AhGXwBNt22LsxtO4CNd80Axn+sCwDydAM78KD0UuPV0tkk1X
	 Wofy/2kKkG0LZnTCfa8XBGSKcqYjkcdWeb6QcoBuO9KQ8WLWA59tGqjLkdWcgXo+Em
	 Ig7SJin/lfunlwUbS0TXYAXOXzD3UGWbXsAj5FxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51427F800D1;
	Tue, 22 Feb 2022 19:45:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8438CF801EC; Tue, 22 Feb 2022 19:45:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BD7EF80118
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 19:45:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BD7EF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kxTdUcfB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC2036157F;
 Tue, 22 Feb 2022 18:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5034EC340EF;
 Tue, 22 Feb 2022 18:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645555537;
 bh=1C8QDrO2OtgLwZNTF58GfOVs6sAo8lISdzMgO8lSpDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kxTdUcfBN9saQxItgBeiesm0kmOdbDyQ635g22V0UnPDbnKibuF3JQcYi3sCBloTO
 IvpdzFQV959IqT+nXxwe5qZmdqnJMMxSfgnbbUUxZ0tWU+ep1q0n7AKLCw5L2jlt0V
 lhnQcjCDRAF0IdnsbCm18QJqNMvCj/dPG0RNSWrxLKX1b+YkI6arxd47zonFVEJGcf
 XoA5u7A0Net0w5ZzQ+0GKxiQPnSXkb2FoEoaMbPm3Me2vdyYOYez1skLNPRstSl0+W
 R2JYN26RCUjXwL6unwKicXVZXHKU4l9DA+aLjc8TDA8JYtuMVXQpMF2xEAeOOYDpQa
 cxWmG2+PrBA1Q==
Date: Tue, 22 Feb 2022 18:45:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 3/9] ASoC: codecs: tx-macro: fix accessing array out
 of bounds for enum type
Message-ID: <YhUvTF2QyL3Vh28k@sirena.org.uk>
References: <20220222183212.11580-1-srinivas.kandagatla@linaro.org>
 <20220222183212.11580-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SgpHx0OWTw7XBEmR"
Content-Disposition: inline
In-Reply-To: <20220222183212.11580-4-srinivas.kandagatla@linaro.org>
X-Cookie: I smell a wumpus.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, quic_srivasam@quicinc.com
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


--SgpHx0OWTw7XBEmR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 06:32:06PM +0000, Srinivas Kandagatla wrote:

> Also few return value of put functions, so that change notifications are
> sent correctly.

The unconditional change notifications are present in this patch and
I'm guessing some others as well (they were there in a bunch
previously):

>  	tx->dec_mode[path] =3D value;
> =20
> -	return 0;
> +	return 1;
>  }

--SgpHx0OWTw7XBEmR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIVL0sACgkQJNaLcl1U
h9BsTAf/euoTBL81jRbI5q8ZW7c/81L9UaPVST8lko3u0csVls06FN1P/6PP2CAv
WYokiT/HJhsWr1OgbjNFY+9wz6qy6cFctzEGeRbRU061v5y4CAvNeZJQ0S9Ke4pg
C997Fmx1ZNcE/MlleGq/Is529oFo/Z6hJnMErGV7x5hSORQhLv8FnnIO6PHfmWsn
0oF3mBft8Kylg3XozVTVC5CNK8XrJJUnxwgGx+Tx8J7lm/PLeARPQQznwumN4ZD2
CdLs5abTrvAn68uXUF9XWNSMotLsQGWcWZA9zqFRapxCi8dAhlqEm+RqvhUBh8Iu
9Gmsj4iEYOT7fLGh0nO2UzE1sXUvTQ==
=zEWB
-----END PGP SIGNATURE-----

--SgpHx0OWTw7XBEmR--
