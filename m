Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC99931A35
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2024 20:19:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7A8DA4B;
	Mon, 15 Jul 2024 20:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7A8DA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721067595;
	bh=pLUCLcj5O7Hs2oy5g+ASmTVqngMsfK+KdVlmFvVar5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xt8FMXhDVI2Tmv/0fualLEbln22Fm4KEuMAgkrbxkLryRIl2H+iP2wBkoJioxJvix
	 2Y9dmfnl7QwHx3JAtbINmHHtj53bXXK9+Rgy6Ioi6xm4Bnu26s128yJsU2BwDBHJdp
	 vM3n6Lew8BNnV7IqGQ2P7LHiN6sq1TS/mYb/ZkSU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0B7DF80528; Mon, 15 Jul 2024 20:19:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C16A0F805AD;
	Mon, 15 Jul 2024 20:19:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B86E2F8007E; Mon, 15 Jul 2024 20:15:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC6F3F8007E
	for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2024 20:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC6F3F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Yiv7Ul2N
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D3FE60BA2;
	Mon, 15 Jul 2024 18:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E91CC32782;
	Mon, 15 Jul 2024 18:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721067143;
	bh=pLUCLcj5O7Hs2oy5g+ASmTVqngMsfK+KdVlmFvVar5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yiv7Ul2NS27UxVMf3NjfnzW9ZuxOHjXrHc+tH+VF6XZTqCPEp5pTCGzlRzA/RqL5f
	 NdP6ljzkUmrqWhPjfC0uFEAskBuGLzDW84quwIJLDsHjn0cepStiIEBhB/fEo0ofSc
	 f5Xy3ocpbDkDGr/1VNsWJadJuVCfEe9JPyNFh57tVlg5qUzO7DDEdghkquDaOXG7NH
	 PXD5wgH7NfsoYbccRpFJmy/RMzmsej+HzfQuQJWXvduhuBMJAa8PV/xy0roPkkHvax
	 co2QcNLePB5CDJwd4s7PIUwt+rP7PjFMzIw9l/gJrbGj2Iv7XdaKEv/r7/rRxwfKaf
	 7SVGjW4wtFWyQ==
Date: Mon, 15 Jul 2024 19:12:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	linux-kernel@vger.kernel.org, j-chadha@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
	henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu,
	Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
	cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com,
	jesse-ji@ti.com, darren.ye@mediatek.com
Subject: Re: [PATCH v1 1/2] ASoc: tas2781: Add TAS2563 into the Header
Message-ID: <124ded12-330c-4a4a-814e-2dbf1b9b7ca3@sirena.org.uk>
References: <20240713015145.314-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="34Rj9qeN6Q5B9sxB"
Content-Disposition: inline
In-Reply-To: <20240713015145.314-1-shenghao-ding@ti.com>
X-Cookie: You'll be sorry...
Message-ID-Hash: 5UM2PLIKHZ3OBQO43PYULLCTG37C2QQA
X-Message-ID-Hash: 5UM2PLIKHZ3OBQO43PYULLCTG37C2QQA
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5UM2PLIKHZ3OBQO43PYULLCTG37C2QQA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--34Rj9qeN6Q5B9sxB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 13, 2024 at 09:51:41AM +0800, Shenghao Ding wrote:
> Add TAS2563 into the Header in case of misunderstanding.

> @@ -64,8 +64,8 @@ static int tasdevice_change_chn_book(struct tasdevice_priv *tas_priv,
>  			 */
>  			ret = regmap_write(map, TASDEVICE_PAGE_SELECT, 0);
>  			if (ret < 0) {
> -				dev_err(tas_priv->dev, "%s, E=%d\n",
> -					__func__, ret);
> +				dev_err(tas_priv->dev, "%s, E=%d channel:%d\n",
> +					__func__, ret, chn);
>  				goto out;
>  			}

This is reasonable enough but doesn't match the changelog.

--34Rj9qeN6Q5B9sxB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaVZnwACgkQJNaLcl1U
h9BeIggAgkYmHKZJ49Lm54AHQh4wEMi2FvlO+BiEd6YTMNcbNq2Zt3R5dCtbIoGE
xSSbxV9/T6WbVdoTjPyXTRIlfZrhJ8VKtdD/+PoiXRtnJv1APcIfs/fDIxRkjxOV
xBRCFrtzW66gIosKXGo2Z+BQ5t+JGzq5XBU3cNynqbSteNHnLSgAjNGaelvJX0wA
/+mS8Cz4/9BBMhsokGT+goQhjPkqmxZ+ByK9LeDpplYjitJm/Xj1JvuUBeHmnf+V
GiuZGsZf1867dV6dOkNiL3DKtUp6rMZJuiQSkRgCoL8NOSOZ80uPJ7GMKYRAw2RK
7FOjSzQuaAJBuLBtT3Mfm0BHHzvOYw==
=DS+E
-----END PGP SIGNATURE-----

--34Rj9qeN6Q5B9sxB--
