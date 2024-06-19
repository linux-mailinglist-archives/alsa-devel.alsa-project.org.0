Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B24F90EA0A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 13:49:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54BD9DF8;
	Wed, 19 Jun 2024 13:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54BD9DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718797781;
	bh=w5cAoAASm64T8m5tiTn2cbQG1dthfwLRAJsS/gRwIq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mfk+GXalkV9J2q0iuPmda3oMTNvzGVnRc0MZOOGkjyWLhSy5L1BLqCyQRORQdyDpB
	 kXAdUf043sWQrbQFAX5kTdBUXgnJrrWwZTcPWovd7Xd7PMgKFkWYnmvUc021zXf2fg
	 nwOTXBlCxSJ5Q9LbGDMTjTbrzpN4BiMzzaXsn1GM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D266F805B1; Wed, 19 Jun 2024 13:49:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCAD2F805AF;
	Wed, 19 Jun 2024 13:49:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB5B2F8023A; Wed, 19 Jun 2024 13:49:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36D0CF800ED
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 13:48:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36D0CF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XNBe9kqa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 381EBCE1B24;
	Wed, 19 Jun 2024 11:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B867C2BBFC;
	Wed, 19 Jun 2024 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718797719;
	bh=w5cAoAASm64T8m5tiTn2cbQG1dthfwLRAJsS/gRwIq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNBe9kqaZNNPx71tIPgLgXf/cuAJXpwV+qaC7uKM/aRgcTBYeBVvyZ5I6BHBpUIcN
	 H61cQcb8bYYpVHIGUcL24i8Jw5lO1CbV4huegFSRDfakfH3AYswsQwJyhZujvZdtwn
	 Rnvm+L67r9hNDlE+/wV7b/1ijIJLXMX0aTa6Y3fXO/B3gzCZXaDxMhNm01JwP8lfVJ
	 kNSsmJPcmK6PFAJUxP8ZQ8mZTK/2GXpMEVLfWX8ePAmNn4Rim0L6GUbt4/tw+TG6Y9
	 9ZJU6zHN130/bKYvDVOzzNFUBgoY+iiK3ydS/Xte0a+R0zWNB8fPWgh242UNeOI4Aq
	 PFEtr0VhHWjKA==
Date: Wed, 19 Jun 2024 12:48:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Simon Trimmer <simont@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Accept values greater than 0 as IRQ
 numbers
Message-ID: <3abde78c-aae9-445a-b8a0-a09e4079006b@sirena.org.uk>
References: <20240617135338.82006-1-simont@opensource.cirrus.com>
 <fe9dd613-8909-4c7d-a7d7-9094b75fe8fb@opensource.cirrus.com>
 <941d2b8a-18b5-43ad-9aec-6785f841dfaa@sirena.org.uk>
 <97da8398-599e-45cb-abb2-97cc66567628@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VR6AEZOBN5xY1cCZ"
Content-Disposition: inline
In-Reply-To: <97da8398-599e-45cb-abb2-97cc66567628@opensource.cirrus.com>
X-Cookie: Don't I know you?
Message-ID-Hash: 72CCEMYF2HUHC2AMJMSD5XAXQWUVYVQS
X-Message-ID-Hash: 72CCEMYF2HUHC2AMJMSD5XAXQWUVYVQS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72CCEMYF2HUHC2AMJMSD5XAXQWUVYVQS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--VR6AEZOBN5xY1cCZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 11:24:06AM +0100, Richard Fitzgerald wrote:

> Ah, ok. Sorry, I assumed you were objecting not just overloaded.

There's a latency between me deciding to apply a patch and the patch
actually ending up in my tree - I test everything which takes time.

--VR6AEZOBN5xY1cCZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZyxZIACgkQJNaLcl1U
h9DGqAf+Jz/okBoNBuqi6pOSDONLdBYzCM2CCX1nO3m7rt43q1WNnDyHMJ/E5sEK
Gf7KEey66EwZOp7ozj0bDUhViwBT9NTuSPgXLcf3FjdBhdn0pxXkjz3IOLQl+rcL
2E/+9WCOfy4WxUq+5Q7EhGeGvF4Iu3e5OfSYN/jbMCb6O8+2frVt4zlpbU4ZTOCO
tDZIctNPH125ATIdP9E1fSFSyLnOuBda8hGwpyCAUjUluwFbTvI8z6u/PLbLUXzq
I81HRGieVpedOzVtVT8vWb6ZkmB1d9HkQT0xtWJkV3AFfdpddjd0Mhm3QWf3SPqx
qroTq2Ew+Mq1/EPA8ouW87vzE09LlQ==
=DIGY
-----END PGP SIGNATURE-----

--VR6AEZOBN5xY1cCZ--
