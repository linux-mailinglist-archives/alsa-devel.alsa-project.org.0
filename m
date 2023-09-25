Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B56BD7AD7CC
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 14:15:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDC07DF2;
	Mon, 25 Sep 2023 14:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDC07DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695644109;
	bh=0JWnCEm04PbR87EnxLoqtHGUIwROp0UMZHSJVwhrJr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AeepkKZlhwEAbypCyaCblonzPhlz3s6+k6iK8krJ5uJob7tKO56HKs/rnGFCqTmUJ
	 FIKtEqj5zzI1FiOBYve+YEgNQGsWS/qHSdHIa2UdX106baZa5R3piaMJhMSEAqmYyQ
	 KdlqvWn3UaeiF99nB+zXvuoEHn6lfVdS97AOjud0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D9DCF8055C; Mon, 25 Sep 2023 14:14:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B5A4F80166;
	Mon, 25 Sep 2023 14:14:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16E5BF80290; Mon, 25 Sep 2023 14:14:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6266F8001D
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 14:14:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6266F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AClfDnxu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B755561014;
	Mon, 25 Sep 2023 12:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA703C433C7;
	Mon, 25 Sep 2023 12:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695644051;
	bh=0JWnCEm04PbR87EnxLoqtHGUIwROp0UMZHSJVwhrJr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AClfDnxumfclvqNpfOBHgF6AthVL79JVCosFCS9H1GubeELXgXsIJPrjXaoqzkmqF
	 vWPquC4qES+724M1/u/svP8R8x27tM7el3z7mXMRDOT8n/fxV7/ryvurfCz3hUlk9a
	 TrFfZhjcTy7TXalmoOevgEHlhv8YhQEt3S1DUJYH0lmbgDj5AsP/sissxz9WXAjytC
	 FSbk9Q3JFPGbdwpKiDmyIh6oDsIeJNddP90y8zGZYV0JFhVI7n4IUCs+jRptJnpuAg
	 VEwji+en+3m6JDw/EsdR7ABysvTps1YLU7a+Zj7Ei9dRKeuvmdo6O8yXxCfT6ljdXU
	 SPrmpvWz/FFPw==
Date: Mon, 25 Sep 2023 13:14:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Curtis Malainey <cujomalainey@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>, Yong Zhi <yong.zhi@intel.com>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: Re: [PATCH 35/54] ASoC: intel: convert not to use asoc_xxx()
Message-ID: <ZRF5jD0SxQVbRM69@finisterre.sirena.org.uk>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
 <8734zkqng5.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cxqhT+dfHw8v3x2u"
Content-Disposition: inline
In-Reply-To: <8734zkqng5.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Cole's Law:
Message-ID-Hash: NITQODPPKKF6LYBSP4SESGLA5H3X3QF3
X-Message-ID-Hash: NITQODPPKKF6LYBSP4SESGLA5H3X3QF3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NITQODPPKKF6LYBSP4SESGLA5H3X3QF3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--cxqhT+dfHw8v3x2u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 11, 2023 at 11:50:35PM +0000, Kuninori Morimoto wrote:
> ASoC is now unified asoc_xxx() into snd_soc_xxx().
> This patch convert asoc_xxx() to snd_soc_xxx().

This doesn't apply against current code, please check and resend.

--cxqhT+dfHw8v3x2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUReYsACgkQJNaLcl1U
h9A+2Qf+Izcmg73ZdoCsoPfcmmOYRV0eNg7iidJzdb1jb+ow+yBuM10Dm+flzIxA
9yj+gubQwswdxQ8HZh0l7Q4mBzTq+gfQmIE+owmxx9pOok/l3smhoDJBKtQKayGb
MIThKSpVNmI3j8LUaPcQSWs3kS35Kl0A2Q/rbSDCHYH5Wy/K1KozZTsNkt9MuWJg
KB0nBzIKkdpWImigr7uLTUnXXK3nWy68q6vYtbcT3XCJX7VZrH43cgT183TH52OR
i9pF8xPUap3a+qMy9imG30A6PcXhj9ibja9a3s7Tq9/SGtpH1YWmAzn1vxa2tCoY
P0G3KqlaEmGdu8ydKowARm8wCesyjA==
=wndc
-----END PGP SIGNATURE-----

--cxqhT+dfHw8v3x2u--
