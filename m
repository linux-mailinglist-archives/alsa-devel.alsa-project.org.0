Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAE4A3DCC1
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2025 15:28:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 853866057A;
	Thu, 20 Feb 2025 15:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 853866057A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740061734;
	bh=VJfQeC6UkhItLRobFtx+p9YE5O6I9pLQXBC0VfKPKkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tMPoN0hD0jCLyfRxOfd65urORz01HFJao8AYduJR6+/IHUClTnhuGtm4QM8Yho1yg
	 BRr/wRj+lhuW2Ssn5gm0w5ue/JALBuFhjjb2eT3wm863Bm45oWcAzQQvJsOEaEnQbe
	 qHyudhzQ1DVRs3yHVMJ7tbvlc3fgql/ITNggxQl0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF2EAF805AD; Thu, 20 Feb 2025 15:28:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61342F8053D;
	Thu, 20 Feb 2025 15:28:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0778F8016B; Thu, 20 Feb 2025 15:27:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD2F0F80016
	for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2025 15:27:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD2F0F80016
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tX+idvPE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C06A961495;
	Thu, 20 Feb 2025 14:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98078C4CED1;
	Thu, 20 Feb 2025 14:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740061667;
	bh=VJfQeC6UkhItLRobFtx+p9YE5O6I9pLQXBC0VfKPKkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tX+idvPElslkbKPYzunVaAW6fwEFnZWUd9D4JvzyM1EZQWdHGfnXLzVDpSnmlKxth
	 XFBY/kkZ2FKZB//s9rOXJOpGT5TlHDbcspF44b6XBAZpuPFWLiTeU6f+MiSNDfgogF
	 Z3D06RIcaHkhMhyoP7xk47H8eKdGNkGPDV2PpL6qr9RBIl8w7OX1U+GcLkVwlSfBrr
	 TovDBNpCN5C0pZrdoIa/FUUGhmCq3SYD+SDOzVnbWgRZXl46afRScI8QZN2bR3K+GS
	 ViI1EUOnt//qe1WPT3bktIoO67Un/SmXJatluRVMBsFkBfsFMDg0Of/CIxLm5PGdxb
	 gX0O8iHvv7szg==
Date: Thu, 20 Feb 2025 14:27:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com,
	13564923607@139.com, alsa-devel@alsa-project.org, baojun.xu@ti.com
Subject: Re: [PATCH v2 2/4] ASoC: tas2781: Support dsp firmware Alpha and
 Beta seaies
Message-ID: <Z7c73zLIhzHmS6fP@finisterre.sirena.org.uk>
References: <20250219061057.714-1-shenghao-ding@ti.com>
 <20250219061057.714-2-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lI+lKjCUclSfw64s"
Content-Disposition: inline
In-Reply-To: <20250219061057.714-2-shenghao-ding@ti.com>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: SGSBZPCWGHOLEQUBK6BYHKZQVKPFBUEP
X-Message-ID-Hash: SGSBZPCWGHOLEQUBK6BYHKZQVKPFBUEP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SGSBZPCWGHOLEQUBK6BYHKZQVKPFBUEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--lI+lKjCUclSfw64s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2025 at 02:10:55PM +0800, Shenghao Ding wrote:
> For calibration, basic version does not contain any calibration addresses,
> it depends on calibration tool to convey the addresses to the driver.
> Since Alpha and Beta firmware, all the calibration addresses are saved
> into the firmware.

The changelog and subject here are identical to that for patch 1.  If
it's all one change this should be one patch, if they're two separate
changes then something in the description of the patches should describe
what's different.

--lI+lKjCUclSfw64s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme3O98ACgkQJNaLcl1U
h9BRmwf/f/in6gQDFvEuNqKbHHiPaXZ6eExjuyeMjCuI7ZRriFq6VUUs25kwa6Vg
xK/VfLZZb0h5sVhe8DXektnBm6dLCFNHcQqJuRznDN38LOFkXk4VkAViiA4gLeA2
MMr4fEPeKhfbVz+YRG3NLEeUgieRtvvdnCJ18R6Z1Ry+ADljJpYGgA2GGdbtKVng
nErYb402aBCs/O9DnO9Gsb1lV9kNuE22kDJH+gYqSYWvw5h8UN07ZXx4r5wdVnlR
qwUV+GIhddmsq8wLZIdT5cWgF7CS5gtTcZil4aZSqV6BwHKhL07CepDnwWzcd4kb
y6DMRm0e6t2x14YjBLK4howj+dUn6A==
=YbjV
-----END PGP SIGNATURE-----

--lI+lKjCUclSfw64s--
