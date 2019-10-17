Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE13DA43C
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 05:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C3721612;
	Thu, 17 Oct 2019 05:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C3721612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571282056;
	bh=g0Gu5ySE9IU4xLfVW46yktL0oNtzrmZK6lSgj6X7SyI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rCpzCAp2pdDwZs1Tx2zIEdtmTktvGSo/KerjyqLjX/auT41rcNQSk5K31qAMcnXQB
	 GIrGfIhfiRlcQ9RvsxXKw2tCaJLOH1TcrKM7B4O3r4ZBAlZ8srLR2bNA6VniS3TLG9
	 ZChV0D4TPXYBzVdKzz37SR2hjwqP/ochbvRcApXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80098F804A9;
	Thu, 17 Oct 2019 05:12:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80FDAF804AA; Thu, 17 Oct 2019 05:12:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 761EDF802A0
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 05:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 761EDF802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="kud9+88J"
Received: by mail-pg1-x544.google.com with SMTP id i32so431415pgl.10
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 20:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YxR7QauPFIpwu18IaJ9ziXnYejBxNJ9VobKL+Ge/XjA=;
 b=kud9+88JoM80HNaxVPp9bA8aFysc53m1u/lEZf1JMDZiN9XECzPAaakFzGRQ+K/6Mf
 hoPI0HqzDInnIBXW7V8vxBo62kioTgEtvchOr2k39qUzo76bHg5tCwIxS2kbSyrMIOnq
 snJ457KW5y2WJFx+1/o/nKYrXyDKC4zPfjvT9Aje2DxQVCR6i3cdCfwtpgKrhG97UUew
 7cqLLEB7wsyRsI0oWCcwiWq9IpAhy6Og+TcT7qDUmidiPsuHvh2aj/YUry+hVMTr4YKb
 OdDknLg146HhsBJOP/ZLJGXXy5/R/2PbglRgeUYC7JmwxwQsD2MiY9gV6wEB8DgWvbXu
 jQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YxR7QauPFIpwu18IaJ9ziXnYejBxNJ9VobKL+Ge/XjA=;
 b=s7JTHVpE5154/EOat1juGc7DL1fS/oPpXLCfrU+twSsI7+h9y3k5MWKcYE/Zi6dTVW
 JKq9Qc0zn7opvmXg523Wp3phPrABqkPCkP+hXhV3fjEBbkRXhDw2xv2gcAHOg1ZrHY3q
 o56OtrxTjF2JyrJ/yyb85OQ87D67wE89koUSwcE4UdquU7fVpEpMbEm5F/pR7j6wjOSW
 Bj7oPKnO4D5iHcvqhhHGNXCkn7UzTA0u0eYPYG4a1fBnsqD5NJELHukrHrfd++NkApI2
 u+/tUmkPg14LutpuauBL8BJWa2o/eL2V2//CYhFAjkQnGppiDsAva1axQc3FOslZTl7L
 GYeA==
X-Gm-Message-State: APjAAAWn0vFdvUVE08cADhlrOCs4wWUxwWt+cwrqKiaDRmtNqbATSjwU
 JlpuRTcXbL2FKwBI1yA2avMo8g==
X-Google-Smtp-Source: APXvYqz33U+X+A3OXDiRRBXsBWjDrHmBMXo3JmS2uzTGkzCx5K9nErCtmSPEZRFpECSSomyuV4Q2pA==
X-Received: by 2002:a62:7a8c:: with SMTP id v134mr1162146pfc.134.1571281940447; 
 Wed, 16 Oct 2019 20:12:20 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:bc61:d85d:eb16:9036])
 by smtp.gmail.com with ESMTPSA id i16sm546637pfa.184.2019.10.16.20.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 20:12:19 -0700 (PDT)
Date: Wed, 16 Oct 2019 20:12:14 -0700
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20191017031214.GA78044@google.com>
References: <20191014102022.236013-1-tzungbi@google.com>
 <20191014180059.06.I0df85fe54162426e31f60a589d9b461c65df2faa@changeid>
MIME-Version: 1.0
In-Reply-To: <20191014180059.06.I0df85fe54162426e31f60a589d9b461c65df2faa@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, robh+dt@kernel.org,
 broonie@kernel.org, enric.balletbo@collabora.com, dgreid@google.com
Subject: Re: [alsa-devel] [PATCH v3 06/10] ASoC: dt-bindings: cros_ec_codec:
 add SHM bindings
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
Content-Type: multipart/mixed; boundary="===============0865872456193435064=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0865872456193435064==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2019 at 06:20:18PM +0800, Tzung-Bi Shih wrote:
> - Add "reg" for binding to shared memory exposed by EC.
> - Add "memory-region" for binding to memory region shared by AP.
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Acked-By: Benson Leung <bleung@chromium.org>


> ---
>  .../bindings/sound/google,cros-ec-codec.txt   | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec=
=2Etxt b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
> index 0ce9fafc78e2..8ca52dcc5572 100644
> --- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
> +++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
> @@ -10,8 +10,26 @@ Required properties:
>  - compatible: Must contain "google,cros-ec-codec"
>  - #sound-dai-cells: Should be 1. The cell specifies number of DAIs.
> =20
> +Optional properties:
> +- reg: Pysical base address and length of shared memory region from EC.
> +       It contains 3 unsigned 32-bit integer.  The first 2 integers
> +       combine to become an unsigned 64-bit physical address.  The last
> +       one integer is length of the shared memory.
> +- memory-region: Shared memory region to EC.  A "shared-dma-pool".  See
> +                 ../reserved-memory/reserved-memory.txt for details.
> +
>  Example:
> =20
> +{
> +	...
> +
> +	reserved_mem: reserved_mem {
> +		compatible =3D "shared-dma-pool";
> +		reg =3D <0 0x52800000 0 0x100000>;
> +		no-map;
> +	};
> +}
> +
>  cros-ec@0 {
>  	compatible =3D "google,cros-ec-spi";
> =20
> @@ -20,5 +38,7 @@ cros-ec@0 {
>  	cros_ec_codec: ec-codec {
>  		compatible =3D "google,cros-ec-codec";
>  		#sound-dai-cells =3D <1>;
> +		reg =3D <0x0 0x10500000 0x80000>;
> +		memory-region =3D <&reserved_mem>;
>  	};
>  };
> --=20
> 2.23.0.700.g56cf767bdb-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXafcDgAKCRBzbaomhzOw
wiE+AQDn54dzQxcEyRftrbS/aZzrkxXRGTsnsPmW/XHWbSppWAD9EZ2ZFfd4P/Jh
6gRW/3o1LSOPemVd4DvkSc5TJH2n+gI=
=3vz8
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--

--===============0865872456193435064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0865872456193435064==--
