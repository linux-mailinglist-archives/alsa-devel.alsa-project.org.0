Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8BD77AA61
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 19:26:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9544674C;
	Sun, 13 Aug 2023 19:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9544674C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691947612;
	bh=8lbfPPJ4n+8aA2NeyWf4XOSw9lu+CR89Quao+yjZXQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V8rzhrmaUVNTmgKGS4qewE4TX9xcnYe0yaNRkjMzAVdtUL8IBPGrnIi/NMvdak3sm
	 i/1WbfoLzh3wd4Z3BtD2Zwa3603cxXA+joTVIeDK7Yi8xe9QaljdTOICYTkY6X8yk4
	 5BBnK7WBf6vq2UeOMWg8+nnioe3EuSdBmNBCg1NU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C0A1F80254; Sun, 13 Aug 2023 19:26:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9733EF80254;
	Sun, 13 Aug 2023 19:26:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8918FF8025F; Sun, 13 Aug 2023 19:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 173F8F800EE
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 19:25:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 173F8F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mRoPtJg2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 78B9C60B9C;
	Sun, 13 Aug 2023 17:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF3FC433C7;
	Sun, 13 Aug 2023 17:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691947545;
	bh=8lbfPPJ4n+8aA2NeyWf4XOSw9lu+CR89Quao+yjZXQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mRoPtJg213x03htNDDiHekOtRmlSdoA2tLPvw83vbGbU00QIw8xPQp9VqQ04QPXih
	 NZvAzzctwjLoI2grRD3TclRM/NmQWjaGiq0klLd7vsH2vocnb4qUAQk2Cuiqw/CzuM
	 9qOOUFiSBvlZZwnP7SROh02qTUuYX1WhF1JwzJP58Wvbud6FXky3sHMDq+g1kmvbJo
	 mi5s2t53lnCfzp9I1KH/g29bu1mq6UyQZHCsTTs8V950imgXf4pWBQonqnGo4FAjMc
	 4QSHt2PTn/XhnEH6sVXd3K/xoiXY5YgNKG++KOKhtEXn37TUWNHP5t5IwTm2A0qzo7
	 Ytxu7qHrpUefw==
Date: Sun, 13 Aug 2023 18:25:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>, alsa-devel@alsa-project.org,
	kuninori.morimoto.gx@renesas.com, spujar@nvidia.com, tiwai@suse.com,
	perex@perex.cz, linux-kernel@vger.kernel.org, linux-imx@nxp.com,
	devicetree@vger.kernel.org, daniel.baluta@gmail.com
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: simple-card: Document new DAI
 flags playback-only/capture-only
Message-ID: <ZNkSFvZkQgtudM5Z@finisterre.sirena.org.uk>
References: <20230801082433.548206-1-daniel.baluta@oss.nxp.com>
 <20230801082433.548206-3-daniel.baluta@oss.nxp.com>
 <20230811191236.GA3937407-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2MQbhxQeL2I8OcPf"
Content-Disposition: inline
In-Reply-To: <20230811191236.GA3937407-robh@kernel.org>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: H6L5RPXZYJS37MP6EZQ2UVPMIOUPLI3H
X-Message-ID-Hash: H6L5RPXZYJS37MP6EZQ2UVPMIOUPLI3H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H6L5RPXZYJS37MP6EZQ2UVPMIOUPLI3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2MQbhxQeL2I8OcPf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2023 at 01:12:36PM -0600, Rob Herring wrote:
> On Tue, Aug 01, 2023 at 11:24:33AM +0300, Daniel Baluta wrote:

> > +  playback-only:
> > +    description: dai-link is used only for playback
> > +    $ref: /schemas/types.yaml#/definitions/flag

> > +  capture-only:
> > +    description: dai-link is used only for capture
> > +    $ref: /schemas/types.yaml#/definitions/flag

> Wouldn't this be implicit based on limitations in the either the cpu or=
=20
> codec DAI?

You can see cases where people just don't connect some of the signals
for whatever reason so even if the two devices could do bidrectional
audio the board can't, and there are also cases like the at91sam9g20ek
where the DAI is connected for bidrectional audio but there's not
actually any audio inputs you can connect (even loopbacks) for one of
the directions so it's best to just mask things out from the user.

--2MQbhxQeL2I8OcPf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTZEhUACgkQJNaLcl1U
h9AFoAf9GbJjlpdCljVFwIbGL4YEzDszN7Bqo2ShmBFc2t6+CJ3cFIZIe3xx0e/n
Brz83l9paS8ptdkksscqnvp8FsIK91gGI4o2UamvpF46DI3+t6yJ9AiNmtnC9JQx
WMVBqNK4gUmlLnvcwM6Esy3BBpHU4XkuOgacAyaOYc2r2Knztc1LQwgk3Kmm4KGx
FeESWRjTKDsFT1YjCOHgYEG4LRg5zoClyuL8O4DlzJ3suQwpjPogqoWVRexP/55A
QAD8JtPo190LjiOWsp1qxVkNba/KRPADOS4KqBeQM+YFmcOW92E30t+0wdLthv5W
Y5oiKJ0YF/0pprKQ+nTij4kxyPxokQ==
=yaLR
-----END PGP SIGNATURE-----

--2MQbhxQeL2I8OcPf--
