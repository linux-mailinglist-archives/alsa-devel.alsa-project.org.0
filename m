Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDA77F0697
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Nov 2023 14:52:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D13C839;
	Sun, 19 Nov 2023 14:51:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D13C839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700401951;
	bh=BGPspVTqg2RxAc0dAe+nKScToKsw6b7pEWgbahJs6Jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IQBSfn+9Q7cIyJDnX2HtEUOm1ifUq8imf+Ygz3eQbSoIu1faIejWNpMtDaKQCRP7R
	 zVkDExLssSoMMuStNOn9nPi0OPZ2TXdUAsFaUkJTWZcMGF+bTRyGIEdccCWBPNKv9p
	 tepiEYJmb2C7Ze+5UxVsaY3V2SZfjsjuYeUpcgY0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4E9CF80310; Sun, 19 Nov 2023 14:51:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94BEEF80249;
	Sun, 19 Nov 2023 14:51:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F132F80254; Sun, 19 Nov 2023 14:51:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B074CF80246
	for <alsa-devel@alsa-project.org>; Sun, 19 Nov 2023 14:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B074CF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lsu/K8Lc
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ce28faa92dso27662395ad.2
        for <alsa-devel@alsa-project.org>;
 Sun, 19 Nov 2023 05:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700401882; x=1701006682;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BFaaFcM0s0AAPxjIW+xwio0LQYtoB+ElMC4cqj7h3OU=;
        b=Lsu/K8LcMHWaxQyOJMMWvWkLAgEvnYw4TtrcCR69S0GqU2C5xHkkYKEDNtmr1KFzsJ
         pRbhYlxOVQOkznQ28BIcwpyEPHTppB9wlq39Fc1XODEnsFQIYlB9NRxDo+9kEV2ovzZ0
         VIx6J8MKhPQ6nVXoIKsihlZFSFCbhiw0YkbcdVb8p5bX4clpD8QuJLVGmOlrq1e6Iye1
         kIM6ORrzy5gmXBW0C/LKg/9p0nkmW00Whfs60H5lVq0kCqSNnwiXbPkg5XLeUSlfSL0s
         CWfSrXowcel/BQhcgCMnOeK7RJGNJAV9ygTY+hBoyJtFwgpZppwEf4BQ0MavrO6DkuF0
         jE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700401882; x=1701006682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFaaFcM0s0AAPxjIW+xwio0LQYtoB+ElMC4cqj7h3OU=;
        b=Aycejc/svDKeEiSs0+uMHPG6DNZOrGPxwmjD7YjsOILz0+EekeR1pE9DOWYozaoMpr
         jvgxxZnxkj0szGKl2e4NkysIY0X83+lgh3qp4b4u/Jf/9ReCX1e0vspI4S2oFnsoVucJ
         hpW8cDJgnvGuUkMs/IJMLcEpbWM6Rr1gYrqJ3QE+Zip9qpaBvE8rLFfI3n2d/uxU1uDA
         RDtmzOQGbKeblxosfAC/TbuelglRQWY6E1JfaiMO+KBgrQSkAaqncru4VyzwfL49CsI7
         A7QUhBTmZzP0lpK2dg+2iaLzpPjpnNPDER+7gsDs+AOC/xhBxFcZtaYBW7o2LWF5nwCP
         EoQQ==
X-Gm-Message-State: AOJu0Yzd47jokN2vPDRltwpbVqvnK7VJPElQ3ehKU8D1Pw5a5tNBMlE9
	P0STh6alxRRXnaRji/H0nidEdKqxZl4Qfg==
X-Google-Smtp-Source: 
 AGHT+IEKLUCj2Ws0Mij9vi9u00UGwYdfEvC3Ii6wJOCCe34iYBfOpfyXwjQK64/2RqGVrm/vmWgMSw==
X-Received: by 2002:a17:902:c14c:b0:1cc:51b8:8100 with SMTP id
 12-20020a170902c14c00b001cc51b88100mr3278733plj.7.1700401882073;
        Sun, 19 Nov 2023 05:51:22 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id
 jd22-20020a170903261600b001c61901ed37sm4377515plb.191.2023.11.19.05.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 05:51:21 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id EE102101D92E3; Sun, 19 Nov 2023 20:51:19 +0700 (WIB)
Date: Sun, 19 Nov 2023 20:51:19 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Oliver Sieber <ollisieber@gmail.com>, Takashi Iwai <tiwai@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Sound System <linux-sound@vger.kernel.org>,
	Linux ALSA Development <alsa-devel@alsa-project.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: Fwd: acp3x: Missing product ID for Thinkpad T14s Gen2 AMD Ryzen
 7 PRO 5850U
