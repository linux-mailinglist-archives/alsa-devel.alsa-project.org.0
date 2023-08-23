Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC18785756
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 14:02:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA51982C;
	Wed, 23 Aug 2023 14:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA51982C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692792163;
	bh=+qxx9c835FfuA1kXHiCO2FXriByw1VW6r27tvA4DIV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pOVx83sHWxhhMgxFMd1dJ9Vl4CD53ua9K1Zw+G5pC0sGAJ0JQBiSdnn0v+PpYPT7B
	 oR4Im9U2tGArTVEb8fmZkm625pya8XBWjTeRPgMUDCI3dctH4SVfHGy0NwJf892Yyc
	 FKP3pST+knXq/NAYAn5Bz8YR+S1kbYLwj3m+zJKE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F41DF80022; Wed, 23 Aug 2023 14:01:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC79DF800F5;
	Wed, 23 Aug 2023 14:01:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C93CEF80158; Wed, 23 Aug 2023 14:01:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BF41F80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 14:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BF41F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g0cYXEFt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 863DF61EF7;
	Wed, 23 Aug 2023 12:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3C6C433C8;
	Wed, 23 Aug 2023 12:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692792090;
	bh=+qxx9c835FfuA1kXHiCO2FXriByw1VW6r27tvA4DIV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g0cYXEFtOZmvS9f1ZyhHu3qOlgMR9lM2JeQN5pI2RfuEJ55I4iGR3vWbgbWFLoeWr
	 ektm3RnysWW679tOWdUIJafJoIV6kKT7oJY6MHxkWBgpuFqqr6yC6URM8qrwJeiYxM
	 y1kPg8/C6VBHhySyketzc99Of0Im7p0RKu+zo1RN5BECEsbc9usuSIObPQnaxLd+gH
	 Jkldhnanup1GMNFmqKNSfBtz7563I4KPISVEGBmlm7g7UqtbSk4L/Zqxg/4yjn8/PI
	 RU0xjQ8LWRGbiwxSMQ1n1dxxc4PpGX0Xqe3ZfFLbed1HbN9PGkdp1vaFYyEl+e2jq2
	 IAMx1Ld3zj8/A==
Date: Wed, 23 Aug 2023 13:01:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Yong Zhi <yong.zhi@intel.com>, ye xingchen <ye.xingchen@zte.com.cn>,
	"balamurugan . c" <balamurugan.c@intel.com>,
	Libin Yang <libin.yang@intel.com>, Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	David Lin <CTLIN0@nuvoton.com>, Brent Lu <brent.lu@intel.com>,
	Takashi Iwai <tiwai@suse.com>, Terry Cheong <htcheong@chromium.org>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Gongjun Song <gongjun.song@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, apoorv <apoorv@intel.com>,
	alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1] Revert "ASoC: Intel: Add rpl_nau8318_8825 driver"
Message-ID: <dd6d51b0-cc60-4fb7-932d-1117143d1715@sirena.org.uk>
References: 
 <20230823040755.2217942-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MBcFXgJDzxWkGZnR"
Content-Disposition: inline
In-Reply-To: 
 <20230823040755.2217942-1-ajye_huang@compal.corp-partner.google.com>
X-Cookie: Some optional equipment shown.
Message-ID-Hash: TULFR67X5Q4BBUSIFEFM5WCUZYYIP6W4
X-Message-ID-Hash: TULFR67X5Q4BBUSIFEFM5WCUZYYIP6W4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TULFR67X5Q4BBUSIFEFM5WCUZYYIP6W4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--MBcFXgJDzxWkGZnR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 12:07:55PM +0800, Ajye Huang wrote:
> This reverts commit 6b8b6892e43419f5339c47d307b1baac0eea036d.
>=20
> Report from kernel test robot <lkp@intel.com>, that
> in broonie/ci.git file0yZ50U, it's redundant
> commit 6b8b6892e434 ("ASoC: Intel: Add rpl_nau8318_8825 driver")
> because commit 273bc8bf2227 ("ASoC: Intel: Add rpl_nau8318_8825 driver")
> was committed at 2023-08-14.

6b8b6892e434 is not applied?

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--MBcFXgJDzxWkGZnR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTl9RIACgkQJNaLcl1U
h9Dg8gf/fG431V157LLa4NzxUiQbuVBUo6pIu6PK37YsZkh6Q9RRnnaEdS2lg2MG
C/EWEXWhvyV2n4zIrP+XVyIA+v3/zpSp5ES0jaIMHzSrF9A8ntqPdsh+3TXQ0lqi
F/JZ6RFemqK9GUmF3xCdxWF+/seCmKzVwM0PUpX7lCSxs2duf0IETtl1HnLFp9aY
fZLKeYLLzBEvmPEdEekkEXWqFjesgFgAUqJF6HgDUs3qYb9VLWvwuMiHwLakTc7R
X7QJsdRR+nN1mnJu/AOYGCcGddKPJBwn4uTeFa30X4+vfM1AIkF/wHWUVMae5cgv
TlP6NTJFpnSq1lFZMBFe9mIOOtlK9w==
=kYaH
-----END PGP SIGNATURE-----

--MBcFXgJDzxWkGZnR--
