Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE047AFF99
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 11:14:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C102A1F2;
	Wed, 27 Sep 2023 11:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C102A1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695806071;
	bh=5ni2a/DB+QDF/FumPKPmxhwyxTIswmMyT0P7nFDDOjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LUYlflsQF3nsv02L0lCKnDiI7SVXVuOU21Ji1irgr8vbued4GdUYyStZoyGk8elgV
	 TBJ+fXuyi4CVCMDRRwSmcDcHtGMghi3qA+8BBstq/rb4RTRLzmPzPPjnCBVQqfkdWu
	 OJZ8Nn19uI4omxkRHPIGU0EFPreu7VqYTc5/8VJM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34BD4F80553; Wed, 27 Sep 2023 11:13:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E66B9F80166;
	Wed, 27 Sep 2023 11:13:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 761D5F8016A; Wed, 27 Sep 2023 11:13:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE563F80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 11:13:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE563F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ol/Uxc7P
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ECE65CE19B5;
	Wed, 27 Sep 2023 09:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1247C433C8;
	Wed, 27 Sep 2023 09:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695806005;
	bh=5ni2a/DB+QDF/FumPKPmxhwyxTIswmMyT0P7nFDDOjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ol/Uxc7PcT/MtG/rPG+r7m+HvHrK7JO+Z40E79QzTlG7bW7aKNMPuoLcyB30Oev2u
	 yJnnJUKl+pf2JidNgW7Uw7J+XSQ9mUzfviLiYb5wHE4YO3/CJSlluw83Wih1+TlMD9
	 VMWvLPtA/SUgt0wLYBt4GnUmmDxY4TVaXUGuqoMDVTzbBKGcs0bzUUPMpkIhP0h8r5
	 H9Y7w/9v571/uQQJPGwtRfZHzP58g+8XjwZNGjKUc2QnuU33HuoYU5yrqKicyjuV1A
	 8e72codJFL4mEsdffKV+PW1jLf+xcb/wXxOsYIKFGRipodHP9B5RrTIFIqZ7WK0lC3
	 YLo/abeR+foMA==
Date: Wed, 27 Sep 2023 11:13:22 +0200
From: Mark Brown <broonie@kernel.org>
To: cy_huang@richtek.com
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Allen Lin <allen_lin@richtek.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: rtq9128: Add TDM data source selection
Message-ID: <ZRPyMolOIjLBWXPC@finisterre.sirena.org.uk>
References: <1695780376-32301-1-git-send-email-cy_huang@richtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5fIGTM3mlZcEO9YK"
Content-Disposition: inline
In-Reply-To: <1695780376-32301-1-git-send-email-cy_huang@richtek.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: M3WK6KUX6W3VMS37AGCK4QLWNP4Q5K5S
X-Message-ID-Hash: M3WK6KUX6W3VMS37AGCK4QLWNP4Q5K5S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M3WK6KUX6W3VMS37AGCK4QLWNP4Q5K5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--5fIGTM3mlZcEO9YK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 10:06:16AM +0800, cy_huang@richtek.com wrote:

> Since rtq9128 can support 4 channel I2S mode audio data, there are two
> dedicated data input pins for CH12 and CH34.  But in TDM mode, input
> source was already drived on one data pin for multiple data slots. In
> this case, only one input source is needed for TDM mode.
>=20
> This patch is to add the data source pin selection for CH12 and CH34.

> +	SOC_ENUM("CH12 TDM Data Select", rtq9128_ch12_tdm_data_select_enum),
> +	SOC_ENUM("CH34 TDM Data Select", rtq9128_ch34_tdm_data_select_enum),

Is this something that's going to be changing dynamically at runtime or
should this be a device property that's set either by firmware or when
we're doing the TDM setup?  This sounds like something I'd expect to be
fixed by the board design.

--5fIGTM3mlZcEO9YK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUT8jEACgkQJNaLcl1U
h9AD9gf/XjwqNVU01O8geeDs/n0uPuij3TFEV+9FdQXoWkepHbUHI3z9MKx9QH2w
mrLYz27YdS0unjrkqXZk6L53daybs2KxJQCb1HlV3/YsFiwsWII6ZCYeAZASTwFs
SOXf8ZJmdkgXJxf0lYq+m7dNCG6e9EVqC2XlUWvbnUdVkYstni7TKSK7i/lvoT/1
+4WezkK8onTaoz3mprbc2TBDGfwATC5LA7E2CGZ0734rZd9XjyzY0wK8SPJn5cL3
1rNPGqvjzdc+f6VtpVKvZHK3JhONqKMCX+DWrf6Wx24QxjA5xzYpKMBviVSzEbMh
MDPRg6Bo5Dl8fezHnz75NQjf2hUBog==
=oiAQ
-----END PGP SIGNATURE-----

--5fIGTM3mlZcEO9YK--
