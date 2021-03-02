Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE032A024
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 14:06:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5107B16F2;
	Tue,  2 Mar 2021 14:05:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5107B16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614690405;
	bh=QSWRjXfZNLMdRfvCmLRy+mM6QNn398hcGSjjZz5fy+0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RY2VrH9Y8BPkYta4gjm3nHtxwygEN5PhHnh729z9v/tZLAx45daXznDzYyY/OljKS
	 8IztkKM+imNCdOhOJ70QzuKdNC3VaXTarkGVpoPtRC5SHC9qUmd5PxBYiU+rm66sBF
	 de4oUMTUJwTCJVQKr4cPHH0YGj/Gzqc4KWuyrYzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F765F80271;
	Tue,  2 Mar 2021 14:05:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6B6DF80269; Tue,  2 Mar 2021 14:05:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42CE3F8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 14:05:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42CE3F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nr/hui3Z"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D49B964F0D;
 Tue,  2 Mar 2021 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614690307;
 bh=QSWRjXfZNLMdRfvCmLRy+mM6QNn398hcGSjjZz5fy+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nr/hui3ZtJHnRFcHg9P0HfaQWvcmXBAFGUdxjUELqb12qd+RhjnVFOltgZjgjCUlW
 jiYZRGZHJ1F9AI/YjPrpdKXPZ1Ox6uJ301zcIIVNcmG4oe6T6QkAoFvCNCENh0n+2x
 Nw0UZOqUgHw3RCAlP7WgOmzW0dge4KDtkgQbcOZgfjKj9J7mQbEulIQ8E48gzGmL7p
 DNq7YpncATONKl9XuePBWrE3k8UOvzyx+G1McY9k5DQtH6UDAIPhJKnKKzgIkqP+o+
 zNXIVwLESdsB4YmJC+Y3QWu/rX5a0zVNbfv0w6Vxc1B3kH+Hq0Lclq5pURqgIDtNz3
 F5t0DdAeRs2UQ==
Date: Tue, 2 Mar 2021 13:04:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 2/8] ASoC: soc-pcm: add soc_cpu/codec_dai_name() macro
Message-ID: <20210302130400.GD4522@sirena.org.uk>
References: <87tupuqqc8.wl-kuninori.morimoto.gx@renesas.com>
 <87r1kyqqb8.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline
In-Reply-To: <87r1kyqqb8.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Friction is a drag.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--MAH+hnPXVZWQ5cD/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 02, 2021 at 10:47:55AM +0900, Kuninori Morimoto wrote:

> +#define soc_cpu_dai_name(rtd) \
> +	(((rtd)->num_cpus == 1) ? asoc_rtd_to_cpu((rtd), 0)->name : "multicpu")
> +#define soc_codec_dai_name(rtd) \
> +	(((rtd)->num_codecs == 1) ? asoc_rtd_to_codec((rtd), 0)->name : "multicodec")

I can't see any reason not to make these static inline functions
instead?

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA+N78ACgkQJNaLcl1U
h9DfHwf/ZMYWs/sPWA+rzE0whXhFXg/fEfsHzSiUQsVcBbFvOxOjHIA7SeahVxh7
DWpNZrwnH/P3SyUeUEZJuDCA7yyq6kGaqfDAD5FUwoVb8dSx5CzKLtrEFNr+RtYc
EjLcrwQyXPABC42gQ3R9wdQp6KJSAV4AB5CGcM3H/7AQgsLM3ZXRDZqKv74BNhoF
vP+cXtvwinFAxfUiqj9nwIRDUtGrGwQZbYWJyqIpjjGmESvIWyFqc67sbhvQnPwo
lDb1XyZeF+YInBG/mh4EePy/kTS+Q+Y6BGhLiDbsKPn0+ib6/yXEPZEaiCh20Zh7
AvUUfpmDhjoD/9ToRfOuxcSlOnxW1w==
=G5Uc
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--
