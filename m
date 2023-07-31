Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4F3769F67
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 19:23:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C121982A;
	Mon, 31 Jul 2023 19:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C121982A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690824178;
	bh=kiXzpQqenKMMpnBqTOhAGdvH08lsx7pYXETUBIhe2Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eXS95M970lKrIlLdeEDw0u3HGTBEYKNzdUO21oyOp9+GBi4iSnkIC4pwppPVzN1DY
	 Bq6JOlp+wUqOkwwKNGd2BL0faL8pb3qEBVChKA8IpM7ElcoKz8FJojVRxJvfwhDaI2
	 9L9Tq9K+LltXAmJZyGT6YTvKvMArlIVs9pwjFrBs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89BB1F8053B; Mon, 31 Jul 2023 19:21:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14D04F80425;
	Mon, 31 Jul 2023 19:21:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 604EDF8053B; Mon, 31 Jul 2023 19:21:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9988F8016D
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 19:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9988F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XMStE277
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7B61261233;
	Mon, 31 Jul 2023 17:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBBDC433C7;
	Mon, 31 Jul 2023 17:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690824107;
	bh=kiXzpQqenKMMpnBqTOhAGdvH08lsx7pYXETUBIhe2Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMStE277hRfTz2v7aKoGI8wVqwS9crflOd0yqEEyNHDkj9xfFqxIsaZcNrrgXcJgE
	 keq55KuTw25asvxAJabz2TP1UOaKt4Hf/o4xhtfHKQEqtNjIXmcF2dIIZBMBah/0qi
	 PNqryFw8cATRFrkBEzQybmHhqgaxRnwjaYLklyNhhpT/cO3TSYIW+5U9cDMAVt6/aT
	 uqG19DfuBylTGbTYI6G6nNJTbKnh2mI3cFAPXNH/MqF9K18A9A6sfSwuZf3wk4OOfB
	 U2GLtm6QBT4Wi3z0DWoHqgngu0ABekSKbtsbyV9rQWw6kXjsIJvOOiyzILRCZSTNos
	 BZeAKEo9aSmJA==
Date: Mon, 31 Jul 2023 18:21:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Brent Lu <brent.lu@intel.com>
Cc: alsa-devel@alsa-project.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Yong Zhi <yong.zhi@intel.com>, Terry Cheong <htcheong@chromium.org>,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Mac Chiang <mac.chiang@intel.com>,
	"Dharageswari . R" <dharageswari.r@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 0/1] Intel: sof_rt5682: remove quirk flag
Message-ID: <f87952ee-908c-45c3-bd8c-cad692654634@sirena.org.uk>
References: <20230731103419.2536036-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cNapWE7fzt2N3lOd"
Content-Disposition: inline
In-Reply-To: <20230731103419.2536036-1-brent.lu@intel.com>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: C7ABRLKSLCQKWQG6KWHC4ZL3PZMPGRNF
X-Message-ID-Hash: C7ABRLKSLCQKWQG6KWHC4ZL3PZMPGRNF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7ABRLKSLCQKWQG6KWHC4ZL3PZMPGRNF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--cNapWE7fzt2N3lOd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 06:34:18PM +0800, Brent Lu wrote:
> We add a helper function to detect amplifier number according to device i=
nstance
> in ACPI table so the SOF_MAX98390_TWEETER_SPEAKER_PRESENT flag and a dmi =
quirk
> for 4-amplifier configuration could be safely removed.
>=20
> Also refactor the max_98390_hw_params() function to use an array to handl=
e the
> TDM parameter.
>=20
> Amplifier number detection and TDM parameter are tested on two Chromebook=
s. One
> with 2 MAX98390 and one with 4 MAX98390 amplifier.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--cNapWE7fzt2N3lOd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTH7aMACgkQJNaLcl1U
h9CUWgf/ateymIZbZ4zSCmCF40krOpEKI545+7ZSX9VWn3zhMUVGp6EPWNwpsAZR
XSEv64pC2EPySh3510ktC5cxUAOf0k4LDzvkuUbwvbJU2EMWHST9pvuXw2ShamC3
gOL3Uqk8bERAa/UfHWrFa/rqGv29bJUMMG541LMoQgRhy473tZDoFtaMCdZutJqC
Jqy0ZA4+dJQ43KQ0J8qbifjuSkG+jaIxaImOfU7aqeF7UXG7igKe9h88vQkfxWsD
Ym8qlE97uZHoh68W0iL+bPZ1TVVOyftIq651quI2bzbQdeestx1/S+6YjlExHlyi
T4Vej0V2yyG1UGZlTGgKUgC73KSDig==
=5xmf
-----END PGP SIGNATURE-----

--cNapWE7fzt2N3lOd--
