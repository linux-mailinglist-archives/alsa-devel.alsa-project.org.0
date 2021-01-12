Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 808762F2FB5
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 14:00:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0680916C2;
	Tue, 12 Jan 2021 13:59:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0680916C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610456400;
	bh=H9xYz/j5XD9PwmLHF0qQYElV9ItgmHRMEuVpmwGRIGk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YGT8UKK+fM7mOPBjyhoJWXVJW6mpJRCgDJxEX3JKkYKhwgFia4MJbaILlmWePTI7P
	 BzlDjJcPjPsbEfjhs6XW28ohzuc/2mPEJFK7l7BAo1CkfIwhpGKqrUfDtkcwJJzd7X
	 Mf4IxT5OBTlGhAEuSh3uEvgvtWCCUYT1eDTbfutA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AAF1F8026F;
	Tue, 12 Jan 2021 13:58:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D67F9F8025E; Tue, 12 Jan 2021 13:58:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6F67F800B9
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 13:58:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6F67F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="llm0EnUk"
Received: by mail-io1-xd2c.google.com with SMTP id o6so3680846iob.10
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 04:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vmNMz4c82U9fhl38EDcfbIBTFdzOpA4YaurmgZ3FP8E=;
 b=llm0EnUkhX9XjQIBTK80NWvYICcF3bAcLiD6aFyt4r6ZEs/YJ+UTRHjY9PyBEGKAgB
 BN1481GgjC56jqLRFRvk7rqMyIFJd+2ep0naN3uXopdHCvZV/63IanjQNz4cp8O5SsQy
 QSsaZtO2YpZsmQdw+08v4XgF/6v8laLk7S1li6g8GGlMhmgGo+YCzaazowoyLsZ7otX4
 po05P9W+UbZldABlzAf5rIasuitM4zhIxtyPmDRyNNPna6YyaMxIiqpFpydWqCKOMuSZ
 33Y203wBhp3zjuhA4nqygoBomvzsWUUVDR9xTx83aYqjI8fW8lEhNI7uKsS7fIAYO9Pg
 sq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vmNMz4c82U9fhl38EDcfbIBTFdzOpA4YaurmgZ3FP8E=;
 b=e926MQm6SkkfFs2eHXbHE+3fhaKQSGYUR8CF6OfBuJLOneF3Yqu7DEcajIfcLo24iE
 qZnB/IGGUR2Pep1DVrs6ec15Z2QqUjF4NxjsJrgqyMi1vCEf162/Zfdz8Guu9jV/3C62
 ZissY8DvjKQZFbSJFKg+4k4HV4IkhCEGlmUMdEuQzqLht9oBYqb4h4f5CcGZ0tzf3XHv
 kbE53mR6ELLct5prPfVY+fcaN6xPhbKxYbivwi57PH9wObmDwa5P8Nax273IhKR3WFif
 is0WFAYeL8/YhjYL5KW9fYrY0AZgp8hR8XZ20nAP0ou21SRjsRQ5BTR8pVZltWNXc33Y
 pp+A==
X-Gm-Message-State: AOAM530KLMDKrQQKU45Zs+M6fSof8kdX60c0rPm3cRlm65dsogq3B1pu
 foCyyV8X4CcUQaVqn2SEl90=
X-Google-Smtp-Source: ABdhPJwH5Hk3sgm0x2Krsl5EBJerXsE1lzyGhppEGMGxcC4o8A1Cz3aGdZeVFPIzT0r85wsaVeFVIA==
X-Received: by 2002:a02:5148:: with SMTP id s69mr4167726jaa.8.1610456295322;
 Tue, 12 Jan 2021 04:58:15 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id 64sm1967959iow.9.2021.01.12.04.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 04:58:12 -0800 (PST)
Date: Tue, 12 Jan 2021 13:58:10 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v2 2/2] ALSA: hda/tegra: fix tegra-hda on tegra30 soc
Message-ID: <X/2c4nZwO9hxTzNN@ulmo>
References: <20210108135913.2421585-1-pgwipeout@gmail.com>
 <20210108135913.2421585-3-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mDB+fc3ahoOZCE0L"
Content-Disposition: inline
In-Reply-To: <20210108135913.2421585-3-pgwipeout@gmail.com>
User-Agent: Mutt/2.0.3 (a51f058f) (2020-12-04)
Cc: alsa-devel@alsa-project.org, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Sameer Pujar <spujar@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-clk@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Ion Agorria <ion@agorria.com>, linux-tegra@vger.kernel.org,
 Mohan Kumar <mkumard@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>
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


