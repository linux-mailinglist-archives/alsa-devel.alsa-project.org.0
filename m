Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF596733259
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 15:38:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AAC1829;
	Fri, 16 Jun 2023 15:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AAC1829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686922723;
	bh=O1ifdy022EVw+vwO8oSlZpF3cK8EflT4CGr0Za53OGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r4nSquqNlWfwK+8w5Va+GxQ5i1AoUx67TpjHP8gesMIUsUOMUi4r53vV5zk3US28a
	 HE1798ZkCadnoDnwcpSkC2MJsNl8wwI1AkwzEnrr3hT0vYwOfEAbybFsS5DLCBWol1
	 RSmLqejsxpvCx2PyrxOsfppeYpJch3FDpUdhTd3M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5818AF8052E; Fri, 16 Jun 2023 15:37:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15E96F80132;
	Fri, 16 Jun 2023 15:37:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71231F80149; Fri, 16 Jun 2023 15:37:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CB14F80093
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 15:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CB14F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ECHKOp2B
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF3C360FFA;
	Fri, 16 Jun 2023 13:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E38C433C0;
	Fri, 16 Jun 2023 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686922665;
	bh=O1ifdy022EVw+vwO8oSlZpF3cK8EflT4CGr0Za53OGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ECHKOp2BSSH4OYhCd0pF7QtPWZr41/SRmfNXe/YJEZ2dzoJjdJQQQ3lEc2vnJYLwF
	 xyQfcn/oD4zaGFA45o/By11ddZf8O5/TD6lLOkDI3jAtxOcWDm3eDfRQMJItgOB8GF
	 h5EMXr8wek/BVBpX3njKbZpZghcsGT9qwu979/DxHKoW9SKRgftEbb14QCqt8ImMw+
	 IIv4eHV/lVEDk301n/wYLDqtR8FheoVzaYfnPeaRjfD01ed8qpXLWpG607YA8pWAGG
	 zb5HeBaaPCf8ob1LRaJRXmclOcYUb5hE1IlKIr+dfk5SLzRXZb834NNp3X5rmgQgFf
	 3b84JqEaHkjbg==
Date: Fri, 16 Jun 2023 14:37:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: tlv320aic32x4: convert to DT
 schema format
Message-ID: <20741da3-3ab8-4366-a8fb-a628b5ab06e7@sirena.org.uk>
References: <20230616083549.2331830-1-alexander.stein@ew.tq-group.com>
 <24617723.6Emhk5qWAg@steina-w>
 <993767ab-d7eb-440a-9f13-026821fd1f61@sirena.org.uk>
 <3660939.Mh6RI2rZIc@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y/gSOOxEdAelgMkM"
Content-Disposition: inline
In-Reply-To: <3660939.Mh6RI2rZIc@steina-w>
X-Cookie: P-K4
Message-ID-Hash: ZWVDDPFTAHNCUSBO4UVANAJB2OE3E3IK
X-Message-ID-Hash: ZWVDDPFTAHNCUSBO4UVANAJB2OE3E3IK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZWVDDPFTAHNCUSBO4UVANAJB2OE3E3IK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--y/gSOOxEdAelgMkM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 03:22:31PM +0200, Alexander Stein wrote:
> Am Freitag, 16. Juni 2023, 14:30:37 CEST schrieb Mark Brown:

> > You could check for dependencies and tell me about them.  For example in
> > this case it turns out the issue is that there's a fix to add supply
> > names that went in which is only on my fixes branch.

> You are referring to [1]? That's part of next-branch since next-20230523.=
 So=20
> this patch should apply on top without conflicts., e.g. today's https://
> git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next.

So, I actually apply on for-6.x branches (which change regularly so I
tend to just tell people to use for-next as it works most of the time).
In this case you've got a dependency on something which is only in the
fixes branch, that'd be what'd be good to surface.

--y/gSOOxEdAelgMkM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSMZaMACgkQJNaLcl1U
h9ARdQf+N4HMQwWzDNP8eb7vyHHegMUXwi7h8g9wsbIx93rQOH4ohWgd/BiUsIBR
E8plZFStBCkA/IGq6Tjh8gredl6LcbsH6102ExhGAnK1IRkOtgfwgBDInYtIe6m8
34lV3ZZuTNnZvVbWR5/rFnCqY7e2FdT/S2Gbt1RE0XL2pHVG3rn8XfSb0ZtDZ0Df
6sYDkwfkH2dSi9GWf5PgvTSboA0Eo2O+xeiRqVSSIi8Ha23SUvwxeX6nliEgKYrk
u07c9E3AxZx/WHtdmH8WrFO4y2Cok+kTUNsGlW2a3983Xhnr/MFf/n9wWqcAS0B5
spFaI9YjyjqHcnXPGcLxZnXZRSsb/g==
=e5v4
-----END PGP SIGNATURE-----

--y/gSOOxEdAelgMkM--
