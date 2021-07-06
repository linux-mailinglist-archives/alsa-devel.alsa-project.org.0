Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9633BF849
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 12:18:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33064168F;
	Thu,  8 Jul 2021 12:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33064168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625739490;
	bh=eNk2Mrckg2zJKDinJc3PbI5Ot39W2aBQbDFoDNraPb8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dJjubWm+ObnLetGHbL6QeARI8WetedNtS686NGKSyhAHyG52rq/erOcDRWnaoupnn
	 a5O+/TIoFC7FCD7gTD+rsMdQblvoj9gL8K3x3CPeBbKq/BPPTDBbzi80DYecVwUNA/
	 1toX9f1vuhxn9cF3clqLxbC04vrhribgv/KDVIRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3770DF805E0;
	Thu,  8 Jul 2021 12:04:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DEE6F80249; Tue,  6 Jul 2021 23:38:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D975CF8012F
 for <alsa-devel@alsa-project.org>; Tue,  6 Jul 2021 23:37:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D975CF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fjV4+ka8"
Received: by mail-pl1-x635.google.com with SMTP id i13so12769801plb.10
 for <alsa-devel@alsa-project.org>; Tue, 06 Jul 2021 14:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ocbz7plpl2GsaeWZtT2xSwu/ECmgcGgX+U0mFWoVx8o=;
 b=fjV4+ka8h0vH05QQfb5mosysrP9nHimBGyZMIaa5AG6oYKlZIJ9fBu1u8zdUGxqK0V
 Um+d4Woup62vh1nDeTEMfYQu/z07c7tU/WMAtzd8zyjZ+D++/9qAcGD3Qi5HWfAEidnP
 LVIhoqq3BcdDCaWawKEqjjS8yu6I4JR+nAEzkK0jeMXN28vBiyhs3oL9vVM3I/zG4bRq
 0ch+fVpWTwIZJdpOA5MGN4Hsas/DzY0s55S8/73rafQT0BQHzaPtbSSjdX9FgBPH3Kng
 zdOUu0zymj0lCUC9mcaI5h90C5jAW9R9slEqBMssceloFyAtObCoJPafpr9GaUMLPWWg
 1jSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ocbz7plpl2GsaeWZtT2xSwu/ECmgcGgX+U0mFWoVx8o=;
 b=UWwcoO55bqsGfZJS6DZNfHS92CuX6m5ywXOWQDwRhgLgzm4uV4zN+mm/ldQBCrDWke
 6xSwU84imAhIT9EHN0NjkvXJShngDvLf5kUYBWejknaWkIOus2T6B5tM0cLjnJEJzwm9
 SYyIT/6V9I2dN6SwF2KjZB43qVqG6C50bYGI1Gjf5cxP/Vyv41gYi2Stev/FDVfXx4by
 dsyPudqwG9MTqCsYK+bj8V/7/T2FGkh5zCZrBCfEfULSiQi0XIqa1GnXNuzpLzwTf6q1
 3q19B7iWoA0IWaEmeVT2ecBL+VLq/Hx1uWsGEkzDSW3VBuVp77YNKYJkmeSUrh5Y0Byg
 34Mg==
X-Gm-Message-State: AOAM5308ISlzpIPjnqSBYhfgEzykgixkcGm6jzeLTh+jQj79yTmTQSnZ
 gkK5sOt7s7DYPFa4mFq3Faw=
X-Google-Smtp-Source: ABdhPJyn2Hi8kaCYu+WokB25snaMIG+9Q6KwjeQoMDQJIrAIZd3JeXm641055Ca25Y6q1bD80UK2hA==
X-Received: by 2002:a17:90a:3009:: with SMTP id
 g9mr2332932pjb.82.1625607470831; 
 Tue, 06 Jul 2021 14:37:50 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id h14sm14343197pgv.47.2021.07.06.14.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 14:37:49 -0700 (PDT)
Date: Wed, 7 Jul 2021 06:37:39 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 4/4] bus: Make remove callback return void
Message-ID: <YOTMp88HfFiy6+RM@shinobu>
References: <20210706154803.1631813-1-u.kleine-koenig@pengutronix.de>
 <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VOubNWsj2sFIOkFX"
