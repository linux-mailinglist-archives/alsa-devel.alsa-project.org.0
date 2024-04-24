Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E55358B1795
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 01:59:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D633493A;
	Thu, 25 Apr 2024 01:59:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D633493A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714003160;
	bh=uFoOF3YO8h0JW7XAW9L2NM3cLaVUAP7oPCFtKLfQxGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fcm1GVcmQ3mxemez9j9NmlG+Vx7YSqOFHz7lFeqfEQ8qMIZrcTJ7+ydLvEjRD3YiJ
	 NKasSlMpxjtkUuSvyejd0f/+hj71u4UEem814JIPu8O3jqoOjOvu4mcIv28CUud6GL
	 9iM4GONZev2xMg634+zm9SFafFD+w8oVT+SSUqbI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D8D7F802E8; Thu, 25 Apr 2024 01:58:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7C48F805A8;
	Thu, 25 Apr 2024 01:58:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88DD9F80423; Thu, 25 Apr 2024 01:58:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6882F801C0
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 01:58:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6882F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pVprsYQH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 48EE361C83;
	Wed, 24 Apr 2024 23:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41E7C113CE;
	Wed, 24 Apr 2024 23:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714003109;
	bh=uFoOF3YO8h0JW7XAW9L2NM3cLaVUAP7oPCFtKLfQxGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pVprsYQHFTj+331xRzeFm97HGexC5nhy7KOsH59tElvZ7w2hox2Oiy1NJjdHLiA2l
	 9h1jFUHoyyqDW9eK+T2PD5dTotq2OYILLtSCgwgiUMj5vrnhwsGSKYGPjqldx6BE3V
	 a+DlmBOEC4n/eVpruu6nfGPuCNLIZ7ILOl65X1qtey5Fwd+oReiwSx0im71jhzREMB
	 EWdnBDb0bdLw2BZFN3xdNrZqEftLIY+Z73sPlrHTnfeATVex1LUdLsqexxBGCnFZz1
	 LnaHO9FqrqpY+/hM/flRo9XqTtxESrep1ulyohYqaCUbSaudvrjCfBGYVB5MhtDffz
	 OeGmrcKMv+fag==
Date: Thu, 25 Apr 2024 08:58:26 +0900
From: Mark Brown <broonie@kernel.org>
To: Tony Luck <tony.luck@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v4 68/71] ASoC: Intel: avs: es8336: Switch to new Intel
 CPU model defines
Message-ID: <Zimcol_3kmP2Bv_J@finisterre.sirena.org.uk>
References: <20240424181245.41141-1-tony.luck@intel.com>
 <20240424181550.42466-1-tony.luck@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SfLdYZdy2UNAMhyr"
Content-Disposition: inline
In-Reply-To: <20240424181550.42466-1-tony.luck@intel.com>
X-Cookie: TANSTAAFL
Message-ID-Hash: 7GDIKRWSHEHKHQ4VLVF2JNZJZJLDJURF
X-Message-ID-Hash: 7GDIKRWSHEHKHQ4VLVF2JNZJZJLDJURF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7GDIKRWSHEHKHQ4VLVF2JNZJZJLDJURF/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--SfLdYZdy2UNAMhyr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 24, 2024 at 11:15:50AM -0700, Tony Luck wrote:
> New CPU #defines encode vendor and family as well as model.

This appears to be part of a series but I've no cover letter or anything
else from it.  What's the story for dependencies and merging?

--SfLdYZdy2UNAMhyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYpnJsACgkQJNaLcl1U
h9C7eggAgh8i99/Fug4G8/wwyWh/fpTIgUvtZhqqNOWn7IgjB6F7MiSo4BGGdeVC
06VmWSymyyUFWVj+YS54cACrfx4+fmByrIoQrJqIML2e0c3cmRPtQ2/3XBxs2Qe1
CfcqNC3qrT3HfI+22xe/UBBZWRRSN0XXLHYuet1eUc5GDBOgTYKBetGsF6T+jvwX
rhq4V7vnFmF1ZcYlBNTPaxWM7AHfB93Zk/1SCKFBMqpw8woBvsKpd8j5Isbw1wvF
A8RkgMgiTUVKGZtFkrQvFYOfZ2JFaJ/Mg+W7PPcP4h/4tHo70VxHAeDoBMjy+GS4
yyo+/XPsXJ9I9mSv5/Gt+JOc5JyRPQ==
=rzp7
-----END PGP SIGNATURE-----

--SfLdYZdy2UNAMhyr--
