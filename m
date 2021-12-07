Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E190346B589
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 09:18:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8037A23BC;
	Tue,  7 Dec 2021 09:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8037A23BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638865096;
	bh=SpMd+sqJUTnRel3jv+UKBpLrHu+ShGBLQ4PN3zip+8c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CWfdgbhR6zYRz3Kbva1UwWllAtld4yghkVl7aCNYA1+piRtu6uJCZKr3qKJwr7d02
	 MItADBW9JTUE+3x47JJkkPbq2VrDa/TKTwU0elir6rxwUQsDzwM2yon68DEKSaVibo
	 PIN1+hN1K+ce3wVKQfn+VePbLc7O9MCcoA9uuzGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 267A6F8032B;
	Tue,  7 Dec 2021 09:17:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AAC8F8028D; Tue,  7 Dec 2021 09:17:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CB57F80217
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 09:16:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CB57F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RJ2A2AvJ"
Received: by mail-wm1-x32e.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso1149602wmh.0
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 00:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ly6PK7ZlXENS118/xi5eqqCwa0KSNmpdRCsrscbUxXs=;
 b=RJ2A2AvJ/GKuZox5oW4GExhqZKBSj9wIWUKbCtplJz8JhCWTyrAxFMIw72JuUB/V+Z
 SPoIecc4pG3tPMKscObyZ2G/uII+bgm7BfxUU0bXw71NAB7FS8lBRIzIVv8M21zkG4ef
 G2PFryO1xXzvsDYUoBUUexeBMEkGTatXl9Mr8rqweUAQNaeypw1JYwzKUEJQSaie5QLI
 fya9lVVVb/XDzqesXcy+ShboMtB1eQDnknTyJU2WHG1Lms0pw0K5obFk6njQiKtDiRhT
 kMTD92schvaOdVSO2zm7fddUwNXJc8+nBSWi5lxQP5xb7QB0pVdcvmXT3LXNvxahKlJ5
 r55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ly6PK7ZlXENS118/xi5eqqCwa0KSNmpdRCsrscbUxXs=;
 b=BxoiDQSGMlk8Z1/tuW3mbnsuP1tERv3OWKeOscCzJxNkP1+1/ELhSHw4uBVGAXXAcB
 wz5Gb8fBw3FJJRg6dYCrb3BRdAwkIA4jrLKFSn6g7q21QIewDhamOqbXQTwdSBMZRQ0E
 lfAYyZsjCexQzwpWV7pWya7n0WOLxPvFv/83iMb/dAdxzSRP8/gRrhbJVk9JQzYpdR+G
 n3UAjKlxPRK9Rv50ncLu63MQaGYyS7F0fFZFK/mD8AfhuzkpNYTG4Qve1MInAox1/Ihk
 mFEkROLTv2HWnSD7MlwQbecEPMAo3j1vUzvIEFr1MIVP89PpDtRcO+TUibKl8e7rTvKg
 q/Aw==
X-Gm-Message-State: AOAM532cpe3/buLW83OHdhHyH6cgkjiuYJa3eAKtDcSTxYUD/WjyH4rj
 Pp0ccLzPh/gpVIDJrNDv5Qs=
X-Google-Smtp-Source: ABdhPJwqMszyeTU2cTI4AGOx6dwxjoLr6yhBZ1CHjwUgz6wuPMFwPNBUzP0X7/jaHwSnRS/oZ9woXQ==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr5138256wmp.165.1638865008363; 
 Tue, 07 Dec 2021 00:16:48 -0800 (PST)
Received: from orome.fritz.box ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id p12sm16556493wrr.10.2021.12.07.00.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 00:16:47 -0800 (PST)
Date: Tue, 7 Dec 2021 09:16:43 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 1/3] ALSA: hda/tegra: Skip reset on BPMP devices
Message-ID: <Ya8Ya2en5Tm5Ol2u@orome.fritz.box>
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
 <1638858770-22594-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="57gZ4qqQmZgyq7I1"
Content-Disposition: inline
In-Reply-To: <1638858770-22594-2-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, broonie@kernel.org, stable@vger.kernel.org,
 linux-tegra@vger.kernel.org, digetx@gmail.com, jonathanh@nvidia.com
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


