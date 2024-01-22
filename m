Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 703DC836D60
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 18:29:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F4BA850;
	Mon, 22 Jan 2024 18:29:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F4BA850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705944592;
	bh=6FeAIXLL4BMXxP3NQlpVvmV8ek7N+/33fe5B2RSSNM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PsV50GUl4wEFo0g5uObNGOegxKUZkpc9yYhOKyf6Gn3XScXso49zKeXXwvOSW+7Iv
	 uEQSDr7ndwzQWSS5CwUOiMLWrnwhByXRr8tlog66Xtgbe7JuGTB4WSEU23M+W2ToVA
	 aE0XmSbBUlQsjfeMepVnQD9Vi7AENgFxzqgPgEt8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51F3CF80587; Mon, 22 Jan 2024 18:29:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2A0DF80578;
	Mon, 22 Jan 2024 18:29:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45804F8025F; Mon, 22 Jan 2024 18:29:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58D8FF800C1
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 18:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58D8FF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vMJTWOsG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D2E6ACE2B6E;
	Mon, 22 Jan 2024 17:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADACC43390;
	Mon, 22 Jan 2024 17:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705944540;
	bh=6FeAIXLL4BMXxP3NQlpVvmV8ek7N+/33fe5B2RSSNM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMJTWOsGivJR62sg5NtIpQ4+SkzwUTtajCJivqs3X5LFdwl1WJMKpC9/sPpycZ7RE
	 EMVL/5OB5lQHH2qXPZWRHyt9Z2IgGJB+gWzhEEVTd/XAC83KWiS45P087CIHvjBXMx
	 doyKBdZB9FWdUx53efJBAi/UpMov+/tW9Ysm4o9ZRzOsENuhC3PuDGm7MKF/9BeY4j
	 PnaV01wZHf/fxQLG5NQIEpUKVoNRzb1jarK1IBUSJsljfjam5k7Xcda5G/vWeCPvE8
	 sSwuyaHTRs/FpHfSkZte7dAYMmW7pAXzevefBWDpXkGwnu6igaTC0TyUN8yjFcVLB/
	 cMAsPztStzxaA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rRy6i-000000000rG-2U1d;
	Mon, 22 Jan 2024 18:29:12 +0100
Date: Mon, 22 Jan 2024 18:29:12 +0100
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v4 2/4] ASoC: qcom: sc8280xp: limit speaker volumes
Message-ID: <Za6l6EP7OqXPU9mj@hovoldconsulting.com>
References: <20240119112420.7446-1-johan+linaro@kernel.org>
 <20240119112420.7446-3-johan+linaro@kernel.org>
 <d54d3640-49bf-4a2f-903b-4beeb0ebd56c@sirena.org.uk>
 <Za4cR90XoAaATq8X@hovoldconsulting.com>
 <aca2b125-acf8-4791-a3eb-ea19826d3ee4@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zuPb1ptY6OeW5Twe"
Content-Disposition: inline
In-Reply-To: <aca2b125-acf8-4791-a3eb-ea19826d3ee4@sirena.org.uk>
Message-ID-Hash: EIYNOKXRLK7ZF75ZCAD5KBRIUG733UZ7
X-Message-ID-Hash: EIYNOKXRLK7ZF75ZCAD5KBRIUG733UZ7
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EIYNOKXRLK7ZF75ZCAD5KBRIUG733UZ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--zuPb1ptY6OeW5Twe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 04:05:37PM +0000, Mark Brown wrote:
> On Mon, Jan 22, 2024 at 08:41:59AM +0100, Johan Hovold wrote:
> > On Mon, Jan 22, 2024 at 12:03:55AM +0000, Mark Brown wrote:
>=20
> > > This doesn't apply against current code, please check and resend.
>=20
> > These patches are based on Linus's tree after merging the sound updates
> > and I just verified that they apply cleanly to 6.8-rc1.
>=20
> > I couldn't find anything related in either linux-next or your ASoC tree
> > that should interfere.
>=20
> > Could you please try again or let me know which branch to rebase on?
>=20
> I was applying it against v6.8-rc1.

That's what I assumed, but I still don't understand why it doesn't apply
on your end:

	$ git checkout -b tmp v6.8-rc1
	$ b4 am 20240119112420.7446-1-johan+linaro@kernel.org
	...
 	$ git am ./v4_20240119_johan_linaro_asoc_qcom_volume_fixes_and_codec_clea=
nups.mbx
	Applying: ASoC: codecs: wsa883x: fix PA volume control
	Applying: ASoC: qcom: sc8280xp: limit speaker volumes
	Applying: ASoC: codecs: lpass-wsa-macro: fix compander volume hack
	Applying: ASoC: codecs: wcd9335: drop unused gain hack remnant

And if I generate patches from this branch, the diffs are identical to
the v4 patches I sent.

Could you please try again, and tell me which patch fails to apply and
how it fails?

Johan

--zuPb1ptY6OeW5Twe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCZa6l5AAKCRALxc3C7H1l
CDS1AP9v09QUe0W/JBDJqz8b7Z8aLnAKxR6EToN186tpJEhmQQD/ZITVhd2YTnO0
WgezFd6GQaMqTSjOQhoI/Zrt8Qu8Vw8=
=IyN/
-----END PGP SIGNATURE-----

--zuPb1ptY6OeW5Twe--
