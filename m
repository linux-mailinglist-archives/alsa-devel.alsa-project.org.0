Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A83172E043
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 13:00:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FD086C1;
	Tue, 13 Jun 2023 12:59:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FD086C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686654031;
	bh=/Bfwify/pN+EHLRwOguUkUl5GSv7oUhAl96UexPlNTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WLh/EMT0ZNhIUjtPRObbXAEEEJnSYk4EOzI4IvCE36cHtDVi5OyuZ978Ekwg2fh3R
	 i1aCmeB0RzLLNnYJJj+s8nkOVv6exLp1rRFA5mYtJMIOiucuFo+WcCAqFx6MRs8a8e
	 0NvXSXDwOmNtAdJKOqC1N5tPe7S2/WumaOeWvHuI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D09DFF80093; Tue, 13 Jun 2023 12:59:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82201F80132;
	Tue, 13 Jun 2023 12:59:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19E45F80149; Tue, 13 Jun 2023 12:59:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BCFCF80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 12:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BCFCF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sebVX+gk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D79B61FBE;
	Tue, 13 Jun 2023 10:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4257C433D2;
	Tue, 13 Jun 2023 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686653971;
	bh=/Bfwify/pN+EHLRwOguUkUl5GSv7oUhAl96UexPlNTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sebVX+gknxO4V7hjYXlVEKHloNueXtGxOr8NBU/dQFj6Y8BYrb4sG4LdPf1g7N8WA
	 3UuXpO50tdtM5FDJCz0pAZ45/zACbgva6bNZAtJtheCIxqo9tlsPRn3J/U7muageIB
	 fiUBnYCQtFdk2NPnT++VU6sP2W540W7Cpg2trpXlOlxxNARy3We8kKesv1zPAG2ZBh
	 0xzWrB5zn171WOBzlbzdxc+koXVMpLm8nan1EnBoFnsf4r0hudjaobPl9wO8jsFMvD
	 MGrtpA2ijVbyDAN/aKA3T8s84+uIyE8BPbv5JylrK7e2AViS4kyXiSNLuCDbwf6D7c
	 Lcak1KWvt0OSg==
Date: Tue, 13 Jun 2023 11:59:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] regmap: maple: Don't sync read-only registers
Message-ID: <e04053b2-897c-46fa-bd1f-e455e01c6152@sirena.org.uk>
References: <20230613074511.4476-1-tiwai@suse.de>
 <b86f7b95-f116-4d06-9aca-7195b01dffab@sirena.org.uk>
 <87ilbrejlm.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h+jgtpBxK4g6svrk"
Content-Disposition: inline
In-Reply-To: <87ilbrejlm.wl-tiwai@suse.de>
X-Cookie: Not a flying toy.
Message-ID-Hash: HYFWL35QQTRN6RDYTGO62UKU7R2XSHVM
X-Message-ID-Hash: HYFWL35QQTRN6RDYTGO62UKU7R2XSHVM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYFWL35QQTRN6RDYTGO62UKU7R2XSHVM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--h+jgtpBxK4g6svrk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 13, 2023 at 12:34:45PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:
> > On Tue, Jun 13, 2023 at 09:45:11AM +0200, Takashi Iwai wrote:

> > This should be in _needs_sync().

> I thought it's a different logic?  regacahe_reg_needs_sync() checks
> only whether it's a default value, and other call paths already check
> regmap_writeable().

Yeah, but it feels like that's the reason we ran into this issue given
that you'd expect _needs_sync() to check this too.

> But I can put the check there instead if you still prefer, too.

It should avoid any similar issues in future.

--h+jgtpBxK4g6svrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSITA4ACgkQJNaLcl1U
h9DhLAf/R3bmLGw2qE3Owpg/IK76UR+MoYy36seq2EfEJSTyWeo0N/ZBuKMpLD0J
NVsVkqZ465pPjJrdpSDHh7996Iq5MzJlFlk7uqvs/3tmTOPIp77XoFYHE8i8uiN3
6GpGRY9HhPkwU+YPHKkMMXA58bFdAgfo2fjr9QDDnYu0WvdNkkj8rArosk2pycC3
hZiavqs5jionbZFQc9sdFzDGMQ6GW0UL9cIExPA6GmbURjwBAK+B1TPbZdZ+nB1K
yFN8Bhdc9CE2Ws9iM6CBk9pSSLPmd3W0wtcbtm/bU1ZZZxglIAuL5vGN2P5E5GYG
/7ZwAEimeUz+jTmSCwcsxcnK9uo+wg==
=oLmI
-----END PGP SIGNATURE-----

--h+jgtpBxK4g6svrk--
