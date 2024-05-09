Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF48C1390
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 19:12:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F025E69;
	Thu,  9 May 2024 19:11:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F025E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715274724;
	bh=YA/u5mUcOxyTQK4E6Daw3gCqDJqZ+z0mf7v0UCWoLp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fZjpcZjkbVu3x7hO6LfXgKC4rY3guuDId9fms/cmIaFRChM6aVhHDT1ukTuXiK4h5
	 5RaTt2H4h8VUoAm+0uxTqBP4O2tF/zntADxRTK9kDa/7D10TpwNdbud4hLMJnOdawB
	 Nkn98xHYA2ZWfy//zH61aZzNzPcpthPRm/z/1DY8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF4BBF805A8; Thu,  9 May 2024 19:11:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70E9BF805A1;
	Thu,  9 May 2024 19:11:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83E54F8049C; Thu,  9 May 2024 19:11:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41260F8024C
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 19:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41260F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VTGvIKV3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4E5161CF1;
	Thu,  9 May 2024 17:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C539C116B1;
	Thu,  9 May 2024 17:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715274678;
	bh=YA/u5mUcOxyTQK4E6Daw3gCqDJqZ+z0mf7v0UCWoLp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VTGvIKV3Q1U4y5xPkrsYLHkZEVfxKI5NSpA/MjGFH9qYIXb8ISw4VmwSYbRo3Wbpt
	 AUc17UJ2ENNqqBx/mzOFCwj4TDG9E5t499JPnvS2tgX6zKQzzyhspPT8OquDgx5LGL
	 ze8dMWHERjQ+aLj+EhFYiM5W0kjPL1KXaK50LQ09aUM1BSrKZIdnS5DfBX7E3jaeSH
	 iZykHvXUCEsYdzCQgK3pG2gzcqvnMmxVb/aWTx2n2kAtKvMQ7UiZ1JHwbt4xnA78Xl
	 f5DLkuB36V41YqYYP9cm4BriMD1pSpZN6rnhWZH7O9ldn3RRwdUsWH2x2dlVJA+Au2
	 ecUhVXGcZxHnA==
Date: Thu, 9 May 2024 18:11:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shengjiu.wang@gmail.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: fsl,xcvr: Add compatible string
 for i.MX95
Message-ID: <20240509-phonics-wound-58d3435165f0@spud>
References: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
 <1715223460-32662-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o/G3P2Zf+UnkTwok"
Content-Disposition: inline
In-Reply-To: <1715223460-32662-2-git-send-email-shengjiu.wang@nxp.com>
Message-ID-Hash: OKDFOYGL46V67GJEOYXO7VUKOSWFK6EW
X-Message-ID-Hash: OKDFOYGL46V67GJEOYXO7VUKOSWFK6EW
X-MailFrom: conor@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OKDFOYGL46V67GJEOYXO7VUKOSWFK6EW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--o/G3P2Zf+UnkTwok
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 10:57:37AM +0800, Shengjiu Wang wrote:
> Add compatible string "fsl,imx95-xcvr" for i.MX95 platform.

That's apparent from the diff. Why is it not compatible with existing
devices?

Cheers,
Conor.

>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,xcvr.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Docu=
mentation/devicetree/bindings/sound/fsl,xcvr.yaml
> index 0eb0c1ba8710..1c74a32def09 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> @@ -22,6 +22,7 @@ properties:
>      enum:
>        - fsl,imx8mp-xcvr
>        - fsl,imx93-xcvr
> +      - fsl,imx95-xcvr
> =20
>    reg:
>      items:
> --=20
> 2.34.1
>=20

--o/G3P2Zf+UnkTwok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj0DsQAKCRB4tDGHoIJi
0imKAQCYoCen/pDUqt0eydvNAg6kYtqxHG4j0dkiPPhCBQDTugD9ETg2kVQ8oDL8
pD2YGMysprBxoLeYVTWRCjCN8LvUCwU=
=iBRc
-----END PGP SIGNATURE-----

--o/G3P2Zf+UnkTwok--
