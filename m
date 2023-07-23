Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D9C75E2D3
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jul 2023 17:15:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D483FA;
	Sun, 23 Jul 2023 17:15:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D483FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690125350;
	bh=7aE78xDzl/ON3r/nv0LAZnUncUCQ/xBV5NONfduK9ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iqGt4jTl9M2YUis+wLu/bdYGIU5cGknluQwI+6bGMKm6bCea2P8Qdxbruv0YysX2M
	 dZQQszb/7s3HpNqc8malN8USVwbodmW+qKHEpwNC/9AVCA8X8nbgDTmsnybp+pM0TE
	 F2ikO7brXyhz3/CdkPMsX0FmkfIg/avFawR23WBo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71093F801F5; Sun, 23 Jul 2023 17:14:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7158F80163;
	Sun, 23 Jul 2023 17:14:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7683F8019B; Sun, 23 Jul 2023 17:12:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F647F800D2
	for <alsa-devel@alsa-project.org>; Sun, 23 Jul 2023 17:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F647F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jOVIIRv3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E0E8C60DB7;
	Sun, 23 Jul 2023 15:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2B8C433C7;
	Sun, 23 Jul 2023 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690125140;
	bh=7aE78xDzl/ON3r/nv0LAZnUncUCQ/xBV5NONfduK9ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jOVIIRv3sXq4FXkR6BZW4hfETFGqFM/tqUeagS7jLSdqtBBLQYbjNIbG2m7LcSsUP
	 kNTA2oyNqg6OZKJWeNrQuSEIrUyKohWnNOVkK+AZ7mJSmpVj195F3U7tK7Mp2rdC56
	 caOZ7u9hsvwio4IdPJokCjMMXPH14M1IkllBCy1QKk+29I7XGyvPYlWwD6Wncl9SDd
	 OVyLq1BCqfZF4kuxOnZYuBmrkNVrOglX4d9FYYXwFGgGIDuAPFYtXRFcbGyg9XYh+S
	 i17akoLyw9kx6G5W/EEz3WCC2PNDb3KRJl8LwdRSo8kWvVUM9IKgfcFIRY9Ay1F5hJ
	 rSxozhjzKsUXQ==
Date: Sun, 23 Jul 2023 16:12:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Shurong <zhang_shurong@foxmail.com>
Cc: oder_chiou@realtek.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rt5665: add missed regulator_bulk_disable
Message-ID: <ZL1DUWAeBbArQL1f@finisterre.sirena.org.uk>
References: <tencent_AA66A80A12D4372BB57E5B7A60471EB00A08@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RGYqtdSr/tWD83Ar"
Content-Disposition: inline
In-Reply-To: <tencent_AA66A80A12D4372BB57E5B7A60471EB00A08@qq.com>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: 6YDRQ2FDN3A3WWICQ4DGZ6CJBYFVMZCV
X-Message-ID-Hash: 6YDRQ2FDN3A3WWICQ4DGZ6CJBYFVMZCV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6YDRQ2FDN3A3WWICQ4DGZ6CJBYFVMZCV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--RGYqtdSr/tWD83Ar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 23, 2023 at 03:07:31PM +0800, Zhang Shurong wrote:

> +	ret = devm_add_action_or_reset(&i2c->dev, rt5665_i2c_disable_regulators,
> +			rt5665);
> +	if (ret)
> +		return ret;
> +
>  	ret = regulator_bulk_enable(ARRAY_SIZE(rt5665->supplies),
>  				    rt5665->supplies);
>  	if (ret != 0) {

This will attempt to disable the regulators if the initial enable fails
which is a bug.

--RGYqtdSr/tWD83Ar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS9Q1AACgkQJNaLcl1U
h9BHjQf/aCDfhC3YfwWnLCjc1UBV+wGtWAEEvrQyc4lgEtRAfTxg8aMYh5uoDDHh
Jf9iWUR4pnv1O54RJcD2I+3mWZKhrXBz5f43jQ0VrkUWACRnE/zVNr2jdQLq/DB3
LCc6Sh6gpfmJOqLhhjZoi5Dvt7fYPZH2cnqTLqNW4Ghql8XrEYpdWCsZffUkKitp
iTxfMd98oGz1SLSHqs9BP0V3DxB3yiZnnvijeQk04gZNENTXczpp1shvuriC8669
1HAkxm93xb6lW0kQDPsiysThYCT3ZiH2PjCXjMhq/J0hbgnKzTQd2HWH1dZ4cJNO
wqQbNFikIKFmu5nP3ZjshAPCRUUJQA==
=VBnm
-----END PGP SIGNATURE-----

--RGYqtdSr/tWD83Ar--
