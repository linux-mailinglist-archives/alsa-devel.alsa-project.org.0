Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 615B95632F0
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 13:52:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F38981631;
	Fri,  1 Jul 2022 13:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F38981631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656676353;
	bh=aVg4rm9fssxdHg5uwaynvHy/AOSJqQjcNz9P0xdagZw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hrXzkjjhtSk8G4UKiVqaksnZRvbJX1SI5APw8m5og1e3KqYRhM6UuLGtJ0vph9MQm
	 wVtnL0UizePhsKssN8J9aQ7HkSvnCau30cRve+XWPQYLy1KGIPRzosuQDnY5bsFu0m
	 nHzBjpJaVHBmsJmnF9PXbjYy24n1MCjrqolVubyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D298F80256;
	Fri,  1 Jul 2022 13:51:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC5E7F80155; Fri,  1 Jul 2022 13:51:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67CD8F800E8
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 13:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67CD8F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Si0nlamF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4285AB82DDD;
 Fri,  1 Jul 2022 11:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA9EC3411E;
 Fri,  1 Jul 2022 11:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656676287;
 bh=aVg4rm9fssxdHg5uwaynvHy/AOSJqQjcNz9P0xdagZw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Si0nlamFemvXRFy/KLoYKmiQ+gjMYAZZWh7vI4XZdttDtPxd4RbeG6t7r84K1dSbO
 wfJD9vADsdA+xBMfcD9nzoOZJccwJ2kDipRkx0GLxvSi0c6qfbavGdK0PAjUgsB3hr
 5UgVaT4eSaNpAchbkP5sjKXlos8TYTmSG3klHJqevOWS78DTLk4PG7GskW8Kc3sCkw
 O/LqHk6m6gyWnbzOLdO+T4Ome0SFUkcWBb2qLjsrLwfMFb/Hjx2hamrB1d0ZQ+Xgra
 cOaYb0EQKQNdyI7LX7c2nQZuyVyb3mdpim4bcgEc8SZQ3hY2ZSD2Dh/u7fSCuqMlBD
 XtO8Y6vajq+7Q==
Date: Fri, 1 Jul 2022 12:51:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V2 0/5] I2S driver changes for Jadeite platform
Message-ID: <Yr7ft2cVTtKrghX8@sirena.org.uk>
References: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VklF/eAaBACgIn/O"
Content-Disposition: inline
In-Reply-To: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
X-Cookie: Who is John Galt?
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alexander.Deucher@amd.com,
 zhuning@everest-semi.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--VklF/eAaBACgIn/O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 01, 2022 at 05:11:02PM +0530, Vijendar Mukunda wrote:

> This patch set depends on:
>         --checkpatch warnings patch
> 	--https://patchwork.kernel.org/project/alsa-devel/patch/20220627125834.481731-1-Vijendar.Mukunda@amd.com/

That's "drm: amd: amdgpu: fix checkpatch warnings", but it looks like
there's no build time dependencies for patch 3 so I could go ahead with
it and the DRM changes go through the DRM tree I think?

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--VklF/eAaBACgIn/O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK+37YACgkQJNaLcl1U
h9CI7gf+KlKB8kb2FsYLItFTormx0LGrvy1WoQ3Par12ZVQ8TU8oosAla3Dt8fC9
AHBi2U1UHsZu5ykn+xxqEQ+XGuAymoYibKch1FMHvlHxKTOyAGzqBrwWlFvs18Mw
7adfaEqu2IirUNqeUI5AY0aAEYNQ3adFxUUwo9b1TeYcP5aHlK8xHFPD+FxNfalm
Tn/binBlJ0cInZe16gcRMo5t5aem6Dy1IgdJwS971JBg7+UCCMRXe2ECDsKqg3fJ
Ht2siQ+Z2Ro+yiS06nHOVingc17Gg5KlSK2xmfJ9xKP9A6QqX3dVMhq2i9EKpQYa
rIDIZXcWCOdvPnUdqyw+e/dKyNmCBg==
=fTTa
-----END PGP SIGNATURE-----

--VklF/eAaBACgIn/O--
