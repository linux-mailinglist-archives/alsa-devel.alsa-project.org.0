Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2145C1ADD50
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 14:29:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B13B31660;
	Fri, 17 Apr 2020 14:28:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B13B31660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587126567;
	bh=+cO+m3yIT1pO8jo77oob6Y5HjW7rLaYa6L5veGV0RVQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mj5QBVazPxjjXP2bdduquvd16L6O1XPBH+D5e/vQ+pv06Bq3qIq0SyVo5ZpzG6J13
	 buk+QWMKlvYvfBxyXjJ2PS3tutcFO08UtOTtTWirLk8++jIDyvN+PX8eFd4DWgQFsy
	 e8moPyWJmR1OhSn4yjnhG8SltRePoIgVCB23j4sY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D983DF8025F;
	Fri, 17 Apr 2020 14:27:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EFECF80245; Fri, 17 Apr 2020 14:27:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C90BF800DE
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 14:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C90BF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZXo3YX/O"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BE8E21D94;
 Fri, 17 Apr 2020 12:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587126455;
 bh=+cO+m3yIT1pO8jo77oob6Y5HjW7rLaYa6L5veGV0RVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZXo3YX/OW9YcLuA4IUA5/tu/+YpLQDgR5vWB5TZzvpyjFfkFnJvTJoN5eRwvPs+wz
 zRiveQ/YOoGdMhE2d6zipSrH+UEIJWMrbWM3QdjOVFfPceMVCdIJkEqEYY8Wagt1sz
 HclQG70dtnXGK2G2NpLFbeEwfq3KjMgEWVohYmVU=
Date: Fri, 17 Apr 2020 13:27:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: next/master bisection: baseline.dmesg.alert on meson-sm1-sei610
Message-ID: <20200417122732.GC5315@sirena.org.uk>
References: <5e997ca0.1c69fb81.f69a1.620e@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline
In-Reply-To: <5e997ca0.1c69fb81.f69a1.620e@mx.google.com>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 tomeu.vizoso@collabora.com, khilman@baylibre.com, mgalka@collabora.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 guillaume.tucker@collabora.com, enric.balletbo@collabora.com,
 Jerome Brunet <jbrunet@baylibre.com>
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


--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 02:53:36AM -0700, kernelci.org bot wrote:

> next/master bisection: baseline.dmesg.alert on meson-sm1-sei610

> Summary:
>   Start:      a3ca59b9af21e Add linux-next specific files for 20200416
>   Plain log:  https://storage.kernelci.org//next/master/next-20200416/arm=
64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-sm=
1-sei610.txt
>   HTML log:   https://storage.kernelci.org//next/master/next-20200416/arm=
64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/baseline-meson-sm=
1-sei610.html
>   Result:     9b5db059366ae ASoC: soc-pcm: dpcm: Only allow playback/capt=
ure if supported

This change to check the playback and capture constraints is also
causing issues on at least Meson - I'm a bit worried that this is also
causing oopses here, not just audio problems so copying in Morimoto-san
too.  We should fix the things that are broken by this change since it's
a thing we should be able to rely on and do enforce for non-DPCm links
but I'm wondering if we should revert for 5.7 and reapply for 5.8.

Including complete report so people have it.

> Checks:
>   revert:     PASS
>   verify:     PASS