--mDB+fc3ahoOZCE0L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2021 at 01:59:13PM +0000, Peter Geis wrote:
> Currently hda on tegra30 fails to open a stream with an input/output erro=
r.
>=20
> For example:
> speaker-test -Dhw:0,3 -c 2
>=20
> speaker-test 1.2.2
>=20
> Playback device is hw:0,3
> Stream parameters are 48000Hz, S16_LE, 2 channels
> Using 16 octaves of pink noise
> Rate set to 48000Hz (requested 48000Hz)
> Buffer size range from 64 to 16384
> Period size range from 32 to 8192
> Using max buffer size 16384
> Periods =3D 4
> was set period_size =3D 4096
> was set buffer_size =3D 16384
>  0 - Front Left
> Write error: -5,Input/output error
> xrun_recovery failed: -5,Input/output error
> Transfer failed: Input/output error
>=20
> The tegra-hda device was introduced in tegra30 but only utilized in
> tegra124 until recent chips. Tegra210/186 work only due to a hardware
> change. For this reason it is unknown when this issue first manifested.
> Discussions with the hardware team show this applies to all current tegra
> chips. It has been resolved in the tegra234, which does not have hda
> support at this time.
>=20
> The explanation from the hardware team is this:
> Below is the striping formula referenced from HD audio spec.
>    { ((num_channels * bits_per_sample) / number of SDOs) >=3D 8 }
>=20
> The current issue is seen because Tegra HW has a problem with boundary
> condition (=3D 8) for striping. The reason why it is not seen on
> Tegra210/Tegra186 is because it uses max 2SDO lines. Max SDO lines is
> read from GCAP register.
>=20
> For the given stream (channels =3D 2, bps =3D 16);
> ratio =3D (channels * bps) / NSDO =3D 32 / NSDO;
>=20
> On Tegra30,      ratio =3D 32/4 =3D 8  (FAIL)
> On Tegra210/186, ratio =3D 32/2 =3D 16 (PASS)
> On Tegra194,     ratio =3D 32/4 =3D 8  (FAIL) =3D=3D> Earlier workaround =
was
> applied for it
>=20
> If Tegra210/186 is forced to use 4SDO, it fails there as well. So the
> behavior is consistent across all these chips.
>=20
> Applying the fix in [1] universally resolves this issue on tegra30-hda.
> Tested on the Ouya game console and the tf201 tablet.
>=20
> [1] commit 60019d8c650d ("ALSA: hda/tegra: workaround playback failure on
> Tegra194")
>=20
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  sound/pci/hda/hda_tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
> index 70164d1428d4..361cf2041911 100644
> --- a/sound/pci/hda/hda_tegra.c
> +++ b/sound/pci/hda/hda_tegra.c
> @@ -388,7 +388,7 @@ static int hda_tegra_first_init(struct azx *chip, str=
uct platform_device *pdev)
>  	 * in powers of 2, next available ratio is 16 which can be
>  	 * used as a limiting factor here.
>  	 */
> -	if (of_device_is_compatible(np, "nvidia,tegra194-hda"))
> +	if (of_device_is_compatible(np, "nvidia,tegra30-hda"))
>  		chip->bus.core.sdo_limit =3D 16;

I think ideally this would be a SoC-specific property derived from the
compatible string, but since this preexisting:

Acked-by: Thierry Reding <treding@nvidia.com>

--mDB+fc3ahoOZCE0L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl/9nN4ACgkQ3SOs138+
s6GmtxAAuykATDSqTibSvd5j+VhWdSgAkDIuCOCRvE8LaBjMs1+GNl1z4dMFsIdX
3XrHJIfRbXQ4msYEEYClBxU0bhI3xqG6jGDXoGRga6IJIR/CZVRMMpnffPl/2igi
RGacMeSM2jN5Z1KNV9w4Xr6YRMBdxGZOpq3hv/J4RZGX5QAnUwMEhhcMIeGOJH/T
/R3PuVN/B4UeMynK24lZHeXSlTo8Vezw/wxVKDdonJGyTSbxxdKH/Jn2bOK5juP/
k5lebqNyDncQ50JiMj29/Eaj9UB7AUCrdD33BLbzBa00kuaYo3CsMI7jd7sa60LB
iooqnIow6P0sT+t+wr7Sw2/gIxfyao+lObqMbJfpBhBKzZh8MgEBDW5W2Pc6rcjs
86iWScjgjPgVzv/SlT91vhdPb8407Bd1MvjynRuAAbwGmDkQEzgS6tFM/ZheklwI
Ws3D4J9B+u0dsUHtg8GLgf/cwNj0xlG/8ackWfbxiN37au/tiPNLlJ0u3246jct2
PFGTolFMFmsjamU519JCy0FItFnImIQ+gqd9andZYryDXxKEVCpYp2AobsAkl7sA
oEle3UXpSHWv0+/NeXhIkGAULrHntxMCLlxLziURDvylDpjRkc9HHva/VAfcqFM9
LEd3q8nOuk0c+nvmD0R1KpFrE5eNAWcRN3ZD4dodB2UnD1Ca7GI=
=2mCN
-----END PGP SIGNATURE-----

--mDB+fc3ahoOZCE0L--
