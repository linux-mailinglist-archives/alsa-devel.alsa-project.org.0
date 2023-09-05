Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5879226A
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 14:12:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E7AB825;
	Tue,  5 Sep 2023 14:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E7AB825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693915927;
	bh=t9xypQL9zL3DNGu9AYpXUQw6SSdWKkSm+5Iht8Xwh2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HFohQn0kX0hRUyIT3eL9xIhpRxOOyCIMlbmYNn2IHkFSN2Mj8bSr46ooRQnCYJV8k
	 +u5PSUKlYsnlraCVLE/2CZ7GriIzI7kwWBGjwY8+jnwf5WI4dCfAin5gpBLR3wLLCg
	 vTKu0S70WFwtFm+EZAXVNX/S4VAaW6Ilgvh1dkW8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 127C1F80552; Tue,  5 Sep 2023 14:11:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 876CFF80431;
	Tue,  5 Sep 2023 14:11:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD052F8047D; Tue,  5 Sep 2023 14:11:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1F0AF80141
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 14:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1F0AF80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WU/YD13T
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03A84602F8;
	Tue,  5 Sep 2023 12:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958A3C433CA;
	Tue,  5 Sep 2023 12:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693915862;
	bh=t9xypQL9zL3DNGu9AYpXUQw6SSdWKkSm+5Iht8Xwh2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WU/YD13TZ++YOfqMBQXeDFj75Ryx80Kz8RXpeolotxpnFAv3i03dqB5bn7NT+jCxu
	 jkBx6ypmTq9XOjc9M7HQ6vkQmXXMWxE3rms1nBD3vRy4baD5sIXtwjqx3UmivyLMDY
	 fAhfDc3aFJIKbVUmx0luQFdBatfn+UEOSahR6BcjtuLmxIzhRP9i4goMgWoaoO0/7+
	 KIlm3vEswuXoms0PtT88F7YK53clzi6CxTGV0VfvGRCZMrTjrN18Ri35KrX67wZ0eF
	 E5AXh67jnTGupCb8OPbc/4BVPH2wsg2Ngco4/t0lwBLaXqQ19DnoMWMN7X1yQuF7iD
	 g88ExNwatibcA==
Date: Tue, 5 Sep 2023 13:10:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: wangweidong.a@awinic.com, alsa-devel@alsa-project.org,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org, perex@perex.cz,
	tiwai@suse.com, yijiangtao@awinic.com
Subject: Re: [PATCH 3/3] ASoC: aw88395: drop undocumented and unused
 sound-channel property
Message-ID: <df03160a-38e7-4af9-ae72-605c120ce4a0@sirena.org.uk>
References: <3ff94d4b-7585-d7ed-9736-ba4c02b3fcff@linaro.org>
 <20230905071356.18301-1-wangweidong.a@awinic.com>
 <537821c6-df3f-6946-b7dc-07ba9db9d416@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZMs55giJ2FMIAcuZ"
Content-Disposition: inline
In-Reply-To: <537821c6-df3f-6946-b7dc-07ba9db9d416@linaro.org>
X-Cookie: I can't drive 55.
Message-ID-Hash: H4Z7JU7KHNMTRBHCSWWTNA4SZTTLPOLK
X-Message-ID-Hash: H4Z7JU7KHNMTRBHCSWWTNA4SZTTLPOLK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4Z7JU7KHNMTRBHCSWWTNA4SZTTLPOLK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ZMs55giJ2FMIAcuZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 09:28:08AM +0200, Krzysztof Kozlowski wrote:
> On 05/09/2023 09:13, wangweidong.a@awinic.com wrote:

> > Could you please tell me what known kernel interfaces=20
> > can be used to parse files?=20

> With exception of Audio topology and FDT, I do not think we parse
> user-provided files in Linux kernel.

It's fairly standard to parse firmware files, usually there's multiple
blocks that need to be downloaded to different locations perhaps with
some dynamic linking involved.  We do also parse the userspace binaries
we run, though that's a rather different situation.

--ZMs55giJ2FMIAcuZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmT3GtAACgkQJNaLcl1U
h9DIsAf7BU+K39jcV6Rv3hG/mLK/M+W/HNSnQ7tqN35N8IaXkPbukfRyPu/8FdwZ
iTMNIRn17gs588wV+4zhZ0k4Lbb46SSt6aHoMf0jzka2apWmFswNSy+zvlJP1p/t
q/MVcbHOswsIYn+MY4M4JSC0mELeBne3wjCU4uciWEnYMwo2tFMJUmUYf9kT1JsA
F+H7AyzrpKrzEAga6kg7Ce5cJDNddvm3ayutfMLx8jk3VMLacx2bd18DqSrlElAQ
NHfKQLg05GDjUm4XZbommDIa4LmbcxW0r2T1Ge69+WYKPMRjdSCceSHXmOWTBSrB
EmiG/5FVHjVN0roLKHKpCG8h0fMJcQ==
=zWBM
-----END PGP SIGNATURE-----

--ZMs55giJ2FMIAcuZ--
