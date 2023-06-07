Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8F37265CA
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 18:24:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9873320C;
	Wed,  7 Jun 2023 18:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9873320C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686155053;
	bh=fwnzBy6ckt+FtqipbzEfvu5tUu3TjJKUo9aSkpzl3yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RJsrdoM5/fqbYCWfL34ul0OMe1CGMNPCQpY6DnjDFaU9h6nimckoOeFL4a5psWiZO
	 3bSi+O7IImxKNMCLmIAiTgS9jK+XClTj7SHmpFmbmoCzq9uKiSqho5aNO8hUWDmy8n
	 y57LLTF/pLAi3jHSQxCyTXMan7QQ6VTubFLwCdYA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B1CDF804DA; Wed,  7 Jun 2023 18:23:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6AEBF8016C;
	Wed,  7 Jun 2023 18:23:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B491CF80199; Wed,  7 Jun 2023 18:22:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E7A60F80155
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 18:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7A60F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Yntv5ygr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75B706370E;
	Wed,  7 Jun 2023 16:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCD8C433EF;
	Wed,  7 Jun 2023 16:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686154970;
	bh=fwnzBy6ckt+FtqipbzEfvu5tUu3TjJKUo9aSkpzl3yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yntv5ygrXLY4/vTfK9Xk6E9FyEj0urziBkUj63ZhYsUkAVrlgNpNz2zDVJuPGrAyz
	 cH2Wl7OjpS/GTxWeEv+GaoJEcDeThA3ix+rAoiSeiUJYo+us+c5G2VvAXysRIMvhZe
	 K4Jl16NczNvf129dmETgHf+R4/+vWuGJiaTSmDIDHYxfaGyO+JA6ERXmllrsl1tTAu
	 AFo2ahPHSDNbPwyDcJLTXyZLHmiuLHtlcwRgeOE9LHj16srwkCSo56GyjU5DEcSqmL
	 67RBfN53NOw5GismzvPsOVKS9h57BFMSi7BIklPPDLRgp+fQhK9RmAR0TTOtEf6BX7
	 9QXsnN6BdDzow==
Date: Wed, 7 Jun 2023 17:22:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
	alsa-devel@alsa-project.org, bard.liao@intel.com,
	- <patches@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: add N cpus to M codecs dai link support
Message-ID: <47053ebb-4157-49a2-bfeb-cf090d502a81@sirena.org.uk>
References: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
 <8411fd34-0326-ae92-1d1e-ff171318ebf2@opensource.cirrus.com>
 <c183a76f-38d9-8e20-af80-32b40e1caffa@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5cwhKFlNM4eLYU7x"
Content-Disposition: inline
In-Reply-To: <c183a76f-38d9-8e20-af80-32b40e1caffa@linux.intel.com>
X-Cookie: Keep away from edge.
Message-ID-Hash: RUGL3HB2HJMX5HZ76GZRE3IYI2RKVY2N
X-Message-ID-Hash: RUGL3HB2HJMX5HZ76GZRE3IYI2RKVY2N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RUGL3HB2HJMX5HZ76GZRE3IYI2RKVY2N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--5cwhKFlNM4eLYU7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2023 at 10:10:24AM -0500, Pierre-Louis Bossart wrote:
> On 6/7/23 04:29, Richard Fitzgerald wrote:
> > On 07/06/2023 04:12, Bard Liao wrote:

> > You are declaring that all the CPU and CODEC in the dailink behave as a
> > single logical link. So you can just connect all CPUs to all CODECS.

> > That also fixes a problem with the existing N CPU to N CODEC mapping. It
> > assumes that means CPU0 is connected to CODEC0, CPU1 is connected to
> > CODEC1, ... But that isn't necessarily true. You could have an N:N
> > mapping where multiple CPUs have been combined to create a multi-channel
> > stream that is sent to all CODECs.=20

> This is questionable when the CPUs are connected to different links.
> SoundWire is not a giant switch matrix, there's a clear parent-child
> dependency and limited scope.

> Example topology for a 2 link/4 amplifier solution.

Or a system with two distinct I2S DAIs (TDM is another thing).

--5cwhKFlNM4eLYU7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSArtQACgkQJNaLcl1U
h9CZ4Af+PaNSmQlPamoNX7/FOy3f8qqJa6rI/ASHftgo61EpiPMKwKcp0zl1zEyq
d5Dv3P0GiobVjx7MyiNxE6d0XjL0EsM7ZSFGntu22YPDlkeU9Fe+gKWlZQrfGvKs
VDSARQBlM0Lq7/fkEg/AUOe/nfezwzEsu75EvawSY5SH7pIHJMCyRZbyk5QqGPhv
6H/xE9dOgrkv4pf3lpZPhWqx9wQ08YR5yL6W7o1qe1KXFjCWb4nvQqI8NmJfIsE4
os4cGRefeySRxxHaArhCcslWnXqfDgu9suyHaOt7DlusFrAbctJ+E4K8KgDxBv4d
WDRsBTGBk0KD8z/WRiCyx1aQhfPqDQ==
=UmjB
-----END PGP SIGNATURE-----

--5cwhKFlNM4eLYU7x--
