Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1712C78B395
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 16:50:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2B09DF4;
	Mon, 28 Aug 2023 16:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2B09DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693234254;
	bh=FmS6oFpBI+c3gEdg4qFbDopMfbRddJucdEeoWvuyr2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HbcvmnxE49iSCwpfdx4JJeKslb4R4qEgK4lheRP3itnqcFDPR1ERvl0mRXn7V5cZ7
	 rKqkuaIrAFxFuCWtNoLH+WpNcz2uD/T4mSUyM9lvXfvJhK9o/9gKZ1JSMTb/Kpz5BN
	 0vAiVAJ44QvJDgevi5SBsSPwJF6kLCaCUxS0IBhQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FA1BF80527; Mon, 28 Aug 2023 16:49:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3509F80158;
	Mon, 28 Aug 2023 16:49:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75D57F80158; Mon, 28 Aug 2023 16:49:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88E5AF800F5
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 16:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88E5AF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PVfSNGcx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A703C63385;
	Mon, 28 Aug 2023 14:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99694C433C8;
	Mon, 28 Aug 2023 14:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693234185;
	bh=FmS6oFpBI+c3gEdg4qFbDopMfbRddJucdEeoWvuyr2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVfSNGcxizUhA2R/czAJPZ5YN38pRPsmj0DkLA6tGOlQBice7yNyNUbE7JhPFbAK6
	 WpfRF+mz9V/hTh8nQf3a1rKMqDQ9gtcfYwZDuP9FHqEc0/Fdzo9gRQNm4bOo3fwuc9
	 ekJqsTZWmkBMtrGBX64mVASnQfPAu9JR+JW5AiAKi2KB1oKfF/HUw7EtnZL4jNi0EB
	 o4pZlweGK/GHVmV4EJ+eT8Va2OQDZdTrzaEdwh7cJmDM6uI8xM0IvxUK0Q3SXOZCHi
	 YzYjhiIJQuATgp32qQJov1RamqVf3xjcPUIj1u+Xuzp3fiN0/wi2FG+ofmxC+qaOQP
	 G7/SgMJUY5vrA==
Date: Mon, 28 Aug 2023 15:49:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.6
Message-ID: <ZOy0BNm1Kw39zTZf@finisterre.sirena.org.uk>
References: <8c4fe69de8214f27e2de1e1c37a70dce.broonie@kernel.org>
 <87v8czxxih.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YkFfw9khCjHvCFs/"
Content-Disposition: inline
In-Reply-To: <87v8czxxih.wl-tiwai@suse.de>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: ES7EEQD43NFTLYYO2JJDXHGUTLIAJV6T
X-Message-ID-Hash: ES7EEQD43NFTLYYO2JJDXHGUTLIAJV6T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ES7EEQD43NFTLYYO2JJDXHGUTLIAJV6T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--YkFfw9khCjHvCFs/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 28, 2023 at 12:38:14PM +0200, Takashi Iwai wrote:

> The fix below seems working.  If you don't mind, I'll apply it (after
> submitting properly) on my sound.git tree.  Let me know.

Looks fine

Acked-by: Mark Brown <broonie@kernel.org>

--YkFfw9khCjHvCFs/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTstAEACgkQJNaLcl1U
h9Ay7gf+NZ5u1vFS08rwugZHJ3pwysfTshn2+pF+kEJCCP9DYY5/WrEoFhNHgyZ1
ki8jdm82LVQReL5y6EXaqyna1jggz6Q4Ng4DOmhhGA9EEgImyZWPISXERHm/u4P4
ZtRMMiR4Y66wKTeUrJZBals2Sr29+1F4lcaWWUpTxqX8m8pZECTLmGdonHhngT+z
n6muChf3NHMMXai81SEaqsd+xKcaqcvSFC+mCUAMHxFYnAx+MGnc2ECsz2slZabR
+iw4IadpOPBPAZhn8YDlHF7Ed7RJhQllJbq5daBR7pyUGOe9xZ/A1C8RhQ0gAfAX
ZmjgwQ5/PnM+FUi2MXpIedOlbuTQPQ==
=CMgd
-----END PGP SIGNATURE-----

--YkFfw9khCjHvCFs/--