Message-ID: <ZVoS13B2Br9U8mvu@archie.me>
References: <8bd0e77f-720b-4804-bbd8-477bd7df938e@gmail.com>
 <251c1bea-8250-40dd-bdea-1cd739d1e77a@gmail.com>
 <a75ce6e7-5012-43d8-a222-dd2639c5969c@gmail.com>
 <78149e00-12b5-459b-8754-a17dd974916d@gmail.com>
 <87sf54jyjl.wl-tiwai@suse.de>
 <826bb4f4-c6ea-4c45-a0e0-5ca826f0cfe0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RgrZYw5NPeRGwo21"
Content-Disposition: inline
In-Reply-To: <826bb4f4-c6ea-4c45-a0e0-5ca826f0cfe0@gmail.com>
Message-ID-Hash: ZF72FEXUAZZE5Z26TDIQLCQ65IDMHUNL
X-Message-ID-Hash: ZF72FEXUAZZE5Z26TDIQLCQ65IDMHUNL
X-MailFrom: bagasdotme@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZF72FEXUAZZE5Z26TDIQLCQ65IDMHUNL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--RgrZYw5NPeRGwo21
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 19, 2023 at 09:54:32AM +0100, Oliver Sieber wrote:
> Hi,
>=20
> in the following I provide my proposed patch for the bug report on Bugzil=
la
> [1]. Let me quote from it:
> > Hey,sound/soc/amd/renoir/rn-pci-acp3x.c has a hard-coded list of quirks=
=2E It seems like some product IDs may be missing. In my case, I am using a=
 Lenovo Thinkpad t14s gen2 with an AMD Ryzen 7 PRO 5850U.
> > My audio output is fine but my internal microphone cannot be found.
> >=20
> > Running `dmidecode` yields:
> >=20
> > Handle 0x000F, DMI type 1, 27 bytes
> > System Information
> > 	Manufacturer: LENOVO
> > 	Product Name: 20XGS1KT02
> > 	Version: ThinkPad T14s Gen 2a
> >=20
> > Could it be that one may have to add the product ID "20XGS1KT02" to the=
 hard-coded list of quirks in rn-pci-acp3x.c?
> >=20
> >=20
> > It seems as there have been similar problems in the past, e.g.https://b=
ugzilla.kernel.org/show_bug.cgi?id=3D216270.
>=20
> My proposed diff looks as follows:
>=20
> Subject: ASoC: AMD Renoir - add DMI entry for Lenovo ThinkPad T14s Gen 2
> From: Oliver Sieber
> The ThinkPad T14s Gen 2 laptop does not have the internal digital
> microphone connected to the AMD's ACP bridge, but it's advertised
> via BIOS. The internal microphone is connected to the HDA codec.
>=20
> Use DMI to block the microphone PCM device for this platform.
>=20
> Signed-off-by: Oliver Sieber <ollisieber@gmail.com>
> ---
> diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c
> b/sound/soc/amd/renoir/rn-pci-acp3x.c
> index b3812b70f5f9..754e24d55e6f 100644
> --- a/sound/soc/amd/renoir/rn-pci-acp3x.c
> +++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
> @@ -199,6 +199,13 @@ static const struct dmi_system_id rn_acp_quirk_table=
[]
> =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI_EXAC=
T_MATCH(DMI_BOARD_NAME, "20NLCTO1WW"),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* Lenovo ThinkPad T14s Gen 2 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 .matches =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI_EXACT_MATC=
H(DMI_BOARD_VENDOR, "LENOVO"),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI_EXACT_MATC=
H(DMI_BOARD_NAME, "20XGS1KT02"),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {}
>=20
> =C2=A0};
>=20

Hi Oliver,

Did you forget Takashi's suggestion to follow formal patch submission
procedure [1]? Hint: It is suggested to use git-send-email(1) when
sending patches, as it handles them as-is (e.g. no wordwrapping,
tabs preserved).

Thanks.

[1]: https://lore.kernel.org/alsa-devel/87sf54jyjl.wl-tiwai@suse.de/

--=20
An old man doll... just what I always wanted! - Clara

--RgrZYw5NPeRGwo21
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZVoS1AAKCRD2uYlJVVFO
oxEwAP9tVEhVvsolMp9atXWPaMw9tMx11FLXrcNpseXNiPTpWwD40zHKn4qSaSFA
d+qO6fzkUeHigQdKkJrzBoLskjqsAg==
=bWQV
-----END PGP SIGNATURE-----

--RgrZYw5NPeRGwo21--
