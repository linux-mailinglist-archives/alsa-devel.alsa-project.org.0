Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5CD76A30E
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:38:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 948B47F8;
	Mon, 31 Jul 2023 23:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 948B47F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839504;
	bh=vj96umHy5Xr60cLrlkkEJA8m1Xb97ziR4gGWBgDzPh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AgBzjLd5r7ewEfE+GoeGrIcGpSJzW+CIGIuDnNlJJDM/f3Q2DNjBQ/2wrFgYjZd/j
	 LTBhDyE87BXYBDb7nJDBzceQYgZBJGswsFevnhA3kkzUlSQU+DVu3DNbUNEi856nbG
	 9YYo6lSaEscnmYtd8Jdwd0lwP1BoQrbb0pIzipsc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5255AF80520; Mon, 31 Jul 2023 23:37:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C39D5F80163;
	Mon, 31 Jul 2023 23:37:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA49CF80163; Mon, 31 Jul 2023 23:37:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD086F80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD086F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=terM4GAk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F04D2612D6;
	Mon, 31 Jul 2023 21:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02452C433C7;
	Mon, 31 Jul 2023 21:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690839443;
	bh=vj96umHy5Xr60cLrlkkEJA8m1Xb97ziR4gGWBgDzPh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=terM4GAkenKnKwMxYm59xOR8nbrUnzYoqSRgOYru0Bgs80HMy9f9Jjj1m9cWZTWRC
	 xfjiFK01X/H6U9Sij/YZ7OSsRZkbFUSyehypVKHg1Ur3GPALDjTG0UEkC3tflfzcPn
	 mGClDNZ7FXjPbOoSpgzCCcm9blbPjcc9NPbwUcGuwCN8IJwhwjjqfyqIQ17rCHBJNX
	 kOQWToFCcw1LHQOGotL8tTOc1VHRrh8wHRUgiinZSPoBQNOaI1qhjYOEYN7pC3HWBO
	 bOCHKXOeTBrp76VKz/uvhgZ4idxEt6Reqirk0VdsuU6nU3MNxFncqkdsMGgdN1TiNW
	 QkfFyxNdqNrTQ==
Date: Mon, 31 Jul 2023 22:37:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
	Trevor Wu <trevor.wu@mediatek.com>,
	Yaochun Hung <yc.hung@mediatek.com>,
	Kuan-Hsun Cheng <Allen-KH.Cheng@mediatek.com>
Subject: Re: [PATCH 6/6] ASoC: SOF: mediatek: mt8186 modify dram type as
 non-cache
Message-ID: <db547382-40f8-4dd9-962c-deedd7fdd50a@sirena.org.uk>
References: <20230731213242.434594-1-pierre-louis.bossart@linux.intel.com>
 <20230731213242.434594-7-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OeYtHYc1queCO9jV"
Content-Disposition: inline
In-Reply-To: <20230731213242.434594-7-pierre-louis.bossart@linux.intel.com>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: I5IEMTYTAB4WLLJVYBN5BFJO36R66ODH
X-Message-ID-Hash: I5IEMTYTAB4WLLJVYBN5BFJO36R66ODH
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I5IEMTYTAB4WLLJVYBN5BFJO36R66ODH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--OeYtHYc1queCO9jV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 04:32:42PM -0500, Pierre-Louis Bossart wrote:
> From: Trevor Wu <trevor.wu@mediatek.com>
>=20
> To prevent incorrect access between the host and DSP sides, we need to
> modify DRAM as a non-cache memory type. Additionally, we can retrieve
> the size of shared DMA from the device tree.
>=20
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
> Reviewed-by: Kuan-Hsun Cheng <Allen-KH.Cheng@mediatek.com>
> ---


You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--OeYtHYc1queCO9jV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTIKY4ACgkQJNaLcl1U
h9BEBgf+IIYwz7Jj0zZ1Vb/qVb6scrjfzWEFRX2j0qNbCJmxZu6WxODt32OrtBzW
cdvytbXrkUVGtcPvIF94wivLWvR+UG9/xE/Ozl6aBGpi/kLsNISI6wH98Wz1Lems
mLlrBKOKwnptMI/h7eJ8yfV1tXjpEDe28mjlFJjLuEzgOqw+1xHTgyb73pEqBLVf
EBhLvw9j85MIfpV5SeAAOvpPk0qPYwvavwcwXqb9+h7VzTHE5uxq7/y4IkFFGQTp
K9j2MwEIQy86uhoskfiuXtBOFgM9NntvXpKrnzpQhlalWs1gLjNAZY5VJhr3LB/Q
GGjY/be2zsncOIX9ZIXtV/tIdWCqdA==
=tb0j
-----END PGP SIGNATURE-----

--OeYtHYc1queCO9jV--
