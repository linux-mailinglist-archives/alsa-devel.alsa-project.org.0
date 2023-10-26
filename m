Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D77A7D85A7
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 17:10:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FE59868;
	Thu, 26 Oct 2023 17:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FE59868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698333042;
	bh=yFCeUvYUN8ddW5lXFRkDIKczNrKiL8ahYwXjs+NIZKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=POFN1SkaUb2PzybsM7G+ZuAiElfnQI4mvIENY1T6OQGFnt2fDhLmTtpe1yydHgqcs
	 oraFc1HF2mR57G0/26GNApWSlM8khdSWB3x4PWeSJ9LXRvLRUtiwmZPxraWIPAnyx5
	 tQdAHtQfOz0iUKCdRoTxYsb37l8eVQI86ajloavo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E634BF80537; Thu, 26 Oct 2023 17:09:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAC50F8019B;
	Thu, 26 Oct 2023 17:09:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6B61F8020D; Thu, 26 Oct 2023 17:09:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E6CFF80152
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 17:09:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E6CFF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UGjKSJXg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 242E3B80BA1;
	Thu, 26 Oct 2023 15:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850A2C433C8;
	Thu, 26 Oct 2023 15:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698332984;
	bh=yFCeUvYUN8ddW5lXFRkDIKczNrKiL8ahYwXjs+NIZKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGjKSJXgr1kKDUyBqpmKI4u63Y1D3+ATox6a9sFyG8bTXklDrSPk0un68G/IEpTrY
	 xRl9pKhjg6Apujz783DfKuKOMmuhqEDmLNH895Y5S0bK8ExZEM+j88oy7pZztRNfj4
	 s+F6x9iZkpZXVRMwT7n2vwTViltYp444oIS14sq5vtD0z3upWaA2Dw6wKwmloIoiWv
	 HPmDRsiieiUGrmbyWFaC10HjWHmofhgtOfMrJWa9P+CbIcYHvgwWZR+Q3E6pVOG2Gu
	 mrzB0//dIcwdKipr7w4jeHvDg6F70BJWG4ATBock1yAlUENgzanSE0X3wQumtDJ73B
	 eaS0wmPCTIqaw==
Date: Thu, 26 Oct 2023 16:09:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v1 8/8] ASoC: cs35l41: Detect CSPL errors when sending
 CSPL commands
Message-ID: <baeccbb4-5015-454d-a60e-861f67ce0f3d@sirena.org.uk>
References: <20231026150558.2105827-1-sbinding@opensource.cirrus.com>
 <20231026150558.2105827-9-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0HftNnHLLsLtjwh6"
Content-Disposition: inline
In-Reply-To: <20231026150558.2105827-9-sbinding@opensource.cirrus.com>
X-Cookie: I'm also against BODY-SURFING!!
Message-ID-Hash: Q7C7ZWKRTSHS3B2MPBSGYUMROJLMFVBX
X-Message-ID-Hash: Q7C7ZWKRTSHS3B2MPBSGYUMROJLMFVBX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q7C7ZWKRTSHS3B2MPBSGYUMROJLMFVBX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--0HftNnHLLsLtjwh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 26, 2023 at 04:05:58PM +0100, Stefan Binding wrote:
> The existing code checks for the correct state transition after sending
> a command. However, it is possible for the message box to return -1,
> which indicates an error, if an error has occurred in the firmware.
> We can detect if the error has occurred, and return a different error.
> In addition, there is no recovering from a CSPL error, so the retry
> mechanism is not needed in this case, and we can return immediately.

Acked-by: Mark Brown <broonie@kernel.org>

--0HftNnHLLsLtjwh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU6gTIACgkQJNaLcl1U
h9BNxgf9ERaHvIciC5wdcj6QKeS1hbJ/n9tkYPUFkD6jh60PrHm5MdAnEPokRYyE
gjiT8Y1t/MDRw8oVp+LMQvUFoMvmIxfkcNic9ks0VN5zdXt5wmZYCUZb3mowY7lC
SCUwOrtZLVJutWMc16v+wl0Gc0MmeTFue30PsxCvh2FIGdqiDnE0cPJe3c+1II9T
F9R5bwaYdYsGFjnCmWw6RmNWK+f8UYUqW6u/CyrcMg26hsMAPuBEG6zSkaORJIKF
uvxh+d6vUKAe3SBz81iT1pYFy5Ets+13lUQ+0KPKL2GjMdWzHqm4qJ23mk9z8La3
rgrQHeA4m+PAVqlZhZ3ZfWypxPvVdg==
=JNLG
-----END PGP SIGNATURE-----

--0HftNnHLLsLtjwh6--
