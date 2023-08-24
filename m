Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CA8787B8D
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 00:37:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8CB3A4B;
	Fri, 25 Aug 2023 00:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8CB3A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692916678;
	bh=IIE/Hy8DLKF//hrVIEU0wR5Vga9FWCpPDIL+cw9imEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ojo6b0W7zJlp52uHAqtEdQ2jhauEMXUhGGs87E0W3OqNhdCDsXE+TuNAHmlYFy94G
	 0EV9rs3t4qOZ3kNZxZ078mOA2FeE9S4faz9Z+xi/xpFHj/XysnXn1BBqhSfwNj5kMY
	 ZN1m5fLiucRT/twE0SrgT+VXQSPZGWdJq27NEdcw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F768F80553; Fri, 25 Aug 2023 00:37:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAC51F80537;
	Fri, 25 Aug 2023 00:37:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0332BF80551; Fri, 25 Aug 2023 00:37:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAB11F800D1
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 00:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAB11F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pGnBKsPZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 16DEC62B85;
	Thu, 24 Aug 2023 22:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D33C433C8;
	Thu, 24 Aug 2023 22:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692916618;
	bh=IIE/Hy8DLKF//hrVIEU0wR5Vga9FWCpPDIL+cw9imEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pGnBKsPZFZrd2upIiZfKbRxi8EiKbSSqXZsK0iBPskTdxjsT8C2OhollrqIs+f0Zd
	 kqFCLINlnwDZLA/Our6j3ZsoSBf7Fmxx9QZMh0HHBZowlTTUr7wd+JcmPF2XueoRyr
	 gpxnv9LxP7tf3d7MmSvNeCibyREveQQOoa9zvyfhIYPfX4kxpo9Y9ljflkF1fwNjtC
	 gZKMbEaFxvqBdR6pnhjfGUnv3rF+Ji5bf5wU2c5AaSFMuN6zgpUnVwDHkdyj3e3osN
	 Wc2ghpAgXFCRi2GR1GX1BTFdG6Uw30Q5rz+MliZiudX6zqQBMk7O6PzzB+cpEGa/kt
	 e6R7CgB3RPFxw==
Date: Thu, 24 Aug 2023 23:36:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH 16/17] ASoC: Intel: avs: Kill S24_LE in HDAudio streaming
Message-ID: <ZOfbe+WXQswb2JOk@finisterre.sirena.org.uk>
References: <20230823080546.2224713-1-cezary.rojewski@intel.com>
 <20230823080546.2224713-17-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kT63110QRN7iJp6i"
Content-Disposition: inline
In-Reply-To: <20230823080546.2224713-17-cezary.rojewski@intel.com>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: OVAOHCKYW6K5F3RSJ4PAGRJ2JZG5UBKC
X-Message-ID-Hash: OVAOHCKYW6K5F3RSJ4PAGRJ2JZG5UBKC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OVAOHCKYW6K5F3RSJ4PAGRJ2JZG5UBKC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--kT63110QRN7iJp6i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 10:05:45AM +0200, Cezary Rojewski wrote:
> Eliminate all occurrences of S24_LE within the HDAudio related pcm code,
> both HOST and LINK side. Replace those with MSBITS subformats to allow
> for granular selection when S32_LE is the format of choice.

Acked-by: Mark Brown <broonie@kernel.org>

--kT63110QRN7iJp6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTn23oACgkQJNaLcl1U
h9Cyjgf9GZainsCatcxkg7WIZqBRf0r5Y30goAOUIlmhldbBa7UYV3DL4yDSwaGB
6scKZ5EiZZPsgClPakJPfKkEtmDJZh1XIV3EIYZkzQG1uyXy3akT4D9xSZ5dbQEe
/sAU6NMW+CbX3wk5NIhAYOuqczZJ6sRjQKSBcW4QbqhzRR3qdCbz6VRRboTaoxeC
XQE6UnHfFJum2VF++ti7ITN6qyhZycOokryzaLbIptQFVjmScqso/0IKR0ZZuddi
sBtvKzrXjYbVcF+c2f/JMxJzZi0lSH5yPlbvZZOPJ1T5wi00bVfRrCG5y1+04o/1
wCNsUKqUMNig0c1Pmvj4Oq2c89jERg==
=xTwO
-----END PGP SIGNATURE-----

--kT63110QRN7iJp6i--
