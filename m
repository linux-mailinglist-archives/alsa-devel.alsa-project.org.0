Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93391859900
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Feb 2024 20:13:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3E639F6;
	Sun, 18 Feb 2024 20:13:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3E639F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708283607;
	bh=/H62QMDTLmM1dXDrq6dNaaqlML8aeDxPeyDcHN0WyrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I2A482mLcHEs4OSH0+sujJH+9sIFZ9PQ7Fp/tpkPv4eDTBq8KaBpoXjG8Y1/9JYru
	 vZj9TfWaaMoB3lxVGNd7k43vBvnBWaD+d7cF6QfMSUG7hHRjchhtgy06WtNtLVS/5q
	 I1T87y4ChQ+C7YxMIF3eX1pXZpCeC/c1qdcLwBNQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B6D7F80587; Sun, 18 Feb 2024 20:12:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B2DDF805A1;
	Sun, 18 Feb 2024 20:12:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35E07F800EE; Sun, 18 Feb 2024 20:10:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59326F800EE
	for <alsa-devel@alsa-project.org>; Sun, 18 Feb 2024 20:10:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59326F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ucw.cz header.i=@ucw.cz header.a=rsa-sha256
 header.s=gen1 header.b=ZTiTJ3UV
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 9689F1C006B; Sun, 18 Feb 2024 20:10:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1708283419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pFAnKsSUhODm3ulUCr0ZKCb5X66vxbSvVEnktFSeTTo=;
	b=ZTiTJ3UVs4a2Vgx5wJ7z2U/BLAVe3GBOVa9rJSP9pZWfwXid2Ga5YyNEW+qIzF7tKld/vm
	BMK0qi2rBhgAwQHYI3elObLrsKLrkActviADTxwwPbma3MrCpGOn8hw4OSoD6MhSIR6AXt
	8wn2nx30JNRD3d9sEyGT05XvxL4TE40=
Date: Sun, 18 Feb 2024 20:10:18 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mark Brown <broonie@kernel.org>, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.10 04/16] ASoC: codecs: wcd934x: drop unneeded
 regulator include
Message-ID: <ZdJWGgYMRoeLEKWh@duo.ucw.cz>
References: <20240207212700.4287-1-sashal@kernel.org>
 <20240207212700.4287-4-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7qa2KFxf9dQT6fA5"
Content-Disposition: inline
In-Reply-To: <20240207212700.4287-4-sashal@kernel.org>
Message-ID-Hash: XXUWYEEX5T56D7UNQ4PMJQHDVOKZTUST
X-Message-ID-Hash: XXUWYEEX5T56D7UNQ4PMJQHDVOKZTUST
X-MailFrom: pavel@ucw.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XXUWYEEX5T56D7UNQ4PMJQHDVOKZTUST/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7qa2KFxf9dQT6fA5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [ Upstream commit 35314e39dabcfb256832654ad0e856a9fba744bd ]
>=20
> Driver does not use any regulator code, so drop redundant include of
> regulator/consumer.h header.

This is just a cleanup, we should not have it in stable.

Best regards,
								Pavel

> +++ b/sound/soc/codecs/wcd934x.c
> @@ -13,7 +13,6 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> -#include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/slimbus.h>
>  #include <sound/pcm_params.h>

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--7qa2KFxf9dQT6fA5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZdJWGgAKCRAw5/Bqldv6
8iOQAJ9inBpQDN+haYqgeqPuxAw4PDFSwwCfVVi8mLYBEMh2CxLJvoxzV8+OUVc=
=0c1d
-----END PGP SIGNATURE-----

--7qa2KFxf9dQT6fA5--
