Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A147339EF
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 21:33:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DB81836;
	Fri, 16 Jun 2023 21:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DB81836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686944037;
	bh=JTpvT/+Xg8T65izIUbx5+aUwFNdu1OGCpNVkfCtk6IY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LdoSJUTdd6m9mo+pwEGxcn/fuJlw228n0aMJCPaJ/nVUU7jBdPM2XLC5YDqWOvTxH
	 3KcOAmHWux3YmqHrepSD0T0qTB1FE3MvTX5Z6S7rFhIJRzsfBPefHAtiAJjjOtKeKa
	 Ztq8jVmM/FKmNoEc6qe4hBE09cvk7FO9UxZv1BHk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20474F80548; Fri, 16 Jun 2023 21:32:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C33FFF80149;
	Fri, 16 Jun 2023 21:32:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 626A3F80155; Fri, 16 Jun 2023 21:32:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=SPF_HELO_NONE,SPF_NEUTRAL,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74C5DF80132
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 21:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74C5DF80132
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id DBCBD1C0E73; Fri, 16 Jun 2023 21:32:22 +0200 (CEST)
Date: Fri, 16 Jun 2023 21:32:22 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com,
	pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	ahplka19@gmail.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH AUTOSEL 6.1 20/33] ASoC: Intel: avs: Account for UID of
 ACPI device
Message-ID: <ZIy4xhk+kbe01gio@duo.ucw.cz>
References: <20230531134159.3383703-1-sashal@kernel.org>
 <20230531134159.3383703-20-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SOvNzeeURu6eDnYe"
Content-Disposition: inline
In-Reply-To: <20230531134159.3383703-20-sashal@kernel.org>
Message-ID-Hash: NQARFFQSQ6LUHOS2VYIOFNEDY66H4SFS
X-Message-ID-Hash: NQARFFQSQ6LUHOS2VYIOFNEDY66H4SFS
X-MailFrom: pavel@denx.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NQARFFQSQ6LUHOS2VYIOFNEDY66H4SFS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--SOvNzeeURu6eDnYe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Configurations with multiple codecs attached to the platform are
> supported but only if each from the set is different. Add new field
> representing the 'Unique ID' so that codecs that share Vendor and Part
> IDs can be differentiated and thus enabling support for such
> configurations.

Apparently this is preparation for something, but we should not need
it in AUTOSEL as noone will write the uid here.

Best regards,
								Pavel

> +++ b/include/sound/soc-acpi.h
> @@ -170,6 +170,7 @@ struct snd_soc_acpi_link_adr {
>  /* Descriptor for SST ASoC machine driver */
>  struct snd_soc_acpi_mach {
>  	u8 id[ACPI_ID_LEN];
> +	const char *uid;
>  	const struct snd_soc_acpi_codecs *comp_ids;
>  	const u32 link_mask;
>  	const struct snd_soc_acpi_link_adr *links;
> diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/=
board_selection.c
> index 87f9c18be238d..87353b4b0cd73 100644
> --- a/sound/soc/intel/avs/board_selection.c
> +++ b/sound/soc/intel/avs/board_selection.c
> @@ -394,7 +394,7 @@ static int avs_register_i2s_boards(struct avs_dev *ad=
ev)
>  	}
> =20
>  	for (mach =3D boards->machs; mach->id[0]; mach++) {
> -		if (!acpi_dev_present(mach->id, NULL, -1))
> +		if (!acpi_dev_present(mach->id, mach->uid, -1))
>  			continue;
> =20
>  		if (mach->machine_quirk)

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--SOvNzeeURu6eDnYe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZIy4xgAKCRAw5/Bqldv6
8ol8AJ4uOFHJoMuMDzFPzmANHZBI9FyppgCfZF4s1exUHQZ/vAe9UVyPThqJntQ=
=Csam
-----END PGP SIGNATURE-----

--SOvNzeeURu6eDnYe--
