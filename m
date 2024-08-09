Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAFD94D92F
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2024 01:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 259AF10BE;
	Sat, 10 Aug 2024 01:36:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 259AF10BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723246629;
	bh=xUsKLR4zWYnJT9y7G1ygwy0DPpPNyOurGAR0AtKb+BU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=owwZCuqY0GEbE5nrRazwHEa5DT04ZzoTQMhoYA+TPl9EvG4PikPW+kBJqiJE7rwSd
	 /vkRpb8OGbx2FieRxafyAbTyBFzmvPX/6Y4dsiLxf54jT8H7kbJ5F2B5byl3cC4znR
	 DnbtjRsgCKxGwBu9MNcym+U+mylPDqF5PdoAvimo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D465DF805BD; Sat, 10 Aug 2024 01:36:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7909F805BD;
	Sat, 10 Aug 2024 01:36:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64CC5F802DB; Sat, 10 Aug 2024 01:27:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1653EF800E3
	for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2024 01:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1653EF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=txk8RPRD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0E668CE180B;
	Fri,  9 Aug 2024 23:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891C4C4AF0D;
	Fri,  9 Aug 2024 23:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723246062;
	bh=xUsKLR4zWYnJT9y7G1ygwy0DPpPNyOurGAR0AtKb+BU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txk8RPRDqGhf+5ZiYnVn+HRXgou6FTRRvAj5/j4152rHhchNuvaaaafmVSKhJ4Pc+
	 6WDuHXU/d7tG2vmrygwjvTjsFrN1hOkZjq7RT+4nY953Hy/XeUgK+b844DAedyqS6A
	 Wl6FSXQ9fWLkDkJXx8XD3B2zUz+NmHcbAUSKLMKZ5c5eosLQe4H8fNE8CLQy5OuBk9
	 nH09X3mRU8zic7VCqJwtfzWLPotT1VbXwiu8GPiFYmSI6TFtNjbGjFKSmCl2Pv2otg
	 9aNrxdrZCzxt5nfPmsXfhxb/eujJ/9C9u6rWbiXpqOKjrSWX8NWLpcwDmDym+q4fl0
	 ACacER/Jvk1XA==
Date: Sat, 10 Aug 2024 00:27:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ALSA: pcm: add support for 128kHz sample rate
Message-ID: <Zral597nrlHHj9-W@finisterre.sirena.org.uk>
References: <20240628122429.2018059-1-jbrunet@baylibre.com>
 <20240628122429.2018059-2-jbrunet@baylibre.com>
 <326792b9-e706-4ab0-a1e8-cc48943e357d@linux.intel.com>
 <874j99434a.wl-tiwai@suse.de>
 <1j4j90hurv.fsf@starbuckisacylon.baylibre.com>
 <87ed84rnk7.wl-tiwai@suse.de>
 <1jcymixfou.fsf@starbuckisacylon.baylibre.com>
 <87seve6q9u.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j9aCuwDsgaYEuagC"
Content-Disposition: inline
In-Reply-To: <87seve6q9u.wl-tiwai@suse.de>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: U24SQ2KS7FRFG7VTLA4WWKB6FH3K64DY
X-Message-ID-Hash: U24SQ2KS7FRFG7VTLA4WWKB6FH3K64DY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U24SQ2KS7FRFG7VTLA4WWKB6FH3K64DY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--j9aCuwDsgaYEuagC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 09, 2024 at 10:42:37AM +0200, Takashi Iwai wrote:
> Jerome Brunet wrote:

> > Takashi, Mark, what is your preference ? Should I:
> >  * tweak the spdif codec to use RATE_KNOT ?
> >  * add just 128kHz, fixing the 3 file above ?
> >  * add 12 and 24kHz as well ?

> > I don't really mind one way or the other.

> If there are multiple instances, it's fine to extend the standards.
> Then we can clean up them as well.

I tend to agree, it seems like an obvious thing that people will be
wanting to use and there's already multiple users appearing.

--j9aCuwDsgaYEuagC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma2peYACgkQJNaLcl1U
h9D+2Af+LZNFlSJBrfEP3351HBCHpFs3TZZnxbfrjvVH0yUKD0hjTTetbbvhdGvg
osn/y10PkEQQ9dESuH+u9CshDO3rw8XPBUlb58L7N1WfRfgE6J54tM7RqaipHv2D
oRuNwSLn9Z2D3/QKywH4MgAcZo+JLKQMWaQnd7IiOItG64qdf4VPolKK4qZj6xlk
wdFrnMEXJn0ox/JRx4gJgZJh0a0YdkRIKaLZIDuOTEJFMK+cfbzlsNtcJPvefZqA
VYW7mPEUfqPqEkCenyVr54ikDvbaDVDxaXj1WumDRU9Ju4lSGWw9/OqDUX+ypmdJ
RQeMnBz4fUojzjlmKM1UkSlHS/o86g==
=/6uj
-----END PGP SIGNATURE-----

--j9aCuwDsgaYEuagC--
