Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB36E74607E
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 18:12:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA7F01DA;
	Mon,  3 Jul 2023 18:11:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA7F01DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688400722;
	bh=NTKxovdssrlXXhzLx/k5aJgT3fdHDCTb40XqEzX76FI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rGsuyyIEv/riZQihogBjIBiP7NCWvDbUhwS+UBuNrAPNaR4owGegD9I61GUzXxYUB
	 6zQ5UzBZE/Uum74SJMygbCPjGsBD0ZpwCY4t90QzYg+9b91vFhplKC9wIOds0ILFF8
	 mYxd4gxz6WZ/GPe47R0PFAo2z7Z0PldtYguaDJeI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45592F8053B; Mon,  3 Jul 2023 18:11:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3C17F80124;
	Mon,  3 Jul 2023 18:11:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2BD7F80125; Mon,  3 Jul 2023 18:11:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 33871F80100;
	Mon,  3 Jul 2023 18:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33871F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ElII1a0x
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F038660F9C;
	Mon,  3 Jul 2023 16:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14391C433C8;
	Mon,  3 Jul 2023 16:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688400658;
	bh=NTKxovdssrlXXhzLx/k5aJgT3fdHDCTb40XqEzX76FI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ElII1a0xgUuzSKc3rFZIRqZ9qtKIM1hbKWzeh/lqV5rirpcSnKhxbsj1lWZ1R2BVp
	 18wJ9DD+HdgDGu5wWt/JDZ5CAb6uAOoOtNJ9OREWkzy3YYEBPxekdTWlJWs73n/CMy
	 cXNM9CHD2e/1fQ0d3uDsWZAL4a2OV/otENYqwGDUykLqaiNpxBVrKJjrtHXWok47Ld
	 m8GP/ScElTQo3wGwF0VbpgLJs8trmVv1GoiyjaAoloRFDKpOPHEcKe2zYNBRB/5qQP
	 u++IvqXPHA2TapuB89hyo+MkNJvrUWtOmxXdehd/y6FBAYwZ4zZJZb75Ks5KySlKMU
	 3FGbXQlBq26Kw==
Date: Mon, 3 Jul 2023 17:10:50 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: Mastan Katragadda <Mastan.Katragadda@amd.com>,
	alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, Arungopal.kondaveeti@amd.com,
	vsujithkumar.reddy@amd.com, venkataprasad.potturu@amd.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	"moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH 1/2] ASoC: SOF: amd: add revision check for
 sending sha dma completion command
Message-ID: <2adeaea7-e3ef-4a58-bdd2-18d3ca3e2519@sirena.org.uk>
References: <20230630070544.2167421-1-Mastan.Katragadda@amd.com>
 <168814485881.50974.4096249135530047142.b4-ty@kernel.org>
 <cafff012-54ac-2d15-1e76-c5313c01f834@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mmrrfenezSd+Xx/b"
Content-Disposition: inline
In-Reply-To: <cafff012-54ac-2d15-1e76-c5313c01f834@amd.com>
X-Cookie: Please go away.
Message-ID-Hash: QWOZI35WX373UPDK66QBODNEO4M7PYBD
X-Message-ID-Hash: QWOZI35WX373UPDK66QBODNEO4M7PYBD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QWOZI35WX373UPDK66QBODNEO4M7PYBD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--mmrrfenezSd+Xx/b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 03, 2023 at 08:58:17PM +0530, Mukunda,Vijendar wrote:
> On 30/06/23 22:37, Mark Brown wrote:

> > Thanks!
> >
> > [1/2] ASoC: SOF: amd: add revision check for sending sha dma completion command
> >       commit: b1db244c716fe300e36428aeb0874913d2e0a91d

> It looks like second patch didn't get merged in this series.
> Do we need to resend the second patch?

I don't know off hand what that second patch was.  If it wasn't a bug
fix it'll just be waiting till after the merge window.

--mmrrfenezSd+Xx/b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSi8wkACgkQJNaLcl1U
h9CBBQf9EfB/7fZZ3ZRVQSgJMCgbwXECOezFRKoklXCfLQW1hpu6rYnVaUP1phq7
OHjYIM+5qDvE2HJ7MPmEnCIZt/OQJFWtomlEJ92rtWeW3Bdk89R1d/d2Qf7Q/NNj
7qqooZZzf0M4IXsZrZqPBy69qRqPWOjyUdSavTGo0K5X1Bs6BPuJZpKxIb6wVG1x
LPr6dgJRd4EBBnewDqm43D+Ti3HbgEnppdcRrE2GPgP13ZNUwbcCATF2durfziWe
yRU/1ca6Ky54EGACuyU1CxNbCX74TLkCov+/d+uleHLU8ZAFWaiV1QaHrUOREZ7L
aCc8JKvvVJj4lR+YkM2V7nXJ1GfWNA==
=3JT8
-----END PGP SIGNATURE-----

--mmrrfenezSd+Xx/b--
