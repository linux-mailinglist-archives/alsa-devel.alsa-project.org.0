Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC16753B8C
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 15:10:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF8D59F6;
	Fri, 14 Jul 2023 15:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF8D59F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689340249;
	bh=ny38HQfzLtwX6eC1kMXhNy8LoU8DEUZBxECFrSVYZxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tuWd670GBULB//DOyPL5gUMpn+PgEe/k5NvY05vr7igS4gSOZGiVaAB5iOZCN0elX
	 Ij9Ug+s4GABryhHPDxoZXSs06JyAC2xBdMYzIObbi7hmi6itgNpvp/lwgQlJJFXCwJ
	 aXdd0uxFzcqk6z+nR2xCkhqlApNzDCLZdDs9e41Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52339F80153; Fri, 14 Jul 2023 15:09:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0303EF80153;
	Fri, 14 Jul 2023 15:09:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B02EF80236; Fri, 14 Jul 2023 15:09:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44BB1F800E4
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 15:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44BB1F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TeCruykt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE41461D0C;
	Fri, 14 Jul 2023 13:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A7CC433C8;
	Fri, 14 Jul 2023 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689340188;
	bh=ny38HQfzLtwX6eC1kMXhNy8LoU8DEUZBxECFrSVYZxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TeCruyktizhsn3RRcqBgwcwYKhK5HBVN9SqIoukDP7r3IcFnbT62h7nMR+B866S5Z
	 m1gm2ahVAYA55Pz7QLumONFJPHG9XyT4i00t2f/oubjmEJLEu11p0rKIp3QJsWWGSb
	 55XZ+oaScV61sgWiY0KNpHkUuOhISob48AmIaGMWfeUMzaZkDOIrKkRVKgdRxQyyEN
	 vSCwnWRU5sE3Xy5bD4dFfI6LcbueBi6BRmB2Z+Je/JWMsW8fr0B7jGjddcT06ILidP
	 UbKCdCJwxoH5pug8qqMG9hXyq2juFWpbPHGcgRiurPTiVpzzMJ6Mf1IHKukSMhgSKk
	 Sb+jjIZvLJx7g==
Date: Fri, 14 Jul 2023 14:09:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 00/15] PCI: Define Intel PCI IDs and use them in
 drivers
Message-ID: <ee3e4d29-48bf-4c8d-b792-f37088a335c5@sirena.org.uk>
References: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x5BNYJ4xdMioPl+C"
Content-Disposition: inline
In-Reply-To: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
X-Cookie: Preserve the old, but know the new.
Message-ID-Hash: DG3FWBEZVQF6PTF3AP7S4H5KGQGLLPAO
X-Message-ID-Hash: DG3FWBEZVQF6PTF3AP7S4H5KGQGLLPAO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DG3FWBEZVQF6PTF3AP7S4H5KGQGLLPAO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--x5BNYJ4xdMioPl+C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 10:24:42PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> PCI IDs for Intel HDA are duplicated across quite a few drivers, due to
> various configurations and historical reasons. Currently almost all uses
> of HDA PCI IDs have corresponding comment telling which platform it is.
> Additionally there are some inconsistencies between drivers about which
> ID corresponds to which device.

Acked-by: Mark Brown <broonie@kernel.org>

--x5BNYJ4xdMioPl+C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSxSRUACgkQJNaLcl1U
h9C59Qf9FkyMHBDgbumQQ0gR+FbQau1VozGcoVek/v377CiS+IGIFgjP7GBr/Uxo
z7uNKJZrTAoIKshbyAf60a14D+6KAXIOxzzQMmM/HMivWa6ihhN1aw1fBsLeGLRW
1xNElcQ05bgdd+Aoo9u3a9Rx4r4shPRJ3KsWY9MmJNZSqlWpdMUsc4oLZR0GfGlj
jThtICxLcJ90UXBomYvrccM6nghuSpb4FSFV6xTjcPpBkG23MfAaWUPNbZWhZmcz
AfbWu0WFS8Om7sRGBalfbWDag1Qikwjh2q8j1vNYX9J9Fq6Pro4Su5bvqQRwWxVP
zAz+X73daUaOVTo8nyGtwTdnmUJtXQ==
=FErE
-----END PGP SIGNATURE-----

--x5BNYJ4xdMioPl+C--
