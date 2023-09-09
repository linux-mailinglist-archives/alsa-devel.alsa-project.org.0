Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A128799812
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Sep 2023 14:46:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B9511EB;
	Sat,  9 Sep 2023 14:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B9511EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694263607;
	bh=/BkZmW+Y3mlj97JtUG1ZwG/p/fnfbVMkY31uTf3YqrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BDzFOcA5XxBDSPYCCBwAODMIEnrDL5hsRKk53lcGpVptyJCpoilNzN1esyl8xN028
	 lwKwBadTymfflnHGlWCQ9XsZBOP6o+RQ3CrMdpgajIXDJs/bBmA3J0FuaVMRRN+gKX
	 Yi6exYx1K4/Br891iYzmpsTZLP62XH8/litl+FwA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CA2FF80549; Sat,  9 Sep 2023 14:45:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2025DF8047D;
	Sat,  9 Sep 2023 14:45:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB303F80494; Sat,  9 Sep 2023 14:45:52 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 87D0FF800AA
	for <alsa-devel@alsa-project.org>; Sat,  9 Sep 2023 14:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87D0FF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DHXgIfHk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C75B6B8010F;
	Sat,  9 Sep 2023 12:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C7EC433C9;
	Sat,  9 Sep 2023 12:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694263546;
	bh=/BkZmW+Y3mlj97JtUG1ZwG/p/fnfbVMkY31uTf3YqrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DHXgIfHkqFr93L8vqvKYYF/bRfV41TJhTJizya8HEpOTF2PnJI9+q7kdy4bfvfixG
	 qbuXBomPd6HUQWJSaQC5CMd1rm0hEPZ7782m7Sckwx62EHOVuyYO55Ehqnet4zNQ6V
	 +MotxMlTUs0IlJzwU4oOGxJkXi29jR01ocrmHUJbOlJItcT6ehR5ai1OxN7UJoT9ia
	 5I23lgGiUDovnrhSi1i1c6cbAfGi1Xnxz8+xDfUEii+CVJwin0yMA6L8744sdeALzP
	 TG2YjT4/uhpnaN7e5FOrr7EvDCNcJxraq21M+F3DWF7GLkpyhgXlsA1iiIlWolvudo
	 Pn1tRzxC4gPmA==
Date: Sat, 9 Sep 2023 13:45:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthias Reichl <hias@horus.com>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: hdmi-codec: Fix broken channel map reporting
Message-ID: <ZPxo8qKMDkmBqGxw@finisterre.sirena.org.uk>
References: <20230909114633.3193-1-hias@horus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CRYsJteP4m9VwM7C"
Content-Disposition: inline
In-Reply-To: <20230909114633.3193-1-hias@horus.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: YZPYKTSY2Y4HRRNHLO4VJFXHUNOGFY6C
X-Message-ID-Hash: YZPYKTSY2Y4HRRNHLO4VJFXHUNOGFY6C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZPYKTSY2Y4HRRNHLO4VJFXHUNOGFY6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--CRYsJteP4m9VwM7C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 09, 2023 at 01:46:33PM +0200, Matthias Reichl wrote:
> Commit 4e0871333661 ("ASoC: hdmi-codec: fix channel info for
> compressed formats") accidentally changed hcp->chmap_idx from
> ca_id, the CEA channel allocation ID, to idx, the index to
> the table of channel mappings ordered by preference.
>=20
> This resulted in wrong channel maps being reported to userspace,
> eg for 5.1 "FL,FR,LFE,FC" was reported instead of the expected
> "FL,FR,LFE,FC,RL,RR":

Presumably this will cause a regression for people using compressed
formats - isn't the fix here to make this behaviour conditional on if
the format is compressed?

--CRYsJteP4m9VwM7C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmT8aPIACgkQJNaLcl1U
h9CBowf+JGLhC4wKjhk+Xm1dMsIghIlZq6aJwbbuKM929p/iKVwWTv7AyuQ+U9y/
p/fV9EeYDYVRfVppD5VVlya5egCxQSfDhXTGrhSDFzCtlp9TMml3t+vsQ6cYJwFX
O7P2vk00i5ADmH7pGVBsJYCMzxydIHCeErD/6LETO+uBMnIRGqTGgh0VqFO+T20f
PQUM75OZFFM5cAm6wFYv3VWt6lo9hW+TjSvuElRawpdrbOPWYUtiRkuIWhBH8jGY
77eOnewhMO65/sGS+qnzEPLKkT82KJs+XcmeCb7sLHC9PXswHMpL+z4H/W9UpsHn
nNSOGAtXAhcGQvmjFbYR9s+/NlOdLQ==
=rfza
-----END PGP SIGNATURE-----

--CRYsJteP4m9VwM7C--
