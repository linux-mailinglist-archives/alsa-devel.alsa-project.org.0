Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F04FBB8F736
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Sep 2025 10:16:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EDBE601CD;
	Mon, 22 Sep 2025 10:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EDBE601CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758529011;
	bh=9e8PlwwYBfj5/qImlIzuspQWaypq4Jop0H/ZcPuXT5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oyhWxNABTLJc5J2lvK+9fWQHtl2N/xezL5BQa9xqZ30YQXBbzjA85AbyjF246pmuz
	 eULSI30FYgYYJu0hVhM5vljssiDH6+n4fl+YAoqhNqZVa6r+rqq3OpCZjn7jqtHzD5
	 YyZrF7yU+tXzor/i3HtuzMeIA1tnM47droah6goc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B54AEF805C3; Mon, 22 Sep 2025 10:16:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECAB6F805BD;
	Mon, 22 Sep 2025 10:16:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F56EF80254; Mon, 22 Sep 2025 10:16:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CF34F800E3
	for <alsa-devel@alsa-project.org>; Mon, 22 Sep 2025 10:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CF34F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cyjOY+t/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C86C601EF;
	Mon, 22 Sep 2025 08:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D56C4CEF5;
	Mon, 22 Sep 2025 08:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758528955;
	bh=9e8PlwwYBfj5/qImlIzuspQWaypq4Jop0H/ZcPuXT5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cyjOY+t/38baIkWLeToE6zJ1Hm4xM42cTOTwqGMjzzdUlfcdZMQemybm5tVTfyaiM
	 Zc7XTUMc/igXQyEDTWfdxkQUCTmFW6gAJDj6SXdvacg8zgHhvo2+IcIAUktCZjiQLp
	 Psg9PyiEOXPg5D2RYcu1BuOB3C4Nwls6S3zVQNkvVXoyPRQEAnW/h3wG0IiRh5VH2C
	 wgvFZDoqpFV7rli7d8/nlegN9plHfLC7hr3onMeHlnC4BPsJpVN1kf8RCQf1tfXJ2k
	 AjXDCmQFhSn43xE1DYg0CiIyD7/jROThJYkIuBkKUuxa1ta8R11QFf6z7HC586uCfU
	 785xXlEFump8A==
Date: Mon, 22 Sep 2025 09:15:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, shenghao-ding@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, k-yi@ti.com,
	henry.lo@ti.com, robinchen@ti.com, jesse-ji@ti.com,
	will-wang@ti.com, jim.shil@goertek.com, toastcheng@google.com,
	chinkaiting@google.com
Subject: Re: [PATCH v1] ASoC: tas2781: Correct the wrong description and
 register address on tas2781
Message-ID: <aNEFtCV0Gm2koLKv@finisterre.sirena.org.uk>
References: <20250920062044.1904-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jxMegtNIkBGudZ3I"
Content-Disposition: inline
In-Reply-To: <20250920062044.1904-1-baojun.xu@ti.com>
X-Cookie: Who is John Galt?
Message-ID-Hash: H5NQVBVCTVD65LOVKBY7E7OPTRYB4N55
X-Message-ID-Hash: H5NQVBVCTVD65LOVKBY7E7OPTRYB4N55
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H5NQVBVCTVD65LOVKBY7E7OPTRYB4N55/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--jxMegtNIkBGudZ3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 20, 2025 at 02:20:44PM +0800, Baojun Xu wrote:
> Correct the wrong description for TAS257X. Combined TAS5825 with TAS2563,
> as they use the same register address and number.
> Correct the register address and number for TAS5827.

This depends on commits in Takashi's tree so it needs to go via there:

Acked-by: Mark Brown <broonie@kernel.org>

--jxMegtNIkBGudZ3I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRBbMACgkQJNaLcl1U
h9DH/QgAgM2mgvWmptxmf+4GpjO0ExIV3YPboWvh1E3GdATS1ZKo3nefHDbw8qZD
1OYF/zRT/SwsO+DhSQJOV66Gq//35nl1A+nJyxfQJC/yQ86kxuNVYzusVI6GTjj6
WLJRx4Ddw4hsq906RU9y67lYIxCnzFKODFlg6mwE8hmcW4BJB88PcEpyg3IvPfem
WahY6NaRfy4Owrz4ZVa1PsR3utbZvE17xn2t4EamfN4QnGydeK0AWENmbDEXL4Of
zko7SnOhK04jDAuQj99wlNUzfmfFFLY6M54PJ08etQ9j1vP14Qv8KXSoUnVV9WSs
rx/PZwhz/a+EfMhTGx/ZGcUWLtWk5g==
=SEDg
-----END PGP SIGNATURE-----

--jxMegtNIkBGudZ3I--
