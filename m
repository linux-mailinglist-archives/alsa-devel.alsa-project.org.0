Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 309DF9BEFD9
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2024 15:11:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD8AC105F;
	Wed,  6 Nov 2024 15:11:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD8AC105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730902286;
	bh=PUuS0tCe3CTdgQYCNE9gH0S9LxjXaMV04akfmdLt1xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FWumfpVwxwKbbcCVP8juop0ovUJ6wqA9LMBo+ByfM3mO6eoFQKGX3O+8oprDe8QZo
	 CfhVOKEjLOLFzW2vqZrxl9siyOMfPb3oXyY7zf3/enWf+lO7W+eAPx7PkaCSi/Oz9V
	 FvzQM7ZsblIYE6CDe33lsF7BZonohffUf+px65bI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26D56F805B1; Wed,  6 Nov 2024 15:11:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9AC5F80134;
	Wed,  6 Nov 2024 15:11:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8422F8013D; Wed,  6 Nov 2024 15:11:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E38FDF800C8;
	Wed,  6 Nov 2024 15:10:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E38FDF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QxbH4Fy1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CCE435C107C;
	Wed,  6 Nov 2024 14:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEB8C4CEC6;
	Wed,  6 Nov 2024 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730902256;
	bh=PUuS0tCe3CTdgQYCNE9gH0S9LxjXaMV04akfmdLt1xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QxbH4Fy1pHJGyPJ41m5e8emEMCv+1P3lPgpD4yb/wjS3uXFcz2crCkvWANABOzvOc
	 rbfJddnBnRCOl/q4LDwWwi+nGY84IESfg58bpVcdy8SJSDNF/vqR0NBdgqZXYpbC4N
	 ymryP4ePwsJjTPSxDxLtXyof+w9HgOIcIUzZGX03UPDpBMhPM1M8yxpEaxir2KUAFB
	 077dGpmyQjttR0Uc5S7ehZPPGeET2YLNVl7LmaGSLIZaocltrG+VGv4LOXtVeeBCN8
	 BGRquysPKdlW2R+IhbHurjwXdehrmqqKOXo2MUl8vds4Ojo6ts7U23D/7rNlcr8/xH
	 QiFvgSp1TSqKA==
Date: Wed, 6 Nov 2024 14:10:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	syed.sabakareem@amd.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Emil Velikov <emil.velikov@collabora.com>,
	"moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: SOF: amd: Fix for incorrect DMA ch status register
 offset
Message-ID: <5e1f7675-1f64-4078-a923-ee51945f3c03@sirena.org.uk>
References: <20241106101455.1229113-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sV4lFD4NC59+GAjz"
Content-Disposition: inline
In-Reply-To: <20241106101455.1229113-1-venkataprasad.potturu@amd.com>
X-Cookie: Polymer physicists are into chains.
Message-ID-Hash: 2YCP3KE2OYVGZYTZ2TS273H2PXCLF4EP
X-Message-ID-Hash: 2YCP3KE2OYVGZYTZ2TS273H2PXCLF4EP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2YCP3KE2OYVGZYTZ2TS273H2PXCLF4EP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--sV4lFD4NC59+GAjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 03:44:53PM +0530, Venkata Prasad Potturu wrote:

> Update correct register offset for DMA ch status register.
>=20
> Fixes: bff3c2a4062d ("ASoC: SOF: amd: add support for acp7.0 based platfo=
rm")

I can't seem to find this commit.

--sV4lFD4NC59+GAjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcreOgACgkQJNaLcl1U
h9BORAf9GKqaFL4aeOlaQ2Hl3x4DbSrO+YV7ljPwZhaeL2BwWMAEOWd8YkiWOa03
XsQKgPIWJZu97/1/I1O8FOMRrh0o7Kgea8wz7LO8QgsoH1c2e0Uxzqh9ZZvEKyHn
wlTX+Ulan8s9IKID24TuaT2Ba++7ce0qTM54+eR5gw0xNpgBMJ6YgnRG0NoCKodz
rg701vF7M339+wo5ylJ+KKXq4hgOr1pxMmAktHDmuPPIi7ZoqO9qmoj/g8qo6Rk1
xKU6GEdLJLxBO3xioi5lXv69u0GDawFqoBOTc/4liixQ4o2k3Lkx3qVBdAttWeIF
eUuGNr/6hiV4EsZN2j6sL232T6ikTg==
=OyQE
-----END PGP SIGNATURE-----

--sV4lFD4NC59+GAjz--
