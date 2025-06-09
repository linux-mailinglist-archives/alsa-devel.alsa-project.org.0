Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E55CFAD1E1E
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jun 2025 14:51:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AECCD6020F;
	Mon,  9 Jun 2025 14:51:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AECCD6020F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749473489;
	bh=IbTRXWFPgGxCoL0oCdR2NuaGeCsPJkLc5L9596OevQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lrvwmo65eElL71RKvS/Z2Po0AXi7H96OYHoJy0cyt9P+iKIEce7lbwxEbDBzO4rOm
	 iV+WEkx/XnJv9wBjIgsTSdYXhVI+SJ1gC0iqX0opPwusDz07+X4Kb4TauVDk7eINos
	 LB3mGTK9cgWpyNGfCfTPu1aflmhd7L3MQc6Px4p4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA264F805C1; Mon,  9 Jun 2025 14:50:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76C02F805BB;
	Mon,  9 Jun 2025 14:50:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F9F5F8049C; Mon,  9 Jun 2025 14:50:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68B5BF80038
	for <alsa-devel@alsa-project.org>; Mon,  9 Jun 2025 14:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68B5BF80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fyxAd6LU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA01361156;
	Mon,  9 Jun 2025 12:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19CDC4CEEB;
	Mon,  9 Jun 2025 12:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749473447;
	bh=IbTRXWFPgGxCoL0oCdR2NuaGeCsPJkLc5L9596OevQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fyxAd6LUvv3yd7FXaap9vYBfTgftpRBo/9qU6L60Jvvb27EOcTKjFbqZCV5XZkbrS
	 LPFSwtYsF6OQebc9oxGI0gZOooAoFmipEdbjG+2reVLKgXJuZd7ZtIixoEWlgznOon
	 q6dal0vSWoTdBEHRWj3uSI9WNvP/StcY7gk1JcDtkSw4rr9HsFXWvBPLBo+2x6a2yz
	 L63/rV9GFhOFIT4bFZb5A3s21DzAj58UVBOvaVFBx1K5VF60bUMKzRdTPsCfm3YkAm
	 8UkpnOzRXxhFtWJ/pLBvBpX5NKCCRPAdxyuz1Tlq5ueeIIoC/iAfzNT8B3a3fCWUa8
	 gSHmpAukL4xLg==
Date: Mon, 9 Jun 2025 13:50:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, tiwai@suse.de, 13916275206@139.com,
	13564923607@139.com, alsa-devel@alsa-project.org, baojun.xu@ti.com,
	jesse-ji@ti.com
Subject: Re: [RESEND PATCH v1] ASoC: tas2781: Drop the unnecessary symbol
 imply
Message-ID: <c83748f0-9ebb-4f75-aced-c4d818157619@sirena.org.uk>
References: <20250609025120.782-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T4EYsjnPIKyE7nsq"
Content-Disposition: inline
In-Reply-To: <20250609025120.782-1-shenghao-ding@ti.com>
X-Cookie: Restaurant package, not for resale.
Message-ID-Hash: 5HAX7UCYZFJPADEDNH6T3CHQQC7SKAMN
X-Message-ID-Hash: 5HAX7UCYZFJPADEDNH6T3CHQQC7SKAMN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5HAX7UCYZFJPADEDNH6T3CHQQC7SKAMN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--T4EYsjnPIKyE7nsq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 09, 2025 at 10:51:20AM +0800, Shenghao Ding wrote:
> The unnecessary symbols for imply are SND_SOC_TAS2781_COMLIB,
> SND_SOC_TAS2781_COMLIB_I2C, and SND_SOC_TAS2781_FMWLIB. They all used for
> library compiling. All the symbols in the imply are used for codec driver
> compiling.

Please don't resend things so quickly, especially during the merge
window where non-bugfix patches aren't getting applied.

--T4EYsjnPIKyE7nsq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhG2KEACgkQJNaLcl1U
h9ACzgf/dWLvYGfOzgKmd+06/aKl3QbUASK9cmwQkz0pda7iyUDJ9N1n/3R0KSrr
C+v4QxfdyWRN6Ex0qoo6tPif4aGYwj6TuqyoXVxPU2P8TZE5XtXKG3CZWm9czMH2
F2kVXyJBmzKYDlZF3oS3IWxCD+iIyrZsIXwhYjnLFOR4yHDIvXzsO991uU4T0V/T
izinPewN6zBjjPaDCmZLtM7wqvI3blTg16EK8IZ62wZwl6YkmU2UGUv0LN+5q2tR
EfM5aQqmqYq8+DWa8BTx48NlgBjJEPdyY0hoqRUBJpckZW1SpfDcis9h2HTnbX0f
jxC1jPpXnppUTiyGrkAy7nYSYZkfUA==
=Wr6y
-----END PGP SIGNATURE-----

--T4EYsjnPIKyE7nsq--
