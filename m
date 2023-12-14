Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3FA813744
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 18:06:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4ED7AE8;
	Thu, 14 Dec 2023 18:05:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4ED7AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702573559;
	bh=C97ruMhJD+gwin8Xnu1LxzszeY6cxubadNcfiKJUIwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sWvhq6F/NgpnhjMu+KTm9AGwMYJva4nQ5hfqaTVHHYJ8VHlC5NwKse0K/jJPIyqbW
	 2EXEmQs0PeU+WyPYWRFO4Or4qFdruRCkVUNB3IJu8JryZB6M5qaTy6zevu3boF3GwT
	 YpQtBWqnyAWelR4ElWBR3sugdOhDDV55aymnMBuM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82D18F80166; Thu, 14 Dec 2023 18:05:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7736BF80571;
	Thu, 14 Dec 2023 18:05:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBAD1F8016A; Thu, 14 Dec 2023 18:05:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BB18F80124
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 18:05:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BB18F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YI3IJG6L
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DA7F4CE2557;
	Thu, 14 Dec 2023 17:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339BAC433C7;
	Thu, 14 Dec 2023 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702573497;
	bh=C97ruMhJD+gwin8Xnu1LxzszeY6cxubadNcfiKJUIwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YI3IJG6Lrj/HrM1w+0YF6QRLpTy5ywxmGCt1xrbg3M6yQAZkbul9dR7KVAh61p3Vy
	 6O/cITES1ZMQMJmH/7O1zvs3FaUz1bhz1fIgD4u3zjObCyYA7ilwzbFmUtvNuE0HHG
	 AGZeBj1VZD3AWNK4ZSxz0UwGUoLUdqfqW/Gfp0OHS4xyaGXSJIxZasuQBpziKeN9M2
	 gquPYYYZgeqkbl2jfiuXPFKMdVgueXfGox1LOBEXfVx7bj/Q/r+9uVaRkL3UXoD2wT
	 PM/uwb4ivacX+FDYVjDe1awrKPWQhzqt0GdzScTAPZvSyxlLAS3tWzOQ4wEIfdrIYc
	 JCKbhjGAeITLA==
Date: Thu, 14 Dec 2023 17:04:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] ASoC: qcom: common: Add qcom_snd_tdm_hw_params
 function
Message-ID: <cd926fd5-e607-491f-8bf8-40f404d56ea3@sirena.org.uk>
References: <20231213123556.20469-1-lujianhua000@gmail.com>
 <7b13b8b6-9048-48a3-b1a1-e62de88e8171@sirena.org.uk>
 <ZXsklsO7nOqBFgzt@Gentoo>
 <bee0ab28-6bd3-4904-8afc-44fe7ddacb79@sirena.org.uk>
 <ZXszbA5fVq2AMjEb@Gentoo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JCIFsr6HNtGfUJfo"
Content-Disposition: inline
In-Reply-To: <ZXszbA5fVq2AMjEb@Gentoo>
X-Cookie: Preserve the old, but know the new.
Message-ID-Hash: 4J3S6WZF5K66LALJONIC3BW2NB7CLJDZ
X-Message-ID-Hash: 4J3S6WZF5K66LALJONIC3BW2NB7CLJDZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4J3S6WZF5K66LALJONIC3BW2NB7CLJDZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--JCIFsr6HNtGfUJfo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 15, 2023 at 12:55:08AM +0800, Jianhua Lu wrote:
> On Thu, Dec 14, 2023 at 03:56:52PM +0000, Mark Brown wrote:
> > On Thu, Dec 14, 2023 at 11:51:50PM +0800, Jianhua Lu wrote:

> > > Currently, qcom TDM setup need to read hw_params, if we want to move it
> > > to machine driver, we must hardcode some params, but it will reduce reduce
> > > readability.

> > What makes you say that TDM setup needs to read hw_params?

> qcom_snd_tdm_hw_params function read PCM_FORMAT to set slot_width value, read
> channels to set rx_mask value.

A large part of the purpose of doing TDM configuration is to fix the
slot width and assign which slots are in use by this interface - the TDM
configuration is a constraint on what hardware paramters can be set and
should always be followed regardless of what is being done with the
audio stream.  If you're just trying to configure the sample size for
DSP modes then that shouldn't go through the TDM configuration API,
that's just normal hw_params() so should be done directly.  Possibly the
hardware doesn't support manual TDM configuration?

--JCIFsr6HNtGfUJfo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV7NbMACgkQJNaLcl1U
h9CaTAf/QuuvzKht/LhszwAptQsmHYSw9+3gn9Ddg+d9YAEb6/OWNMxB2kDd2hJ+
pfflmY+FKXTgJS6MskMch8Dxuc0QV/eInQwS6waQO4QjCZ/rqAHTutMLj/Hf7GDq
51FCW7bGjJOnnTn353AW3e6LoiwP6CMKhnw0ZVue2advz+frgtPZQF1NfWoVroIf
AJn1YspPewXTyysr99iHRJVNAGWevm5yg/fhUDtJA39qa0VM1l4AnYnW6ONoAT+Q
lNlFkDH22WUAzLS2lh+vqU+hd6ji18ldAzZ4KaiXFqBFQ2ag7Af7sckObeANsBLZ
fq5EK41S13Jqa3AZ5k1Q0CemAw0jZg==
=xdNX
-----END PGP SIGNATURE-----

--JCIFsr6HNtGfUJfo--
