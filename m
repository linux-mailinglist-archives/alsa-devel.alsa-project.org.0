Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA8C856F0B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Feb 2024 22:04:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7556DF8;
	Thu, 15 Feb 2024 22:04:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7556DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708031060;
	bh=VhdfpZDcEIsddO/EyQfKPvU+8LMInwZEs57nuX4AZrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rpwQpLz39cz4h0MV8O9pAkMnykhPtBrOdW4h+CtM0cumuX9ORkZyJrylknkMnMmEl
	 cGJv0XpEDuGrERwt+w0rzxjD8F5GxB8y6YUs8jhD+MK0buK7GhkdybuiOX5TDGbzPq
	 NiqMiIzE/B7FNBLIhOC0hX0bo2S2YeEDTwZeYeqw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 278D7F805AB; Thu, 15 Feb 2024 22:03:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E1E2F80588;
	Thu, 15 Feb 2024 22:03:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78209F80238; Thu, 15 Feb 2024 22:03:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B3ECF800EE
	for <alsa-devel@alsa-project.org>; Thu, 15 Feb 2024 22:03:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B3ECF800EE
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raitC-0000gM-7x; Thu, 15 Feb 2024 22:03:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rait9-000xGR-RU; Thu, 15 Feb 2024 22:03:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rait9-005eCw-2Q;
	Thu, 15 Feb 2024 22:03:23 +0100
Date: Thu, 15 Feb 2024 22:03:23 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>, kernel@pengutronix.de,
 Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
 NXP Linux Team <linux-imx@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com,
	Fabio Estevam <festevam@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 00/13] irqchip: Convert to platform remove callback
 returning void
Message-ID: <knhwqxhouaiehmnnz5oxaxibhq7usokefztae4pplqypwuzgye@mke2irokres4>
References: <cover.1703284359.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="543tsvzhxgimotst"
Content-Disposition: inline
In-Reply-To: <cover.1703284359.git.u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 7OV4LXPUQ3SZL563PBSFPB6CAZC46EVB
X-Message-ID-Hash: 7OV4LXPUQ3SZL563PBSFPB6CAZC46EVB
X-MailFrom: ukl@pengutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7OV4LXPUQ3SZL563PBSFPB6CAZC46EVB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--543tsvzhxgimotst
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

On Fri, Dec 22, 2023 at 11:50:31PM +0100, Uwe Kleine-K=F6nig wrote:
> this series converts all drivers below drivers/irqchip to use
> .remove_new(). See commit 5c5a7680e67b ("platform: Provide a remove
> callback that returns no value") for an extended explanation and the
> eventual goal. The TL;DR; is to make it harder for driver authors to
> leak resources.
>=20
> The drivers touched here are all fine though and don't return early in
> .remove(). So all conversions in this series are trivial.

I'm still waiting for this series to go in (or get review feedback). Is
this still on your radar? You're the right maintainer to take this
series, aren't you?

The series still applies to today's next.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--543tsvzhxgimotst
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXOfBoACgkQj4D7WH0S
/k52nAgArzzUUBfYS1wZr/tKGMqABl7rtsR1xpM2V3NdiROGvaYALX1/ROABy83V
lo8pk8XNMuVzDEYFoMOjFhWeoT9jJ8qGk+emLXFs2gr1HwIDzptSP5nW3jSLgv1m
Y/CnadQn2wbIyxPPxPxPglktJ6kPrVcg4pllVjhi6VrwuhIi8dItD9WDuf+qVaVe
J0rHGiTF2iZvhcuIgIulliMcR9+5npsA14ZxonEQdHJ7f4Ew0LTijz14X8+rNZ4b
3Fe8/jB2MGtwxlwK6eFGEfH5SWnWqltMR4yPzGVHNIqUHrSB3BVFWzDyNnW2EAfx
d+1GXz634dPtW4JEgQNJRXcgS//+JQ==
=O3pv
-----END PGP SIGNATURE-----

--543tsvzhxgimotst--
