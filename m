Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A18D47B46C2
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Oct 2023 12:27:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6D53DED;
	Sun,  1 Oct 2023 12:26:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6D53DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696156030;
	bh=s9/p99kT0VYsx4yrVdBNhfgZ/TYCwb1BgJDgHsY9SKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LjAGl1Cp8vpA/K3IOzoEbvgFT10Pczia9i7W5Q4j8cfIiUNJgwX2OcsSgSL3cDSRi
	 zfhzGaOfSngqjHIFQNyTyoavXU6/tIPgOHDcaiYUuqP2yl9KPYh1QhlQQvBN+ROlDg
	 qcTYGTk12atnk5y3H7fPb29igzdkhQ+js2ZDoSxw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CB93F80557; Sun,  1 Oct 2023 12:26:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5E7DF802E8;
	Sun,  1 Oct 2023 12:26:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D435CF80310; Sun,  1 Oct 2023 12:26:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 97821F801EB;
	Sun,  1 Oct 2023 12:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97821F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NPsd1NtM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14B0360B65;
	Sun,  1 Oct 2023 10:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3025BC433C8;
	Sun,  1 Oct 2023 10:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696155962;
	bh=s9/p99kT0VYsx4yrVdBNhfgZ/TYCwb1BgJDgHsY9SKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NPsd1NtMIOV36cBYv5g/jT6AEaaeRDZyk7BW+L4HreTrkgYqWZ6x/TSUsZ+7ziNuZ
	 9Rn8LeX9PMe2KSTLnINi2MSMiiO26q3sflB+2mIAkWnqpQvaO9UWVLS50Rfqw9iVQN
	 lWv7Xl2FYH2bElZYg9JgmonlH8t4RRvIpkyo86m8g/WR/KnzH4ZeMVh2iBoPPr7gSR
	 LFfA1QJb0J8ASgI3RaRIPYTIxifizJH6DCzM7yATRtvJGiOju8/6so3rmZdVbLnGCN
	 WVykFaHCUXCKuNfmtqjVXArcnKLffNwv9QsfHlQ0YsR3Au7i7d3bbyDTgMYeMf2T3J
	 sCGAx0vyocx/A==
Date: Sun, 1 Oct 2023 11:25:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: SOF: ipc4-topology: Use size_add() in call
 to struct_size()
Message-ID: <ZRlJN9qVOv7CIu1N@finisterre.sirena.org.uk>
References: <ZQSr15AYJpDpipg6@work>
 <169601489953.3012131.13922425518082792309.b4-ty@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ueidA5gUlRHLLhJj"
Content-Disposition: inline
In-Reply-To: <169601489953.3012131.13922425518082792309.b4-ty@chromium.org>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: QCAJE33LK76ODQK5SAVTSENTE37HRRLB
X-Message-ID-Hash: QCAJE33LK76ODQK5SAVTSENTE37HRRLB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QCAJE33LK76ODQK5SAVTSENTE37HRRLB/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ueidA5gUlRHLLhJj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 29, 2023 at 12:14:59PM -0700, Kees Cook wrote:
> On Fri, 15 Sep 2023 13:09:11 -0600, Gustavo A. R. Silva wrote:

> > If, for any reason, the open-coded arithmetic causes a wraparound,
> > the protection that `struct_size()` adds against potential integer
> > overflows is defeated. Fix this by hardening call to `struct_size()`
> > with `size_add()`.

> [1/1] ASoC: SOF: ipc4-topology: Use size_add() in call to struct_size()
>       https://git.kernel.org/kees/c/93d2858dd630

Why is this bypassing the ASoC tree?

--ueidA5gUlRHLLhJj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUZSTYACgkQJNaLcl1U
h9BtXAf+JtOZ1WQU2/T+zUaB9MU7XCgIHdDZoo2/uFRURhrBqZb+sQe0NWOJRR7J
6hWBccpjhIJU34f2MqHtmZdYLxWIPUsK4QrSF6sBA0/2L4cUaTpqsn3fFczMkAkc
W2zwOj1mPDz+VAdHrlSSi0JY3DMjVJX4needmY9LG2vajHvi7eLmVk0W0pdBBlt5
YdTLfdPyDCBzTFEnwu9Oj0B5PGDaEWZoZ8E2DSRnr6rOEJ/t0QBGPtY/kJeWes20
AGI592EbRVJT22z5eWOXQuyVz/S1n7kUSqngUTSkJC2LN6ijELH8O4frF4BM3p6M
afdsDhRrIbChhtiVd3YcWOWNsAXm/A==
=OPOT
-----END PGP SIGNATURE-----

--ueidA5gUlRHLLhJj--
