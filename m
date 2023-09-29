Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2A87B36CB
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 17:26:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1564DEC;
	Fri, 29 Sep 2023 17:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1564DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696001197;
	bh=zR3V39FUOXpDJZX+fcXic0O2fzgMBC+hizqSI52SM+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ClSepNKqx+y1Yel/XNw9/T+koQ2jNn1Gt5n91c0WStWpg4B3qYRfuEiK1fmzHY+ZM
	 HQTvPYJxIjzEW/WCpW3ixh38qXIL3feAACq1Ii3WnoRS30RHkFlBd2v1XvF4zHeRMt
	 i2KcsRJyVLWU1Vh802IiYOP5Tx6eFthAPH9kwKSA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06C85F8007C; Fri, 29 Sep 2023 17:25:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0E05F8016A;
	Fri, 29 Sep 2023 17:25:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F477F801D5; Fri, 29 Sep 2023 17:25:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4397F800AE;
	Fri, 29 Sep 2023 17:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4397F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=raNcOeAP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5885CCE243B;
	Fri, 29 Sep 2023 15:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F0FC433C7;
	Fri, 29 Sep 2023 15:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696001128;
	bh=zR3V39FUOXpDJZX+fcXic0O2fzgMBC+hizqSI52SM+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=raNcOeAP+3T8q5itobNnfQzGZodlhmfufngy0pt74/+sP7smAxMCkRkquKoPhJ8oH
	 l2HRX3hCJN7FAxdaZRt0/7k3pKWACWvwFibCjq2a9G8XDAoPQVGhGV6R3AmSGJjcOO
	 G14QPDMELVKzgoooGk2Nj+N85rUhN7uylPvlQBg/81oOPbpQuq77krausidgIQbCoa
	 sFIgaKO9rrzQaJabcVR5Zy0nhRc0fgmfX6tc13DW2TNHGGTxNhp4BVDFpfBJrGrOZ+
	 MMdWVpAGeked2HEmGQLOGD+vtPNw0nx5KlKfHzamSg0QzRz8rL1xl04RvFMpzxTU+A
	 Y0QXaZ4/FiwNQ==
Date: Fri, 29 Sep 2023 17:25:26 +0200
From: Mark Brown <broonie@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v5 00/12] sound: Use -EPROBE_DEFER instead of i915 module
 loading.
Message-ID: <ZRbsZmjnR3hfsr3N@finisterre.sirena.org.uk>
References: <20230929145123.233838-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A0XDTaLZBAdeh9YB"
Content-Disposition: inline
In-Reply-To: <20230929145123.233838-1-maarten.lankhorst@linux.intel.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: NSSKCNTEWAGUDKD23D7EB4BLO7BVJ4HZ
X-Message-ID-Hash: NSSKCNTEWAGUDKD23D7EB4BLO7BVJ4HZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSSKCNTEWAGUDKD23D7EB4BLO7BVJ4HZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--A0XDTaLZBAdeh9YB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 29, 2023 at 04:51:14PM +0200, Maarten Lankhorst wrote:

>   ASoC/SOF/core: Ensure sof_ops_free() is still called when probe never
>     ran.
>   ASoC: SOF: Intel: Move binding to display driver outside of deferred
>     probe
>   ASoC: SOF: core: Add probe_early and remove_late callbacks
>   ASoC: SOF: Intel: hda: start splitting the probe

The subject line styles aren't consistent within the series here.

--A0XDTaLZBAdeh9YB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUW7GUACgkQJNaLcl1U
h9AnUwgAhkSLp+kvd8MgYHfmPYIFUUhZBZQRkcIQIqKSWYl6JEIdZ1alxsCsbLsQ
bLr4HT6V+0HukhLfCwbFCk/oL2R+dhrxz/s1lLANnVdQd7sZ9qsmpj3FRV2TFnpM
pKL0z8mJF3mHV9z1k5KxcJO91VnBQE+0o+P3GkYAJA4P++kOD++2+HX3k59Z+WM5
TKsYQ/7y89Y7XThCqJclbyGgp9rOz/JLblfdMvtUhP3hgzjDxd25md+L8v6BHmIR
0fHrppNupGzgB1095PW/uFB9v8bXDsgHKRMvc7n0nO7RJ23h2w9Vx84b/G2LYBNe
dH331KjnIx7FUlLcTb71hXlpPXotbg==
=cs2R
-----END PGP SIGNATURE-----

--A0XDTaLZBAdeh9YB--
