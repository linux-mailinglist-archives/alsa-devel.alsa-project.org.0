Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D20870F3EA
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 12:15:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAB79208;
	Wed, 24 May 2023 12:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAB79208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684923347;
	bh=fAJ/9c94p8jokuPvjpX6AG9SWXwN966uEum3K7/L5Io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aR2NXh6qMck5D4pVR3jhSLrywDYZIcT9MsMFvnbb2p3rPgQSPmuAwdjewXJgCHrV0
	 +3rlE6nOFU1JFvA8NqIkwkFUEV6Din6Bvzex/St58ZGOBIMy5/nu41CxIKYNtRSBVh
	 2Nj0HCFeKSveD2Q2yJT5Q+0/l4n3teVUSYKCCZsc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78B42F8016A; Wed, 24 May 2023 12:14:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C7AF80249;
	Wed, 24 May 2023 12:14:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D79C1F8024E; Wed, 24 May 2023 12:14:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DB42F80053
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 12:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DB42F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ldjdLCGh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 99CEF60F33;
	Wed, 24 May 2023 10:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E532C433EF;
	Wed, 24 May 2023 10:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684923289;
	bh=fAJ/9c94p8jokuPvjpX6AG9SWXwN966uEum3K7/L5Io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ldjdLCGh1uJ2M+preJPllwAzA6UDUxpQe8I8E1hlH4nW6nl9d4QGUIeCmTMqQIgiM
	 CLmDOqEenSAc4r4QZK1oGI0HV7Ct0tml1f3T7LT7B0Kj4QZdgWDPBOi85bRQVze75f
	 2CpNRWl/8prOXlR2o0f7Avs8Hk+tv2146Azgq0wEmhyW/MKfUzfDnFDIXWKZgkJZK8
	 s6y54Y7AHbsRvGjYwI4a9nciGV42iyf9290zNc04bFFbE0PLzsM2TMW0pjmisztVIf
	 eR0MN8ZZizkp3pftej78bPpPX3RLjg3HHVDMXyibFE5BtnJz7WrLuMOmD9hkX9BaO7
	 +oVzzJ68zDkgw==
Date: Wed, 24 May 2023 11:14:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/2] ASoC: codecs: wsa883x: do not set can_multi_write
 flag
Message-ID: <8becb36a-107a-4d92-8279-d4c55edc9076@sirena.org.uk>
References: <20230523154605.4284-1-srinivas.kandagatla@linaro.org>
 <00283665-e44f-457b-b2c9-1acf59d1cbd8@sirena.org.uk>
 <c37b88ae-7f54-3c07-666f-010a5fd84bd1@linaro.org>
 <d94e734c-e816-4b3f-9fb3-a6589063c05a@sirena.org.uk>
 <af7b7d4f-d7ab-b5ef-e639-9a8b13de54ee@linaro.org>
 <c24b2f1c-3b08-492f-954c-c4f10ae5ad81@sirena.org.uk>
 <bdceb6e4-9de8-07ab-502b-c526e97a592d@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U1MramEXXsC4AvQ1"
Content-Disposition: inline
In-Reply-To: <bdceb6e4-9de8-07ab-502b-c526e97a592d@linaro.org>
X-Cookie: You will be divorced within a year.
Message-ID-Hash: VPSVVEFFQNYY7N5A7IKHFMYYQFDF6XQ3
X-Message-ID-Hash: VPSVVEFFQNYY7N5A7IKHFMYYQFDF6XQ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPSVVEFFQNYY7N5A7IKHFMYYQFDF6XQ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--U1MramEXXsC4AvQ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 24, 2023 at 11:09:32AM +0100, Srinivas Kandagatla wrote:
> On 24/05/2023 10:48, Mark Brown wrote:

> > > Is write callback used for both Bulk writes and multi-writes?

> > Only multi-write at this point but we probably should consider redoing
> > bulk writes to use it as well.

> By the looks of the code, its other way around.

No, that's not possible.  A bulk write requires a contiguous block of
registers so can be expressed in terms of a multi-write but a write with
discontiguous registers can't be done as a bulk write.

--U1MramEXXsC4AvQ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRt45MACgkQJNaLcl1U
h9B2eQf8DvRiVD+RF/FcRMx48sGR2udjLtdDRSP3D/qN/Ht8RF0lD3oGS9RB7mM2
SZ+/ZLN3kvqUZTrCu345E3N8cZJIsjFS11WmGi+BrNmJy10sUWkD4BS6vN1a+yG6
lHJIs/Gz1F3+bs/QTJK0F2Otd8qnr3F2CoOqsb437m1xuACiwnJKqqdGmuGF6cAc
9IXDbCS2LVUSOhkO6eKxM8IfSC5KHkY4DfxE73gHUykUSjUq5C30iEjTGvjccfn4
FvuzM6t8klOkTbIKNYRw5SDb9r2ilRbz90I+tUEl+ujWP4aFfCWbk/krV9zYaYmL
EDQ+KE7k21XmjWKkf6bu2tAK66CktA==
=WB4b
-----END PGP SIGNATURE-----

--U1MramEXXsC4AvQ1--
