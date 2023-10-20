Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 651FE7D0F47
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 13:59:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FE0B83B;
	Fri, 20 Oct 2023 13:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FE0B83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697803166;
	bh=hgzML6+OkKEZo9orZ2B4XMz4xyPZIW1HsH8NObcq26Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PyYpg43fNYpWvo85/NpRlBgLQERyMA5srC452CIMSD2zEPyxeMy+GzHXefv3hbQvo
	 Fpl/Y1JxiAyuVT5Ww3HpkSR2LqJCgtw7bDTyVPfFtSW9LNwFdwaFneKAl1gIvUzgrc
	 4EH+rndp9HNvuqyxvUFkvFLYc+jRW2kzcab6kUyg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8681F8024E; Fri, 20 Oct 2023 13:58:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B12BF8024E;
	Fri, 20 Oct 2023 13:58:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAEFCF8025F; Fri, 20 Oct 2023 13:58:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 065B9F8019B
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 13:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 065B9F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lJfbIk+b
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 698FE6208A;
	Fri, 20 Oct 2023 11:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D424FC433C8;
	Fri, 20 Oct 2023 11:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697803103;
	bh=hgzML6+OkKEZo9orZ2B4XMz4xyPZIW1HsH8NObcq26Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lJfbIk+bODkAScfSGDHEq+PLNjXPWWSsU+m/xUitudtsy5RhTn38Y403l0mmABOQ7
	 aktFocybnTVSYyGpsCX0JqQtQU97Djc3QILHLLCMvO844SodK5UfHPEYTzNMsMP9wL
	 7HaEm+i48Acl+5fbosR8Ag9paz2Od7QKAQBYuQZtDL8Mdk3q4gz9iTLR2o3BIq2ebm
	 Xmcvcyvn20O5Bo84NGFE1Awj7lG54eVFa6eWE1bBrgTalLeVb9joOHzU/x52BCXcP8
	 dSt9Fc+5IrRaORbgozVFunhDsjvrxacYtP6lTzHrXGIFfbVcdFSjL4yq3NXVNO91X2
	 IxUCJneVxvayA==
Date: Fri, 20 Oct 2023 12:58:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] dt-bindings: audio-graph-port: add ch-maps
 property
Message-ID: <ad696b38-3bca-4cc9-8e9d-81dce9686de4@sirena.org.uk>
References: <20231012-storage-directory-548905001d10@spud>
 <87wmvr8ioy.wl-kuninori.morimoto.gx@renesas.com>
 <ZSllNtm4ZnUnkiV2@finisterre.sirena.org.uk>
 <20231013-planner-irate-8e411cc54a48@spud>
 <874jirxul6.wl-kuninori.morimoto.gx@renesas.com>
 <20231017-darkness-jackknife-5cf32246a079@spud>
 <871qdskbuu.wl-kuninori.morimoto.gx@renesas.com>
 <20231018-object-renewable-6e03bce41ff4@spud>
 <77d3d1e5-7120-4a5b-99c0-c34407f63d5b@sirena.org.uk>
 <878r7yqeo4.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="esXYev3zreSbHTkV"
Content-Disposition: inline
In-Reply-To: <878r7yqeo4.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: teamwork, n.:
Message-ID-Hash: 2AGDP3D27W4VDZ3KYR7WIG37Z553ZYDX
X-Message-ID-Hash: 2AGDP3D27W4VDZ3KYR7WIG37Z553ZYDX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2AGDP3D27W4VDZ3KYR7WIG37Z553ZYDX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--esXYev3zreSbHTkV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 20, 2023 at 01:13:31AM +0000, Kuninori Morimoto wrote:

> DT
> 		(A)						(B)
> 		<- port ->   <- port ->       <- port ->      <- port ->
> 			          ax(ep) <--> (ep)bx
> 	map=<0>	cpu0(ep) <--> (ep)a0		  b0(ep) <--> (ep)codec0  map=<0>
> 	map=<1>	cpu1(ep) <--> (ep)a1		  b1(ep) <--> (ep)codec1  map=<1 2>
> 	map=<2>	cpu2(ep) <--> (ep)a2					  ~~~~~~~~~

I think that looks like what I was thinking of, yes.  Might be
misreading it though!

--esXYev3zreSbHTkV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUya1kACgkQJNaLcl1U
h9BN8gf/f/SHp+53AbjL9/at/+jwsiphdCM3VMOemva8S7CsKEpjdSFr9MfZtRVR
78obwdoyzDD+ZZn58KUnuPC+Uh0092rLKx+CG8SzvMCLpD+BWZysK98dmP5AYk8F
ZjvZpX/z4MhTtkDBPaHfLDQ0T8itq7FwlsGYnvl/fXHDc2wqPV22gkcYLBFoOEtl
e81NELusQ0eCvAWn22Efqnmu5bYY7gvd2FjV8W0AOqW1Mq7wictoL+DnXP5blTHY
w6Uow+hZRH9jdIBxyFU/vePaW5iswWze5lGcWXSi2cDUT/cosaaLQ0S8GKcWhR5l
qRUJeioHr1FsTkUs3+S8Vn3kRS6t5w==
=X52B
-----END PGP SIGNATURE-----

--esXYev3zreSbHTkV--
