Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E742571296D
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 17:27:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C783B20C;
	Fri, 26 May 2023 17:26:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C783B20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685114826;
	bh=zxx7OmAFKO9T9Ao0oqSq594bi3DhPycIlfbuWJawS1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QbO0/sM6KmgYK+OSWJpC3qdnTp/0m/GapAo8YfaznyN185CBH3e3w9T0eksihwBC5
	 VyyW2ZIiPI+vE03xkLjQuIK5dyEpuN8s25Qn79g27KeB4HgO8/YYmwiAaG2HMta5rk
	 i34LYSupK9rv6jzPKJHkw/ahYdOOZY1QYczqEoJg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CDDEF80548; Fri, 26 May 2023 17:25:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9644AF8016A;
	Fri, 26 May 2023 17:25:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F27BEF80249; Fri, 26 May 2023 17:25:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99947F80053
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 17:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99947F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MqTsjnOm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 70FB76152F;
	Fri, 26 May 2023 15:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FE0C433EF;
	Fri, 26 May 2023 15:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685114732;
	bh=zxx7OmAFKO9T9Ao0oqSq594bi3DhPycIlfbuWJawS1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MqTsjnOmr+vQCY4WkJ3s+5S5Jly1Ubce4C3EmAf3MMcvFhc8HqFO3XylWETLCnxrp
	 6Jz09dvXDe6nihy6nRsGbds8fkQsnp+Sz1C3pP4VlNXy4l/Z1Nbjx1nYZP7K5W5W6I
	 y2hhSy7fAAT+VbrHAIGAmJIkvahW619OB6m6qXJWsVv7j1Cj91L/NUZvdJpYhfWmQ8
	 AYp7UiK5WZwA87BYNJpQHrvbO4cmMM6Va8cYJ8C4hjD1KKXwR27l+BB1tAndd1HjM+
	 x4SNfMzmXKsNcTNATTil39kS0GQhbAY2AULmcdbUWPB7HlR1U2/HJ2fiuGPIos3zXD
	 psErak4pglxeQ==
Date: Fri, 26 May 2023 16:25:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Claudiu.Beznea@microchip.com
Cc: rf@opensource.cirrus.com, tiwai@suse.com, perex@perex.cz,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, simont@opensource.cirrus.com
Subject: Re: [PATCH 13/13] ALSA: hda/cs35l56: Add driver for Cirrus Logic
 CS35L56 amplifier
Message-ID: <e06d149f-1da4-4d7e-89de-208e0e8335d4@sirena.org.uk>
References: <20230525150659.25409-1-rf@opensource.cirrus.com>
 <20230525150659.25409-14-rf@opensource.cirrus.com>
 <6ff4235d-f8d0-3c3f-cc67-18aadee2afbc@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yAJCG2p31xUBZol5"
Content-Disposition: inline
In-Reply-To: <6ff4235d-f8d0-3c3f-cc67-18aadee2afbc@microchip.com>
X-Cookie: A Smith & Wesson beats four aces.
Message-ID-Hash: 5T3L2XTZ6BPVULLMKSAC4B72Q2NY7R5L
X-Message-ID-Hash: 5T3L2XTZ6BPVULLMKSAC4B72Q2NY7R5L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5T3L2XTZ6BPVULLMKSAC4B72Q2NY7R5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--yAJCG2p31xUBZol5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 04:40:23AM +0000, Claudiu.Beznea@microchip.com wrot=
e:
> On 25.05.2023 18:06, Richard Fitzgerald wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> >=20
> > From: Simon Trimmer <simont@opensource.cirrus.com>
> >=20
> > Add a driver for the Cirrus Logic CS35L56 amplifier. This uses the same
> > component binding API as the CS35L41 driver. This is not a standalone
> > HDA device; it provides control of the CS35L56 for systems that use a

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--yAJCG2p31xUBZol5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRwz2cACgkQJNaLcl1U
h9A0eAf+ICSD1M5+iPd16MJkaGEt4sMBiQBwOB0zDiDTXy4LkQt5viUWy7Qga8P4
9XJzdkhjK8aASywb4ihzQoDjOE8CKJ1dh1t6jQ5GoM64YIGfM/vXyfCkwk2MyVc2
IX+9TowNt8ISXeOhThVVoqdwsUbgucYrqiK5EgBN+Xkjrz6lbblHB6YnrHpD2B10
YMwydxaQX1RUZmT/0dSl5hNbDZQ0COye3BGykiDeysWAfQB9QJPTtZcOONoqgHHN
hpyDdbIeAzaV1MwMd1MaDD44xKHGjbfotfWREW+jeZUwqaAs8qbAtNuHGeAhVO5X
58kMCF9alh35VwOwrBY0WFT7mzYFYQ==
=kDHu
-----END PGP SIGNATURE-----

--yAJCG2p31xUBZol5--
