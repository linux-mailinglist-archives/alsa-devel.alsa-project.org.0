Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C46FD7861
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 16:25:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1934D857;
	Tue, 15 Oct 2019 16:25:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1934D857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571149553;
	bh=zC3uJwynV9wlFuMBIoek/PokgnrLRMFKdWxZ/52Aypo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qnAJI/Il/NZgxTb2vxMufB8sFR5SE+pBICgIxKLuWvkb1rS/Zt2gxiOwy91xY6v+N
	 lIZcRsflXrIHe5/xyHCt8heeGipSt1RSq2IgM0BWdndjU4tx0V6jv5N2F7AAsaOGWn
	 7lmSGHKH2lRRKQShG269ITl1voUdJpYRmMQA3LBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5808F804AA;
	Tue, 15 Oct 2019 16:24:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 322FFF804AA; Tue, 15 Oct 2019 16:24:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F2F6F8011D
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 16:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F2F6F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vdm+Kl7G"
Received: by mail-wr1-x444.google.com with SMTP id z9so24110532wrl.11
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 07:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FAnSKJ9Pew82PkAXBmKY6NLtUVGPV5vweCMQygZLvvc=;
 b=vdm+Kl7Gd2y8KQLrE/HVhM8oojADmvZGvILZ1fyliGX2ZgMa9FIC9w8kzDxAMJuDjd
 tqCIlnyOggnEoSYxZJ1Y7rUjNA8gBdVlFKsxpYi6hy+nkIaklBboKo7lkhwMrlJaFdcL
 0MgFqVTbuVUK1wuhcUhTp6rfthPK1vSdRge5O5Pcq3XW0+3kZIbigf+Y6dfavg/k4dCB
 ghGvkniJqx3yGmzSZ/i0UOfsGeMwIDESQLlGA6wl4Sfvol8nxxLE84K0mdY9BbZriZMa
 jRZoCjXC1ZUMbID1bn/0THaqWglcm+43TCn6DU24RN3vOs0NIrGxEtg6aXLoyDPw1t9r
 60rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FAnSKJ9Pew82PkAXBmKY6NLtUVGPV5vweCMQygZLvvc=;
 b=fCB8Dh86mFYnvi+rNVRV4T9GZiafgLWLUtyN9LlOvISCp1tED77pA+Rsyj6T3YN6vO
 73eHgy9FI3M8A9hrtO6hfaikUKEv7qxgAiE4Ml2YIk2U2o9GKJbGHMtQRh8PC4TJD4qi
 VJZnMesxLerBk1BF2epdIv6MgW6dOI7PeSgfDsOCgYkl7qr0/0vU5xpZndHVxgvROhTe
 RMcSw9ctcOIQwax5bJp6jCbv8dz98E2+Iv1Dp+A1FR6/tioegn+w1JDBvHUSOC9Schvi
 jC5dA97Hd5cUd51AMGpFLGzlEI8ju7E6sBiuwuoB7UsWrqmRS9Dwq31ZzMhz4WR/fH4P
 AroA==
X-Gm-Message-State: APjAAAXGm7Oas9u88nZr52uv4itA2TFdhuaFay5TJGwghc64Vxyd9nGs
 CoTyLwbIbHMnIQkuoGu+LZc=
X-Google-Smtp-Source: APXvYqxMLLgnR0vPxF/fKc2CDYJpM14udBOYJNSRJ7usNIA2JSpBWl8XxRhB+VXeRePSyanx9OYDig==
X-Received: by 2002:a5d:51c8:: with SMTP id n8mr215083wrv.228.1571149442587;
 Tue, 15 Oct 2019 07:24:02 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id f20sm17308471wmb.6.2019.10.15.07.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 07:24:00 -0700 (PDT)
Date: Tue, 15 Oct 2019 16:23:59 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191015142359.GA1101003@ulmo>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-11-arnd@arndb.de>
MIME-Version: 1.0
In-Reply-To: <20191010203043.1241612-11-arnd@arndb.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linus.walleij@linaro.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 linux-serial@vger.kernel.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pwm@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jiri Slaby <jslaby@suse.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Faiz Abbas <faiz_abbas@ti.com>, Olof Johansson <olof@lixom.net>
Subject: Re: [alsa-devel] [PATCH 11/36] ARM: s5pv210: split from plat-samsung
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
Content-Type: multipart/mixed; boundary="===============8467501387157597187=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8467501387157597187==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2019 at 10:29:55PM +0200, Arnd Bergmann wrote:
[...]
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index e3a2518503ed..8eb738cac0c7 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -394,7 +394,7 @@ config PWM_ROCKCHIP
> =20
>  config PWM_SAMSUNG
>  	tristate "Samsung PWM support"
> -	depends on PLAT_SAMSUNG || ARCH_EXYNOS
> +	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS
>  	help
>  	  Generic PWM framework driver for Samsung.
> =20

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2l1n0ACgkQ3SOs138+
s6Eb7xAAsZ9JZaeRn7IjUZs/yz8zD5TWoNpojsmj6Kzf947MW5cgaZEJei22skVy
3Kv1ogZu1N2WO2L7v//P9waAgCs0EuHgeRkT+UgsW2AapaShdkNmMh0tgJNWGFLm
JwwGVB6rfjuBVYQgICBlfKzPdA9KDQNlxJPJmE3lC2kAQ5KWtsWHJIuWpk3zruQK
rZyp33ecFy4Xa+Sxue8CTgyUoHv+t7fhjtpAn/NgMJGy4WGi5lfn8S9bkb9uULHD
cZY4hv+EPC/GAaMQJ6HX9BwGnY1l+Mh8K7uH323OWAMQUqNAgKYuGvhUYSCtLPB1
WNdTjM1kkz93c1pLaikNdKtO3NhqrmXD+fKwmEF7xCQqEfBvPznq4ipHb4MHJEih
YLw8CGBBCX51LOghEJsYi0dMhvWdq4WFJcmXCcjWBYygVWkbvwkdCZSOTdeyI3GE
QTTlWslD1YDL7FuwCYPLBpldFi1JT8hFwP8oK3VTSxmpd4j8mjDKsMHpHtzzTGe/
6Le5t6ewz0rvR5ZFAnZB04VlIFV+l+Zx3e3Bxaqc2h/I6u1yagTZuPSknB7FJRPs
ic4Qr6sfKbK7LMuIIohElzhuVHcEeIfZ3NYAkWh7t9sqefIRrJUcDcPkz3sQ/8Vn
ChkBlbp/IuPwYuSPNI9nf7EW5vFjV7aTYZFXI7mj5M3kK5suvsU=
=4m87
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--

--===============8467501387157597187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8467501387157597187==--
