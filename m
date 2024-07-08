Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 505D792A559
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2024 17:05:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 976E884A;
	Mon,  8 Jul 2024 17:05:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 976E884A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720451147;
	bh=UezjPL3T/OnCXTBp0Y+/oH1ev/RmhW9z8IKaXU4tL0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DCdG0WGgFkOmBTQ1C436i6i43+pdp7HYkVGX5IFmObmDT5sS/gDTsSJWBA4SKlUwy
	 mY0884jGNqj3TIEkysDNoJG6QFUdsf7xFK0OTptCMlpWUPErQKvXg2H14CPN74hZOk
	 AeW7JjQ88tOrZysgfMryUay+pS7z8v0/I35ejOfo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F066F805BB; Mon,  8 Jul 2024 17:05:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 963C9F805AB;
	Mon,  8 Jul 2024 17:05:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A7D0F801F5; Mon,  8 Jul 2024 17:05:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E137F8013D
	for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2024 17:05:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E137F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tG5J7xrK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 05E8360E0A;
	Mon,  8 Jul 2024 15:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A794C116B1;
	Mon,  8 Jul 2024 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720451104;
	bh=UezjPL3T/OnCXTBp0Y+/oH1ev/RmhW9z8IKaXU4tL0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tG5J7xrKMKXjfrdzywSEEU68edCUx0b2WlZo9owO4MQoXFUjdT5xmgmR5Y9wCwckR
	 Y2KhZVTXP58z0mNAsXWSfFdt3qp4e0rr2H7W16fM6fI+Df6RfF5kAqwVryN8enEXut
	 MwmOR3BPuAZ4pNeYyIIXaT7qqN7sR432ICwTCNReiE7pubh91rnobWtj3sMWMV+g+U
	 z3E2LBQ1zB3QIicAK3RMI/fr0YiUtRiVkpvCp8K3iFIFgUR/DiodextZ4b8Hf+j/V0
	 9s7VvXLvmloztonCr0swBAqIrYtqxVwlc+O/+XQRVhSZkfi+9OEfE7CWG1AvtyouWp
	 fpTOE0RVhgCKA==
Date: Mon, 8 Jul 2024 16:05:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] firmware: cs_dsp: Use strnlen() on name fields in V1
 wmfw files
Message-ID: <91fc7cb3-6a00-4b3b-abed-a3a41b191912@sirena.org.uk>
References: <20240708144855.385332-1-rf@opensource.cirrus.com>
 <de44f274-4e02-4c66-b784-41031e99c33e@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FJRKTcPs+sZ0rFsq"
Content-Disposition: inline
In-Reply-To: <de44f274-4e02-4c66-b784-41031e99c33e@opensource.cirrus.com>
X-Cookie: Many are cold, but few are frozen.
Message-ID-Hash: AG4LUIEJBPP5OOO65BAEWDYQPBUSYULX
X-Message-ID-Hash: AG4LUIEJBPP5OOO65BAEWDYQPBUSYULX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AG4LUIEJBPP5OOO65BAEWDYQPBUSYULX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--FJRKTcPs+sZ0rFsq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 08, 2024 at 04:00:07PM +0100, Richard Fitzgerald wrote:

> Don't take this. It applies to 6.11 but not to 6.10.
> I'll try to sort out one that applies to new and old code, or
> send separate 6.11 and backport versions.

> Sorry about that.

git seemed to be able to figure out the context for 6.10 (I apply
everything with am -3).

--FJRKTcPs+sZ0rFsq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaMABsACgkQJNaLcl1U
h9CkAgf+IM6nyhh313jQKBcO3PnBflDEBf25Duajbv1xDQK0DncEyWpkOgueuvie
RdCQg214wCJPCALfND/tzHHfPMcqoi+uraGIpdRDPM4V4jnMQ6k/TaPs+5jx4gjR
a8p17voU62DKumtQWr+G2CtdsByV3M7XK/+qM28W+NJGuFXCmbxRmgOajhAFr9zR
y8Ioftmk0fiE3DDeYXCm6S2qHql3PnDoD144PynUkzrLy0eBwmJZQoBxn9ttAIaX
FxGuaXRvWimj4+fFmKBZ71IV3YSaBW9rVSo+d1ldkKUQGNUNOEl8AuDtVz9eyuV5
VNfrT33uRnQB+tIlnuxuSAr1ednNGw==
=ftUo
-----END PGP SIGNATURE-----

--FJRKTcPs+sZ0rFsq--
