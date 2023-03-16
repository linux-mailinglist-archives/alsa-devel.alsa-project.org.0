Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8682E6BCEC0
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 12:53:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E757111C;
	Thu, 16 Mar 2023 12:52:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E757111C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678967588;
	bh=b90WYRFDl4yqL9nLZZCJ0KpbaBzqf/uopEj8P5nwVbQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SUFe1yYGKttQU6Gd52dwqwir1R9UQWxm/EqeimWWRSrATOAlFWPNac0ZdjGYWjNki
	 4TpA5H17Eyd7Ku6dir8/MlTumagAr+4ZzhZpYtaoF/DrxhEUQYiIGIPcwggvlGN2Ns
	 2mBoz3BAHC+P1mkkIl0kj1/Q7VYWjCSOXn0MAyZU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1323F8032D;
	Thu, 16 Mar 2023 12:52:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20197F80423; Thu, 16 Mar 2023 12:52:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C39BF800C9
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 12:52:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C39BF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XrIz3rb+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2381161FF1;
	Thu, 16 Mar 2023 11:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CECC433D2;
	Thu, 16 Mar 2023 11:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678967526;
	bh=b90WYRFDl4yqL9nLZZCJ0KpbaBzqf/uopEj8P5nwVbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XrIz3rb+7x6c4MnH65XpITx3fijve2aIfQ/NrunNYpqghVWRCakhKXDQ4ifSyVGyq
	 tiqVlmGC0/YxVbA0PvLPO7OotJOXRArPQ11lbJMSL95ZqByEYAhl8yjdrxd1ffetuA
	 Kt78NFwo0BHuj7Y19RUfSUdfP545NUp3PKntiPwurXGMbnydz47oQnDR7bxeOBwADU
	 9/mN+1MDRcQbbwm0pmI8pno+0EAW6S7k5LseVwZ/s3NCOBzdfQDXWGFhxxaEnEK6xi
	 1ml16CMgLVbr1ye9HSxtCl4+jduigZ2ZaGt9tA6zNVoPBKDtXnwDl4n1mEtdqH6bFM
	 DHsB41hJWIwdw==
Date: Thu, 16 Mar 2023 11:52:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Ge-org Brohammer <gbrohammer@outlook.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI entries to support Victus by HP
 Laptop 16-e1xxx (8A22)
Message-ID: <386ec839-e10d-4a5a-b3ff-d8772ab73675@sirena.org.uk>
References: 
 <PAVP195MB22610BD3A98379E740C93C08DABF9@PAVP195MB2261.EURP195.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UFq5NANQBWER6Dx/"
Content-Disposition: inline
In-Reply-To: 
 <PAVP195MB22610BD3A98379E740C93C08DABF9@PAVP195MB2261.EURP195.PROD.OUTLOOK.COM>
X-Cookie: With your bare hands?!?
Message-ID-Hash: 3Q3W3A4QSTQ2DTCSSF27CUORF4EFKUYP
X-Message-ID-Hash: 3Q3W3A4QSTQ2DTCSSF27CUORF4EFKUYP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3Q3W3A4QSTQ2DTCSSF27CUORF4EFKUYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--UFq5NANQBWER6Dx/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 15, 2023 at 09:26:00PM +0000, Ge-org Brohammer wrote:
> This model requires an additional detection quirk to
> enable the internal microphone.

This doesn't apply against current code, please check and resend:

Applying: ASoC: amd: yc: Add DMI entries to support Victus by HP Laptop 16-e1xxx (8A22)
error: patch failed: sound/soc/amd/yc/acp6x-mach.c:269
error: sound/soc/amd/yc/acp6x-mach.c: patch does not apply
Patch failed at 0001 ASoC: amd: yc: Add DMI entries to support Victus by HP Laptop 16-e1xxx (8A22)

--UFq5NANQBWER6Dx/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQTAuEACgkQJNaLcl1U
h9CzFQf9GxRerC4Gg1SYLw8KrxkYASqqOcH4Jy2XS3TtOYVoPDgrl0njYGZTQHjK
+gABwC+kp2j6NuknmgkIzKgYvVygj3SCEETG35pL9Wc8NtWfRX+00ZhxdWoYC/Mi
1jsDPtSMYOnFQq2RIT68Ds7rruSGRwpp4r391o1rwTtnGvuBChiYhJkyQIgwY+e+
fpHFo4PhgkPO5e72IvcaeJuQY/ui6KNSEEMwBpK3R8qek8PFzjt2zZniLJgDYYoN
xvsbF2ahhUtT2V1v7Vbh8WCILGT9FQSmI+EMiG7suV56AxddP/evnwlDp7BjDawb
HAArmM+mnPBID37aHyvkg2wnybvARQ==
=yw4c
-----END PGP SIGNATURE-----

--UFq5NANQBWER6Dx/--