--57gZ4qqQmZgyq7I1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 12:02:48PM +0530, Sameer Pujar wrote:
> HDA regression is recently reported on Tegra194 based platforms.
> This happens because "hda2codec_2x" reset does not really exist
> in Tegra194 and it causes probe failure. All the HDA based audio
> tests fail at the moment. This underlying issue is exposed by
> commit c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP
> response") which now checks return code of BPMP command response.
>=20
> The failure can be fixed by avoiding above reset in the driver,
> but the explicit reset is not necessary for Tegra devices which
> depend on BPMP. On such devices, BPMP ensures reset application
> during unpowergate calls. Hence skip reset on these devices
> which is applicable for Tegra186 and later.
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: stable@vger.kernel.org
> Depends-on: 87f0e46e7559 ("ALSA: hda/tegra: Reset hardware")
> ---
>  sound/pci/hda/hda_tegra.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>=20
> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
> index ea700395..862141e 100644
> --- a/sound/pci/hda/hda_tegra.c
> +++ b/sound/pci/hda/hda_tegra.c
> @@ -68,6 +68,10 @@
>   */
>  #define TEGRA194_NUM_SDO_LINES	  4
> =20
> +struct hda_data {
> +	unsigned int do_reset:1;
> +};

I suppose this could also be a bool. Not sure if we need to care about
packing optimizations at this point.

It may also be useful to rename this to something less generic to avoid
potential clashes with other data structures in the future. We've often
used the _soc suffix in other drivers to mark this kind of SoC-specific
data. In this case it would be struct hda_tegra_soc.

If Takashi is fine with this as-is, I don't have any strong objections,
though.

> +
>  struct hda_tegra {
>  	struct azx chip;
>  	struct device *dev;
> @@ -76,6 +80,7 @@ struct hda_tegra {
>  	unsigned int nclocks;
>  	void __iomem *regs;
>  	struct work_struct probe_work;
> +	const struct hda_data *data;
>  };
> =20
>  #ifdef CONFIG_PM
> @@ -427,8 +432,13 @@ static int hda_tegra_create(struct snd_card *card,
>  	return 0;
>  }
> =20
> +static const struct hda_data tegra30_data =3D {
> +	.do_reset =3D 1,
> +};
> +
>  static const struct of_device_id hda_tegra_match[] =3D {
> -	{ .compatible =3D "nvidia,tegra30-hda" },
> +	{ .compatible =3D "nvidia,tegra30-hda", .data =3D &tegra30_data },
> +	{ .compatible =3D "nvidia,tegra186-hda" },
>  	{ .compatible =3D "nvidia,tegra194-hda" },
>  	{},
>  };

One other thing we've done in the past is to explicitly pass these
structures for each compatible string. That simplifies things a bit
because we don't have to keep checking for non-NULL pointers and instead
rely on the fact that there's always a valid pointer.

To do so, you'd basically add:

	static const struct hda_data tegra186_data =3D {
		.do_reset =3D 0,
	};

And reference that for both the Tegra186 and Tegra194 entries. Again,
not strictly necessary and since we have only one occurrence where we
need to check this, it seems fine as-is, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--57gZ4qqQmZgyq7I1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGvGGsACgkQ3SOs138+
s6ElZhAAkBaYvI5wUy4Npac6iTV4FV0hRhu5qIRVrFswg59quVV9ON7cg+yhPiT3
ECUBt0PvJSyC2WahkVievF9k/szqlqmuIkccsh1dyTg989V3unM3QAiIv77sdkua
HvljJ+klN7RCuYLG1ZRf9D2gq6673eTOh1DkAGX5piScMQj9cJskWDBkp6n3pxJt
cGuaEuXC1+VMMKAZqQuyFcp067IVbSsiPggWXKaaR0fWiZak2gGNPDaZQGBIUrmH
c5Tne6q+E3C+CRyuxE4SNTuurPwaorbFqR5rvaaViixJRrXII3pTa6MueGllsQPL
ZbasWvQgLhSUg2r//wgDoMNwX4DpbUgBdhqjmz9jPZ/a8QwqCmZXbjxBs30EdLMs
kZGfblGdGUUC2AEQRRUCG1ftCPrSj3FQtF41mOjWCEoeFvGSQhi0mi1Sm/vxYvbQ
ur4P42gmEf83YIgZG93GjP0lsvu06Rb/vqcvB7tIvM6FR9F3TNp5rWasRj94x8w2
v2JunAPyIjLPRd/h7mhFOJ7b40QrF4DkBduAQnfd/knk2qwaHmkHUG8wnPpoaVDN
5oMwUJ2p8eAM/GHkj4iuEivBSVGQ9gcNU7xYE1Rd7yx7lGKexlC37UW55lVxlGYX
7oXSVisIG2dJ4E3GjLbTkWQaf5Af4hjqdzziS4lEM33Fg+YY06c=
=bQYe
-----END PGP SIGNATURE-----

--57gZ4qqQmZgyq7I1--
