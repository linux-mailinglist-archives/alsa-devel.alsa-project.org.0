Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBBE2F37BB
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 18:56:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5985216B3;
	Tue, 12 Jan 2021 18:55:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5985216B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610474184;
	bh=1FGZ5YRyYoYsT8ENZ23oRCtaZ1Q53Ycq2i0Ai2+Fwb0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bJHIyu1h7Gg0MKdRxf6pe7GRKclDR0MGvZLlRLX4TJ8yg8635UeF78QuEBjG/TyJU
	 HgDx0WouWwdDSoiRe4lkx/jTAOzvvys1l6SFqrXOkJ2Rmiwhb9jka43oFDauoTFLEH
	 8QrIn1PCWCBH4Tl3Z70aGc6yLWECEyxDc7ENss7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D62AF800B9;
	Tue, 12 Jan 2021 18:54:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF3A3F8025E; Tue, 12 Jan 2021 18:54:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3570F800EB
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 18:54:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3570F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IpOfZiUL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEA222311D;
 Tue, 12 Jan 2021 17:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610474080;
 bh=1FGZ5YRyYoYsT8ENZ23oRCtaZ1Q53Ycq2i0Ai2+Fwb0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IpOfZiULlBbkKHWoLhOotg9SNAhYE+XoY70SNtvL9uLcHLQxaHMyHh4PAfsjcaZll
 AbqW21Ifo520DGrMR8NLx67i3gyeUocA/3JgqCYGVXdCm1WVfsp6RTWACT/5IN83mC
 gylXfmJcOpWGQn37Lty61hQHAUbRmss4ywcEpkKWwkMDQ7jGYox0n09QBbubPGCTaG
 YGIei1zNvu3ewVjUJNkhArLsZ002nnQuUDHO37W+IBVFZ31+6hUravjPbtP52BlHoO
 I1I/6fimNm/cxwjQtVGOLYA23g5rei8HoCxH3HVuB6w2izAzB7OLx90D3h+1v0Iy4k
 uEY6Mi3IRxZLg==
Date: Tue, 12 Jan 2021 17:54:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Perry Yuan <Perry.Yuan@dell.com>
Subject: Re: [PATCH v3 3/3] ASoC: rt715:add micmute led state control supports
Message-ID: <20210112175406.GF4646@sirena.org.uk>
References: <20210112171814.5404-1-Perry_Yuan@Dell.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aZoGpuMECXJckB41"
Content-Disposition: inline
In-Reply-To: <20210112171814.5404-1-Perry_Yuan@Dell.com>
X-Cookie: Stay away from hurricanes for a while.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, mgross@linux.intel.com,
 Mario.Limonciello@dell.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, platform-driver-x86@vger.kernel.org, hdegoede@redhat.com
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


--aZoGpuMECXJckB41
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 01:18:14AM +0800, Perry Yuan wrote:

> Some new Dell system is going to support audio internal micphone
> privacy setting from hardware level with micmute led state changing
> When micmute hotkey pressed by user, soft mute will need to be enabled
> firstly in case of pop noise, and codec driver need to react to mic
> mute event to EC(embedded controller) notifying that SW mute is completed
> Then EC will do the hardware mute physically within the timeout reached

> This patch allow codec rt715 driver to ack EC when micmute key pressed
> through this micphone led control interface like hda_generic provided
> ACPI method defined in dell-privacy micmute led trigger will be called
> for notifying the EC that software mute has been completed

It feels like there's an abstraction problem here with this being hard
coded in a specific CODEC driver.

>  #include <linux/soundwire/sdw.h>
> @@ -244,6 +245,7 @@ static int rt715_sdca_get_volsw(struct snd_kcontrol *=
kcontrol,
>  	unsigned int max =3D mc->max;
>  	int val;
> =20
> +	pr_err("++++++rt715_sdca_get_volsw++\n");
>  	val =3D snd_soc_component_read(component, mc->reg);
>  	if (val < 0)
>  		return -EINVAL;

This shouldn't be in the patch.

> @@ -287,6 +291,18 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol =
*kcontrol,
>  			return err;
>  	}
> =20
> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
> +	/* dell privacy LED trigger state changed by muted/unmute switch */
> +	if (mc->invert) {
> +		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[=
1]) {
> +			rt715->micmute_led =3D LED_OFF;
> +		} else {
> +			rt715->micmute_led =3D LED_ON;
> +		}
> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led);
> +	}
> +#endif
> +

This doesn't look good.  There's nothing Dell specific here, and nothing
about this is conditional on any sort of runtime detection of Dell
systems, it's not obvious why this is conditional on DELL_PRIVACY or why
we only report the state if the control is inverted.

I'm also not convinced that it's a good idea to set the mute LED if only
one channel in a stereo microphone is muted, that seems likely to lead
to surprising behaviour for users.

TBH I don't understand why this isn't being done in generic code.

> +	bool micmute_led;

What is this for, it never seems to be read except for in the function
where it's set?

--aZoGpuMECXJckB41
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/94j0ACgkQJNaLcl1U
h9BbyAf/ZlFlV56S+eSk4TW9LTEcwFtqLC40UMS40vmYqaYsmy7Tl7NWCnDY36Qz
TjyUZN9acHq9Xz4a+z7S6x8yPyFbk0KmS98l7xs429tjfck5SpAoPsWGOLuVPcEX
5Nmiq/HUR+Y213AAyOkXjRnVuBA6K6ipQdQ4mM699wW+Mm3ISPcCl+RcK7A73ptH
fKCGq9ETOZXN4fSLz8IWNBjFcCUU2MLAvznCZRlX2ALwhgXHHTIAmsZsai48y88Y
v/H7x/T2Gpc4w8La9V9nhmA7TGsdWSDGCD0BJe1Fglrv2rA9g6/uOuBTTpFd8zzl
9QKo07FI/WjO9dOD4nHnqLiiJb0Mrg==
=uHEo
-----END PGP SIGNATURE-----

--aZoGpuMECXJckB41--
