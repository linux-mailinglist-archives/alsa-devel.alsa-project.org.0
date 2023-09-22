Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1F47AB40A
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 16:49:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0645CE72;
	Fri, 22 Sep 2023 16:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0645CE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695394148;
	bh=MOhFtSxywGBpaqP+/PDz7RXVCPUbnemaokEwfMmBonY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GX4swyNojmo9ecvkiFN0wctj2LznMVl+TDK8SEPs/Ma/AEQd7gd2a0hIM/ht2m4mk
	 XjeeizR7InJ8LFAnd7G+PfZ7uD5qqYodUtjlJvUyMTlqtRFoI7snGHgpiFKhW6MdD6
	 +3TiuDUV5s9BKS4jfz+uxkRUGhtbQ8KPPvKrvlxs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0229F8047D; Fri, 22 Sep 2023 16:48:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E91DF80124;
	Fri, 22 Sep 2023 16:48:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B0D1F80125; Fri, 22 Sep 2023 16:48:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 463E0F800F4
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 16:48:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 463E0F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KlAYPKrG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA1FE622C4;
	Fri, 22 Sep 2023 14:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67FAC433C9;
	Fri, 22 Sep 2023 14:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695394088;
	bh=MOhFtSxywGBpaqP+/PDz7RXVCPUbnemaokEwfMmBonY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlAYPKrG13tOQTGsGM+XdpmN2DJRaTkS/TM8UYhSO4pkDN8UsBgPgD8cCIHLTJbPQ
	 IG1CuSDapXaqT+WeQDUbGm230ecSUaDJfiHkX6Joo4+5AhgU7hlrfZIpGhhnr4d6j9
	 6tteYJ+qhV4xUWQdsUyyhE64VnhArtYLOJu9qv65SaExEjMp1Hdx1gJ0mP4hWBzeU9
	 oBDsHVw1VbZ2iTjjSo10M5seJyA8Ous4uD+vxAcdqt1zUW0BIX+EcChGyecpEpzUc1
	 qYazKBatGp4EFmGRFVTfbkuFuay4U8PJh6LJskJPFGapvXFYPza0jsOpzeWatQNZP+
	 QZJttlhGL6c8w==
Date: Fri, 22 Sep 2023 15:48:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: 'Takashi Iwai' <tiwai@suse.de>, 'Jaroslav Kysela' <perex@perex.cz>,
	'Takashi Iwai' <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v1 0/2] ALSA: cs35l41: prevent old firmwares using
 unsupported commands
Message-ID: <8adda3b7-90f0-4d0b-b990-669a591becad@sirena.org.uk>
References: <20230922142818.2021103-1-sbinding@opensource.cirrus.com>
 <87a5tecm2m.wl-tiwai@suse.de>
 <005e01d9ed63$4b605550$e220fff0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YQfCH/+O2F9Rglbu"
Content-Disposition: inline
In-Reply-To: <005e01d9ed63$4b605550$e220fff0$@opensource.cirrus.com>
X-Cookie: A day without sunshine is like night.
Message-ID-Hash: 3W322IOGNU4BJBGWVNM6X2PC2QIQ72EU
X-Message-ID-Hash: 3W322IOGNU4BJBGWVNM6X2PC2QIQ72EU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3W322IOGNU4BJBGWVNM6X2PC2QIQ72EU/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--YQfCH/+O2F9Rglbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 22, 2023 at 03:44:30PM +0100, Stefan Binding wrote:

> > So those are fixes needed for 6.6 kernel?  Or they are something
> new?

> These are to fix the issue that was reported on the Lenovo Legion 7
> 16ACHg6,
> which was introduced after the fixes to CS35L41 HDA System Suspend.

Could you be more specific about which fixes these are and which tree
they're in?  If they're fixes then I don't have anything queued for 6.6
so I'm confused about why you say there's a dependency on my tree.

--YQfCH/+O2F9Rglbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUNqSIACgkQJNaLcl1U
h9A/Ogf/biZHy048dz2KHe8iObwC+lZhV5DTWj/Pj8I3PIvn9kkIGQaUqzZLN1Kg
JUrnxb83CnArTEoeFJO/oa48ZGfY20p30AqNIzmPQ50kE4rEGIp3adBMXUEovr64
zBRnLiDsh6lbltPt+oTQOF5bO2V39AuKmHYiGEpE0yQbAATOva53Roscyz7PnLAm
USTUAV317CdEvMAI17EabnvwKSsLugyNfrF+3lI2yweSGItJlJlla88kqTeOyBfE
GAzSsMJWyuVwQaJ36+UMd23oDwQDEh6sYJXYtr1dSyITw27ujxkgSZdB9TbiB0Lm
A8c02pWrJA6VDC2W5l/4NoDYokQQRA==
=/X3M
-----END PGP SIGNATURE-----

--YQfCH/+O2F9Rglbu--
