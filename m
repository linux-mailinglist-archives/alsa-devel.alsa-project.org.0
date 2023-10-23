Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 827B97D3CED
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 18:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96C5C84B;
	Mon, 23 Oct 2023 18:55:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96C5C84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698080189;
	bh=Hpe7ekaJs73CJgZf5fhyangHoKF2l+kv/gkvQP5ZgmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RRN6UWOA3UG64HlWrJV7KY7BNtfjpdo15Y4rar3o7gd4sjs0KX/Iv81QYoxujKYT4
	 l8JpJ4b/azzCa8qVxwcsLGO+w6zSPUXcwg+YQsWVbRdlTbaR5Uz6lMX9guyAVdHBVz
	 fgs/W8gKMlnVNU+38KlBaLL6FIzsTdeexW8k8PiU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22A4EF8055A; Mon, 23 Oct 2023 18:55:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B29D0F8032D;
	Mon, 23 Oct 2023 18:55:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97979F804F3; Mon, 23 Oct 2023 18:55:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF0B2F80134
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 18:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF0B2F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YhmS5jI0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 77DCC625CB;
	Mon, 23 Oct 2023 16:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF1CC433C7;
	Mon, 23 Oct 2023 16:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698080121;
	bh=Hpe7ekaJs73CJgZf5fhyangHoKF2l+kv/gkvQP5ZgmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhmS5jI05JwAioYZMc0FUT+5OFTFXShOEqQJCKnqWdA2tAS9QqOYhjLqNVCKDlATx
	 LJuHsmtQA55nvPrV/HcQ/b9Jhm+9gxHsIdrIfw3r8LIN/8c6eC84kpEkNXkV2/GCLL
	 XsfhMmfaq+u34YgutzjKqJKxiplQUcdVW+cU4e6ZS9B0XKhhVgwoTBlaCJ16UcuaOm
	 sZWNJ7jzyjTUDsoEh6WRqtlh60agRqnpxxgxfPCbB2+6bTRTGvKLV6+zzMvbcXKXjj
	 /cUNJ5GU+3B6KJgT9LeG58dn66g2hGW2tfTq6Mkq5JS9pFWm1c+ezfplQif+GuHKNz
	 qUIldiPM+LTLQ==
Date: Mon, 23 Oct 2023 17:55:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
	KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
	scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nau8821: Add DMIC slew rate
 selection
Message-ID: <20231023-company-coziness-0b50388abfaa@spud>
References: <20231023021537.617980-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6XhV5INvunCnaq1A"
Content-Disposition: inline
In-Reply-To: <20231023021537.617980-1-wtli@nuvoton.com>
Message-ID-Hash: CHXDG6O7H7WODSYGRBKLQ564SKS2UW7F
X-Message-ID-Hash: CHXDG6O7H7WODSYGRBKLQ564SKS2UW7F
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CHXDG6O7H7WODSYGRBKLQ564SKS2UW7F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6XhV5INvunCnaq1A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Mon, Oct 23, 2023 at 10:15:36AM +0800, Seven Lee wrote:
> Add input with DMIC slew rate selection
>=20
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../devicetree/bindings/sound/nuvoton,nau8821.yaml         | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml=
 b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> index 3e54abd4ca74..5f7f2eed4834 100644
> --- a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> @@ -89,6 +89,12 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      default: 3072000
> =20
> +  nuvoton,dmic-slew-rate-selection:
> +    description: number from 0 to 7 that sets DMIC slew rate.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 7
> +    default: 0

I'd much rather this was an enum of possible values in $unit, than what
appears to be values you want to write to a register.

Cheers,
Conor.

> +
>    nuvoton,left-input-single-end:
>      description: Enable left input with single-ended settings if set.
>          For the headset mic application, the single-ended control is
> @@ -127,6 +133,7 @@ examples:
>              nuvoton,jack-insert-debounce =3D <7>;
>              nuvoton,jack-eject-debounce =3D <0>;
>              nuvoton,dmic-clk-threshold =3D <3072000>;
> +            nuvoton,dmic-slew-rate-selection=3D <0>;
>              #sound-dai-cells =3D <0>;
>          };
>      };
> --=20
> 2.25.1
>=20

--6XhV5INvunCnaq1A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTalcwAKCRB4tDGHoIJi
0lUgAP0dICzYGKOkFJyrsYF0Pcon1DPv052uYcDE0imGelULMQD9FUUVcAFtlJFy
ayCgZF3Du2NWFIzNgjEbBbFyfd77GQQ=
=7mpV
-----END PGP SIGNATURE-----

--6XhV5INvunCnaq1A--
