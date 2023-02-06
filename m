Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D1868BF28
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 15:01:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E50A41;
	Mon,  6 Feb 2023 15:01:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E50A41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675692110;
	bh=WHmuZ4HOQhS+Ld/3mBNiQinI0Q/poYTTVhw9vo4zWAo=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YeJxKkaSLUe7SpJ+sSBE1UPGqhoiTGZ5JtoJAx/IL8od/1D335utRHm6qAtQVulo4
	 EWWee4fqud4FYZnDNW948FlgWRjfVW6MbOCa0IwuY3OKbbh+Y66r2Z/WyafpBEzgVe
	 B5L2rtp5zG5Xv+rMSpWusE/mIBllh7oQSBqUUBhk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26706F800E3;
	Mon,  6 Feb 2023 15:00:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E44FF804F1; Mon,  6 Feb 2023 15:00:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B199F800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 15:00:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B199F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gR7dHSyk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF8C060EA2;
 Mon,  6 Feb 2023 14:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D38DC433D2;
 Mon,  6 Feb 2023 14:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675692045;
 bh=WHmuZ4HOQhS+Ld/3mBNiQinI0Q/poYTTVhw9vo4zWAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gR7dHSykZ5YFuPkcFzcN3fEKmpKVUR5vCog6Nymhup0iMTfawYgAEY6asKI6c1+0S
 uaYLLsN50+QwTyoT6AJ9apGVdH4dveKzBEsfLXslqNPs3mOE4lK+oyGam9U9DHbk3c
 6VjBA7MYuWJ4AG4Gg9Y60J8/DxEb1v+mwIhxe9CBdzprzoZQuT7Ax+pdqB73IYOaKF
 rW9f11x/5G92S59NKFqaBL5pHukb/AC8RnLffeIiQHw9nAwyhDq2xsi9gWK+h3B257
 7Hd8/dEiCD9/4IsbS1ud2rUYdK9i0jaTqHkMOoDmtltNwXflXu4G6EwpzZ34yCXf5P
 0lgJqQ8o6gscw==
Date: Mon, 6 Feb 2023 14:00:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: aw88395: Uninitialized variable bug in
 aw_dev_parse_dev_type_v1()
Message-ID: <Y+EIB2UrQ3+5Ax72@sirena.org.uk>
References: <Y+EHjQ0+QCAXxmlh@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/4JoUgpNFgE7fxsI"
Content-Disposition: inline
In-Reply-To: <Y+EHjQ0+QCAXxmlh@kili>
X-Cookie: Hope is a waking dream.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Nick Li <liweilei@awinic.com>, alsa-devel@alsa-project.org,
 Weidong Wang <wangweidong.a@awinic.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Bruce zhao <zhaolei@awinic.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--/4JoUgpNFgE7fxsI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 06, 2023 at 04:58:37PM +0300, Dan Carpenter wrote:
> The "cur_scene_id" variable is never initialized.  It needs to be set
> to zero for the code to work.

Someone already sent a fix for this.

--/4JoUgpNFgE7fxsI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPhCAYACgkQJNaLcl1U
h9Cijgf/YHHuQ9XpwusAnVzXrs2tRILYwpZOHfRv+NDdSvXG2FH5HuYOtRyH6lbg
e/ulk+Co/6L51zkVFBnkeyyHFmLxl3LG49h+dnCaFcf8WqwjllacASz98ZAe3D1w
si5IH1h8l+tX6WhCXDI0paTH3PlqOpNsz9ikLAlLiiHiFOHgiIxgfKuCpRMjMY5X
YRzTJ78U0tGC1V0ZOIQyR3nygywlu/TNn2uyPq/+cfjLC4Kgz0tRIraSFrWPp/iS
ID13trYgCM4WmKxTANyPSaeFmJZ4l2WsPklLn3MtIYfdcH02AC8F6qa9bkh0z64E
NENYjZ+uVbOIrn6alMRkjO7/wYgKHA==
=Limx
-----END PGP SIGNATURE-----

--/4JoUgpNFgE7fxsI--
