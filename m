Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E77F80723D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 15:22:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05AA7832;
	Wed,  6 Dec 2023 15:22:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05AA7832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701872562;
	bh=ZNkS8weCP0QRV3CVKvgaXMCVDfS0RmNiy+bdwYGA47s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AgYmHUOYmi0YD7VVVRNLrDLXxIVEG8K4wM72ifUpE4YjtnNmB9LJrUuZ+2/tP/WQj
	 nv+Xvc6xSw5cwdt1yCVfwpRumyUv2z/zcFX4y4uGG4WBd6DYBe41dxWNFtQDWBKYkZ
	 rCFv8VswZZDsP9A6PoCU24HbpXd26tJ5Of9XIqSQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDEB2F80557; Wed,  6 Dec 2023 15:22:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16489F80571;
	Wed,  6 Dec 2023 15:22:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C213F8024E; Wed,  6 Dec 2023 15:22:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B043FF800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 15:21:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B043FF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ucfeXW4O
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7951BCE1EAF;
	Wed,  6 Dec 2023 14:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1EFC433C7;
	Wed,  6 Dec 2023 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701872506;
	bh=ZNkS8weCP0QRV3CVKvgaXMCVDfS0RmNiy+bdwYGA47s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ucfeXW4Onf5QLw5HUed6uVr9oYAfp5wf4gAIw9ky7XNn5p98asSgcdhXVJEsaNEgg
	 nMIGXlktaYXOp9293d0j6tcsj1lvBoI/yz9FlvXbQdAObgiBYyosZ8uJGoAHo/LuaI
	 w3QGg2SGf52Xwn9HrKcX5J/Pql7PBmABiHRVteOmKpgLHvl/q9LhqSlDChuIHfkJPX
	 DEa3CemeWGH8GXhjojuVAHm4Bx4A0t39XHwzaZ9GfXBixu9jbNP0QozgFwMsN1ET2F
	 G8tVDyDC43rmaI7WoDgY9Nv2up1Z7C6jhOKx4BARyUTyGAEObnQ0Y3mI1HArTjWgbx
	 ZwX3dMx3Jmy5g==
Date: Wed, 6 Dec 2023 14:21:40 +0000
From: Mark Brown <broonie@kernel.org>
To: cujomalainey@chromium.org
Cc: alsa-devel@alsa-project.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: mt8186: Revert Add Google Steelix
 topology compatible
Message-ID: <51d05129-837a-434c-af65-08e9ea9fb7a4@sirena.org.uk>
References: <20231205220131.2585913-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4cFuMLhVCC2QbLhF"
Content-Disposition: inline
In-Reply-To: <20231205220131.2585913-1-cujomalainey@chromium.org>
X-Cookie: From concentrate.
Message-ID-Hash: 4SL5SI6PO3B4MJPEXSPW7GR7PJZSJBWN
X-Message-ID-Hash: 4SL5SI6PO3B4MJPEXSPW7GR7PJZSJBWN
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4SL5SI6PO3B4MJPEXSPW7GR7PJZSJBWN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--4cFuMLhVCC2QbLhF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 02:01:18PM -0800, cujomalainey@chromium.org wrote:
> From: Curtis Malainey <cujomalainey@chromium.org>
>=20
> This reverts commit 505c83212da5bfca95109421b8f5d9f8c6cdfef2.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--4cFuMLhVCC2QbLhF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVwg3MACgkQJNaLcl1U
h9DyfQf/VEmto/+PQwCGj8ayqN1Xy+2ItQx+hRnBWwpr0DisOgIREVk0TGmQpCCd
EQq64VBYa3BuQmAPHxfsZl6hOLEKSK6tGVvcBWgTeN1ehnOd8g7OpOwL5LzLWyaW
K00EES73JkLsV47y7VvEEXi/+trWlJcG/KiNOqyI6s18Ze3MES0pFu1Xf7mL5Z7f
pzw5du74slR8rV36pQELFvgXNccO28ZtvFzz7PYrGY5vG7C5tdm/CUfoso8yUkrJ
QJi0Q2LEfbhExbJhAJev+IaXPB8jiXnLOFyy/xoR1zrcDVjKXq6pKoK+5WjRXrrT
awNSeMCMBX2a77Eks39g3sUTqslQIg==
=GpYG
-----END PGP SIGNATURE-----

--4cFuMLhVCC2QbLhF--
