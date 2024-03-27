Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B36D88E794
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 15:59:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A29C52BEA;
	Wed, 27 Mar 2024 15:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A29C52BEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711551579;
	bh=/qS4x09dYgY6sXrlC/UAO2mdxYkbcHDpH5G5a5KiSBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VQSkm6dEVmyXxFMpDQ0Imvf/odEvyiKPOEU2D8ag48xeTAFwnUw/Y53aL7kWhb1Zb
	 iVtBcVbW8IXxPQPIJis8gdpw7HTFbYN3bT6+kfOKq8rcX58zkunK61ceOXv6pZr/V6
	 Q297VeXUDPTZFZa/2GH+sEt5NUFA5Vm5usGHjNko=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9899AF801EB; Wed, 27 Mar 2024 15:59:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1ADDF801EB;
	Wed, 27 Mar 2024 15:59:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 064DDF8025F; Wed, 27 Mar 2024 15:59:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15A92F80074
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 15:58:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15A92F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pPwuCjRl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29646614D5;
	Wed, 27 Mar 2024 14:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24936C433F1;
	Wed, 27 Mar 2024 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711551535;
	bh=/qS4x09dYgY6sXrlC/UAO2mdxYkbcHDpH5G5a5KiSBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pPwuCjRlr2pf6LvffM7s/dfNggx+aqFSMFLisJ1jTW/SuAe+ldFFxLBE0YxDXQQBp
	 rAi/m9dBaeqalOhAkjEM1aaW1pjMabgz/cgxhJ17AavvRlVqcoqoac4PSds8htaok1
	 K31oIFDom5coSJuhQ7soLqmzmvrsLxw1jkQidAl1lLduL+ie7q/MbllbhlZ452mTm7
	 HFzKaPfd68ysqzGwO8dkt3pTLJppzHr8XpUQa+QqZ3i+PsctWCPTNfJNd6d+PQiMUt
	 HlZumMd6hU3V+G8vjBKytgsBSgy89g46+0F88J3oPA3kHrKT8SKGiPhvJnFFn7jrR7
	 ec5Jj/hBDkckw==
Date: Wed, 27 Mar 2024 14:58:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, venkataprasad.potturu@amd.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] ASoC: amd: acp: fix for acp_init function error
 handling
Message-ID: <e4ba58bc-fa5b-4ece-8906-f7cc7cb5b0f4@sirena.org.uk>
References: <20240327104657.3537664-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HHnNWzSd/b2J4Dry"
Content-Disposition: inline
In-Reply-To: <20240327104657.3537664-1-Vijendar.Mukunda@amd.com>
X-Cookie: A rolling disk gathers no MOS.
Message-ID-Hash: 5Z7KJUQKPYYDU7D6MQ4RC24KPYURXUOT
X-Message-ID-Hash: 5Z7KJUQKPYYDU7D6MQ4RC24KPYURXUOT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5Z7KJUQKPYYDU7D6MQ4RC24KPYURXUOT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HHnNWzSd/b2J4Dry
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 04:16:52PM +0530, Vijendar Mukunda wrote:

> @@ -115,7 +115,10 @@ static int acp_pci_probe(struct pci_dev *pci, const =
struct pci_device_id *pci_id
>  		goto unregister_dmic_dev;
>  	}
> =20
> -	acp_init(chip);
> +	ret =3D acp_init(chip);
> +	if (ret)
> +		return ret;
> +

The return check is good but shouldn't this be a 'goto
unregister_dmic_dev' like the above case so we do cleanup?

--HHnNWzSd/b2J4Dry
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYENCkACgkQJNaLcl1U
h9CYOwf7BZiqXeDfs5qRdUvEV6cGZnFIAaeLR8VhXpILbSHzmNxBzmFxPAC3BGQI
xKGZ7bBdvf4funwt/P/PKxFh7p0o78PjkO9pzru4987ZlqH19RmzJvcc5+DU7lY0
Phf3ttUIpmZNDdXQi08pvBOLpJFsynY4v+EuUIpTdGLOHNB9k/Y5EKV3ZMV2pWn9
LFqxzfV00O03xEu+q7Dm20GthUd9c+pVRehCB7ZgFABe+39fZAclAnumiDS5WhMO
i/uBEQTku/TMKuedQPP5AwG4kB4ZLIkYihT5X968UG270soc7b8dP9tKcAsbuz9p
WEEvxqDuH8qQZ2/8VT0ipDeTOAbmAQ==
=HydH
-----END PGP SIGNATURE-----

--HHnNWzSd/b2J4Dry--
