Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 139BC905CA8
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 22:19:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7238FE67;
	Wed, 12 Jun 2024 22:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7238FE67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718223556;
	bh=njGhKPnNqXDaLAWemur/lSMydRb9BaPJzA7YroBJXy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DdTpXky2u+N17ScSCsw92B50Fy4eRmAAHIrttLIrGyHZPyHSuFpo/lg3jN8LmPfMY
	 FCxFRCBGQgxUcIvaAFC3Te9FmN6/Gn7S7qcuKnrI17c7MIqKB1GJXCMQH9iZ/KKiAd
	 z4sd4Wd+nv9xjUcjbR/B2BXGVQgVcDhfE/ig0hC4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB07DF80578; Wed, 12 Jun 2024 22:18:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DD96F805AC;
	Wed, 12 Jun 2024 22:18:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B32F7F8057A; Wed, 12 Jun 2024 22:18:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31E41F80496
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 22:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31E41F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iV+zO8I/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 64CB3608D4;
	Wed, 12 Jun 2024 20:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2478C116B1;
	Wed, 12 Jun 2024 20:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718223513;
	bh=njGhKPnNqXDaLAWemur/lSMydRb9BaPJzA7YroBJXy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iV+zO8I/CZs5wVgnGn3iLOpGco8Aw44kDAKoN8T8ukmZ+WjHSHIR2Iimg8WXrxe6v
	 GR/8Aytc0zwIbIfe4fxBz1lqBShMyACZbrcOGkLPqwVJwO14IbQBK8ucBiJDjU2rDZ
	 qu7a6P9Hbfzh0fNxgM7K7uVBSPYTXqV9LGvQkW2Nn4G1jKEAWyARIupKdrUD13k6SZ
	 7PXkHf0cB14H/DBklsZFDV367YpLBg+mxCidFtEVmopFamOeGGQNDPAEl/X1QHILi6
	 I2JB3ev4uy/z39IubhRxgPs5uad69IDt8nZR8xkVx9dEdrIHktuNdpfcaHK9OhOwJv
	 ovMzTgm4UjlUw==
Date: Wed, 12 Jun 2024 21:18:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Banajit Goswami <bgoswami@quicinc.com>, neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 1/3] ASoC: codecs: lpass-macro: add helpers to get
 codec version
Message-ID: <ZmoCl16mACdJU5Qt@finisterre.sirena.org.uk>
References: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
 <20240612-lpass-codec-v25-v1-1-9f40611a1370@linaro.org>
 <jowqhnspiai4ydp7m7mn3p654kufg4ufbm2iexjg5dqbcxqatu@jfex2rnes5vu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xapvb1KMCPCdZk/7"
Content-Disposition: inline
In-Reply-To: <jowqhnspiai4ydp7m7mn3p654kufg4ufbm2iexjg5dqbcxqatu@jfex2rnes5vu>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: YYDQO2DGSSYBZIQFMJ2JKXWBANGK6FC4
X-Message-ID-Hash: YYDQO2DGSSYBZIQFMJ2JKXWBANGK6FC4
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YYDQO2DGSSYBZIQFMJ2JKXWBANGK6FC4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Xapvb1KMCPCdZk/7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2024 at 09:15:21PM +0300, Dmitry Baryshkov wrote:
> On Wed, Jun 12, 2024 at 05:57:21PM +0100, Srinivas Kandagatla wrote:
> > LPASS Digital codec have changes in register layout across multiple
> > versions. Add a proper way read the codec version allowint all the lpass
> > macro drivers (tx, rx, wsa, va) to configure the registers correctly.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--Xapvb1KMCPCdZk/7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZqApQACgkQJNaLcl1U
h9CpnAf/Sl3IB3d6N7vAnrXggB6qM/9ur6uBFSna4TVicmPaBDqdKWmW70JbgFiQ
UXqpmmTwqtSi5kYlBBJlCzvWO2hftIyp2uLokrWDU34hjb7QuKnBGRTK7ULPabd1
ZtzQ9NlPXFeV1bWI2UfJz/x1glSSUzEeQOodpH0JdBKkUf7GFNgfCGEiXJ32qm55
FNRQkSrg4ZjVZIx0uvkuERG+kOVobl5qxZTrL+7qnR+KBf45avv4x4ygdLtTtt/C
q84Ij7bm+7qtzH+c9YSIIhE3B48iV2caBc7sGLh8va671JUsRdVNaL8x/VglZvEr
QZ7FtzG4tzNzIe93tzJBOvk+RffeMA==
=d1jY
-----END PGP SIGNATURE-----

--Xapvb1KMCPCdZk/7--
