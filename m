Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D5E5B571F
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 11:24:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 257FE16BD;
	Mon, 12 Sep 2022 11:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 257FE16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662974663;
	bh=UnBOhXfenvWbDybP985OVBjApcnoKO9fDkCSbi1tltY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j7HFMBRIt1VpKPq84t5sd3vMibvirAwgBDqdhvBFkVVK5TBCBfnPQU8pXADVW9hvB
	 1d4ai3kOMB868Nfoj26IK96UftsRaDKDBYR0vXQrhJz022XO2Zwk7jezpy+KMelfNG
	 imJVa3W8BLD4X5D8DuDaZ+GowoazUgMvKXLr35vg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64E4FF800FE;
	Mon, 12 Sep 2022 11:23:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0EE9F800FE; Mon, 12 Sep 2022 11:23:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A2FFF800FE
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 11:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A2FFF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oDv1416Z"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7AC646112C;
 Mon, 12 Sep 2022 09:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E247C433D6;
 Mon, 12 Sep 2022 09:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662974595;
 bh=UnBOhXfenvWbDybP985OVBjApcnoKO9fDkCSbi1tltY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oDv1416ZzSErNeJeEkWCV4fsAkh6JQrFlh57PL0pJCsquswQKX5jfpceE3VvIxN9c
 fWucNJqbbG/pvTHU8atIXQlAorOlZme2/yMUUYKIsKcFhJaDHaGcvxTnJxH5W/gMEx
 7DbcDaLl1/P3mK8alwcrouWobNxx0zebkGo9Br3+mGvz9VUOImZ5dFc1qylVyTVO2K
 D70EX6pmxnpWYMhqFlg2Z0bD/6LzIfCa9xXuocuGFAaBkJwVPrwf3fLDgSZhuz9ohR
 DgEAVPHJHkyRL2UvDnATq7vHCU+7048938zAxDL76kjL/tZAKqrwwQnoIz+rng1gd9
 SSeOY8Rkjb2yQ==
Date: Mon, 12 Sep 2022 10:23:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Mengchen Li <mengchenli64@gmail.com>
Subject: Re: [PATCH] ASoC: wm8978: Support the recording function of codec
Message-ID: <Yx76gpaq0wbuek72@sirena.org.uk>
References: <1662970985-2909-1-git-send-email-mengchenli64@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Z7sRByif36EoE65Y"
Content-Disposition: inline
In-Reply-To: <1662970985-2909-1-git-send-email-mengchenli64@gmail.com>
X-Cookie: One FISHWICH coming up!!
Cc: alsa-devel@alsa-project.org, steve@sk2.org, patches@opensource.cirrus.com,
 tiwai@suse.com, lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
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


--Z7sRByif36EoE65Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 12, 2022 at 04:23:05PM +0800, Mengchen Li wrote:

> @@ -822,7 +822,9 @@ static int wm8978_hw_params(struct snd_pcm_substream =
*substream,
> =20
>  	snd_soc_component_write(component, WM8978_AUDIO_INTERFACE, iface_ctl);
>  	snd_soc_component_write(component, WM8978_ADDITIONAL_CONTROL, add_ctl);
> -
> +	/* Enable MICBEN */
> +	snd_soc_component_write(component, WM8978_POWER_MANAGEMENT_1,
> +		snd_soc_component_read(component, WM8978_POWER_MANAGEMENT_1) | 0x10);

This should be done by creating a supply widget for the MICBIAS
which will be connected by the machine driver to the microphone
widget.  This will mean that the MICBIAS is only enabled when
it's actively being used which saves power.  Look for MICBIAS
widgets in other CODEC drivers for examples.

--Z7sRByif36EoE65Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMe+n4ACgkQJNaLcl1U
h9A23wf/VKQ3FSmdQjFDDJEEUs0HNfY4P0YenSN4PDN5HFlbSLOVniXhlqDgO0E+
mHeFGhUtaTllmz8Y2FnKZmqXnbmqB+s4idpwoN0yKMvgqJQsVdg6ShFjUvezbNUj
g87/GpTbXwoHwDN44FTPbiEvxv5JP1X6OeCpxwE4PV2W5I8gPD4egyONTX/8lN66
wPJkBUkbz0V42TyGix/MFLgWF+V4UHRNU2I5GbLdXclNzQ9hWgDVXXxvmTc6cFSJ
v4ZJx+T4WOIdHxiFzUCmjl5WuUuCBPsyQGAt6+ewD+68G9NKvzImTmXHORelsTqo
vex12eXjTBGKiWAOqQVPHd4no1r9fg==
=O00c
-----END PGP SIGNATURE-----

--Z7sRByif36EoE65Y--
