Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0881C7CFBE5
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:02:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A9881E7;
	Thu, 19 Oct 2023 16:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A9881E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724176;
	bh=+ZNQA+t088lS/rtlpOaE+au/ptE1r6ex2418W/mbAVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wv7jACTNqmKxhOGiMOQF8DAx0VuniMbNqylJKQYhEp3L25ZePSrCa010bIDm+qNub
	 E1Hzwpk3oVZKJsCOTYZObkOEP35T9m6M6C2wN/NHXzGe462QfvV8RqLMa1UT6pEfJ1
	 X6dHCkXLpRLZ+dHF9Kdw0iCsCtW9niSifQeAtc/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C6A9F80558; Thu, 19 Oct 2023 16:02:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A816BF8024E;
	Thu, 19 Oct 2023 16:02:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 036DAF8025F; Thu, 19 Oct 2023 16:02:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1653F800C9
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 16:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1653F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LC3ELqSP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 45E8ECE2D8E;
	Thu, 19 Oct 2023 14:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A48FC433C9;
	Thu, 19 Oct 2023 14:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697724110;
	bh=+ZNQA+t088lS/rtlpOaE+au/ptE1r6ex2418W/mbAVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LC3ELqSPVM3LYkCBD0KMDVt+dL3NKzibdP0C6LUJ8fIRvmAwYqf/ZgU82Eizxhpzf
	 /FXAXYIosf/4FWWZe6VHcqxLPoqnkirtegdfVfP/Jm01c1ez/nOjN2Xb1AgMWs3CjV
	 vh7OGlpGzD1+6Ocu6KvvbYr5jDvPoKk0lch39ECL5+N0REimriih6ovQdW4nXrPQmw
	 dURLvY+/UHaKfsWEeR/blW50IdtohxRf5Nsm95EraXDQA7yQK/8L8RwrNQIFFQz5bz
	 umC1z2TC/fN3F18kuxqbXySqI75U/29+UP1JgcvB62FV8u2qxKGMkQUUc8PK5UY0xs
	 pPAICwBK9s4Nw==
Date: Thu, 19 Oct 2023 15:01:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	alsa-devel@alsa-project.org, perex@perex.cz
Subject: Re: Migrating this list to a different platform (take 2)
Message-ID: <8a5591c6-686c-41d7-9ff9-f57b2ab034cf@sirena.org.uk>
References: <20231017-coroner-blurt-edffe8@meerkat>
 <87o7gulpog.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ait1sRmH4PfyOoFa"
Content-Disposition: inline
In-Reply-To: <87o7gulpog.wl-tiwai@suse.de>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: E7KC22R6DBFOELFBQSCKNQGRTWODLHEZ
X-Message-ID-Hash: E7KC22R6DBFOELFBQSCKNQGRTWODLHEZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7KC22R6DBFOELFBQSCKNQGRTWODLHEZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ait1sRmH4PfyOoFa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 19, 2023 at 03:14:39PM +0200, Takashi Iwai wrote:

> I personally find that it'd be a significant improvement to be an open
> list; it was often problems that manual approvals took long when
> admins are off due to vacation or sickness.

> But the whole decision depends on Jaroslav, after all, who has been
> administrating the list since the beginning.

This is broadly my opinion also, especially with using b4 the moderation
delays are noticable for me.

--ait1sRmH4PfyOoFa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUxNskACgkQJNaLcl1U
h9A3/wf/dJLI+6gcZjxkvKQ4vL4jiliJapvtsRlK3DGw08mLEGXoNocMKyS4VmxA
2+Wu2/gCfWZjxDIPBNzW0Ble4sxxf+D/fSQSJaC7lgiB/eSwv1SfMX0cFbYr2Tqh
yxztPLYtcyl/J8l9pnxlYvcnA/T0jcH9U4l1Utt2YF7t4BDt+Tr3Z5rUVq57dGT8
uP7BOlIBYhxlrDqpS1J8/ZGhy/5MWylMF77bXxN1y21X65guNVh2kQjOkGAmeuSU
gqkN6KrkJTEzE/j85cHKswaA8fcbbHciGMukJXPcbRecFozhMpKmBDEsHFLriWHx
wnpXNdZqUSSaCPQ2+F5J/5qSr0VWaA==
=TDWu
-----END PGP SIGNATURE-----

--ait1sRmH4PfyOoFa--
