Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BE1AB7F76
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E3A0605E9;
	Thu, 15 May 2025 09:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E3A0605E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747293551;
	bh=bBZBSFJF4WAGnbmxg/7z5+9uficJqF0PWrAmZr3Il8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rSEuLLJBVHSo1RNFtk0cMrfxV1mtVPtG33BzZju0iIm4mGkA8M/wcB3bwvReT8WkN
	 CUydJfltjELEgPB2KlPX1cH7MJwKQg5AKpJ7qklYquBsmzsHa/+ZtwNFDOW7dI0Fc5
	 BEtS4UOTtUHHTaymdaCqgvL6noLneL+TyouWFcuY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B976F89B67; Tue, 13 May 2025 18:34:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 722B1F89B69;
	Tue, 13 May 2025 18:34:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26656F80733; Tue, 13 May 2025 18:34:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87042F8072D
	for <alsa-devel@alsa-project.org>; Tue, 13 May 2025 18:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87042F8072D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sdzA5GFz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04C0E445EA;
	Tue, 13 May 2025 16:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3852DC4CEF3;
	Tue, 13 May 2025 16:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747154089;
	bh=bBZBSFJF4WAGnbmxg/7z5+9uficJqF0PWrAmZr3Il8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sdzA5GFzkz9Os/uBkgDPCYZlhJ5AW5cB8/1MHsFbe974X7XMD/B2CaPeyj89uWGf4
	 GGjNMldBwDEf3j+Dl6DKKiQLvK6qI1L/x8CJV58oT+S0+kOQb7QeJZCMQXYIFnxtxy
	 9K3ciRef51bexhu0PTnGp/HCCgJ8vjywdGX5fzUkU7OeYBPYASttml3zcaxf7ebw0O
	 P+gov+G2u7ezITWb2HTffpSexbcrgs61K4fY/r9l4HK9k1WWmdoW2jyt7LnulUVBnf
	 iIYnDKeVrpW8XtSfOWOWCP/8xfeN59B4vl1PvD3YQ9JOsePOckg71NGVfCu4saMqxn
	 gboRf/7u0CetQ==
Date: Tue, 13 May 2025 18:34:40 +0200
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13564923607@139.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, baojun.xu@ti.com, Baojun.Xu@fpt.com,
	jesse-ji@ti.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4] ALSA: hda/tas2781: Fix the ld issue reported by
 kernel test robot
Message-ID: <aCN0oEM4t3fnGuId@finisterre.sirena.org.uk>
References: <20250513085947.1121-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q4eOyN+JEz99T971"
Content-Disposition: inline
In-Reply-To: <20250513085947.1121-1-shenghao-ding@ti.com>
X-Cookie: Well begun is half done.
Message-ID-Hash: F5TDVMRN35JKEKM7WYIVJHIPHFMOZETW
X-Message-ID-Hash: F5TDVMRN35JKEKM7WYIVJHIPHFMOZETW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F5TDVMRN35JKEKM7WYIVJHIPHFMOZETW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Q4eOyN+JEz99T971
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 13, 2025 at 04:59:47PM +0800, Shenghao Ding wrote:
> After commit 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c
> and leverage SND_SOC_TAS2781_FMWLIB")created a separated lib for i2c,
> However, tasdevice_remove() used for not only for I2C but for SPI being
> still in that lib caused ld issue.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Q4eOyN+JEz99T971
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgjdJ8ACgkQJNaLcl1U
h9CfMAf7Bchpz60sOG8Qi50ZcMrM303UhubrlAjelbu3JcylKmEEgqCZdMBgoPPk
4DLWbap/7j5RUNJ4P0VzizuYF1EijZdSQqZ0ONPzGwPwBXbKn3/LZNlOn0Rf9XfO
PomljcbQtnjMGILyW61jgCmmb39kt+1U5RV9lGvwynuLelU1TDwDd/xVsX++xdTB
cfLn+rv0J9H4LgIcJEt1ktG/gxEpydG8zL5042rVRfOvgS1GkFNhWfTt6sJf3Oak
wbx868wXuFZdhst55ZPaoCsjHC0H+VEMvelAb2hm3avj0Am5onvwTOJGZei1eoAO
O8hjoGywmO+kHbk1mmfcBV8XoBhIZw==
=z2MI
-----END PGP SIGNATURE-----

--Q4eOyN+JEz99T971--