> Parameters:
>   Tree:       next
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git
>   Branch:     master
>   Target:     meson-sm1-sei610
>   CPU arch:   arm64
>   Lab:        lab-baylibre
>   Compiler:   gcc-8
>   Config:     defconfig+CONFIG_RANDOMIZE_BASE=3Dy
>   Test case:  baseline.dmesg.alert
>=20
> Breaking commit found:
>=20
> -------------------------------------------------------------------------=
------
> commit 9b5db059366ae2087e07892b5fc108f81f4ec189
> Author: Stephan Gerhold <stephan@gerhold.net>
> Date:   Wed Apr 15 12:49:28 2020 +0200
>=20
>     ASoC: soc-pcm: dpcm: Only allow playback/capture if supported
>    =20
>     At the moment, PCM devices for DPCM are only created based on the
>     dpcm_playback/capture parameters of the DAI link, without considering
>     if the CPU/FE DAI is actually capable of playback/capture.
>    =20
>     Normally the dpcm_playback/capture parameter should match the
>     capabilities of the CPU DAI. However, there is no way to set that
>     parameter from the device tree (e.g. with simple-audio-card or
>     qcom sound cards). dpcm_playback/capture are always both set to 1.
>    =20
>     This causes problems when the CPU DAI does only support playback
>     or capture. Attemting to open that PCM device with an unsupported
>     stream type then results in a null pointer dereference:
>    =20
>         Unable to handle kernel NULL pointer dereference at virtual addre=
ss 0000000000000128
>         Internal error: Oops: 96000044 [#1] PREEMPT SMP
>         CPU: 3 PID: 1582 Comm: arecord Not tainted 5.7.0-rc1
>         pc : invalidate_paths_ep+0x30/0xe0
>         lr : snd_soc_dapm_dai_get_connected_widgets+0x170/0x1a8
>         Call trace:
>          invalidate_paths_ep+0x30/0xe0
>          snd_soc_dapm_dai_get_connected_widgets+0x170/0x1a8
>          dpcm_path_get+0x38/0xd0
>          dpcm_fe_dai_open+0x70/0x920
>          snd_pcm_open_substream+0x564/0x840
>          snd_pcm_open+0xfc/0x228
>          snd_pcm_capture_open+0x4c/0x78
>          snd_open+0xac/0x1a8
>          ...
>    =20
>     ... because the DAI playback/capture_widget is not set in that case.
>    =20
>     We could add checks there to fix the problem (maybe we should
>     anyway), but much easier is to not expose the device as
>     playback/capture in the first place. Attemting to use that
>     device would always fail later anyway.
>    =20
>     Add checks for snd_soc_dai_stream_valid() to the DPCM case
>     to avoid exposing playback/capture if it is not supported.
>    =20
>     Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>     Link: https://lore.kernel.org/r/20200415104928.86091-1-stephan@gerhol=
d.net
>     Signed-off-by: Mark Brown <broonie@kernel.org>
>=20
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 289aebc155293..1f302de440525 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2911,8 +2911,17 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, i=
nt num)
>  	int i;
> =20
>  	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
> -		playback =3D rtd->dai_link->dpcm_playback;
> -		capture =3D rtd->dai_link->dpcm_capture;
> +		cpu_dai =3D asoc_rtd_to_cpu(rtd, 0);
> +		if (rtd->num_cpus > 1) {
> +			dev_err(rtd->dev,
> +				"DPCM doesn't support Multi CPU yet\n");
> +			return -EINVAL;
> +		}
> +
> +		playback =3D rtd->dai_link->dpcm_playback &&
> +			   snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK);
> +		capture =3D rtd->dai_link->dpcm_capture &&
> +			  snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE);
>  	} else {
>  		/* Adapt stream for codec2codec links */
>  		int cpu_capture =3D rtd->dai_link->params ?
> -------------------------------------------------------------------------=
------
>=20
>=20
> Git bisection log:
>=20
> -------------------------------------------------------------------------=
------
> git bisect start
> # good: [87b0f983f66f23762921129fd35966eddc3f2dae] net: mscc: ocelot: fix=
 untagged packet drops when enslaving to vlan aware bridge
> git bisect good 87b0f983f66f23762921129fd35966eddc3f2dae
> # bad: [a3ca59b9af21e68069555ffff1ad89bd2a7c40fc] Add linux-next specific=
 files for 20200416
> git bisect bad a3ca59b9af21e68069555ffff1ad89bd2a7c40fc
> # bad: [feb09551bfe34ccf0ba462188a1aee651be0f2c3] Merge remote-tracking b=
ranch 'i2c/i2c/for-next'
> git bisect bad feb09551bfe34ccf0ba462188a1aee651be0f2c3
> # good: [a4721ced760684d1776bf31f7925aa41bb3f4846] Merge v5.7-rc1 into dr=
m-misc-fixes
> git bisect good a4721ced760684d1776bf31f7925aa41bb3f4846
> # bad: [e75043c693af6a10c9e2087adeef243cf05ce3bd] Merge remote-tracking b=
ranch 'rockchip/for-next'
> git bisect bad e75043c693af6a10c9e2087adeef243cf05ce3bd
> # bad: [08a315860a1b462fef5969d2e6ab4cdab26df8e3] Merge remote-tracking b=
ranch 'arm-soc/for-next'
> git bisect bad 08a315860a1b462fef5969d2e6ab4cdab26df8e3
> # bad: [80dbfa57508c36c2b3798b387ef3eb92954b9c09] Merge remote-tracking b=
ranch 'slave-dma-fixes/fixes'
> git bisect bad 80dbfa57508c36c2b3798b387ef3eb92954b9c09
> # good: [a723380c6f0a3723db72da6c6097b32b23f5564c] Merge remote-tracking =
branch 'sound-current/for-linus'
> git bisect good a723380c6f0a3723db72da6c6097b32b23f5564c
> # bad: [5bd70440cb0a6f5c6a84019bb2aa93ab8310a5cd] ASoC: soc-dai: revert a=
ll changes to DAI startup/shutdown sequence
> git bisect bad 5bd70440cb0a6f5c6a84019bb2aa93ab8310a5cd
> # good: [4d1a015a203c0249e3332ea217a38ec978118daa] ASoC: convert rockchip=
 spdif bindings to yaml
> git bisect good 4d1a015a203c0249e3332ea217a38ec978118daa
> # good: [0f2a3b02274c02eb97697c4d89c019d1d21ac225] ASoC: wsa881x: mark re=
ad_only_wordlength flag
> git bisect good 0f2a3b02274c02eb97697c4d89c019d1d21ac225
> # good: [aa7812737f2877e192d57626cbe8825cc7cf6de9] ASoC: sgtl5000: Fix VA=
G power-on handling
> git bisect good aa7812737f2877e192d57626cbe8825cc7cf6de9
> # bad: [0c824ec094b5cda766c80d88c2036e28c24a4cb1] ASoC: q6dsp6: q6afe-dai=
: add missing channels to MI2S DAIs
> git bisect bad 0c824ec094b5cda766c80d88c2036e28c24a4cb1
> # bad: [9b5db059366ae2087e07892b5fc108f81f4ec189] ASoC: soc-pcm: dpcm: On=
ly allow playback/capture if supported
> git bisect bad 9b5db059366ae2087e07892b5fc108f81f4ec189
> # first bad commit: [9b5db059366ae2087e07892b5fc108f81f4ec189] ASoC: soc-=
pcm: dpcm: Only allow playback/capture if supported
> -------------------------------------------------------------------------=
------

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6ZoLMACgkQJNaLcl1U
h9Dj+wf/fkhQhxPx7tkyDksIQGIeynmpn6Tv+GT73ZT9z5WPAqpfUj22Nu4XXDvC
t5ip7wivTDsysWHemDSI8l1dLJo1XF2N3SxBIKm3sFg5ZRLLYpHg8+ctVh9oJgLl
7/J1KD8fJrsVpP5f1AaxdPpVgODROBGzuz4Lb9JZmaO9e9ZdZrnQChN81DeRp1kW
WsyGSa+ZmyuSg8owd/qd3VKI9ImSyzduGAWDrC9mXnGGcJu69W6oW7Q/fcGj4yee
/iG7zqmE2/DAlQqPRhsXNkbEWGH3sOjclx6Qhq26HWA7nLaDg91Mb3qpejS7PjwP
V3QhYNO2rRr44ETzqEHvKg0Ypf98VQ==
=NfT9
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
