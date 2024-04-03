Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ED789748D
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 17:54:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADE762CAE;
	Wed,  3 Apr 2024 17:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADE762CAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712159653;
	bh=k/OEm1O+N4pFF8hKKQ1wp3dIBzJrgNFMh7ciuZb3SgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SgsJkv2sTOz75Jxof8o0GPqxMHG/PVMMv/rDKOm6cRQ9cgJPud4l0v2fzMoyepUmK
	 /aq8aCX3dQ8MrdCPUtW90YKWX8i5i8FsegAamzWc/4Gb0e0ihoMigq0+mJxchGqr3x
	 CsND/8uGoOG+PbX42hGsO2xNykx7NQFOTtOT8+rQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17BFFF8058C; Wed,  3 Apr 2024 17:53:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E3DDF805A0;
	Wed,  3 Apr 2024 17:53:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B5D0F8020D; Wed,  3 Apr 2024 17:53:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C44ABF8015B
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 17:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C44ABF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sLg7zsqa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E309CCE126E;
	Wed,  3 Apr 2024 15:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28717C433C7;
	Wed,  3 Apr 2024 15:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712159602;
	bh=k/OEm1O+N4pFF8hKKQ1wp3dIBzJrgNFMh7ciuZb3SgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sLg7zsqa7TwwrbSu5mXYsd8T/1gxfVBuRvhweIu57XJOvEJbsGdCYrPuTixZ8DHDc
	 jyyvniVOACqSumcuvdW/hjzg4Pnf45zNsuLshvsLpiEn6Vzw8l8gwnSwaJHc27P9Kk
	 6fei932wpqzuHgzjBSNuJBrhqPLVRTlsXYGvEjsZ/HjIaH8lo9X4y8zkTah3NWAuN7
	 O7V59796ngEC5IDsvKsgfziNkKfuqcye0kjVHYI+69AAAWv2njISKjNoP1IJonWMVz
	 Dl5sdgRtzUQ/DV7G2qQUfnnZpDKwXFC30rzGcndLDHSCX7VIUeDxnPlLxAg9un3uYX
	 BJRa/gEJkbaqQ==
Date: Wed, 3 Apr 2024 16:53:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	cujomalainey@chromium.org, lmajczak@google.com
Subject: Re: [PATCH 0/4] ASoC: Drop soc-topology ABI v4 support
Message-ID: <70c48f28-36c5-4fb0-9f07-5d8e4eeb1694@sirena.org.uk>
References: <20240403091629.647267-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jsog9sEwC/0aC5C5"
Content-Disposition: inline
In-Reply-To: <20240403091629.647267-1-cezary.rojewski@intel.com>
X-Cookie: Knowledge is power.
Message-ID-Hash: 2OOTRIVXTFS6LOCOWJWRJKGBKPV6JZL6
X-Message-ID-Hash: 2OOTRIVXTFS6LOCOWJWRJKGBKPV6JZL6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OOTRIVXTFS6LOCOWJWRJKGBKPV6JZL6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--jsog9sEwC/0aC5C5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 03, 2024 at 11:16:25AM +0200, Cezary Rojewski wrote:
> This patchset impacts UAPI.

> The only known users of the soc-topology ABI v4 are Chromebook
> configurations. Starting from kernel v5.4, all of them are making use of
> soc-topology ABI v5. The patchset first removes obsolete code from the
> Intel's skylake-driver - the driver of choice for the mentioned
> Chromebooks - and then proceeds with removal of relevant soc-topology.c
> and uapi bits.

Do we have to worry about old Chromebooks that fell out of ChromeOS
support but people are still using with a general purpose distro?  I'm
not sure what the user community is like there but v5.4 is from 2019
(and products would I guess have still been coming out for earlier
things in 2020) which feels kind of recent.

--jsog9sEwC/0aC5C5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYNe2wACgkQJNaLcl1U
h9AWEwf+JraZmqk8SeRd5dhoQ5JcHDeOkXYlvqrh7duippvSjyHyJ5pTkxUmIJlp
3sMJ4UXQJWA3A/xeyXnCw1PuBHqIypk/tJMLwOWkWlQ+vjr62Zgzs9EA87f2tVaM
871NcBIYBHATzWrQCBZErDqISHLgUbQ/BWc41KITG9kQ+ngsRUHXg6viSCepAb2H
EOfTTROiyvZT5p1aTVwhGEQiJxV/Xm1NkAuVlXZGZjdx3D1Kh3vdJLje4g4tlFZk
AoFYPJbHeHqiYr7wln8W4B7lYv1RiTz/trbogtV3rNhNrDiwFXe7X4NhWSk/mK5t
PzxcdpCwGvwyfYqqVboF4x0ZeOrEkg==
=FDsA
-----END PGP SIGNATURE-----

--jsog9sEwC/0aC5C5--
