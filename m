Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2824D8C4EE3
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2024 12:23:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB25FDF8;
	Tue, 14 May 2024 12:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB25FDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715682190;
	bh=MlD37PhYaCYGWNXB+XjgAOliaEbuIjPec0duTTv9ngc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CR61m1oPUJxVQ7TFZztLH3lC//OmTIv3ZJaKryausQ12HltfA61iGGWrEx7kSZLzG
	 wm4ky4sHe4S3xasnx01LzB0K1r51L3QTVCtbD6TX3ULGIvny7rIcDRAYGTesXHL+HN
	 D1zhjXb/kzLEXv+hwQog4lp7X12fIzaHLFntfSds=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C86AF8003A; Tue, 14 May 2024 12:22:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89C75F8059F;
	Tue, 14 May 2024 12:22:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D65D7F80224; Tue, 14 May 2024 12:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 404C8F8003A;
	Tue, 14 May 2024 12:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 404C8F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gfFlObsN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 25718CE1196;
	Tue, 14 May 2024 10:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5998C32782;
	Tue, 14 May 2024 10:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715682105;
	bh=MlD37PhYaCYGWNXB+XjgAOliaEbuIjPec0duTTv9ngc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gfFlObsNwvICy6Ottyc7oE+Hl8pJyYYXj3h9E3FrxQSo5bRF+KfXayxwDEdKEj7EJ
	 v6DglZeI553eFwOaDRycJC7dXPFIHnLdVZWgDBaRqPsX321Pgc22fpT8+F7xXWnaR/
	 JlG/x6nArF+zpHXEDn9PCZ4WopblfDI6Rtn0G3DmAcKGUch//Bojsm+YYI+D47s3qp
	 H1RHjKC86EtXDkoD9jn2xONn3sYw8dG7u5KEIEhjZchwwZ25j+yr2WHYl4YN3aqL3j
	 NzEOxI9eojQmA8AmCmUBshYnso5aRa504XkUAnCcwVPVYFGSZJtY5YjCHU5Bp7b88m
	 a2XQqlTTNwQHw==
Date: Tue, 14 May 2024 11:21:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
	daniel.baluta@nxp.com, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/6] ASoC: topology: Constify an argument of
 snd_soc_tplg_component_load()
Message-ID: <1fb69d24-03af-4742-9f44-5a93704f5cfb@sirena.org.uk>
References: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/yzFNmYb1iOOUdKX"
Content-Disposition: inline
In-Reply-To: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
X-Cookie: In the war of wits, he's unarmed.
Message-ID-Hash: IFXG2XKGJ5NGLRGPU2XZHPHEG4OQJ3CU
X-Message-ID-Hash: IFXG2XKGJ5NGLRGPU2XZHPHEG4OQJ3CU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFXG2XKGJ5NGLRGPU2XZHPHEG4OQJ3CU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--/yzFNmYb1iOOUdKX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 13, 2024 at 07:37:20PM +0200, Christophe JAILLET wrote:
> snd_soc_tplg_component_load() does not modify its "*ops" argument. It
> only read some values and stores it in "soc_tplg.ops".

As mentioned in submitting-patches.rst when submitting a patch series
you should supply a cover letter for that patch series which describes
the overall content of the series.  This helps people understand what
they are looking at and how things fit together.

--/yzFNmYb1iOOUdKX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZDOzIACgkQJNaLcl1U
h9D6KAf8D7XMQi5rJoTwxI9Bu02nKcGaXYmMbfHTt9hAM5CY6TONJDV9QVBsu5dj
VaeRt4XMiNUQE5eZMwuVqyEuT6ZOjuZs+A5mZUQ4OZx7GpAW8p4VnkxBVqOoHPCV
Iub0jsw4DBINsrpvtpds6+65rmg6IzZwaZLyc5I4yF7gqJiNRL4II1Wo6mgAGmkX
XmDUP3ViiX5WqbZQNDUYCD/NOHCjTDRqiv+PnRB11iYOiGyThOiEqr8V3mt3o0/H
dZQB82eb+i8O5jnXK222WHcezw9OgJFiEzVmpU0EEooUFmIIh5MZJhqqIdc+w9JB
cqXOrlguU7cXitcrwir2QCzFWKY3Lw==
=Z+z6
-----END PGP SIGNATURE-----

--/yzFNmYb1iOOUdKX--
