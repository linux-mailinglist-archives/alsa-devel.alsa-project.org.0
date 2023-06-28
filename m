Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8937411E2
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 15:02:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1467B822;
	Wed, 28 Jun 2023 15:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1467B822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687957334;
	bh=2Y00wv8k2zeA83pKwDQ0+f0MQm1Vo3HU23NOR7nc/K4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A+hd1QE6iLD9ZDm7l2MjxdVpAw/Ti9rs22NgQR4FevJoqIitbstoDisWyQ9g0DrIg
	 dHb7FhQeCgRZyIf/tRNbSUxFy+3zXCIM8R7xIzznty94FDZb5BXlAXig67Oz4Nlzqc
	 a8s+YgVBlsyP+u8regWA7wuaUkbjMxSYpQQ2FSg8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF66EF8051E; Wed, 28 Jun 2023 15:01:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F13FF80212;
	Wed, 28 Jun 2023 15:01:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8688BF80246; Wed, 28 Jun 2023 15:01:11 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ED0D6F80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 15:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED0D6F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EZpxB2up
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64A0561324;
	Wed, 28 Jun 2023 13:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AE7C433C8;
	Wed, 28 Jun 2023 13:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687957264;
	bh=2Y00wv8k2zeA83pKwDQ0+f0MQm1Vo3HU23NOR7nc/K4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZpxB2upZeStM/+zsI4GTnz6y7pPZiv3bTGZVGP1AYAEmWtE42tKhS6Rv8k2+I13f
	 hhpQyoUb/MhYmnfA8zzwdKTX23t5SBXPaIYRMMgUagzwYTWwlGfUm8pIyk0jWTQezB
	 2pEC/BGq8sV/DRQ7RkRqHkkJrjbIWrXPIqUTNHeyLZYYbKq10dVObhXR2nomA/8Boy
	 w68yKaXAO9VxzlrymNs37HVgCnNVjSVGB8+yhXJGkolukx0DQSRyjlO/tJ1JoYtARS
	 B2PCckymx1q/0MeyaI2aAbDB57tkJETjgL/UYY/a9tVtHqE7nkkW2B/8HQJDN8afUE
	 TOjpM5+3oqArA==
Date: Wed, 28 Jun 2023 14:00:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [RFC PATCH 0/8] PCI: Define Intel PCI IDs and use them in drivers
Message-ID: <f4baf2d6-5fb8-4a28-acdb-ec838b0e2568@sirena.org.uk>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ivVRextVhQTuygq"
Content-Disposition: inline
In-Reply-To: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
X-Cookie: HELLO, everybody, I'm a HUMAN!!
Message-ID-Hash: 7CSDB3PKM73MYK2YYRGL7MGITUMSBCF7
X-Message-ID-Hash: 7CSDB3PKM73MYK2YYRGL7MGITUMSBCF7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7CSDB3PKM73MYK2YYRGL7MGITUMSBCF7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2ivVRextVhQTuygq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 10:51:27PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> PCI IDs for Intel HDA are duplicated across quite a few drivers, due to
> various configurations and historical reasons. Currently almost all uses
> of HDA PCI IDs have corresponding comment telling which platform it is.
> Additionally there are some inconsistencies between drivers about which
> ID corresponds to which device.

Acked-by: Mark Brown <broonie@kernel.org>

--2ivVRextVhQTuygq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmScLwoACgkQJNaLcl1U
h9C14Qf/enTslOfeuoQE3sEiC7/D5fPrkfXHo5SpklR5QWR22KGn23Mr0UqCdSUa
PJaY1aUhKtpPW/x1rP8LK0b7Hsb6zI+MW8FT+oNXIHveJRBgevnDB3MbHkv9betY
FnBfa3gRALg0kPKxrpSYSGef1Tbg/F1m3YgtpTwBbTf5UBoRQVBhFOPw/ghLVmqt
GRlu5kU6zBIEbEg9jTJ5eP6qFpmkYIWYMXJnuc6kA2IbDRXhtECItlWjSAs82bMY
w9XyPZMPCY4KYbMeGAB/L1KlZvmLCsLQEDRUIva/0Ml6ty97cX67+9e+bgsqRtEC
XtmEQX5+/sSnbrCZzUgJ1K6cMEYgXQ==
=loPF
-----END PGP SIGNATURE-----

--2ivVRextVhQTuygq--
