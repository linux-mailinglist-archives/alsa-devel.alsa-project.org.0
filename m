Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD0A7D3F80
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 20:48:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC69A84A;
	Mon, 23 Oct 2023 20:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC69A84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698086895;
	bh=a/Xz0HDBkYNts4VwVAiPTWCIxUNlPTz08F7wjXZ7R6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lo/F517z3JQHMiRyEA/240/mQeLp9Tr8Yc5hSrP/DmaOUrkPz0TnPAGPkiPJJPKOZ
	 9gLBZAAPDZJKY82tRh/Yexlc/qxvbMfuG1KHKxh4DJU7tgYxwzPKjfP/yk8zNKEIe1
	 CfeaGca6OZqmr6tDwpLGzx6QOL+yqvQzr5YDCphM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 926B8F80553; Mon, 23 Oct 2023 20:47:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38286F80027;
	Mon, 23 Oct 2023 20:47:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 504B9F804F3; Mon, 23 Oct 2023 20:47:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BF6EDF8024E
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 20:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF6EDF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FMaIbhT9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEB4161D0B;
	Mon, 23 Oct 2023 18:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C872AC433C7;
	Mon, 23 Oct 2023 18:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698086835;
	bh=a/Xz0HDBkYNts4VwVAiPTWCIxUNlPTz08F7wjXZ7R6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FMaIbhT92gQicOE0RaU+MomlzKqDUDWqJyFyNI6vv2nvgcLxzX4OrBbrblun9bVRt
	 Qpy9plL6kXIwUNtUVFPXJ0Pi3F7ddmLt6wKNoppso5jCkasrL7fzziczCHLvMcyazu
	 UtfObdMXYMtacNNXK9f5ZMPBgfTsg1Xa6prt+WA9IxGsagL1q4zotG24ZiUI+Mu/Yt
	 F77btmTK5cfTGPV/8I1qM2E1OMPAdYPvPdsHcjG+z8knLZFwptcEHgRuAGhShWSEmz
	 Jiy0Wv2cqtrgd7seYvYwZqKsAhK6gMrZM5FWI5fMQaTI8AqSQ87lXRLvFvKSGjJurU
	 ixwX2SW2yeUDA==
Date: Mon, 23 Oct 2023 19:47:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/5] dt-bindings: audio-graph-port: add ch-map-idx
 property
Message-ID: <4565f60c-ee6b-442a-b509-e54e60cf77ae@sirena.org.uk>
References: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
 <87wmvdkiif.wl-kuninori.morimoto.gx@renesas.com>
 <20231023-security-tadpole-8b4fd45a96da@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XwBwEXjWxYuqPtGK"
Content-Disposition: inline
In-Reply-To: <20231023-security-tadpole-8b4fd45a96da@spud>
X-Cookie: Never reveal your best argument.
Message-ID-Hash: J2RWALBDWYQDYFYRFGKK7FFXGVNEYHGM
X-Message-ID-Hash: J2RWALBDWYQDYFYRFGKK7FFXGVNEYHGM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2RWALBDWYQDYFYRFGKK7FFXGVNEYHGM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--XwBwEXjWxYuqPtGK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 23, 2023 at 05:50:42PM +0100, Conor Dooley wrote:
> On Mon, Oct 23, 2023 at 05:36:09AM +0000, Kuninori Morimoto wrote:

> > +      ch-map-idx:

> I would rather this be spelt out as "channel-map-index" - although I
> don't know if that is the best name for the property, as it seems very
> tied to a single operating systems variable names.
> I'll leave it to Mark as to whether there is a less linux implementation
> coupled name for this property.

It's not particularly Linux coupled, this is a fairly general concept.

--XwBwEXjWxYuqPtGK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU2v60ACgkQJNaLcl1U
h9BO1Af+Im6NJd2L0W8mO6oRNcZSrhse7QemDP7SfjBM6bFGBKMFD6Tcn0zAjB8c
2xblx9ExlOtai797tCAKEaApwAscvP1Vl82p2cWCDqqObiXzerpvPFn4rJ9n2JS1
llSr2FHd+dQ4bnnJgtzBAS9gln2V11MpQYc5ep7Hp3gXAsXabHQutQo8nTjf4nfX
XCLcQjL2i+FNJc1mMWVgE4mojXZZj8AARUV/eytEvN377GGAcW/lDx4bNXLTot8/
Ox6vNu8YsAlJQgax+bS/eKdNEqcC8xy2yqsR/JL+aLWKAqy1/0ezYGgPUNZQgXRQ
FsYbcUMNSRrJlXQQNmvmy/gv8956tQ==
=msxI
-----END PGP SIGNATURE-----

--XwBwEXjWxYuqPtGK--
