Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF0E6C8FFA
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Mar 2023 19:13:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3117DF4;
	Sat, 25 Mar 2023 19:12:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3117DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679768011;
	bh=CajaQHBsxDOFeWJ2Z4uhMq5fkuJ8Vq6DMecim34eK/g=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kLK/IezPd3NIoDB8yvOuJL1bLEhI6IzDKsBmYGZbC+Lp3pkJrdt5zE/YIXXhYRhFi
	 sVs5yuxoB4KuP7S5nOXybI0WLsUg8kOEoVfYjVYxdDTrjrIIKP5VWQoVKyIFBzwYZ6
	 4pT/NwdK4/lMvLgnYkR0MWuifNu5J5FZJzuLbmcs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59204F8027B;
	Sat, 25 Mar 2023 19:12:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85C97F802E8; Sat, 25 Mar 2023 19:12:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3854CF800C9
	for <alsa-devel@alsa-project.org>; Sat, 25 Mar 2023 19:12:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3854CF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mUCM6GRA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4641DCE049A;
	Sat, 25 Mar 2023 18:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE99C433D2;
	Sat, 25 Mar 2023 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679767946;
	bh=CajaQHBsxDOFeWJ2Z4uhMq5fkuJ8Vq6DMecim34eK/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mUCM6GRAikDeM9qfa7PiMJ/0Dw+GRabGMDc4q3NX0t/nsMJnQzpoROwQ0SkKcPyUq
	 VR65LV/hVTQkSw+4J8V0XeKmu6ncB0RkxNW1oCexmX0XIoe7foBNVYvz/RrrQL3YUH
	 CAhHltUbyW8gpA1WcvHnkmMuRKEfzS3FoUjftPyce/BEoRwmn9FUf6S/M5yvV6tpBu
	 DZwww6l2sDKaS3QTi/VhYAv4LKMfgE54KL5TZA0G8zt4yRQ/Ys0fRT4aLuj8OM88ng
	 IcI9mrgVU40MqYCT4JqVDRVbNchp98sZKx89mfJELQRBjNaE1tr9DjIRlTuFkW6y7g
	 Ksp/Fwvdy5BqA==
Date: Sat, 25 Mar 2023 18:12:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Dylan Van Assche <me@dylanvanassche.be>
Subject: Re: [PATCH v3 1/1] sound: soc: codecs: wcd-mbhc-v2: expose ALSA
 control for jack
Message-ID: <ZB85h55to1MsQnnh@sirena.org.uk>
References: <20230325142142.24337-1-me@dylanvanassche.be>
 <20230325142142.24337-2-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BY1KhK6s61gDAstw"
Content-Disposition: inline
In-Reply-To: <20230325142142.24337-2-me@dylanvanassche.be>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: 6M4TRNLWERJHHQXI5E5VUEAH7BD22XJ6
X-Message-ID-Hash: 6M4TRNLWERJHHQXI5E5VUEAH7BD22XJ6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Banajit Goswami <bgoswami@quicinc.com>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Joel Selvaraj <joelselvaraj.oss@gmail.com>,
 Caleb Connolly <caleb@connolly.tech>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6M4TRNLWERJHHQXI5E5VUEAH7BD22XJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--BY1KhK6s61gDAstw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 25, 2023 at 03:21:42PM +0100, Dylan Van Assche wrote:

> =20
>  	mutex_lock(&mbhc->lock);
> =20
> +	ret =3D snd_jack_add_new_kctl(mbhc->jack->jack, "Headset Jack", WCD_MBH=
C_JACK_MASK);
> +	if (ret)
> +		dev_warn(component->dev, "failed creating Headset Jack kctl with err: =
%d\n", ret);
> +

No, drivers should not be open coding userspace reporting - there
is no reason for this device to be special, or for this device to
duplicate what machine drivers and the core are doing.  Any
configuration should be done by the machine driver, the ASoC core
jack handling already creates userspace controls when asked.

--BY1KhK6s61gDAstw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQfOYYACgkQJNaLcl1U
h9D8yAf/fy9sMmjyaQSaCVRAtU6vPerFG2ZHD4sxzKPFhQb/dYDzG1AIAN+Dcp6p
TNKiM3DeqpzAV9GsThFTdllqXMAu79UOYhkPiPhjqUIH7gCli6TD0nhE7FerQWs0
MNYJFlZb9ZanjrSLm9QX0nraG9B/2mFgfK5ug7nH2WpNnuTm+5jwztOISRpAhOmm
/dWq7YTfT9CZdJkruUFsq0OgvDHnR294QQbzziUeRVX69msTC9h7BQVFk09Unvf7
wIP0p7qOLGuMjanJ/SyKU51V1Z078t7TrQhrPDzIW95oXgJeDAdmsqkeIfZDoAMm
mRLRKpwn0bVRbSCjisW24bgr/1tajQ==
=yrsm
-----END PGP SIGNATURE-----

--BY1KhK6s61gDAstw--