Content-Disposition: inline
In-Reply-To: <20210706154803.1631813-5-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Thu, 08 Jul 2021 12:04:26 +0200
Cc: nvdimm@lists.linux.dev, linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-fpga@vger.kernel.org,
 linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-cxl@vger.kernel.org, linux-mips@vger.kernel.org,
 target-devel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-acpi@vger.kernel.org, industrypack-devel@lists.sourceforge.net,
 linux-input@vger.kernel.org, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 greybus-dev@lists.linaro.org, platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-ntb@googlegroups.com,
 linuxppc-dev@lists.ozlabs.org
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


--VOubNWsj2sFIOkFX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 05:48:03PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
>=20
> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
>=20
> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.
>=20
> Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk> (For ARM, Am=
ba and related parts)
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Chen-Yu Tsai <wens@csie.org> (for drivers/bus/sunxi-rsb.c)
> Acked-by: Pali Roh=C3=A1r <pali@kernel.org>
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org> (for drivers/media)
> Acked-by: Hans de Goede <hdegoede@redhat.com> (For drivers/platform)
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-By: Vinod Koul <vkoul@kernel.org>
> Acked-by: Juergen Gross <jgross@suse.com> (For Xen)
> Acked-by: Lee Jones <lee.jones@linaro.org> (For drivers/mfd)
> Acked-by: Johannes Thumshirn <jth@kernel.org> (For drivers/mcb)
> Acked-by: Johan Hovold <johan@kernel.org>
> Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org> (For drive=
rs/slimbus)
> Acked-by: Kirti Wankhede <kwankhede@nvidia.com> (For drivers/vfio)
> Acked-by: Maximilian Luz <luzmaximilian@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com> (For ulpi and=
 typec)
> Acked-by: Samuel Iglesias Gons=C3=A1lvez <siglesias@igalia.com> (For ipac=
k)
> Reviewed-by: Tom Rix <trix@redhat.com> (For fpga)
> Acked-by: Geoff Levand <geoff@infradead.org> (For ps3)
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

>  drivers/base/isa.c                        | 4 +---

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

--VOubNWsj2sFIOkFX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmDkzSMACgkQhvpINdm7
VJLVFhAAyxEk2xOSRC1xhJSnjLQvNeb+KeTAJr+uaSAwwExERXcbGlIryhqCZSij
fZRzkvgPIscNAegWidvmuhZlhkFJPwvPArfhB/pFIDvQ1xX0kCPH3T51Lncu35Tf
vgluc4JhAW9+1UzoKZsv8RK4uY2ETRMBBeYs7epjqK2RhCvzG8rDMD+Dy49nxrYX
eNdmcR+7EcK8RjLmb/YEfNXxcXdDW0KlU5ATAh+PKuAPKbOKpoKfKuYsOYS7VrGJ
MAk5lC5J/bqbBWM4eqm+g5NbskWMr1N5WC60R7K3isMCoaEpnKNhSD3kvYIFe2Tf
mWyIE2c7D+UWhzbp+Kq4+DHzBN4ajLBy0oMd28HrGOQmD+/chjjc1zTOK9uNBvKz
xBRbxQl7OrAnKhUqcrgVpVL30EvTNajZIOZdwtGXhQCWW+MX747JE+H291VLg3gz
a0p6IJ8TS+gOgGGvmNjVg6yHYuKv6XDbDfI7tc0dRJUOoVqfbkIHSvAQQzn0LIFn
k/Ln4D8LDFj8X3fHbfz200+nzo9gwA5ZXhWXzvTKXhSEyBoc3+i+Ihn3bgYf6rI8
j8LozqWaWpNxaLMBrLuy06ldAuzhnQ7wPw1JuGXDAY1vdMYVVRp1XcbjBSqybXMA
weoaxx4Lwh05XikzxZpXDQBx5N+5V3sYRuqGrYs7H1ZUm0rT0I0=
=yTaM
-----END PGP SIGNATURE-----

--VOubNWsj2sFIOkFX--
