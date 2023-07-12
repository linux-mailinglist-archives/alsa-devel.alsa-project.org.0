Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ED3750579
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:05:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A87641F1;
	Wed, 12 Jul 2023 13:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A87641F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689159922;
	bh=oDWMj4wCG9sfPHK9CyPPfDOXkRNls71sIrOffbIjbP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p4Ij3+6lrYWGu2BhAsR2C30EmjYCgWpRfTuUjRV2Ofvo0HRuaRZxjxDf/amRKeanj
	 tmM1kXAUJd00AjMyOxEOjMH1QBEOFkyL0cUzP/NbKhcwTr+FSdSm0VKrvs0CUpY2P3
	 siSZ52vh8i2esLAuN4Ydwn192mee6Ls7W2+bGRW4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 721BAF80290; Wed, 12 Jul 2023 13:04:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 135D0F80236;
	Wed, 12 Jul 2023 13:04:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E16AF80249; Wed, 12 Jul 2023 13:04:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7161F80093;
	Wed, 12 Jul 2023 13:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7161F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iSPpQNkg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A176161759;
	Wed, 12 Jul 2023 11:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5ACC433C9;
	Wed, 12 Jul 2023 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689159860;
	bh=oDWMj4wCG9sfPHK9CyPPfDOXkRNls71sIrOffbIjbP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSPpQNkgmjyHqhJSiEEnc5123jsUgmF7aW73gteBQHaSidd6BZSG4rC/wmz/ahtWF
	 +pxEAsfaqJR66xH/q2VxWgQHqTjrfN4hvB3lxBF+AVL88SIWYaUGWwekrRO2vJWrdn
	 dZNaL/XMPtS5SjcbXpUofDWsMV65VP76cxcFa3B/fvpJUopfL9t5pRz7hUQX65lxZX
	 TYqyDse4z5WkB9pTYMP3m6kJfFq72FYP6XMofI3I2T+FVrnIBPnmILXm68MEkPiFL2
	 gPP7YJZyxAC2xpdVPCeDU8v93wM31x93Su84fNE7nXJygK/3Cf/UL17l531+DplxAD
	 r4wCLsMz+8rzA==
Date: Wed, 12 Jul 2023 12:04:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Mastan Katragadda <mastan.katragadda@amd.com>
Cc: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
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
Message-ID: <26d859b2-f094-4dfa-9352-b71427755d5f@sirena.org.uk>
References: <20230630070544.2167421-1-Mastan.Katragadda@amd.com>
 <168814485881.50974.4096249135530047142.b4-ty@kernel.org>
 <cafff012-54ac-2d15-1e76-c5313c01f834@amd.com>
 <2adeaea7-e3ef-4a58-bdd2-18d3ca3e2519@sirena.org.uk>
 <ab3c2e81-b7f5-9527-7e32-d332259cdc87@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iZ85PHxjhEaqtozT"
Content-Disposition: inline
In-Reply-To: <ab3c2e81-b7f5-9527-7e32-d332259cdc87@amd.com>
X-Cookie: Dammit Jim, I'm an actor, not a doctor.
Message-ID-Hash: DL3PT4C4ZTXSZ6R4P63RF3ONPJ4SHKLK
X-Message-ID-Hash: DL3PT4C4ZTXSZ6R4P63RF3ONPJ4SHKLK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DL3PT4C4ZTXSZ6R4P63RF3ONPJ4SHKLK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--iZ85PHxjhEaqtozT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 09:03:30AM +0530, Mastan Katragadda wrote:
> On 03/07/23 21:40, Mark Brown wrote:

> > I don't know off hand what that second patch was.  If it wasn't a bug
> > fix it'll just be waiting till after the merge window.

> =A0Do I need to resend the second patch?

I still don't know what the patch was - if it's not applied probably.

--iZ85PHxjhEaqtozT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSuiKwACgkQJNaLcl1U
h9Bs6wf/XN81h7SzERM55+5Cx7DqpGEatKi/57OSQCLwokUkwIs6auIzbtns//rb
cZclqQONifzq2uZXlljyIWIi1Xc7yVt4oZT/FFWbIpwT6aJV4UQIXagfjVgV/AEs
O64hUD/oTdUMK3fWtasmmifHn6ugt1z+ljgSd8vrKWdQKAvveH8NTqR1eyY2NqKY
bFkSXCeqomRjLq+Mq902ZC6MRKP9Yd3HY7ToGYmFwUis5/nTSPecoN4doM7QPIJ+
82Ty9dyXQxhd+WYx1HQ0C0wd6XGkIWaWCfwpyDC07s38jjZikMV1hkBAGS0Vi4TJ
1kvuD8f6P0i8N1hEJL55JrrxYMpAgA==
=EzFr
-----END PGP SIGNATURE-----

--iZ85PHxjhEaqtozT--
