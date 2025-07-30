Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA8EB15DFA
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jul 2025 12:19:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA59C60220;
	Wed, 30 Jul 2025 12:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA59C60220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753870757;
	bh=Tg8r+XpwvnhBpj5g+umHzYZAE3tecrn4qKxVcmRqeKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S5wwzLK7rKiFyY7J9K0BBuqdnHEekAzt1egsaC/Qy92Ty7uoUqkDa5P9tQ7vuei8l
	 WONYKeM54D2Z/B/heCBlG7TEKio24uhXSDoeEJjRqbwv8NRPFII19IdVuJMiOEycoT
	 IN9paWFuX1ZiOg84a3evZXzSKaZM2t7Jdix/WhSE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C91FEF805CA; Wed, 30 Jul 2025 12:18:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C5B2F805C4;
	Wed, 30 Jul 2025 12:18:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A012F80254; Wed, 30 Jul 2025 12:17:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04CF1F80152
	for <alsa-devel@alsa-project.org>; Wed, 30 Jul 2025 12:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04CF1F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JHW9vQPC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6551845DB7;
	Wed, 30 Jul 2025 10:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33E1C4CEE7;
	Wed, 30 Jul 2025 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753870669;
	bh=Tg8r+XpwvnhBpj5g+umHzYZAE3tecrn4qKxVcmRqeKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JHW9vQPCjcs/PYKbTp+bMCyR60z5J1NRPoMBdfTxGXadkctrHl7EweYlnRhjIrTHK
	 tN9EHp4o+aLpsMrLDfYxP8wmAMFfRBSmXreKFJ4efw7RdhIzeVYvLPvHUpUTEehiRU
	 XaaiYA7RAmbKDm8Lbd+dowjX71Nj8V0fmcweE5B0784mTbMefE3u12U7yTI75QSk7r
	 OAVWQchVyQ0bFWF31EJVm4gZrY6iIsPvGXIQsTvEZ0pjv0Nv8eYqw8S1KdY7wWkqta
	 X48gi4ZVqO+sXaXuzv3z8zC0miVPwSmoN0qfmPs6T5RO0LORtLJvmcWWmjOccffbj3
	 QvCTxnuTX2f2A==
Date: Wed, 30 Jul 2025 11:17:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com,
	alsa-devel@alsa-project.org, shenghao-ding@ti.com,
	13916275206@139.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ASoC: tas2781: Normalize the volume kcontrol name
Message-ID: <e36cd0bf-fe0f-4edc-841c-83f688a5e75f@sirena.org.uk>
References: <20250730053236.57643-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lS82ug0n8tvwRv6Z"
Content-Disposition: inline
In-Reply-To: <20250730053236.57643-1-baojun.xu@ti.com>
X-Cookie: Linux is obsolete
Message-ID-Hash: KT3RUN3GCKAYEYJASLHKFRKRNXZOXTTD
X-Message-ID-Hash: KT3RUN3GCKAYEYJASLHKFRKRNXZOXTTD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KT3RUN3GCKAYEYJASLHKFRKRNXZOXTTD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--lS82ug0n8tvwRv6Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 30, 2025 at 01:32:36PM +0800, Baojun Xu wrote:
> As more devices become supported, add "tas2781" as a suffix before the
> TLV name, correct the DVC step, and normalize the volume kcontrol name.

I'll apply this but this really should be several different commits, the
variable renaming and the user visible renaming should at least be
separate commits.

--lS82ug0n8tvwRv6Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiJ8UgACgkQJNaLcl1U
h9DZ3Af/WfnwgG+83a5MNc/itrYacIQMYNcsXQyp298uC/8hf5CgYMje+RmrS8Qu
RTTSiDfIebAt5IiI7b4VcFJN3V2Y+DwannQscjEK5BPMzNDXEeij6bhhPDlMhsh7
bd1L+WbIC+WldzmUKwt52hlzGjZtumXq/B221aH49Vkvy58DILIs8724d9mm4x6x
lZkDaMVU03zFpNstsmFreYu7a9AD/DkB9X2E7ALx8mR4pzKr3Ww/uX6RurS0sY64
2rpGbFf6mvqPp5ojgzNxHSi2ewAVHoaUQ3QyHRKGmMccX4G8kvcUt7dAaXwP8OK8
M3T5M0B8GXxThY4pZvOWV4C2X3j9Sg==
=a3aI
-----END PGP SIGNATURE-----

--lS82ug0n8tvwRv6Z--
