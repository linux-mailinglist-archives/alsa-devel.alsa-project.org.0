Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D31937B51BD
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 13:53:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD849E0D;
	Mon,  2 Oct 2023 13:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD849E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696247599;
	bh=mD0QT0lkuP0r4ZV9BxCcQ5Sp1u63ujom7VHA8vIIfnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q09YcjIbd7dlEWvCODhO7FYhWd9oiEqhPyNS9iDClBuUkU6i2H4XLkcel9iq5L4gj
	 F01GXbekU1w4Mwg91M8sNMWFM1yQPR+tzMAIjsFYOqyMVwMPG/zBSFlRJG+3WFMHgq
	 P94lmWHp1uFHfX0zz4F1MoxTFPWueZQN6CGohLr0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FF98F801EB; Mon,  2 Oct 2023 13:52:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D22CFF802E8;
	Mon,  2 Oct 2023 13:52:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FE10F80310; Mon,  2 Oct 2023 13:52:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6029AF800C1
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 13:52:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6029AF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Axrne4HG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 74101CE0EEF;
	Mon,  2 Oct 2023 11:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F04C433C8;
	Mon,  2 Oct 2023 11:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696247532;
	bh=mD0QT0lkuP0r4ZV9BxCcQ5Sp1u63ujom7VHA8vIIfnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Axrne4HGDwfESYO2ByS4rSXEtSHeXhf9vW/ONBjwi6qspv5IbIE0zKhUoG0DYzCLB
	 84YMqwGTgFdOWWA/NcIeWt4G6F+YjgR4tAj0hp51BQX+BGGSfxE5/Te8Wbq5pO1/dB
	 HiM5dVdMCAmE73sW6Ji0OwjSEgotKJjFNSdjs+3kgJ1T6PqnknFEIGnNwWeGd0YmbD
	 kImsO0h8bP6jtcBvw9GzM1rtMnXdUdFr5bnBEDgxkv4nw4WqeNIuGwaRGBDOjdeuNy
	 kT2mklnaBQroIIW0k3OH6+cTGGmmN1rJrVVPVJ5nv6WOmYD1rMe2oc2F4VK5GEZ9F1
	 vASKikm+Wttyg==
Date: Mon, 2 Oct 2023 12:52:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Sven Frotscher <sven.frotscher@gmail.com>, mario.limonciello@amd.com,
	git@augustwikerfors.se, alsa-devel@alsa-project.org,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v4] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Message-ID: <4fa7d39d-dc34-4550-97fa-2b089f364cca@sirena.org.uk>
References: <20230927223758.18870-1-sven.frotscher@gmail.com>
 <46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KGb+AMvjQ5LP9ojj"
Content-Disposition: inline
In-Reply-To: <46560887-0b6e-42ac-96c3-b4dbc1d7cb61@leemhuis.info>
X-Cookie: Postage will be paid by addressee.
Message-ID-Hash: U7SXTVN7LDRBU5ON6E7WBF7XEISOYYE2
X-Message-ID-Hash: U7SXTVN7LDRBU5ON6E7WBF7XEISOYYE2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7SXTVN7LDRBU5ON6E7WBF7XEISOYYE2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--KGb+AMvjQ5LP9ojj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 02, 2023 at 11:32:48AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:

> Makes me wonder: How many more such quirk entries will be needed? Will
> we have all machines listed soon, or do we expect that future Lenovo
> hardware will need entries as well? If it's the latter: are quirks
> really the right solution here, or do they just hide some bug or then
> need for code that automatically handles things?

x86 firmware descriptions are terrible, it's just an endless procession
of quirks.  The model for ACPI is not to describe key information in the
kernel and instead on Windows load device specific information from
separately supplied tables.  On Linux that translates into these endless
quirks, on Windows it's platform specific drivers for otherwise generic
audio hardware.

--KGb+AMvjQ5LP9ojj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUaruMACgkQJNaLcl1U
h9Bx7wf9FRyZSTh2EDOh9DlJhuxaY0I/WglGW1OTL05cnsL/2aJB17tn/OXVh6kV
63H5ZQ7Pkeb2JjyglqakUciSCmVUFP3wZAj1m/OOuUyNB1RiVvtWe6JQJDfzEsIX
QJoHO2nm2SGOmGy0JVOUcWDWXKxHo1L88+cimo7Sfj7yTLHBuRUMSqxpODOho1p6
Y0KAYgGtzlgAhGLTc5mRkWep5r05zosEpTHVSmx4lpVVTMb8+vzYGym+py/ghoux
G5b/wmqdWrVA69eGeyi5znMCXre8tzN0EujVE5C9Out07VJ4vpKG9tm9dMcSFNEg
jiLZrMEwNviwo0TkT2n8pfasqmsXbg==
=pKIL
-----END PGP SIGNATURE-----

--KGb+AMvjQ5LP9ojj--
