Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E29C78FE5A
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 15:35:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FA23E72;
	Fri,  1 Sep 2023 15:35:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FA23E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693575356;
	bh=r3Pc7eL7Jn147ezvhEQH3/uAKYegF32eqLMRyCIvJzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W5V/jK0b0S/P8zF0AdIqKRNEdbCPeWHi8OCessN+cyBdOtp+OWjw3JGc7BTWsW1GI
	 gb67MtWdG8CVl+h8Hy7bg/ZVsKvcDH8UMszf/If2XX+5vdTQTES286ku2ghHr7jqdl
	 n6VxTbr/a8tnob785LLbvoP4oV8Fzg1Vd436pkjU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61233F80155; Fri,  1 Sep 2023 15:35:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1ADEF80155;
	Fri,  1 Sep 2023 15:35:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA5ECF80158; Fri,  1 Sep 2023 15:35:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DB86F80155
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 15:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DB86F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ozWF+liB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 148A161A88;
	Fri,  1 Sep 2023 13:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF81C433C7;
	Fri,  1 Sep 2023 13:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693575290;
	bh=r3Pc7eL7Jn147ezvhEQH3/uAKYegF32eqLMRyCIvJzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozWF+liBTTnKhqxSbnCJ6qB+TL4wsKZLk18tf6SnV5smTXE6QVjYTuv065DZZW/yW
	 H2QArKMPXMsYnwJpGhZfExa4Y3NZAI0LF0CG0q/5/DR3G8bYyunew6a+34KPwXkQx5
	 OPnt3hpu35MOWwyMr8glpHf0zec4Yb05bSfPo4BkV0yPq3vbiMkY+iPM5cy09ywLci
	 ZgA5EOt4bCN10Dyn0K4ichuOqAFpF7lREHURxbyauaQfQbcpHGEoSO0lcdiGsZ9dYE
	 yQhD6WJ3k4djqAbElPE0keVmUwvbrXjIJUJASg03/+LBUz6FgdBirsnoXGSaBUCbVZ
	 lnX+DSNzR2xXg==
Date: Fri, 1 Sep 2023 14:34:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 1/2] ASoC: dmaengine: Drop unused iov_iter for process
 callback
Message-ID: <93771c43-be13-46c6-88f6-32c05c6035ab@sirena.org.uk>
References: <20230831130457.8180-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4874YuUA2QHCgFTh"
Content-Disposition: inline
In-Reply-To: <20230831130457.8180-1-tiwai@suse.de>
X-Cookie: Dealer prices may vary.
Message-ID-Hash: A36DXT3JGLBLM2BBWGILQB2UAIXTKCR4
X-Message-ID-Hash: A36DXT3JGLBLM2BBWGILQB2UAIXTKCR4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A36DXT3JGLBLM2BBWGILQB2UAIXTKCR4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--4874YuUA2QHCgFTh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 31, 2023 at 03:04:56PM +0200, Takashi Iwai wrote:
> Passing the iov_iter to the process callback is rather buggy, as the
> iterator has been already processed for playback.  Similarly, it makes
> the copy for capture buggy after the process callback reading the
> iterator out.  Moreover, all existing process callbacks don't refer to
> the passed iterator at all.  So, it's better to drop the argument from
> the process callback.

Reviewed-by: Mark Brown <broonie@kernel.org>

--4874YuUA2QHCgFTh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTx6HUACgkQJNaLcl1U
h9CMYQf+PU4tLvGS/DPm0sjWgJYfxmubAfpPuXL8DsQqfUee1B0tg2zCEvVzdx/n
y1c4mUFmK+CzZ/AvZDlLrGnG8vXnuLQafZb4zMzYhnjd3mX7ljHL0ii8H8oK7i8K
cJWcMS6aFTf7gfkNmBXevBt+wIm4Ik9h9I8nSU/0RbEKwOAH3rOQ7qFa7wsRBQk2
izCLr/nIoESa+UtkdOjhhblv6AIHXDkAaxvLkCkPMGYhyz1RzH14TraECL9YsVYU
wlueEaNY+dTLMcmrZbHNX7R6sx8SjBMqUKrYMdmBVvtF2kWFfzAHuqdTWyJzDNwU
r5m4ojkWn3r7TEBA2PoXo7pxg7/6aQ==
=EByz
-----END PGP SIGNATURE-----

--4874YuUA2QHCgFTh--
