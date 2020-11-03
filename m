Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3F72A460A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 14:14:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 766AA17CB;
	Tue,  3 Nov 2020 14:13:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 766AA17CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604409265;
	bh=M+XGL1TF6rEHXAM9ztMrosxOcLuRdxKMEc4oded8c+Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r9TKJF5NIMI3JKaUw2YhmdF8hoSQ4DHOtReW38OcCH6d4J3pqjNEJASDzKk85Mm79
	 yg1NKnXsOqhonlZstUNGZ9mX642ISprIND7zbenuZEazExDrKT4KN/p/nSRFVZ/c1k
	 lvvtRym5bzuEOUPQctXXofU8N5hk//ZlaTQthsPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9ED7F802A9;
	Tue,  3 Nov 2020 14:13:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B7B7F8028D; Tue,  3 Nov 2020 14:13:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CA6AF80171
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 14:13:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CA6AF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HRYPhdLk"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB6F221534;
 Tue,  3 Nov 2020 13:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604409183;
 bh=M+XGL1TF6rEHXAM9ztMrosxOcLuRdxKMEc4oded8c+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HRYPhdLk8vpV9wiwTnjT5L1S7ABv/TIk1BabOLB+piUq4y1c8Q9idXD10K9znzYHm
 UCdDpAGpIKx9sWTqSQEEhEJFcKq4jie0saveXB+V5eu4WQ1AM+79WniSfAhjvdBwZl
 UmXH/mC2kMH3mR1R4YQaOYx/7PQTzICl8hur41wI=
Date: Tue, 3 Nov 2020 13:12:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Perry Yuan <Perry.Yuan@dell.com>
Subject: Re: [PATCH] ASoC: rt715:add Mic Mute LED control support
Message-ID: <20201103131253.GA5545@sirena.org.uk>
References: <20201103125859.8759-1-Perry_Yuan@Dell.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <20201103125859.8759-1-Perry_Yuan@Dell.com>
X-Cookie: I don't get no respect.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Limonciello Mario <Mario.Limonciello@dell.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com
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


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2020 at 04:58:59AM -0800, Perry Yuan wrote:
> From: perry_yuan <perry_yuan@dell.com>
>=20
> Some new Dell system is going to support audio internal micphone
> privacy setting from hardware level with micmute led state changing
>=20
> This patch allow to change micmute led state through this micphone
> led control interface like hda_generic provided.

If this is useful it should be done at the subsystem level rather than
open coded in a specific CODEC driver, however I don't undersand why it
is.

> +static int rt715_micmute_led_mode_put(struct snd_kcontrol *kcontrol,
> +      struct snd_ctl_elem_value *ucontrol)
> +{
> +    struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +    struct rt715_priv *rt715 =3D snd_soc_component_get_drvdata(component=
);
> +    int led_mode =3D ucontrol->value.integer.value[0];
> +
> +    rt715->micmute_led =3D led_mode;
> +#if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)
> +    ledtrig_audio_set(LED_AUDIO_MICMUTE,
> +               rt715->micmute_led ? LED_ON : LED_OFF);
> +#endif
> +  return 0;
> +}

This is just adding a userspace API to set a LED via the standard LED
APIs.  Since the LED subsystem already has a perfectly good userspace
API why not use that?  There is no visible value in this being in the
sound subsystem.

Please also follow the kernel coding style, your code doesn't visually
resemble the adjacent code.

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+hV1UACgkQJNaLcl1U
h9AGAgf+IGVQYbKrvIHSUvGOYs9tp4WUFSmNglhd7Ud3/tdlsnPO/aeUFkBN4Yja
kHuwFCBDhVuOCfuDIX8MbRSeNMAidm8lwbcDiyl86HMWrbLKREut/8x2xzPfBwJ+
juSi/fxeWR+2+QnlsTEy7skHLgQuSyimWjPAC5og6c6df00EooJWtngXe1F5WZNz
vFzBW/pfVQjh/ms+RnSBGETqse51SslYWgtNhXINqqKGDNXi/EOsXxsJFCJxpEWC
xV6OWz3KWnDs53nDHL3nQuZauSHaQYJwhg5IRxqWZUb49UHOCzljejgsCXj0A4eP
k4C44Dcr5APTlkcwicbW0BrAOX635g==
=lmo/
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
