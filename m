Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 806A547737D
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 14:47:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1331A1F32;
	Thu, 16 Dec 2021 14:46:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1331A1F32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639662467;
	bh=YyfykfbbgC2Ex7pWJDXMGZAc3DrJRrM/0Hp5pH73NA0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tpILIwcBLrmYmtHpPMfl1xya9Mrw6RD4Suzu9T+gHZWVMtA0hEX/hrHaWblRo4Kxa
	 7SKfisIe/rmyy95MP4Ao0N4jdT1qzxMo6k9pGNbNFN2AzuPwz1LsqXB+s9awfVWNIM
	 3bsLnc+A7/ZJh7xpDrt7N7/gTP2/CthhJpPXoQL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FFDCF8015B;
	Thu, 16 Dec 2021 14:46:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0CDFF8014C; Thu, 16 Dec 2021 14:46:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 979D0F800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 14:46:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 979D0F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="j5l38ck6"
Received: by mail-wr1-x433.google.com with SMTP id c4so44296563wrd.9
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 05:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=082erHSPrIMR3rNHlkVNnLqclLhfGMrOuGl2rkH3scs=;
 b=j5l38ck6lv5iBJ7KVkH+GcDavx/dqdCt1vmbAMSuNmlhDxQzV61rT80YoY2pobDgbo
 V9eciYJZf+jIns+/Gca6T6c0MUvYZR1ttdNKIcvvfHSIs9M4VbfwaSiKyR6OjHSWtk/D
 SsoRqBRBZ0t7hIXC/pgKnwyf/X6LGID8m/KUlhSC3kJNjnkGvmM5cs15d93GjWhtix8j
 7hJzBZrUu/VoxV9ead8wfhFXBdQBXRjaxB6efNsPKkY4/n2Ozt4iTb1rpJ9EzShToEZn
 itt9xgOnRmuvlQ5B4LWW/cO2OPICBy+FkgZQlU5CSCwhRAQ9iynWEgT+I5zVHFhX98bf
 fO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=082erHSPrIMR3rNHlkVNnLqclLhfGMrOuGl2rkH3scs=;
 b=T108QPx7mUcQ/jiVZfDO/PYNkrFeC+61YAHopPSjyUV8QuCXOkvRJ0YFr01AFNum4h
 PpdhZOLT93eNhChzJTP4m6ValBPRUjQMSgtbhZslBW6Aqlfaswxw0CGoIjpH3W4dxjWZ
 leTxGJMrka+DT6l3dNkPnAiO+OJi07K4PAxIWGVPlPbzuC3oxSiXeuFu2o+unZgBV9co
 H1QvZEdZewYfRlILuQFFEmnLKll6cD85mlB4pkNgA9M8+k934aFzTQDnBOqhPRusQ7Rs
 kg0KxwXz8eoTd1hSuaff6Gh6ijT+SOZBOTz2Zx2dgD1ZpsrgIIVBchHxERO93b4GuDtl
 Kvqw==
X-Gm-Message-State: AOAM531GPtdhm/eWDN0wWO1J/hhql9XViDQv37BWI2GYxX+Vpckgx22S
 xG4QC9GBc1EZZjXcK4qooUs=
X-Google-Smtp-Source: ABdhPJz6fej/q9wMgIqkbfb+Am1+cVbK1+zRmhxF4GEIhutpDbPUdi0sxT+4y58hn1UKOADbjiJg+Q==
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr9100087wry.582.1639662394439; 
 Thu, 16 Dec 2021 05:46:34 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id b14sm5340551wrg.15.2021.12.16.05.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:46:33 -0800 (PST)
Date: Thu, 16 Dec 2021 14:46:29 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 20/22] ARM: tegra: Add HDMI audio graph to Tegra20
 device-tree
Message-ID: <YbtDNbdJqCGTaMNs@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-21-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gyfxT+HMhoGDzaoq"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-21-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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


--gyfxT+HMhoGDzaoq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:23PM +0300, Dmitry Osipenko wrote:
> Add HDMI audio graph to Tegra20 device-tree to enable HDMI audio on
> Tegra20 devices.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20.dtsi | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.d=
tsi
> index 72cbe32d0c1d..dde228bcbbff 100644
> --- a/arch/arm/boot/dts/tegra20.dtsi
> +++ b/arch/arm/boot/dts/tegra20.dtsi
> @@ -186,7 +186,7 @@ rgb {
>  			};
>  		};
> =20
> -		hdmi@54280000 {
> +		tegra_hdmi: hdmi@54280000 {
>  			compatible =3D "nvidia,tegra20-hdmi";
>  			reg =3D <0x54280000 0x00040000>;
>  			interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> @@ -1063,4 +1063,24 @@ pmu {
>  		interrupt-affinity =3D <&{/cpus/cpu@0}>,
>  				     <&{/cpus/cpu@1}>;
>  	};
> +
> +	sound-hdmi {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,name =3D "NVIDIA Tegra20 HDMI";
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		simple-audio-card,dai-link@0 {
> +			reg =3D <0>;
> +
> +			cpu {
> +				sound-dai =3D <&tegra_spdif>;
> +			};
> +
> +			codec {
> +				sound-dai =3D <&tegra_hdmi>;
> +			};
> +		};
> +	};

Should this be status =3D "disabled" and then only enabled for platforms
that actually enable HDMI?

Thierry

--gyfxT+HMhoGDzaoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7QzUACgkQ3SOs138+
s6Fz0g/+NXG6Z5v1cU5m8qATHlCS7LOgj0m1pDYH7NGhleBIryfDjU2YTHXFLVs7
9rmIyyM+EkHDDNrmZSW/EbXeADTOvlQR6IaMDqRxQQnZ7/7lyWxpwIzNpVMNOY8x
kfv1G2e1+GmjkHtWQpjKa+PFpIFFLc872ivZXcx4wqT+93KdTlqxQ93v1pLKOsxF
vfN3rtnRukmbifI8vaIgacWTEuL2EvZEFlmpUL0/83qM2d96RWKfPozq43qJKAL+
fYa+9dzPG2NnK90C7lY69SQ9gaE5tiV81l5UewA8Q6foZ6b9OQty4aWk7uc4uXCk
MLiTR2hXLf5OSTsq4hbGk2TBgvPPmzCrFOJu92UllBEkveYBd/2AP4U8e5mfx/vx
cFzWKXVskWQ9bWy9Q98DGtKM9Ojf7ZgxGsF3r98yxy7O4JCO3lNBJf+aug/Glhw4
qcFsmmXfIXIdIWnmfO5X1v/RQdHEldzwTdyqR1L2LXyDy9jONdpp8lcKXyEbr3L3
XCv4gnZE44IdI3ZDu7SLGBk1kCAa7HP6p2Tdkg+h4igQidlDcFPu63iCEiRYnIcG
kTrosbzFBH3w1BHd3wE1LZbF2md0k1ra8lV4XSujtY7cqDJ24xrIEA6Rb0vjpYsw
eFgpOzcO6tDHfFp4gPKnmFceREIar9AkxSKaIK8THz8lbuJMdGY=
=nVuk
-----END PGP SIGNATURE-----

--gyfxT+HMhoGDzaoq--
