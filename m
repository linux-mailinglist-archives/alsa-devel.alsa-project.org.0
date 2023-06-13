Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A52F72E4AC
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 15:56:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98842E10;
	Tue, 13 Jun 2023 15:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98842E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686664566;
	bh=iSmSOi8YU02GjFRauD4K5+rplja7hUixCkETFWDQmlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kix7DgThSpXifbe2ZRQ88AJrl+DskRqMeJP5KclbDN03h54twDPVtl7x6ngeZeXkD
	 OqmiRejhsBzkpiUo8CTApWJrrJB/Lyot8q/o2fKB0buJkExCZ2IjU5jfZ7WRBuSZxk
	 Z6HIcXwPABJE9xNvnwBAvf5r+/vpRMTbLu9DvVA0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07570F8052E; Tue, 13 Jun 2023 15:54:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93E52F80132;
	Tue, 13 Jun 2023 15:54:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 888EEF80149; Tue, 13 Jun 2023 15:54:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F4EBF800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 15:54:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F4EBF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XJ5yJAEx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8D67963161;
	Tue, 13 Jun 2023 13:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71160C433D9;
	Tue, 13 Jun 2023 13:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686664483;
	bh=iSmSOi8YU02GjFRauD4K5+rplja7hUixCkETFWDQmlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XJ5yJAExaLmvMqk4coILGi79B+899BpXgOZNH4uuP/eQuKwpaNkARmEFmkVgn7biz
	 EEk2e+3JekdMhMo0W7NRgYdtxxHKZ+2ekT+UnnDi7deCGPYnxY/WR/BnOeOTufBdXt
	 2CO2oDQnuIytFqJHXpZLWgWY2sVqHohlXOxyNOQLT/iDxGK5j29fqVnVKlwduZ5cjF
	 8S8JY68gz0Yn9r1clxM30GVBZT+z4k55qSAGM24UixT+z9/+OROWkalpCMi7/olPR+
	 Xoi0srk5u0usumLttenNwwwFYQwj4iXHoENmAPci1Y0sBd6eXoJJZqKdrlqxTtC7cH
	 X1AQRtNmIl8mw==
Date: Tue, 13 Jun 2023 14:54:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Yingkun Meng <mengyingkun@loongson.cn>, Conor Dooley <conor@kernel.org>,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: Re: [ PATCH v2 3/3] ASoC: dt-bindings: Add support for Loongson
 audio card
Message-ID: <449d07d9-5538-4f36-83a0-3a81a9ab9ea2@sirena.org.uk>
References: <20230612085614.3039498-1-mengyingkun@loongson.cn>
 <20230612-booted-french-186dd95e78a9@spud>
 <bda7c25f-65cf-d45f-3ac0-f2471e3aacf8@loongson.cn>
 <20230613-zoologist-panorama-a87858bba075@wendy>
 <887f9cc4-6457-9d14-8aef-011ff4c9aeda@loongson.cn>
 <20230613-depletion-garnet-ccc2009111c3@wendy>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bcFqVBu2j9qZWhmQ"
Content-Disposition: inline
In-Reply-To: <20230613-depletion-garnet-ccc2009111c3@wendy>
X-Cookie: Not a flying toy.
Message-ID-Hash: GU7PFIOBO4EEQI4OPSB6DPTJDKEDWDLN
X-Message-ID-Hash: GU7PFIOBO4EEQI4OPSB6DPTJDKEDWDLN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GU7PFIOBO4EEQI4OPSB6DPTJDKEDWDLN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--bcFqVBu2j9qZWhmQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 13, 2023 at 01:46:41PM +0100, Conor Dooley wrote:

> So it is entirely a software construct? Why does it need a dt-binding
> then? Your commit message says the controller is present on the device!

A typical embedded (or power efficient laptop) audio design will consist
of multiple devices connected together (frequently via non-control
buses) together with system level passive components and plastics which
are also important to the audio configuration.  A card binding describes
the interconections between the devices in the system and provides
identification information for the audio subsystem.  This system level
audio integration is a physical thing that can be pointed at that
requires real software control.

Like I said before please look at the existing audio card bindings.

--bcFqVBu2j9qZWhmQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSIdRwACgkQJNaLcl1U
h9AOEAf/djOuF0KqRDXHKbgIdlBrak/uDTEiHEoqXTlaTW9hPHgCP27FoU5F15vG
/mS+Obydc9IWyOl0uscQPGFP9nLoayDYduM5nEIlAJiBH0rvBjqZ6UVnAofy1Ec7
9ebQPTGDGmWs8iwKgfQjZmw7UJI2J4QQ5pFjZjNTkgmMb9Pu8ixylIbjiXyeiEZH
8Ad65tmEvYRhcGdTFZZ/88Drx+ne7TczcBg4wwcFN0V51NWhXr2XwaEaGKfKTizA
Vx3gq40qxkwzZQPp5UcSL/O7FqhwFh3zHwzduDMVv80tsDbHnD64xRQpZNWELycv
lO4MOL8CZc5th3RnMJat7bXSNHcKuQ==
=JHLU
-----END PGP SIGNATURE-----

--bcFqVBu2j9qZWhmQ--
