Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E2987A7BA
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Mar 2024 13:43:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51091211E;
	Wed, 13 Mar 2024 13:43:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51091211E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710333800;
	bh=DXSVZljyBLC5a5bv0CgQcHa/KwzURiQNZglsucfnuhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GfW35FyKBWqpqcCXTMn52M0+DwC5hB8qhV0NXxAzvKKRvhEYfW3F1jkTlK1Unk2fh
	 ZwVwpUomvdtcMLQl2+zn4hOryfr8DFVISAWSKx0JLjCNA+bQ+YlBwF0vXU5/t7XfUf
	 SN2IHLxvDBDjuIKLEXDNjClbDYhHmi1q/O51MlEA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58DCCF8014B; Wed, 13 Mar 2024 13:42:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7669F804E7;
	Wed, 13 Mar 2024 13:42:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC281F8028D; Wed, 13 Mar 2024 13:42:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1671AF80088
	for <alsa-devel@alsa-project.org>; Wed, 13 Mar 2024 13:42:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1671AF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S7iVlM1Y
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1905361375;
	Wed, 13 Mar 2024 12:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96983C433C7;
	Wed, 13 Mar 2024 12:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710333750;
	bh=DXSVZljyBLC5a5bv0CgQcHa/KwzURiQNZglsucfnuhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S7iVlM1Yv1FdfGxD5dAxt5gtvqPHKBy18644j0pvXAICnMmlq1ZUb3cD2ioaZYpgL
	 //AMzZ5ClKLtUS6DWftu9L9v6wjtj9YGYwI8yWCowMXyi02ls/9ZpA4v67CLHYdeHM
	 dV2L8kBzrY7ZFOZ1H8f/o9kD40draOJ3M2tpzXnAzGXNdJLz82x2qnyaM4qjcsAn3y
	 vdE/bTQB27TepIUa1O3ZbOU8KmTb45gboqvYF8DnTvTFJkmiflFrf7KtzyqHiEWpBn
	 B8fp/TmKvEa0dEdzIIZeAQRmHGAJEC1S3ErwhRipgq0isUyWO+hx2JOZrfcgnpoKVW
	 iUJ48KwBMVdBQ==
Date: Wed, 13 Mar 2024 12:42:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/5] ASoC: makes CPU/Codec channel connection map more
 generic
Message-ID: <0388cd67-42d7-4a20-bf05-6637d484d0bd@sirena.org.uk>
References: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
 <87ttpq4f2c.wl-kuninori.morimoto.gx@renesas.com>
 <e7121fbc-c814-4153-9f17-82ad5de13e64@sirena.org.uk>
 <87a5n46xjk.wl-kuninori.morimoto.gx@renesas.com>
 <7248b107-db87-4409-b93c-f65035d0a6b4@sirena.org.uk>
 <1jo7bje6da.fsf@starbuckisacylon.baylibre.com>
 <b9de4fd1-ef4a-4c30-b3cf-e36931be90f1@sirena.org.uk>
 <1jh6haih3f.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wQxpEnVQw38uV/8e"
Content-Disposition: inline
In-Reply-To: <1jh6haih3f.fsf@starbuckisacylon.baylibre.com>
X-Cookie: It's later than you think.
Message-ID-Hash: BGXW7F22FY7AOI5E7QQJ3VPB3P7H7FOV
X-Message-ID-Hash: BGXW7F22FY7AOI5E7QQJ3VPB3P7H7FOV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BGXW7F22FY7AOI5E7QQJ3VPB3P7H7FOV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--wQxpEnVQw38uV/8e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 13, 2024 at 10:36:41AM +0100, Jerome Brunet wrote:

> * Only the u200 is failing. The others devices of the same family are fine.

Oh, that's a shame :(

> I'll continue to check but this is apparently related to the options
> turned on by the debug fragment. Maybe it could be interesting to check
> another non-intel SoC manufacturer using DPCM with this fragment ?
> (another device relying on cleared ch_maps - Renesas and/or MTK maybe ?)

The error reported was a kasan one so it may just be that that needs to
be turned on to reproduce.

--wQxpEnVQw38uV/8e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXxnzAACgkQJNaLcl1U
h9Ai0wf+OYHVg9zC6RMcSJpC7ACW+vbtvz0OdadwhgAlHiep1nwv1pT8HxQ/a6ww
XtYXBPeyZ+Y7/NGN1c01Jvd/h61KP2A/wOM0e2XOh+C0TEqfknw9r+TFVkeqTnMY
B684z8HI9r+W015kRWHkTV965eMBjxrXIw8iuRCPs75BpdxShLBDm4r6tw1O+j7f
ZjRxYQmQS+0k++0IheEtoK1zx8h3jrFKYtmFyI7h/zaGTShIu4PwAscGGhk8wd1X
jm1zEcn55OP3w/8FtzYSGaec0L6ehUDBv23Zpgnx9KuUIvehR/oWzo3uhlRTCKui
0QHsYd3RamfGrNFDssvpWFVWblNP6Q==
=ZlKR
-----END PGP SIGNATURE-----

--wQxpEnVQw38uV/8e--
