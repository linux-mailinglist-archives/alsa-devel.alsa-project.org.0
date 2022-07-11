Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9782E5707BF
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 17:57:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B0D4828;
	Mon, 11 Jul 2022 17:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B0D4828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657555030;
	bh=8HV9yZZGFBJidulDHDzfWS4Ajwr3bhBQMRksoe8XUHI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JER7fKx/WlKX+k+R1GAM0gXj6j0VFpWrDhOSaO67pNpv6qpXDEwMoBUgbGNl3OY4b
	 AwtpbD1+AbjNQOx3vq+ZAXJ4VYeAg1BDcnbuLq4ixAeR2F0pLq76M0JBebK7qV76K8
	 V+nesi+TazYrnu16g2rOzxkBueOtAsdWfQT7c9qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98105F800E8;
	Mon, 11 Jul 2022 17:56:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FFCEF80163; Mon, 11 Jul 2022 17:56:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA17EF800E1
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 17:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA17EF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MDIxfWkN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A641AB81032;
 Mon, 11 Jul 2022 15:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D788C34115;
 Mon, 11 Jul 2022 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657554961;
 bh=8HV9yZZGFBJidulDHDzfWS4Ajwr3bhBQMRksoe8XUHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MDIxfWkN7FUIOBu2c4cTc5keVGVoKO2v+NQgGOoloxL6OwZ0VNankrbwYB3yBk7pk
 TSFHe2oY+KK0YR7zfpizEhsXxn0wbAhNnNKmqyBCCaE8mncbW134UskBO4J8gmY/6L
 2xHvfMTI7f3VV2PQM3arYmPQrV2zsKU2Y0LZd2umyPXMPPtdw2DsjmkMF6xU63sj8g
 7djIbycrg4FC4RKZmUXtLnaeiOSHXpZh6p/Aoowqy+L41xsSyo1DNrwgEiWV/a52vO
 5dekxUddpSXcHrEvl6jwjgYqJ4nWHmo8xjwF3GJVAyIenm0zM1heexVSuuykMWNGKk
 AnxZ5mZxddM8A==
Date: Mon, 11 Jul 2022 16:55:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s: Fix NULL pointer dereference when
 pinctrl is not found
Message-ID: <YsxIDCaMf0Z0BnxH@sirena.org.uk>
References: <20220711130522.401551-1-alexandru.elisei@arm.com>
 <Yswkb6mvwUywOTLg@sirena.org.uk>
 <YswoOE/sP088lius@monolith.localdoman>
 <Ysw2mzhw4pyrxirc@sirena.org.uk>
 <Ysw+3Hg+GbDjXuTn@monolith.localdoman>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tg1MdlMwJWKMRNAi"
Content-Disposition: inline
In-Reply-To: <Ysw+3Hg+GbDjXuTn@monolith.localdoman>
X-Cookie: I am NOMAD!
Cc: alsa-devel@alsa-project.org, heiko@sntech.de, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, linux-rockchip@lists.infradead.org,
 judyhsiao@chromium.org, linux-arm-kernel@lists.infradead.org
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


--tg1MdlMwJWKMRNAi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 11, 2022 at 04:17:37PM +0100, Alexandru Elisei wrote:

> Do you want me to respin the patch with an abbreviated splat?

It's fine, just leave this one.

--tg1MdlMwJWKMRNAi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLMSAsACgkQJNaLcl1U
h9DfVAf3fsWaAiN9qpjwm1k+G3+bQFU/BeOTROHaL2wDeSqy50zlg6PJy+C8/DWW
FLEDtXUo/3Y+fuC9hjkEhpElWej3xK292MXE0d3gkc+pZe3FQzOYn6JTNvOeUS3u
MQIZKwXplY4jbXBYnDzt9JKl7Hc8ZdVYfngtQkOj/bJiU5IrqRQIrQpivaNi6Jpz
wRNdd01A/z5Rk09lWCQz6uTg8XxLpI8pxrL3BL6Q0TjA5J8rIp8ki5UMYhkcmi78
8tMo/IOyLGRLJCJij+wAilMpUZPIoAgexZhuSJlZyWyuHf0qWEFZSSK+z0g7Ybfn
KE6lm2sRo6syEO4ln0OneVdgv/9a
=vq9L
-----END PGP SIGNATURE-----

--tg1MdlMwJWKMRNAi--
