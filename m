Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 130166A87C2
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 18:20:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94C9B82A;
	Thu,  2 Mar 2023 18:20:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94C9B82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677777651;
	bh=gGcvY9KZIRZWsHC1ETRiPMVBuY9qg/Qwr7bbpu4pnUs=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SPApQkfuLpzB+jN4YXmAy18USZL34sSdji1v4uQvu+xkdqOwoM4Qh57YD1GbTcmWq
	 JNoafbpYhxKdt1bTg8p1nEs0p2kCpd+OwMOI0tf0jckR7sQMESM9KwKtMQqFoWbnOe
	 cbW+uOrijZZGnRcIBgh5p8dyEhpiFfXCX/D+00N4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1BFAF800C9;
	Thu,  2 Mar 2023 18:20:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD722F80266; Thu,  2 Mar 2023 18:19:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A10F9F800DF
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 18:19:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A10F9F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rmwPdXeG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 74503B81222;
	Thu,  2 Mar 2023 17:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AE3C433D2;
	Thu,  2 Mar 2023 17:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677777589;
	bh=gGcvY9KZIRZWsHC1ETRiPMVBuY9qg/Qwr7bbpu4pnUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rmwPdXeG2YzcFW2FgQMdJ5rD3NL5mSe1V0TbXBTgJCc1lgBA2FkYRFXiO/JsRArsD
	 +jSK/7ZD3vz5qRmEyNf7z4/xA/ofCNsezui9w6erTFxG0v4CMAedtsoc4pOZkdjflR
	 zSuJB2HsxrVSB4eDLpncgW45fd8xSDEGBjPIuJ2hbOqhMnLLNfQO5KZ094oTU4q4tK
	 j92GJdxkxmZZL994QCyjGjQ5wh/E3Fadte0W6U5T71j3Bkis11I+H+bJDbSkd05aD9
	 401MQpsekKknaHL/JsYBNQs1/giW4SaeiuMlsvQMuPZWHmK7QDoB9xE0HolWJYGseE
	 jFZ9YvX0zdzOw==
Date: Thu, 2 Mar 2023 17:19:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
Subject: Re: [PATCH 5/5] ASoC: cs34l45: Hibernation support
Message-ID: <8aef2c0c-9bd0-4c3a-86e1-7732ddedabfd@sirena.org.uk>
References: <20230302171154.2342527-1-vkarpovi@opensource.cirrus.com>
 <20230302171154.2342527-5-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UdbDkV8ZAUZ45riw"
Content-Disposition: inline
In-Reply-To: <20230302171154.2342527-5-vkarpovi@opensource.cirrus.com>
X-Cookie: Who messed with my anti-paranoia shot?
Message-ID-Hash: TRTALREXJOEPM7HEJ7Y5HZHIPMUGVBKP
X-Message-ID-Hash: TRTALREXJOEPM7HEJ7Y5HZHIPMUGVBKP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TRTALREXJOEPM7HEJ7Y5HZHIPMUGVBKP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--UdbDkV8ZAUZ45riw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2023 at 11:11:54AM -0600, Vlad Karpovich wrote:
> From: "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>
>=20
> Adds support for the amplifier hibernation controlled by
> DSP firmware.

What is amplifier hibernation?

--UdbDkV8ZAUZ45riw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQA2q8ACgkQJNaLcl1U
h9D84Af/VTDcd6XHZp4Z/T2jE5/F1zAjTlm+kuBPBh1p9xIWMLXGZiX7KIMqdOUi
M2YEGgKJJ8NCbt1FX5Z3GBHbzoibXrU77uXCDvQHCkqCWDjabYW2Kzx/E57vEfF8
lvnpDp7x/k2YdGpTQodVAmfZ9CQ4YXk43m0ViWwS5B/Xl0SyA3Zs3PN02pf+iRg8
RthuKfPQbUE7n93lICzy5bFuDIwqB1aZ96JCmekxMdKTzcyZ5r5KEOvu4S3bqtX7
LiwKbXsQwLUfxozL1AvRgsRFjdR+abwHzQS8kCHgV+WVXH+/UvXZX6xmctoY0zKG
yK6G9I+KfDQD7ozLQE9KLyXXyy2VoA==
=XpQh
-----END PGP SIGNATURE-----

--UdbDkV8ZAUZ45riw--
