Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E280A27A957
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 10:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D75F1EF1;
	Mon, 28 Sep 2020 10:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D75F1EF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601280743;
	bh=IScXTkq6g8LWwRGHx3I0qVt8JnRHRuHibvGnD8QZ69U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jeAxheFgBr+Lm6MY7p9e78YHimKV0D9dIjRSRWsYB3fb3lmf66iZ/1jPoJTZeTw7f
	 4m4/EANRbjQCy8stz9yvwOrUZAY2bFyarzdjuRH8sHQq7E1Qyi9t21TRlX71xf3l07
	 dsMUcaiNiRogOd1+UG56rVP5ju1rGnH93SjiHY9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84232F80228;
	Mon, 28 Sep 2020 10:10:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 500E5F801F9; Mon, 28 Sep 2020 10:10:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EAF4F800FD
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 10:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EAF4F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PQeOiCWW"
Received: by mail-wm1-x343.google.com with SMTP id x23so95067wmi.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 01:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=31AqBMRSXqhYTQQr8QkJaNcT3VWyt1DfR1wcfaGbJtY=;
 b=PQeOiCWWh5CYSpErnhIwtEUcaxq6IJE4FgWMDgnMJTdkBXfSB8gMVA7HNwkcAThxHM
 G6hVuXMKh7arr4dsk++A0CROg4x+3tCeAt3caK9vfd6UOM7sz26SIxPo7pcItQDScMx3
 hq7E6nUI0ckCL1McIx0G0+AwCZiuQCxh3LPBt0Tc2QND5FO19X4B/DKCfoQF2i0d2eji
 cRbpDRevPrXf9kORDjftSGj4UEXx2a5a5LhDqIqtmcBIY1IWO+0R747pPmouKg+Be/PS
 zO1jfRN8IInGlrvpKscRSbKPt8P2zibNHll57ULnnYngG+wD+P+P7hgRSID7wX1vq1Pm
 cGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=31AqBMRSXqhYTQQr8QkJaNcT3VWyt1DfR1wcfaGbJtY=;
 b=frT871IesacsHKSCOxloZWa7b0IBmBnJNKjw3BQwI69Lx3rM7wnv8YWoT5PTKu9TGG
 hCmA8/11GfLFjhGvt4Yu90FjadtoCVQCtVF5M3nWwrX5lFAkvqw0f0KjJa8mI93RNk86
 1gZtutzj72MN9ZxPUFjXzPNklal/k9EtvTZmsgcD5DfdSpLNUvKISE8qW4DDsLT8Xy+J
 0kfBQzh/Uo0rj99w4YcaKi9BsdiaoTQMktwLgfwM9sPWzG7KJsuQlL5JKqxOqLYISBMG
 jk72q8/9goLizcrlbYyAzvXlezYPy8G1G2NQutXfXRxfHcGamKYM6UG6TzlNg60UnLtt
 +suw==
X-Gm-Message-State: AOAM532MpECqyZ8Uyo96FPsdHBE+3JBQCrXAYhRQWsdENcSzEVSKf5Zj
 TSU+hlHXq3Vcvlxp8xBO6JA=
X-Google-Smtp-Source: ABdhPJzIGf+sM0Jx6w17pqYx3HRomoZAcOHNEnPqDg5mojC4p8yVRDu79/lEm46i8sqcgLQFk4MGOQ==
X-Received: by 2002:a1c:6555:: with SMTP id z82mr315524wmb.101.1601280628586; 
 Mon, 28 Sep 2020 01:10:28 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id k8sm331939wrl.42.2020.09.28.01.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 01:10:27 -0700 (PDT)
Date: Mon, 28 Sep 2020 10:10:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH] ASoC: tegra20-spdif: remove "default m"
Message-ID: <20200928081026.GH2837573@ulmo>
References: <ede103cf7f6914054a73cf8f1d9725ee13a7cf5d.1601149261.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SUk9VBj82R8Xhb8H"
Content-Disposition: inline
In-Reply-To: <ede103cf7f6914054a73cf8f1d9725ee13a7cf5d.1601149261.git.mirq-linux@rere.qmqm.pl>
User-Agent: Mutt/1.14.7 (2020-08-29)
Cc: alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
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


