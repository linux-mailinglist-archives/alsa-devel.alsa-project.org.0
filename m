Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F406E7D5953
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 19:04:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AD6A1EB;
	Tue, 24 Oct 2023 19:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AD6A1EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698167042;
	bh=e2eXLni69BO7wMud3CKNlOGu58TTqXzYwp9Pe/VV7jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VWun5Ik+E0vSLGBMZxfORZ+DqGfW+YimEBFrWZN+E2G7EADtEV9o77DtEB0dgUloh
	 292CTU3LthsYkltvtT0CUwioun+AruptsHEwyZhlwvvjt8sHs8Ksaxc9inNUQ92wDL
	 wnZO/e1pVNf8l+D7FPz3E//HGKm6hAI5Bg7V94m4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6319F80157; Tue, 24 Oct 2023 19:03:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F288BF80157;
	Tue, 24 Oct 2023 19:03:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37B01F80165; Tue, 24 Oct 2023 19:03:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C83FF8012B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 19:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C83FF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M/bGhj3r
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B3F52B825A4;
	Tue, 24 Oct 2023 17:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA9AC433C8;
	Tue, 24 Oct 2023 17:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698166978;
	bh=e2eXLni69BO7wMud3CKNlOGu58TTqXzYwp9Pe/VV7jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/bGhj3rWy8ywrovJr6pBX001G9Uwmk7buaao2v9oM9kO6x6FnSChtMTihVK0eJRl
	 lcXf+WKUTQfkzyqh6qR4VhRv4+8oCH2xRcxjVWPZiGERRwQycbN8SPmEMD9jeYpt6d
	 LkVfFRlp8L6qaKlOKDkl/hDhIW3uPZayF6fz6d19iXGfDTQywJe3lu3PiQtelsHHix
	 LhYPAp3GGH8TEY3JZUNxQ50CmOdgNqi0bIrObPn7zSo4ynwFWSJgB/tq0JP0fkjtdL
	 kx16gEg3Bje7ID7P9chua3EBOgRulnbnfO2XnD8mdZEpekIgEs9LwD1iQG/fWWLYwx
	 5cpxCvML5gIaw==
Date: Tue, 24 Oct 2023 18:02:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 3/6] ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_SSP2 quirk
Message-ID: <4f5f9570-e420-40f7-987c-c216032b91f3@sirena.org.uk>
References: <20231021211534.114991-1-hdegoede@redhat.com>
 <20231021211534.114991-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="esf29u8zVW0SVuIs"
Content-Disposition: inline
In-Reply-To: <20231021211534.114991-3-hdegoede@redhat.com>
X-Cookie: One picture is worth 128K words.
Message-ID-Hash: Y2SECLWD7NV566UEXNRVKHE3TBSTSBQ4
X-Message-ID-Hash: Y2SECLWD7NV566UEXNRVKHE3TBSTSBQ4
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y2SECLWD7NV566UEXNRVKHE3TBSTSBQ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--esf29u8zVW0SVuIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 21, 2023 at 11:15:30PM +0200, Hans de Goede wrote:
> Add the standard intel board file quirk mechanism also used in many
> other intel board drivers and add a BYT_WM5102_SSP2 quirk setting
> for designs using SSP2 instead of SSP0.

This doesn't apply against current code, please check and resend:

diff --cc sound/soc/intel/boards/bytcr_wm5102.c
index fd7d5fdfd3fd,51682137c4a8..000000000000
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@@ -201,8 -227,9 +227,14 @@@ static int byt_wm5102_init(struct snd_s
  {
        struct snd_soc_card *card =3D runtime->card;
        struct byt_wm5102_private *priv =3D snd_soc_card_get_drvdata(card);
++<<<<<<< HEAD
 +      struct snd_soc_component *component =3D snd_soc_rtd_to_codec(runtim=
e, 0)->component;
 +      int ret, jack_type;
++=3D=3D=3D=3D=3D=3D=3D
+       struct snd_soc_component *component =3D asoc_rtd_to_codec(runtime, =
0)->component;
+       const struct snd_soc_dapm_route *custom_map =3D NULL;
+       int ret, jack_type, num_routes =3D 0;
++>>>>>>> ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_SSP2 quirk
 =20
        card->dapm.idle_bias_off =3D true;
 =20
@@@ -278,7 -323,7 +328,11 @@@ static int byt_wm5102_codec_fixup(struc
                return ret;
        }
 =20
++<<<<<<< HEAD
 +      ret =3D snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_cpu(rtd, 0), 0x3, 0=
x3, 2, 16);
++=3D=3D=3D=3D=3D=3D=3D
+       ret =3D snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3,=
 2, bits);
++>>>>>>> ASoC: Intel: bytcr_wm5102: Add BYT_WM5102_SSP2 quirk
        if (ret) {
                dev_err(rtd->dev, "Error setting I2S config: %d\n", ret);
                return ret;


--esf29u8zVW0SVuIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU3+LwACgkQJNaLcl1U
h9BHaQf/T7oZWPBGAnvG3bJfi8U8h1cmsgZZYp5la/7BktrK6mW4QhM5uLeRn5Mh
uCLMrFEfuhmcuB6AauFexd5iWUEGlhNdoAXxLQ99obqvxsvN28ZlpMCz4On/BMP4
TojWTDiYwwkIcpydl1r7RTpuV2qgKIWbevQibwDWGzY3pMV1FDAQCkTdijzccdPl
QxxPOpEQcI0gkVhDKoL1nOiaOyZkh2kloQNhkzsdH2TLmTr+WfIzLpKKEFjWUV0V
4z7bmWzR77tp1OeZrApQ8FD6WWoohdW7o360A9UzC1SO/7nVh4zBTPM2/4+Sb1pC
Y3Z+ZX/MKbZBB/2sicyXtdJVX6GoNA==
=eXfY
-----END PGP SIGNATURE-----

--esf29u8zVW0SVuIs--
