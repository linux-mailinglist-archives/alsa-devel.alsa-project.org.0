Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 926817423FC
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 12:28:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B76033E7;
	Thu, 29 Jun 2023 12:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B76033E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688034531;
	bh=bPvP4Y25hHgu3neqxtUdrkLGAxIwJpwf6S6yIFQalOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TMSo2aKLgNCWf7KXEVpu94Wthpm6rWAyHVUU8VeuHfUerSC383zZTTtW1PH9ES7X8
	 CE/kDqoowLmn304AuVOcfCJ39PyaxAMWf5UhzHMkKf0MPydtGv+BVBSNAHsggjGMWf
	 FTHTidDVBe8MQhkcXdgf8ezNrr7POoNgzCVdeE+0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 909BEF80544; Thu, 29 Jun 2023 12:27:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1E65F80212;
	Thu, 29 Jun 2023 12:27:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE895F80246; Thu, 29 Jun 2023 12:27:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBDFCF80093
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 12:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBDFCF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Mg9Duhez
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF9FF6146C;
	Thu, 29 Jun 2023 10:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3F0C433C8;
	Thu, 29 Jun 2023 10:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688034441;
	bh=bPvP4Y25hHgu3neqxtUdrkLGAxIwJpwf6S6yIFQalOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mg9DuhezoYMh/FWOnp+kn9eVapyic23i9t897m/wCgM5aQNwHZQcRgLHPPMJkjAks
	 0xuC2rRKBM19KSGUaPriv8F7GUlw2+Wf+l2n0o4mupP5i6qIA7NXzSNCjdCvK0WBYh
	 u4GhlyOVp3yYICmzW8BMOoGteNOX1JVMWgCznNhq5zrvOgEy8HZklDzDoggC+MULRM
	 f3WYN/U7H/RsVX84kOZKVkEGFQqN271oBsuLc9JpNIv/AdJlSSaZNO5C5qIPP44imm
	 ecbW3hInCwKpS7hQlo/xnol5Tn2B8BrvNcoAYttcuS2NEqlgseuMbmJf43UtSs0+Hb
	 mxznilpapIDmQ==
Date: Thu, 29 Jun 2023 11:27:14 +0100
From: Mark Brown <broonie@kernel.org>
To: David Laight <David.Laight@aculab.com>
Cc: 'Sameer Pujar' <spujar@nvidia.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"mkumard@nvidia.com" <mkumard@nvidia.com>,
	"sheetal@nvidia.com" <sheetal@nvidia.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [PATCH v2 3/5] ASoC: rt5640: Fix sleep in atomic context
Message-ID: <006fe704-4777-43f4-a85a-e181106ee31b@sirena.org.uk>
References: <1688015537-31682-1-git-send-email-spujar@nvidia.com>
 <1688015537-31682-4-git-send-email-spujar@nvidia.com>
 <bae9f041867e4625ad293d284566bb4f@AcuMS.aculab.com>
 <550e5c8f-0bfb-4ffc-9a43-1ecb153c6a02@sirena.org.uk>
 <953c899d04e543f681e44daad4ec2ff7@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gA2UFWZQXCDsCSqy"
Content-Disposition: inline
In-Reply-To: <953c899d04e543f681e44daad4ec2ff7@AcuMS.aculab.com>
X-Cookie: Surprise due today.  Also the rent.
Message-ID-Hash: 7ZZB7RBXSNIYEVQCPDWXNIH5QU76LSK5
X-Message-ID-Hash: 7ZZB7RBXSNIYEVQCPDWXNIH5QU76LSK5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZZB7RBXSNIYEVQCPDWXNIH5QU76LSK5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--gA2UFWZQXCDsCSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 29, 2023 at 10:21:06AM +0000, David Laight wrote:
> From: Mark Brown

> > What makes you think this is anything to do with audio glitches?  The
> > bug is literally what is described, it is not valid to sleep in atomic
> > contexts and if we ever actually try things are likely to go badly.

> What I mean is that deferring the ISR to process context
> is likely to generate audio glitches on a busy system.

This is an I2C connected CODEC.  We're not doing anything with it in
atomic context, and nothing it does is going to be *that* latency
sensitive.

--gA2UFWZQXCDsCSqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSdXIEACgkQJNaLcl1U
h9Be0wf/ROgGSAEbkgQzBxOmNgrw91eBaIwJJe+GoIsaTybqliz5eXrMv9B46p1F
sixbkb16ATRlZBFC/1QUfV5ieLTC4USlazvajvIn9zLfhiCaYjDgLL7jtq1H6BkR
pAVz5tEnETeZlnorDIw4rA/8xG8tZyYAdcCI97SsXq4czkCRf1n4Ec7L/IeBZ6D4
ENfM9wZ7LvCHJNw5/NqqhoKcGuJHaGDLjj0mY0BXzyIdnKfSGi/E/rFVHdlhgifV
sh6kmwULkWuysVkdVyASn1Ogil7CH6aTmAH6g3vYp3dILODIoWJv5Zt13JOoNLR4
TnkzOJoTvEb8crrDMBNvTJysNuELrQ==
=dbwv
-----END PGP SIGNATURE-----

--gA2UFWZQXCDsCSqy--