--SUk9VBj82R8Xhb8H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2020 at 09:42:40PM +0200, Micha=C5=82 Miros=C5=82aw wrote:
> Make tegra20-spdif default to N as all other drivers do.
>=20
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Fixes: 774fec338bfc ("ASoC: Tegra: Implement SPDIF CPU DAI")

I don't think this is warranted. This doesn't fix a bug or anything.
It's merely a change in the default configuration. The presence of a
Fixes: tag is typically used as a hint for people to pick this up into
stable releases, but I don't think this qualifies.

> ---
>  sound/soc/tegra/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
> index 3d91bd3e59cd..a62cc87551ac 100644
> --- a/sound/soc/tegra/Kconfig
> +++ b/sound/soc/tegra/Kconfig
> @@ -39,7 +39,6 @@ config SND_SOC_TEGRA20_I2S
>  config SND_SOC_TEGRA20_SPDIF
>  	tristate "Tegra20 SPDIF interface"
>  	depends on SND_SOC_TEGRA
> -	default m
>  	help
>  	  Say Y or M if you want to add support for the Tegra20 SPDIF interface.
>  	  You will also need to select the individual machine drivers to support

So now by default this driver will be disabled, which means that Linux
is going to regress for people that rely on this driver.

You need to at least follow this up with a patch that makes the
corresponding change in both tegra_defconfig and multi_v7_defconfig to
ensure that this driver is going to get built by default.

Given the above it's probably also a good idea to explain a bit more in
the commit message about what you're trying to achieve. Yes, "default n"
is usually the right thing to do and I'm honestly not sure why Stephen
chose to make this "default m" back in the day. Given that it depends on
SND_SOC_TEGRA, which itself is "default n", I think this makes some
sense, even if in retrospect it ended up being a bit inconsistent (you
could probably argue that all patches after this are the ones that were
inconsistent instead). This was merged over 9 years ago and a lot of
common practices have changed over that period of time.

Thierry

--SUk9VBj82R8Xhb8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9xmm8ACgkQ3SOs138+
s6EzAw//csXks9215vvcBCKjXwZz3HXXMNsnJveUZK0fzDUjSr5oQeILZbN+gfxa
6pVNIU0ePDvtIh3814xSwzhSli5OlRq4Vo+y+zI2rer0L3BB6HpM80ekckhtKMJV
J8gKAxWtjmnzxizchU7LX+Lds/aeYS9xrqxEsninWvGZ7slMPbb7fxfGUyHvyG0n
ypjLyBsFyzDRfAo5ptW3LVW9W++aMoObYgcubxpdZ4EVThkf+/GUvUdWry69ZTYE
XmjwM2uq0B5edVuBYN9ezQflcoeDGIrD+ZR6yOtTeXViKxXqwZZuHir4dJ1i/upV
58cg3rYjAaAPyjxhMilJ35iOan0pGnVQJtjS64p9k9cCJBnADJs2fUcczzdXnP/O
tze1XSeQXbqr9XZKnODmNHwOajUoHVwLM6RN4bNwYdtMkpETN0afqQ9pX4X3WMD5
QJWXFSPc13LXeQwhOQNC+u5vfPaWYhne7/7WbLmd82IWiPABXeMwKINyzbv5ddUA
PWJo5TMOSpEopNzvDoWa8VYMN+QmPujxpiclBMK1aNkcWIa+hGGqWe+tyYun88e5
z7m9FSDqm0o2eizPl6zfNzUf35ihah/Q86k8eiULWQUR7kLNImS0n8fQGOR1s4dO
NLs6phyiJyLZOjYJ6GcCm0Vk/vCt2ifr+7DnT/okpWxlO9hDmAY=
=/ZoJ
-----END PGP SIGNATURE-----

--SUk9VBj82R8Xhb8H--
