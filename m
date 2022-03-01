Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF9E4C8BEF
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 13:45:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 672B91B08;
	Tue,  1 Mar 2022 13:44:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 672B91B08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646138733;
	bh=Dvmj37OjCzYRSD5lH+68CdPQAV0uvqJN0PHM1p+T0So=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L8yPUq46RurLE6ZW4l5WGRa/XOq+KW2YS0N0mokQz3A4f6ugqs0Ox/rjWY4TC7ir0
	 oUsPwyCG1t//36X4+xH6AuVW3ZSWsAhPPtIP+Jnbbyvb1lU/xMFWvRZQoU+KasmtGl
	 HVyqGbNvR98KTYddFatXs8qOsfFMXmsA6U+vHuXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE06CF802D2;
	Tue,  1 Mar 2022 13:44:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5FD4F80227; Tue,  1 Mar 2022 13:44:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C983F80167
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 13:44:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C983F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cvEy4Cel"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58B9161229;
 Tue,  1 Mar 2022 12:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D6ADC340EE;
 Tue,  1 Mar 2022 12:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646138659;
 bh=Dvmj37OjCzYRSD5lH+68CdPQAV0uvqJN0PHM1p+T0So=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cvEy4Celqtz56G+ZmoQDluWwekayBnfTCkFgpjXIFUH67plCHqLaSs3bbB243KlIR
 c45wYDECEVf4LWJ00ZQiKAcyUSHL64BhIGFvma252WcK0UALkdGdrYGD/dqovDJKtR
 nXEk3Ag/hwkYm5li4hxxk+HMio8KgibuwB4aX5v1Z2zZmHKVjrxL7cIQKNI/tiMITd
 NkO+5zDQZmAzNeWpLD6uKGpNz/FoYh51Uy8J52cCMjZhmPH1IJKDOsrwcP7vK2YjZm
 nonLZCYTS9eYAKYZRMI8CD96NDXVzp27Rt1yTEqCpDc6ETJVDQByLrDXXZXW/TIYGE
 LR+shwwVPEBnw==
Date: Tue, 1 Mar 2022 12:44:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: fsi: Add check for clk_enable
Message-ID: <Yh4VHFviMI/LbjVe@sirena.org.uk>
References: <20220301073949.3678707-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a4D1fYTki8ZRdcZe"
Content-Disposition: inline
In-Reply-To: <20220301073949.3678707-1-jiasheng@iscas.ac.cn>
X-Cookie: You have a message from the operator.
Cc: alsa-devel@alsa-project.org, songliubraving@fb.com, ast@kernel.org,
 kuninori.morimoto.gx@renesas.com, daniel@iogearbox.net, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, john.fastabend@gmail.com,
 andrii@kernel.org, tiwai@suse.com, netdev@vger.kernel.org, kpsingh@kernel.org,
 yhs@fb.com, f.suligoi@asem.it, kafai@fb.com
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


--a4D1fYTki8ZRdcZe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 03:39:49PM +0800, Jiasheng Jiang wrote:
> As the potential failure of the clk_enable(),
> it should be better to check it and return error
> if fails.

> -		clk_enable(clock->xck);
> -		clk_enable(clock->ick);
> -		clk_enable(clock->div);
> +		ret =3D clk_enable(clock->xck);
> +		if (ret)
> +			goto err;
> +		ret =3D clk_enable(clock->ick);
> +		if (ret)
> +			goto err;
> +		ret =3D clk_enable(clock->div);
> +		if (ret)
> +			goto err;
> =20
>  		clock->count++;
>  	}
> =20
>  	return ret;
> +
> +err:
> +	clk_disable(clock->xck);
> +	clk_disable(clock->ick);
> +	clk_disable(clock->div);

You need separate labels for each enable so that we don't end up
disabling clocks we didn't enable, that would also be a bug.

--a4D1fYTki8ZRdcZe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIeFRwACgkQJNaLcl1U
h9DwBgf/bin2luVJoiauARSYcwKh6nAuT6t1+pRx4vZsv96asJBq6mHzg3Lde11Y
m2QgosA3PwMCLdvAIk4gZc2OQfzLQ6r96lgNEFHE3fmZknc9qPeO5P8275sdgfRy
xn7l5w0j4y/4QoGu6YpE9EidGOGlkLQMcMvVc3CcpIUQLexWdGIgYUoJDT8MaIrA
NNlrI3R296GI6oToypsEEC+KnTcddRKhEqd/wlCTD75OP9WmbQdUkw84mXq4A29F
yDHw4BIYC8Mhx+RvUUXSaBue6Ow0kk58x9hdeFIE7Zc2qRk8xuSTxnju+QXIPNZK
djNrcWAUdWEufFhsSf26mOnIq6bsrQ==
=LFkr
-----END PGP SIGNATURE-----

--a4D1fYTki8ZRdcZe--
