Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD9B931A36
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2024 20:20:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC5AB1F6;
	Mon, 15 Jul 2024 20:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC5AB1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721067635;
	bh=/a7n+L06/3cwBvsUR+R5BPDaGBL3GPi9f9ewNLQr5sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tS9CBY2g6MTtROO1xNnnaw17+6rqcb65oYDaQDZVdvKV6XIWxkETFAy/rTzMVbTH6
	 3zY+yB0ZpagRi+XiEkgUWOSeZn9cCw+oZfPlx4m11jbqu5JmIlg5ygsFT1K3xMyeYL
	 vQg79Wa628rPnwiqldH+GguNfcB5OQPuwqLdxYVw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A823F805A8; Mon, 15 Jul 2024 20:20:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEF99F805AE;
	Mon, 15 Jul 2024 20:20:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0FE7F8026D; Mon, 15 Jul 2024 20:17:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C0B5F8007E
	for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2024 20:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C0B5F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=e59gx80N
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A3E53CE1028;
	Mon, 15 Jul 2024 18:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D19C32782;
	Mon, 15 Jul 2024 18:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721067461;
	bh=/a7n+L06/3cwBvsUR+R5BPDaGBL3GPi9f9ewNLQr5sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e59gx80NuvMFPiOJCDd5+eKnTh2fJOx2oeMiLtN08PStrCTN0pegn0SKoRSSqG6nP
	 i9M5gpZwDgxFTNkL8vBLMN9zmSPSzbFcDNwEr2nDARee8R1gO64VGEEhhP8ot3ghZG
	 Ru1Kwshg6m3I/tLcMfuBmdMwSp+uLyp5CPCH9pC1A+sHJMk2pczFL1gt6657f2OVC3
	 nOfZ45/Qsfykek0412e0xF0Ahw0ksDRV4urjpZWnGTOfyc0XfPqSc8NcyTekCCxi9c
	 C/DWQSApIPyrwL07dwSyXVgbcQr10uu0x1TC4k6xCrU1DYDZ2KeKlPvsi89YYC4VHs
	 dnzOKi0z1KoJA==
Date: Mon, 15 Jul 2024 19:17:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	linux-kernel@vger.kernel.org, j-chadha@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
	henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu,
	Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
	cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com,
	jesse-ji@ti.com, darren.ye@mediatek.com
Subject: Re: [PATCH v1 2/2] ASoc: tas2781: Rename dai_driver name to unify
 the name between TAS2563 and TAS2781
Message-ID: <8ee6346f-8608-4436-9371-35a29c763e4a@sirena.org.uk>
References: <20240713015145.314-1-shenghao-ding@ti.com>
 <20240713015145.314-2-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8LkSsyNIfzHoV24h"
Content-Disposition: inline
In-Reply-To: <20240713015145.314-2-shenghao-ding@ti.com>
X-Cookie: You'll be sorry...
Message-ID-Hash: YKANKYUX64KUK4FBGQEYJDSOUBEMAHDB
X-Message-ID-Hash: YKANKYUX64KUK4FBGQEYJDSOUBEMAHDB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKANKYUX64KUK4FBGQEYJDSOUBEMAHDB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--8LkSsyNIfzHoV24h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 13, 2024 at 09:51:42AM +0800, Shenghao Ding wrote:
> Rename dai_driver name to unify the name between TAS2563 and
> TAS2781, remove unnecessary line feed, strscpy replace scnprintf.

This should be split into several changes, the name unification, the
linefeed cleanup and the scnprintf() replacement don't seem to overlap
at all.

> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
>=20
> v1:
>  - Use strscpy to replace scnprintf.
>  - rename dai_driver name from "tas2781_codec" to "tasdev_codec"
>  - Remove unnecessary line feed for tasdevice_dsp_create_ctrls
> ---

These changelogs should come after the --- so that tools can cut them
out when applying.

--8LkSsyNIfzHoV24h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaVZ7wACgkQJNaLcl1U
h9AKuAf9EzKY5bZtrfwCgfckt8+TSEnO+8AaYC/hRJmziSj5sStrTISP5Psoeqtx
EikijpKOEs6faFyafTgeVYjy0z8gycpPXRA3kN8iuYOT4qiXgfgg70LL5aEZbyt6
UtljkGXCNfNs5U4pYk/FaGj1wULTr+M91qFQbQOfLswbF1XPN7Xf3T/oaPp1bdz6
M1Rnjwnrh8/gVoV/ReViYDqDz+jRUPS+ae8YJj21qWYnmM80juOBy+V7ng3cjQL3
8EziPDKzh9tXduyfBbW20rMOYoVTMALOPm/y2zNnyGwabM/jPCZLOIcLe+tn76J+
5ZLgRDdRK4i8kMZbJqRzlAF7B8XQxg==
=s1cR
-----END PGP SIGNATURE-----

--8LkSsyNIfzHoV24h--
