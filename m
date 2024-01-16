Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E51782F4E4
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 20:03:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F05EB7F8;
	Tue, 16 Jan 2024 20:03:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F05EB7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705431799;
	bh=uEs+RMO6rQt206PpnddhCgxZJue2xXnGJSwB1Of8DlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JJpyZHeW80MUJ7G8YlZHeP7V9LsHXm/s5hJjYDtwtxANZn0dgH5f2LXkIbeicT0lV
	 yWcSZHf0dZjhNSIYAyGsKXHSQNwYk5Z1xjeirj0r7vhpBYi0BwGk4vZ72nU7RNIJLb
	 tYvhNOvX5C0v3m66aMQYX6QSANRuppWMF5KEkrqY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E61F9F805A0; Tue, 16 Jan 2024 20:02:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 161E6F8057C;
	Tue, 16 Jan 2024 20:02:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8BA5F801F5; Tue, 16 Jan 2024 20:02:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3AC9F800C1
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 20:02:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3AC9F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qPK36bAm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 592B6CE1ADB;
	Tue, 16 Jan 2024 19:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2C0C433C7;
	Tue, 16 Jan 2024 19:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705431743;
	bh=uEs+RMO6rQt206PpnddhCgxZJue2xXnGJSwB1Of8DlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPK36bAmWIJxGhrTPZu9Xux5GIH76VazqGjEoGrHe8G+UmTfYl7g37FrCVfvO0B0x
	 zW5tlj6v7diIYy5hutBTDcLhfDtiYWIlKYzecobnY2RVTHNOuO26zYGI0VjkGtZG76
	 guot39bb6PWn3HcVXI6Q/JSyLBEE8NMbRcrntU3mbVdKbjTHnO04QkGqAo8ETsAldQ
	 VEhXFd1TNaL17ZAE3eoiOkfZuW0veiCjwe+lH6BSmSvNnGWE71ncV/sravP/vVWRWg
	 YwrlgGTXNgfL23S4aONnyTil9niMy0huPn6bB6YEgPfuVaUdLEVR4Hqs2FT96ErJuL
	 lbyJKQtmKP07g==
Date: Tue, 16 Jan 2024 19:02:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernelci-results@groups.io, bot@kernelci.org, stable@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: kernelci/kernelci.org bisection:
 baseline-nfs.bootrr.deferred-probe-empty on at91sam9g20ek
Message-ID: <845b3053-d47b-4717-9665-79b120da133b@sirena.org.uk>
References: <65a6ca18.170a0220.9f7f3.fa9a@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1b1GUrukrkmjRG8w"
Content-Disposition: inline
In-Reply-To: <65a6ca18.170a0220.9f7f3.fa9a@mx.google.com>
X-Cookie: If it ain't broke, don't fix it.
Message-ID-Hash: 23VFW53RYWKDNOV5N3NF235N2GRSW6HA
X-Message-ID-Hash: 23VFW53RYWKDNOV5N3NF235N2GRSW6HA
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/23VFW53RYWKDNOV5N3NF235N2GRSW6HA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--1b1GUrukrkmjRG8w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 10:25:28AM -0800, KernelCI bot wrote:

