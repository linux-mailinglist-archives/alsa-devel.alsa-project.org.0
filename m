Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFC169994D
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 16:54:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6B66EF2;
	Thu, 16 Feb 2023 16:54:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6B66EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676562893;
	bh=rkgXmY8cpjf1Pt6HA8tOxJIVcubT27btnREyMggBO28=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gCfcIPRjoRHxXBIUCE/RQvAz6ceyRZ/TqT+kNmaQX3zr5mbRhO/b+wXVtjFRG3Gcw
	 FzJ0oyV+bCavcAiXyW1Wq8P1jLbDq/ZBKD8cngKkTFABDuoIAzq+w4eimsnx1b9IEq
	 n3MUn/hr32d3qT7YNWc6OxdACtNzLbasWz2Qg9sc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32840F800E4;
	Thu, 16 Feb 2023 16:54:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E487F80171; Thu, 16 Feb 2023 16:53:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 881EDF80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 16:53:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 881EDF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p13iDQxZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AD52DB828BE;
	Thu, 16 Feb 2023 15:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0651CC433D2;
	Thu, 16 Feb 2023 15:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676562832;
	bh=rkgXmY8cpjf1Pt6HA8tOxJIVcubT27btnREyMggBO28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p13iDQxZq7ocDDHgG1uMgKnf6kJNXPKcg8vgkyOtrI0WtYVf/L19htGpLZDWPrAo3
	 HrKEp7ELWJ/xGx/c/9QxSlG8kzmcL/iX4ZhrsBsjTHVwVID/jJmcH09Vm9y5/qNq1p
	 qj/Aa8c/+WRu6YdWjvxg6EvLXOQfkKXYw3mD3KGaAvi9csEcq4W8Fib5I8zT93J8L5
	 Q1u7lfNY5ok0xH1kR4/KWfv00V0kZYLYvFf9ezoHruZkxq8c+yTPYeLEcEl5j2Uf+k
	 UZLknx4lJ4ufcqKz0PCzxp58yN+EndIu+YCFGkxaM10ZTRzjans4s3SckCd2NhHDDh
	 xNzIzkSbx28Rg==
Date: Thu, 16 Feb 2023 15:53:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-dai: fix possible stream_tag leak
Message-ID: <Y+5RjX3cB9gwnvVs@sirena.org.uk>
References: <20230216144054.26203-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0tthjwA5hvwt6DIA"
Content-Disposition: inline
In-Reply-To: <20230216144054.26203-1-peter.ujfalusi@linux.intel.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: VYFIYSEESOQEFYGEBPUT4EGKVHA2N45J
X-Message-ID-Hash: VYFIYSEESOQEFYGEBPUT4EGKVHA2N45J
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VYFIYSEESOQEFYGEBPUT4EGKVHA2N45J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--0tthjwA5hvwt6DIA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 16, 2023 at 04:40:54PM +0200, Peter Ujfalusi wrote:

> is there still time to send this for v6.2?
> If not, then I will re-send it with stable 6.2 tag.

In general it's best to just include the relevant Fixes: if
you're concerned about this...  it's rather late and Takashi was
looking for early pull requests, I can apply and send but now I
have to wait for you to tell me the commit it's fixing in case it
doesn't get pulled in in time which just slows things down :/

--0tthjwA5hvwt6DIA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPuUYwACgkQJNaLcl1U
h9DpOgf/XVp3rEOWdJn5W5AuxJ3CqyUKXoRABzZBDIv2ZzAZBUlVsDmr6Xz6m+qr
OyCvj3AcGT9a0jz1X0sNQfisK4NY7n77Gi27rcfvQMfEu61GBut8Pb/6nhaLxj10
DB+HZDi9SFVezaRpZ9Gpx/9Gw1veeavLJ6cX7OcB0aNsxxIuG0wZ/R4aVyCMFwSS
famTcBZRnDFLtAwCBZk//yoIUZB47e8LmunxeJgwzNuZ7p0x2aJ1ZOA7EoTwYRQ8
HLZjtTYow1k+zvapODoK03eOIWyHhFEB7rHKv5e9QzsGOfc5VscRK/lls2ndb5J8
iJpjJpneO98HxU8g2iwEJI49HOa54Q==
=eKuW
-----END PGP SIGNATURE-----

--0tthjwA5hvwt6DIA--
