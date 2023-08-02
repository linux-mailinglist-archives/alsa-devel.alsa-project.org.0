Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0B576D547
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 19:29:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BB463E7;
	Wed,  2 Aug 2023 19:28:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BB463E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690997378;
	bh=fZOqG176cU7NTL9kF5IUl1tJY6WVyVd2yvYUysK5c4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iW8NIzbBEIGZxYusq0cbdDX45tTZkFxhSCavC76TBbGtmNiw1HEhelyXIFwGmxxiz
	 DckOfTVHhUpjyYko0MHj8qlyYux0JbuNqJya30efj3+eLo/SfF9U0eVos4Lg5oByg1
	 hYKYnGQKe5xpymebOAkBO4v9raeixK73eOcEWuBU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BFCFF8025A; Wed,  2 Aug 2023 19:28:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE14CF801D5;
	Wed,  2 Aug 2023 19:28:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5732EF8025A; Wed,  2 Aug 2023 19:28:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0BA8F8016D
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0BA8F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=s2qTYnVT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8B8B461A71;
	Wed,  2 Aug 2023 17:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DCEC433CD;
	Wed,  2 Aug 2023 17:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690997308;
	bh=fZOqG176cU7NTL9kF5IUl1tJY6WVyVd2yvYUysK5c4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s2qTYnVTVxmoM/7E/k8f+YVgG+VoGlUIkCW4hUuPFLuW45Gpukag9xjM4G3yNBRFf
	 F9fCcepA0IJAxVfYgBXTi8XC7/fq7AcFLOvA/w5RvjjHUI+sm7qsyIdmxRSymToi9l
	 yElDU1nHeyyAjVpoQg5Q5NsbrP+YDFUWrR1m5qES87cZqrJ3NPRmGCKpcEEFbO18tz
	 PjSrySyhW7OxIuJFh+AsVT0s3SIttTqOByGvWzsj/DE8J1hbh+ezaer48zzC6FqYxG
	 UbTNdG7cNb+U30jy6EPoOvwQU08wmaPJKQecvoO+Q9ZB6nl+DEYqcINItbtYUY9/HA
	 OxkuVgfo611Cg==
Date: Wed, 2 Aug 2023 18:28:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, Hans Verkuil <hverkuil@xs4all.nl>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
	tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
Message-ID: <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk>
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
 <87il9xoddo.wl-tiwai@suse.de>
 <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MdG0m2yIP0FKio4T"
Content-Disposition: inline
In-Reply-To: 
 <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
X-Cookie: Humpty Dumpty was pushed.
Message-ID-Hash: J7SJPJBH72ZIM5LJRGIAO564MXE62ND2
X-Message-ID-Hash: J7SJPJBH72ZIM5LJRGIAO564MXE62ND2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J7SJPJBH72ZIM5LJRGIAO564MXE62ND2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--MdG0m2yIP0FKio4T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 02, 2023 at 10:41:43PM +0800, Shengjiu Wang wrote:

> Currently the ASRC in ALSA is to connect to another I2S device as
> a sound card.  But we'd like to the ASRC can be used by user space directly
> that user space application can get the output after conversion from ASRC.

That sort of use case would be handled via DPCM at the minute, though
persuading it to connect two front ends together might be fun (which is
the sort of reason why we want to push digital information down into
DAPM and make everything a component).

--MdG0m2yIP0FKio4T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTKkjQACgkQJNaLcl1U
h9A05Qf8DvVF+7HkTrWpZeLLTiun4dI0bUwdJ7dBv/9eO2gLeD8aonbFN/iOGUS3
6HQafM/WVAHT67s9CThpIHGG8oWuubOG2Na3mKSs3xD+zRf4NVxpUN9+2JclaYtt
zKwBd+OYExLP/x/6qTGyqQi5BC0pmgpk73+mQtRRVClGOdjsfE3ke6TWvOBsIUsZ
+l3hAMxeKmIgczEq5MkPahD2mfN0CZgbCwaFA2zriaJXCPxPP/YFvYf+Mli8KDBK
6eRZS7e6SHICYPyqngTDICpj6MbiIxCHm7qIKEboyK5C0cW8PR52o6fbyN0XAHxc
sNfbpJop+bjYwFJQnjwlPTzGqO5cgg==
=0H5v
-----END PGP SIGNATURE-----

--MdG0m2yIP0FKio4T--