The KernelCI bisection bot has identified bc7d0133181e5f33aca ("ASoC:
atmel: Remove system clock tree configuration for at91sam9g20ek") from
the v5.15 stable tree as causing something to fail to probe on
at91sam9g20ek, most likely the audio driver though I didn't pull the
logs to verify.  The commit isn't a particularly obvious one for
backporting.

Full bisection report below.

> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>=20
> kernelci/kernelci.org bisection: baseline-nfs.bootrr.deferred-probe-empty=
 on at91sam9g20ek
>=20
> Summary:
>   Start:      bd7e92d593935 kernelci-20240116.0
>   Plain log:  https://storage.kernelci.org/kernelci/kernelci.org/kernelci=
-20240116.0/arm/multi_v5_defconfig/gcc-10/lab-broonie/baseline-nfs-at91sam9=
g20ek.txt
>   HTML log:   https://storage.kernelci.org/kernelci/kernelci.org/kernelci=
-20240116.0/arm/multi_v5_defconfig/gcc-10/lab-broonie/baseline-nfs-at91sam9=
g20ek.html
>   Result:     bc7d0133181e5 ASoC: atmel: Remove system clock tree configu=
ration for at91sam9g20ek
>=20
> Checks:
>   revert:     PASS
>   verify:     PASS
>=20
> Parameters:
>   Tree:       kernelci
>   URL:        https://github.com/kernelci/linux.git
>   Branch:     kernelci.org
>   Target:     at91sam9g20ek
>   CPU arch:   arm
>   Lab:        lab-broonie
>   Compiler:   gcc-10
>   Config:     multi_v5_defconfig
>   Test case:  baseline-nfs.bootrr.deferred-probe-empty
>=20
> Breaking commit found:
>=20
> -------------------------------------------------------------------------=
------
> commit bc7d0133181e5f33ac33ca4f6bb2bce876c8ad88
> Author: Mark Brown <broonie@kernel.org>
> Date:   Fri Mar 25 15:42:39 2022 +0000
>=20
>     ASoC: atmel: Remove system clock tree configuration for at91sam9g20ek
>    =20
>     [ Upstream commit c775cbf62ed4911e4f0f23880f01815753123690 ]
>    =20
>     The MCLK of the WM8731 on the AT91SAM9G20-EK board is connected to the
>     PCK0 output of the SoC, intended in the reference software to be supp=
lied
>     using PLLB and programmed to 12MHz. As originally written for use wit=
h a
>     board file the audio driver was responsible for configuring the entir=
e tree
>     but in the conversion to the common clock framework the registration =
of
>     the named pck0 and pllb clocks was removed so the driver has failed to
>     instantiate ever since.
>    =20
>     Since the WM8731 driver has had support for managing a MCLK provided =
via
>     the common clock framework for some time we can simply drop all the c=
lock
>     management code from the machine driver other than configuration of t=
he
>     sysclk rate, the CODEC driver still respects that configuration from =
the
>     machine driver.
>    =20
>     Fixes: ff78a189b0ae55f ("ARM: at91: remove old at91-specific clock dr=
iver")
>     Signed-off-by: Mark Brown <broonie@kernel.org>
>     Reviewed-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
>     Link: https://lore.kernel.org/r/20220325154241.1600757-2-broonie@kern=
el.org
>     Signed-off-by: Sasha Levin <sashal@kernel.org>
>=20
> diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_w=
m8731.c
> index 8a55d59a6c2aa..d243de5f23dc1 100644
> --- a/sound/soc/atmel/sam9g20_wm8731.c
> +++ b/sound/soc/atmel/sam9g20_wm8731.c
> @@ -46,35 +46,6 @@
>   */
>  #undef ENABLE_MIC_INPUT
> =20
> -static struct clk *mclk;
> -
> -static int at91sam9g20ek_set_bias_level(struct snd_soc_card *card,
> -					struct snd_soc_dapm_context *dapm,
> -					enum snd_soc_bias_level level)
> -{
> -	static int mclk_on;
> -	int ret =3D 0;
> -
> -	switch (level) {
> -	case SND_SOC_BIAS_ON:
> -	case SND_SOC_BIAS_PREPARE:
> -		if (!mclk_on)
> -			ret =3D clk_enable(mclk);
> -		if (ret =3D=3D 0)
> -			mclk_on =3D 1;
> -		break;
> -
> -	case SND_SOC_BIAS_OFF:
> -	case SND_SOC_BIAS_STANDBY:
> -		if (mclk_on)
> -			clk_disable(mclk);
> -		mclk_on =3D 0;
> -		break;
> -	}
> -
> -	return ret;
> -}
> -
>  static const struct snd_soc_dapm_widget at91sam9g20ek_dapm_widgets[] =3D=
 {
>  	SND_SOC_DAPM_MIC("Int Mic", NULL),
>  	SND_SOC_DAPM_SPK("Ext Spk", NULL),
> @@ -135,7 +106,6 @@ static struct snd_soc_card snd_soc_at91sam9g20ek =3D {
>  	.owner =3D THIS_MODULE,
>  	.dai_link =3D &at91sam9g20ek_dai,
>  	.num_links =3D 1,
> -	.set_bias_level =3D at91sam9g20ek_set_bias_level,
> =20
>  	.dapm_widgets =3D at91sam9g20ek_dapm_widgets,
>  	.num_dapm_widgets =3D ARRAY_SIZE(at91sam9g20ek_dapm_widgets),
> @@ -148,7 +118,6 @@ static int at91sam9g20ek_audio_probe(struct platform_=
device *pdev)
>  {
>  	struct device_node *np =3D pdev->dev.of_node;
>  	struct device_node *codec_np, *cpu_np;
> -	struct clk *pllb;
>  	struct snd_soc_card *card =3D &snd_soc_at91sam9g20ek;
>  	int ret;
> =20
> @@ -162,31 +131,6 @@ static int at91sam9g20ek_audio_probe(struct platform=
_device *pdev)
>  		return -EINVAL;
>  	}
> =20
> -	/*
> -	 * Codec MCLK is supplied by PCK0 - set it up.
> -	 */
> -	mclk =3D clk_get(NULL, "pck0");
> -	if (IS_ERR(mclk)) {
> -		dev_err(&pdev->dev, "Failed to get MCLK\n");
> -		ret =3D PTR_ERR(mclk);
> -		goto err;
> -	}
> -
> -	pllb =3D clk_get(NULL, "pllb");
> -	if (IS_ERR(pllb)) {
> -		dev_err(&pdev->dev, "Failed to get PLLB\n");
> -		ret =3D PTR_ERR(pllb);
> -		goto err_mclk;
> -	}
> -	ret =3D clk_set_parent(mclk, pllb);
> -	clk_put(pllb);
> -	if (ret !=3D 0) {
> -		dev_err(&pdev->dev, "Failed to set MCLK parent\n");
> -		goto err_mclk;
> -	}
> -
> -	clk_set_rate(mclk, MCLK_RATE);
> -
>  	card->dev =3D &pdev->dev;
> =20
>  	/* Parse device node info */
> @@ -230,9 +174,6 @@ static int at91sam9g20ek_audio_probe(struct platform_=
device *pdev)
> =20
>  	return ret;
> =20
> -err_mclk:
> -	clk_put(mclk);
> -	mclk =3D NULL;
>  err:
>  	atmel_ssc_put_audio(0);
>  	return ret;
> @@ -242,8 +183,6 @@ static int at91sam9g20ek_audio_remove(struct platform=
_device *pdev)
>  {
>  	struct snd_soc_card *card =3D platform_get_drvdata(pdev);
> =20
> -	clk_disable(mclk);
> -	mclk =3D NULL;
>  	snd_soc_unregister_card(card);
>  	atmel_ssc_put_audio(0);
> -------------------------------------------------------------------------=
------
>=20
>=20
> Git bisection log:
>=20
> -------------------------------------------------------------------------=
------
> git bisect start
> # good: [8bb7eca972ad531c9b149c0a51ab43a417385813] Linux 5.15
> git bisect good 8bb7eca972ad531c9b149c0a51ab43a417385813
> # bad: [bd7e92d593935dd5324b1a129a4753ab866fa8fc] kernelci-20240116.0
> git bisect bad bd7e92d593935dd5324b1a129a4753ab866fa8fc
> # bad: [5a7a5b2edac4b05abd744eeaebda46d9dacd952d] drm/radeon: add a force=
 flush to delay work when radeon
> git bisect bad 5a7a5b2edac4b05abd744eeaebda46d9dacd952d
> # good: [157a22ca80c50f64c495767331045d501c9ff013] staging:iio:adc:ad7280=
a: Fix handing of device address bit reversing.
> git bisect good 157a22ca80c50f64c495767331045d501c9ff013
> # bad: [e0199ce728fb98a96a20136a5edb11c160d3151f] drm/amd/pm: Fix missing=
 thermal throttler status
> git bisect bad e0199ce728fb98a96a20136a5edb11c160d3151f
> # bad: [fa189827f00c67b8ac2c396ee79d767c6a9ad6b9] netlink: do not reset t=
ransport header in netlink_recvmsg()
> git bisect bad fa189827f00c67b8ac2c396ee79d767c6a9ad6b9
> # good: [56e44ff13d841cbb8638e7ec7759240a556752cd] ALSA: sonicvibes: Fix =
the missing snd_card_free() call at probe error
> git bisect good 56e44ff13d841cbb8638e7ec7759240a556752cd
> # bad: [858d93280e83561997cc06f5318ac22464d2bae0] serial: imx: fix overru=
n interrupts in DMA mode
> git bisect bad 858d93280e83561997cc06f5318ac22464d2bae0
> # bad: [84e77e72367f6f2d293b80b18da84d587e86382f] dmaengine: dw-edma: Fix=
 unaligned 64bit access
> git bisect bad 84e77e72367f6f2d293b80b18da84d587e86382f
> # good: [eab8e585840f84c6a352eaab70e5495eda7ebb6f] drm/amd/display: Enabl=
e power gating before init_pipes
> git bisect good eab8e585840f84c6a352eaab70e5495eda7ebb6f
> # good: [cbdd7a33c533e03404d51071af1e056ce3716caf] dt-bindings: net: snps=
: remove duplicate name
> git bisect good cbdd7a33c533e03404d51071af1e056ce3716caf
> # good: [935745abcf4c695a18b9af3fbe295e322547a114] vfs: make sync_filesys=
tem return errors from ->sync_fs
> git bisect good 935745abcf4c695a18b9af3fbe295e322547a114
> # good: [ba9e9a794fd1689bf7e8a7452c55f3d3cbda7728] net/sched: cls_u32: fi=
x netns refcount changes in u32_change()
> git bisect good ba9e9a794fd1689bf7e8a7452c55f3d3cbda7728
> # bad: [9a4c63e7332c8303265e559a0b52acf9e3ab2148] ASoC: rk817: Use devm_c=
lk_get() in rk817_platform_probe
> git bisect bad 9a4c63e7332c8303265e559a0b52acf9e3ab2148
> # good: [236785649ad2e027ccdaa6ee888c4a5571473eb9] ALSA: hda/realtek: Add=
 quirk for Clevo NP70PNP
> git bisect good 236785649ad2e027ccdaa6ee888c4a5571473eb9
> # bad: [bc15442cc99f054f7b2703db147099b7fe6bba69] ASoC: topology: Correct=
 error handling in soc_tplg_dapm_widget_create()
> git bisect bad bc15442cc99f054f7b2703db147099b7fe6bba69
> # bad: [bc7d0133181e5f33ac33ca4f6bb2bce876c8ad88] ASoC: atmel: Remove sys=
tem clock tree configuration for at91sam9g20ek
> git bisect bad bc7d0133181e5f33ac33ca4f6bb2bce876c8ad88
> # first bad commit: [bc7d0133181e5f33ac33ca4f6bb2bce876c8ad88] ASoC: atme=
l: Remove system clock tree configuration for at91sam9g20ek
> -------------------------------------------------------------------------=
------
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#50028): https://groups.io/g/kernelci-results/message/=
50028
> Mute This Topic: https://groups.io/mt/103768621/1131744
> Group Owner: kernelci-results+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci-results/unsub [broonie@kernel.o=
rg]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20

--1b1GUrukrkmjRG8w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWm0roACgkQJNaLcl1U
h9Bo9Qf/eRLQyGWOm70BJo2jeAe5s9NYzbYmOzGQBc0nP/vuAMrSQzdusaD85qti
o9YCbsY8h5CYbIZG6e923zp36O1UIkb07bbFyGGcy8KPW+Ac4sbdEg5LFWkCEF2c
IwS95LBIQI0nQP4xTGHDqmCZ5jfKi7tonvMQI8E5n/4He7AjBROx7Jiq7M533CeK
EAyEi/+j1m5b17ygAdriObx5V14ohDlhwCNGF/FYV+zU9vuiazFgBmW1cXC9AnXU
LTyDTlDrOEy6ioNDpGJ9JZuGDwEH8bMb+LR8xSdcQEI86UVxzza9h06Q87PLkggW
Q3j+Drcw9RPGSwcGwR0ZuzaWmf1AJQ==
=ir/1
-----END PGP SIGNATURE-----

--1b1GUrukrkmjRG8w--
