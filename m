Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4FB63386F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 10:29:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 242A91683;
	Tue, 22 Nov 2022 10:28:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 242A91683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669109353;
	bh=T3nU7r4TDRBfUE21qBPtx6/vbbqNd5aTZrUhEKVEpe8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DNvj9sEM3Peygi17DIBqudUrBwi0y404kfkfVkU+ExDJXUXYTIeLKQQ8+tIU1YYFV
	 HhJvU+duc6BSGT7T8/9glU4FWk6KDMGyr6zPHaqcTURyI3rHHC5fkZfqjvsvSojgxi
	 W31elVc1394dBxPN8L0QMZfYP9Pb3eWeTzOhctXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C01DDF80149;
	Tue, 22 Nov 2022 10:27:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF395F8026A; Sun, 20 Nov 2022 20:43:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8A69F800B5
 for <alsa-devel@alsa-project.org>; Sun, 20 Nov 2022 20:43:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8A69F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="eTDOl2wC"
Received: from mercury (unknown [185.209.196.162])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sre)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 981D16602381;
 Sun, 20 Nov 2022 19:43:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668973425;
 bh=T3nU7r4TDRBfUE21qBPtx6/vbbqNd5aTZrUhEKVEpe8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eTDOl2wCVRsu/tyZH+YPJZtqzX+lTk+zyDWIOt7B5OERtVQXV05JqgkECzvZaxhvq
 GWHynwzbAdTGjQc4EiizPb4JzuNJErOOA6MGMcIE1OOBJsR2nJxdyKqik4rZXW8I8S
 YL9hLYJH9B0qYNlv0ofE25pkedfO3Zr0ukRr6nTWoiYIF0ElBn0uG1ehB/KKpnJkB6
 LmHZCe95IKsjPugXIHsbUyR3TPbe/Uz/FTgEe5YV5fHfIiRZ+dwYB8lU4/MgAmu4vM
 BZjO4bgM9A0wAKu6Ub+wy7zE/lgrgtzyeA/1iFwakjmg/vd8UL0auYvToqpQCZqsxv
 +Bmg67/Ow+Rwg==
Received: by mercury (Postfix, from userid 1000)
 id 1C1D2106F223; Sun, 20 Nov 2022 20:43:43 +0100 (CET)
Date: Sun, 20 Nov 2022 20:43:43 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-ID: <20221120194343.nnpzhgjapep7iwqk@mercury.elektranox.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wvm2z6appxwdd5fa"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
X-Mailman-Approved-At: Tue, 22 Nov 2022 10:27:18 +0100
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-fbdev@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pm@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Grant Likely <grant.likely@linaro.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, Angel Iglesias <ang.iglesiasg@gmail.com>,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-crypto@vger.kernel.org,
 kernel@pengutronix.de, netdev@vger.kernel.org, linux-integrity@vger.kernel.org,
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


--wvm2z6appxwdd5fa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 18, 2022 at 11:35:34PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> since commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type") from 2016 there is a "temporary" alternative probe
> callback for i2c drivers.
>=20
> This series completes all drivers to this new callback (unless I missed
> something). It's based on current next/master.
> A part of the patches depend on commit 662233731d66 ("i2c: core:
> Introduce i2c_client_get_device_id helper function"), there is a branch t=
hat
> you can pull into your tree to get it:
>=20
> 	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client=
_device_id_helper-immutable
>=20
> I don't think it's feasable to apply this series in one go, so I ask the
> maintainers of the changed files to apply via their tree. I guess it
> will take a few kernel release iterations until all patch are in, but I
> think a single tree creates too much conflicts.
>=20
> The last patch changes i2c_driver::probe, all non-converted drivers will
> fail to compile then. So I hope the build bots will tell me about any
> driver I missed to convert. This patch is obviously not for application
> now.
>=20
> I dropped most individuals from the recipents of this mail to not
> challenge the mail servers and mailing list filters too much. Sorry if
> you had extra efforts to find this mail.
>=20
> Best regards
> Uwe

=2E..

>   power: supply: adp5061: Convert to i2c's .probe_new()
>   power: supply: bq2415x: Convert to i2c's .probe_new()
>   power: supply: bq24190: Convert to i2c's .probe_new()
>   power: supply: bq24257: Convert to i2c's .probe_new()
>   power: supply: bq24735: Convert to i2c's .probe_new()
>   power: supply: bq2515x: Convert to i2c's .probe_new()
>   power: supply: bq256xx: Convert to i2c's .probe_new()
>   power: supply: bq25890: Convert to i2c's .probe_new()
>   power: supply: bq25980: Convert to i2c's .probe_new()
>   power: supply: bq27xxx: Convert to i2c's .probe_new()
>   power: supply: ds2782: Convert to i2c's .probe_new()
>   power: supply: lp8727: Convert to i2c's .probe_new()
>   power: supply: ltc2941: Convert to i2c's .probe_new()
>   power: supply: ltc4162-l: Convert to i2c's .probe_new()
>   power: supply: max14656: Convert to i2c's .probe_new()
>   power: supply: max17040: Convert to i2c's .probe_new()
>   power: supply: max17042_battery: Convert to i2c's .probe_new()
>   power: supply: rt5033_battery: Convert to i2c's .probe_new()
>   power: supply: rt9455: Convert to i2c's .probe_new()
>   power: supply: sbs: Convert to i2c's .probe_new()
>   power: supply: sbs-manager: Convert to i2c's .probe_new()
>   power: supply: smb347: Convert to i2c's .probe_new()
>   power: supply: ucs1002: Convert to i2c's .probe_new()
>   power: supply: z2_battery: Convert to i2c's .probe_new()
>   [...]

Thanks, I queued patches 513-536 to the power-supply subsystem.

-- Sebastian

--wvm2z6appxwdd5fa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmN6g2YACgkQ2O7X88g7
+pocPA/+MG7rp45xJuAH0zlIFTM8ovBviXnLvra0hpvK+vMB8SVdh4K8vRCAoeoT
lxML9oRVfhraHzo/3X6+7V87cw+QzEx3GZbYsIasGqic46MoFYkbA2i3Q8s8hS5y
qpAcKn/efXJaBtdIxWQnOc0xU0YCiteiIik8Idb9MjHFupUspLxtIjCzTAmvKQ0k
hJ5u5cqv3d/MP6VpsOCUYPDet9nS9ByPeg8Kr9Ux1a0WEldPYUO+dU0ObqRdhliZ
agftaEtCvFYkfO9k8ubBL/x00gTn002xOB7gp+5s0V0D3wKfT5EPVYOoUZbeYMIu
QOZaLHkNkBtV85kGm18h7IFdQZQY9ahcaGTYZplyz/YzHlK/AlfjA2umKS1+rs5m
A+DDqnAkuWw9fLg0MJ4dLSPwOSPX3VfgmVS3By3Do2gotQkCqXsRdhrG1cIoE1aL
AZYpSwLTn2rAYF59poL3rgSqx/MhgrLwmKQOH3fjwZ3R7PIAWFhYP1We2UtKdCEM
Gjpr7QfAUiOuXDKi5OrBbWr4m2eX26A4uifwR62OyldwH8pUWAq3umgkw3rotQAA
hdwOOPM+cHTyLbtP8kaP1XSR6u0ybuTbw8OQE/XPDNVceoMqR4XxUSYbs0Q0UzY6
fwljGfbakuGbaNlb7s2LBsy0ESZuiz64Za/0gfJhI5rP1eNRR1U=
=Dh+o
-----END PGP SIGNATURE-----

--wvm2z6appxwdd5fa--
