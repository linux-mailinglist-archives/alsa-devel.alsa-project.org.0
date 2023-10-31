Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5817DCE64
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 14:58:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B58A741;
	Tue, 31 Oct 2023 14:57:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B58A741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698760698;
	bh=E1N8DPeXMwmV8axu0l0mzrj53KBS82hlNTWkJem0bSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mTi5leXQD8jeoY9JRBPgZsbg7+4aczepXK4O0nrAH0KxRd/9Pl9npID34mmeEKEy+
	 jKUsRMUzw5TXxECkPpEKlKOEGB+wN0E2VFzu3v9HGwZ3PIbwgFqIqBmefKdV2ArGXH
	 lyGMBimkMgM3RJzBKNI2ROUiYbQIPAsZ9sRlQoA0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FAF8F80166; Tue, 31 Oct 2023 14:57:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65F41F8016D;
	Tue, 31 Oct 2023 14:57:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAB41F8020D; Tue, 31 Oct 2023 14:56:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82154F800FA
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 14:56:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82154F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q9eekhVC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0511ECE0A21;
	Tue, 31 Oct 2023 13:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E2FC433C8;
	Tue, 31 Oct 2023 13:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698760577;
	bh=E1N8DPeXMwmV8axu0l0mzrj53KBS82hlNTWkJem0bSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q9eekhVCKNQzchDnKHOR1oIJor2ulf/P1rs1dxrMxgslQGWEn4wK3t9kls5Sv2fwJ
	 esCrkO/g9N55HG5QeMAHEXsuJR1JavDBcPqQL8fWU0U83j9Zc/wCjTtqYwskLIdqBm
	 1UoH8Un+qW9OnpQWQx4QnyMMY8XSogwY4uv3QTlCOE1Wi4YIQm41ut/Ylz1nTW4zwi
	 BaoXeJXatlHX1PXJY6+E/ZuTCtBkNPya2cb+vC9qC3Jh4wxjNvNwIBGF4IQr1QAyLo
	 RKBZ/I8CDAUnz8S7r1gmHv+V5As1mMoQR6AF9wonrc9xApt7VuCZdGQTI4rd9XFofp
	 B/dqAqA2/Pzvw==
Date: Tue, 31 Oct 2023 13:56:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com, yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com, zhangyi@everest-semi.com
Subject: Re: [PATCH 2/3] ASoC: codecs: ES8326: Changing initialisation and
 broadcasting
Message-ID: <71f64848-c08f-4a34-98f7-1b4ef9c35f4a@sirena.org.uk>
References: <20231031033610.86433-1-zhuning0077@gmail.com>
 <20231031033610.86433-3-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HbTv7xDAEXxEd4RB"
Content-Disposition: inline
In-Reply-To: <20231031033610.86433-3-zhuning0077@gmail.com>
X-Cookie: Is it clean in other dimensions?
Message-ID-Hash: A2ESDH7BZN6OIP43GY2NPTOLGH35VOUD
X-Message-ID-Hash: A2ESDH7BZN6OIP43GY2NPTOLGH35VOUD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2ESDH7BZN6OIP43GY2NPTOLGH35VOUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HbTv7xDAEXxEd4RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 31, 2023 at 11:36:09AM +0800, Zhu Ning wrote:

> New chip versions require new initialisation and playback processes.
> Changing the initialisation and playback process for better results

Are the old chip versions in production systems or were they just in
prototypes?  If end users might have the old chip versions do we need to
have runtime detection of which chip version is in use or are the old
chip versions going to work well with the new sequences?  If there
aren't end users or if their systems will continue to work well it's
fine but the above makes it sound like older chips might need the older
sequences.

Please do try to keep your commit messages wrapped at less than 80
columns as covered in submitting-patches.rst.

--HbTv7xDAEXxEd4RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVBB3sACgkQJNaLcl1U
h9DlBwf+M8oZ0+2OB8obrlNF2goNhIQKAMa0eaM5zMr0rlxc7Hki4ADDYdsp8xWW
CVCpbr367FrxC6DsBqijvuf6mIlU+Y+L0KuYx4Efpr9zsT353aYMImmTiejFp6rQ
bk+u/c8xphNz+8IOUcdkdUhQcyRNPqfYZMkDVSYQgHy294wHulvMfQ4AzftOthhQ
18CvIq4fL6CQNFTBlwY36HuTnjf36sd+ZCQw716Ta53Heh6NuUVWhycutopvYoDW
S9aqAYLI5qZw+p34PVSkmmpWIrTuRoBHJuvLAHy3vw3TSub3QCrXrr89nvPYGHHB
se0MRbL50u5bfzOQVz7+y2RT+CuTLw==
=+tNo
-----END PGP SIGNATURE-----

--HbTv7xDAEXxEd4RB--
