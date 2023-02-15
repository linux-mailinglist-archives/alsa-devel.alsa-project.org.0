Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D073697C83
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 13:59:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DA66843;
	Wed, 15 Feb 2023 13:58:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DA66843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676465983;
	bh=eyP/8H2w6Aq7Vb2ltmRwluPS7KXnfTSnFc3mifM9j/o=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ehYnnL0rgxaY7Du9R2wEczk4JDMNw7+PQl6qrgvh7rF/YM2oNoW7dGSIdKm6PcF7P
	 Iyg1+0D2b1Zos6oUdAwYp2KLJpR8PVCv2dkVt79bAJiVLM5RWMyrLEBKPv1nxVZBK2
	 xxYSjVDqoWAoEdKgaK+ty0LE4mVAG61CzAUG2PoM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9671F801C0;
	Wed, 15 Feb 2023 13:58:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDA89F8047C; Wed, 15 Feb 2023 13:58:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F413BF800B6
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 13:58:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F413BF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NijATvzR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 80A4761AAF;
	Wed, 15 Feb 2023 12:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 594FEC433D2;
	Wed, 15 Feb 2023 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676465924;
	bh=eyP/8H2w6Aq7Vb2ltmRwluPS7KXnfTSnFc3mifM9j/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NijATvzR8b6e7No1G41E+8G6J2f/+t01fspm1dRlVUs84T/vitbZV/XCYlM5FzSyc
	 CtioQM7mqHmZpCB3mcmxZuO9SbsNkYvGLoi0SAhNW9DEIU7xdBgAr1+H/2w0o7vuBO
	 PMR+jJe6wvYnYdUSb4s9k5dHDearL3aUvIf8/O4BfzBne5J6D+Xw2KeQpG/ewgAby0
	 6/6UjdvHKfbK1tHtgTsq8Z6qx6W+FmQbck+2hKvZAuYaJ60466adJzzBMDjadATaeW
	 gC6MbrHE0/Ry0EV7PlbLyao87AkvUSEFLiB1UywwzcfPS6ubO/laCiCuW4hnOZ4b77
	 cm3LV3/InRo0w==
Date: Wed, 15 Feb 2023 12:58:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <lucas.tanure@collabora.com>
Subject: Re: [PATCH] ASoC: soc-dapm.h: fixup warning struct snd_pcm_substream
 not declared
Message-ID: <Y+zXAQHHhkPtjXZB@sirena.org.uk>
References: <20230215094643.823156-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H4pdYQ3rNz1gxtj+"
Content-Disposition: inline
In-Reply-To: <20230215094643.823156-1-lucas.tanure@collabora.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: P7JPKUKTDSHOZXEMFNJ5QZRK3S7KXDVZ
X-Message-ID-Hash: P7JPKUKTDSHOZXEMFNJ5QZRK3S7KXDVZ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7JPKUKTDSHOZXEMFNJ5QZRK3S7KXDVZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--H4pdYQ3rNz1gxtj+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2023 at 09:46:43AM +0000, Lucas Tanure wrote:
> Add sound/pcm.h header to include struct snd_pcm_substream used in
> snd_soc_dapm_update_dai function.

> +#include <sound/pcm.h>
> =20
>  struct device;
>  struct snd_soc_pcm_runtime;

This should be a forward declaration of the struct like the
adjacent forward declarations that are already there, we only
pass a pointer to it we don't need the contents.

--H4pdYQ3rNz1gxtj+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPs1v4ACgkQJNaLcl1U
h9BmuQf/XGMHuzkuHa6g7NfdPJiXEc/2CMdz9QaXMWzdXCKriEHeZwvEBNDb5vbT
OTfHFHZT6SA2/b1xjFJNizc/EhG5bAf9VpYPKHeY5QzoaoXnK/LmnGaSz9bd3avi
stM3whRCQDFAv2MswJna4r/+oRWOssZbhv/2TjTCLi5pWca1LTm24sooqKG+g11w
NG+ooCEE2IquycBT56spysa0ds+Ekxkx9lwu5rJXmj5rg9QiWMQG+JlBhxA2BUrD
V3atTKZEL5IdLpGazmQFe7V/9wM4jDtnhSHMonapfX2fQ/TprcqjvJUwjy/9eXU3
cjKvJsorSjFww1TPSV1piq+s5x0syg==
=g84M
-----END PGP SIGNATURE-----

--H4pdYQ3rNz1gxtj+--
