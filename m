Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D25127AD811
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 14:30:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 218ECDF5;
	Mon, 25 Sep 2023 14:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 218ECDF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695645021;
	bh=FuYf1m4eGYMC673RhBj8i0XgVlU9WPmIrrLnGYOa1U8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a5gbp8vD0/7TeiC1yOJIzurdvMhVsEiq3YKoUl3R6Sn1tR4eISdyOW6P5MUKwbaEP
	 QxIW/maUUBgKHJcYI+roYvKqqhyXQ+PS33DDCQrtq4ItjobfCWYdBxfEnu6IeumnFa
	 Ai6y1U5+LxuiumFlUWF1lwa6oRT1xS90wuBy+Qj4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34AC1F8016A; Mon, 25 Sep 2023 14:29:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D517CF8055B;
	Mon, 25 Sep 2023 14:29:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CFD9F8055C; Mon, 25 Sep 2023 14:29:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7BB7F8055A
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 14:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7BB7F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AGjtVz1k
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D8F6EB80D1B;
	Mon, 25 Sep 2023 12:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDE5C433C8;
	Mon, 25 Sep 2023 12:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695644945;
	bh=FuYf1m4eGYMC673RhBj8i0XgVlU9WPmIrrLnGYOa1U8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AGjtVz1kLuk5HqHUcT1oBsl9VzeyHlojOiaClc00Eoh7TXPUWLVBeEfsG5pQI48aZ
	 vzom7oxwMFCkLMBADklyF04FhnYBAN9EhqNgaJ0qYIoA/JvKmN/VlXJluVYsHZF3Y+
	 jUTR6TaqQdqZ+ViLGjvgR6CucwkPn8S3WKRin5VIkoX84az2QNh7j15+iH4xkUgeBm
	 YNNyq49hOjo5UtCRGLne24XF/lcjp8FZGRKhdlT9k66xGeEbrdXdRwEAz1uhEVtAdr
	 4kpgmBrhoEUIn05NwMlVEPzrbC757dMySvkjA1YC4HYLcaGRp+h3Q9kbf5M2JBKWKJ
	 RwvxN+sdzryWw==
Date: Mon, 25 Sep 2023 14:28:59 +0200
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, alsa-devel@alsa-project.org, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH 4/4] ASoC: Intel: Skylake: Use helper to setup HOST stream
Message-ID: <ZRF9CzOwcfdMZ3Ry@finisterre.sirena.org.uk>
References: <20230925115844.18795-1-cezary.rojewski@intel.com>
 <20230925115844.18795-5-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CzZOsxzHac032llT"
Content-Disposition: inline
In-Reply-To: <20230925115844.18795-5-cezary.rojewski@intel.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: UVPZJVZPZBC55BGNX2ZAMF4Z3QN3LUFS
X-Message-ID-Hash: UVPZJVZPZBC55BGNX2ZAMF4Z3QN3LUFS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVPZJVZPZBC55BGNX2ZAMF4Z3QN3LUFS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--CzZOsxzHac032llT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 25, 2023 at 01:58:44PM +0200, Cezary Rojewski wrote:
> snd_hdac_ext_host_stream_setup() abstracts the procedure details away.
> Simplify the code by using it.

Acked-by: Mark Brown <broonie@kernel.org>

--CzZOsxzHac032llT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmURfQoACgkQJNaLcl1U
h9De8gf/UrafdUzXh5QJrAVoDFK/GPt57lYgyliMd3cnfaWiWW+k6l43i1AbwjB3
yKiTIy3GyqCft+RlPwmErHq6SaZLtVPaQWPIevSNC1lSfXvNwl++QY+TPuPa9mpz
tx1PXCScFr5BklcWAh8Y4gUsbGlgp1eAd6DAQRpAtFsiciaQemyaez5XXWdaIjon
GZNOfo4e2Nm5Pi2ibyn6AhY8eXl9QUxv/a9rASGdUyRUW9fbw5h57oQdZWVB2uKu
FUvrZuVYjR6OF5s2iJNPI214BRv0buY/0MhrTySCdiNs9qrvvnivi0NTFbEmIko8
QdXLE9iAfW/MJZDLrHHeFQTpGXFHpw==
=AXZR
-----END PGP SIGNATURE-----

--CzZOsxzHac032llT--
