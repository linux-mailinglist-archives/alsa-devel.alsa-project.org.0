Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0316D7F159E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 15:25:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EBAAA4E;
	Mon, 20 Nov 2023 15:24:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EBAAA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700490325;
	bh=OAZ4POKjwP0M4rKTg4s6RmwzmfekC9Jq6D8vayS9/j0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E86cyRTfLBRxIEn5NkdoWPhPk0XX+OGnY6R+l/Zs6TJ4mdEh8fNsJyRLtqOd9iwT9
	 IC42dq/Fgz9E30GKTI2LTNwv3vp3k6u7bAFGZXNL1wAQgbeuMaTNIj/g03nvWIDnBu
	 g+e47xeH9UAaCMWW/nD+Ktct36x0XrIhzVeU4cqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68E9BF8057E; Mon, 20 Nov 2023 15:24:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DADFF80310;
	Mon, 20 Nov 2023 15:24:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A7C3F80254; Mon, 20 Nov 2023 15:24:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0754F80246
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 15:23:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0754F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ge+PPpQU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1A506128E;
	Mon, 20 Nov 2023 14:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CE7C433C7;
	Mon, 20 Nov 2023 14:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700490227;
	bh=OAZ4POKjwP0M4rKTg4s6RmwzmfekC9Jq6D8vayS9/j0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ge+PPpQUXPg0hjdkxxAZVxf0eyiHMtwO8LBMhSqslbhoscoVZR33NM1dR5ZKUQ7yo
	 bawMy+vowUQZKp2Ouefp4zPJunWEoSuy1vm3+M9X+Sb++B1gCdNUVamveZ4cvYgvCs
	 R8zCcnDdHdCyTQa9A9QOUVuX8jQD+ve1ZtQPFDPBu3US7a+2EI8FEogkbYjlObN+lk
	 Hsj6jZ4pzOfNnEgljaeOyfMbH8/WltPmjcn7tzNf1co+L8O0aZoiol2CrozEQZCYGq
	 D84jke09ZdFGrCrXzECP5Mej+opQwqrhAy7gVDb506CPV8tLzNTGCHw3a0udZou2qS
	 B/VLeafCCjL/A==
Date: Mon, 20 Nov 2023 14:23:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: Re: [PATCHv2 00/10] ASoC: fsl-asoc-card: compatibility integration
 of a generic codec use case for use with S/PDIF controller
Message-ID: <f5a3dcec-a622-4b34-9818-5a0161882d0f@sirena.org.uk>
References: <20231027144734.3654829-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EVPTXRsq8NHn/o5Z"
Content-Disposition: inline
In-Reply-To: <20231027144734.3654829-1-elinor.montmasson@savoirfairelinux.com>
X-Cookie: <Manoj> I *like* the chicken
Message-ID-Hash: 74WLQPLXWCBP44JGHVF4SUCOFLHNNFQK
X-Message-ID-Hash: 74WLQPLXWCBP44JGHVF4SUCOFLHNNFQK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74WLQPLXWCBP44JGHVF4SUCOFLHNNFQK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--EVPTXRsq8NHn/o5Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 27, 2023 at 04:47:24PM +0200, Elinor Montmasson wrote:
> Hello,
>=20
> This is the v2 of the series of patch aiming to make the machine driver f=
sl-asoc-card compatible with use cases where there is no real codec driver.=
 It proposes to use the spdif_receiver and spdif_transmitter drivers instea=
d of the dummy codec.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> * Part of the dai_fmt variable hold information on the codec provider
> or consumer status for bit/frame clocks. In patch 03/10, as we add
> compatibility for multiple codecs, we make the test about bit/frame
> clock provider only check with codec[0]. That way we assure
> compatibility with all already existing compatibles. As it was never
> intended before to have multiple codecs for this test, is there a
> better way to handle it ? Should we make this test check if any codec
> is clock provider ? Or should we let codec[0] be the default
> possibility ? That way, future compatibles that could encounter this
> specific case with multi-codecs should adapt the test for their needs.

Yes, we should be checking all the CODECs - existing bindings that only
have a single CODEC should work fine since they shouldn't have
additional CODECs but it's possible that a device other than the first
one found may be providing the clocks.

>   Documentation: fsl-asoc-card: add documentation for generic codec case

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--EVPTXRsq8NHn/o5Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVba+0ACgkQJNaLcl1U
h9CUygf/brcNLcA4O9bL7/YYU6VYXa+YHncQ2q4DG1O1JFoPm1T3TwIEgqInG8+n
AWonsqdtKxwD+mHeOrW7tMZ6qyYicI7uyMH/9xko+/7bUa3hodZr88TtFlUSsAvN
uYQOVSKbvzoJNl+pbKWPTG7erSDFhjxY8B/PNzGNV8Sstup/q/F4v1CH/rfUkU2a
HM5cU/eLqu07e76nFcznQRF1fukjvj5Egy38LFuZrXl3nkN2bRNfFZEZe3agooAE
IIuNjQhCczjt9htqfSjch/JXiYIUVhQgUDCThKfWD/pdxIlGGCr0cwHAIa7CuVBZ
GguwgAs4XLRBnKjrDRMeSweDluOypw==
=ZYSP
-----END PGP SIGNATURE-----

--EVPTXRsq8NHn/o5Z--
