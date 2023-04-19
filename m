Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A0B6E796C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 14:11:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58552EE9;
	Wed, 19 Apr 2023 14:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58552EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681906307;
	bh=zXn7zJCUIG3ulu/Ol1+5Z/t1V/9CZ+gFKm/NZrXca8E=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UJmLYHlPLQy7ryXsUdb+Cm3aQpB1OP6WbGwLll3BgkZvcQ5iSCKf32c+OEm0K7lkr
	 o1LeatqHKXdGChkZFwL4s15fkNL2ifz5C6EfXqpXfie5wFJpSp83THC9t07OeM+iwB
	 GxRsQ3yr4KYt7XwLU6zdncM+Y+AJNxMp9aA0kCRE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA396F80149;
	Wed, 19 Apr 2023 14:10:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F71FF80155; Wed, 19 Apr 2023 14:10:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7ADCF800F8
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 14:10:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7ADCF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fAl9F0b4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E777636A3;
	Wed, 19 Apr 2023 12:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51155C433EF;
	Wed, 19 Apr 2023 12:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681906244;
	bh=zXn7zJCUIG3ulu/Ol1+5Z/t1V/9CZ+gFKm/NZrXca8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fAl9F0b4N1Q/ALgKd++p4qmPo4uTpbJixPN/iSsdI2nRaczZkA/z26SGrvqLrQIJp
	 EjtTMAoyO4b5BudvKLtUPXapdCrChXu0WiC77LsyKvjM1gDjtkL+sKKbr7Ry2bDwPa
	 G3lIMXhSTvy0pTEpG/FqDKc0wMR3/2hlQzwgzWZWAiC6+CzWfDJxCHBNyibHqiyfsW
	 eNACV1vNw1iTt9jrp9gHCjd6LKdlYCdfXJ3Os8Vh+DNDNZ/fDFv2ISgyPda+sfi/6p
	 /lsSfEVVwBCtR7ugWI13LfL/jUmIyqWE+mjEjUHzjhiheOfWZT3J2jOTPCtoOiPynI
	 XzUvXqMK8dm3A==
Date: Wed, 19 Apr 2023 13:10:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] Revert "ASoC: fsl: remove unnecessary dai_link->platform"
Message-ID: <536ac75b-9a04-4f01-b62b-a5ba94847603@sirena.org.uk>
References: <1681900158-17428-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Svnkl6ntiFrJF6sJ"
Content-Disposition: inline
In-Reply-To: <1681900158-17428-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: This is your fortune.
Message-ID-Hash: 5TI3IT5JWNCYOCBH3CKJCDZKP56BZ6ED
X-Message-ID-Hash: 5TI3IT5JWNCYOCBH3CKJCDZKP56BZ6ED
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: kuninori.morimoto.gx@renesas.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, tiwai@suse.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TI3IT5JWNCYOCBH3CKJCDZKP56BZ6ED/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Svnkl6ntiFrJF6sJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 19, 2023 at 06:29:18PM +0800, Shengjiu Wang wrote:
> This reverts commit 33683cbf49b5412061cb1e4c876063fdef86def4.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Svnkl6ntiFrJF6sJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ/2jgACgkQJNaLcl1U
h9CvjAf+LMbQGyVZrjxwg2HmcbPI6CtACi2AKIxQckmP0FDevBjQG3Lrbs9uSIk9
EDhu08RXTZk9d5HT5c3iesNsESZPdoi9s/I5MNLXJ3qYSGO1F6twOD36u+MrpD1Y
e8HzFNtOKxOK0dCPNilpAdaJ0eXiiOU5XEsVaF1FVqWNts0gPpFTfI4t9o+i4YAW
WbPTf2TFZG4XtUmUJp6L7mUE/8Ng54+L/LSAMicX7D/DPZC10R+INJQCO8UgFsbs
EI00Rv7l3+ZhdBVLKa9i91jgZjDcMi8pzsgJ8gunLr7bD4b9vXCqayznWkMOC1p6
na9sDJqTXr57S3mm2kSQi78Y/sJD4w==
=TMjV
-----END PGP SIGNATURE-----

--Svnkl6ntiFrJF6sJ--
