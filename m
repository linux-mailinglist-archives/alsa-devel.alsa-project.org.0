Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 826C970E55E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 21:29:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCE4D1EC;
	Tue, 23 May 2023 21:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCE4D1EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684870182;
	bh=9570lVFvsab3sHmAwYsy5Py+ie11vRvjp4TrSWAcHOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E102xC3du24SRQN8zolb8usI40Hd0aEf9N8lYhON5CKXnovmFTQCauq+60BoOAd+1
	 VnpLtnUlbbugoRf5GqFYE5CHHBu+AdRDj08xI7wyy8mwKvzvXVV8ZPs5QwPYEyVrnF
	 TExl24ZWNTp/1QBCba4TTkWqynA0LcXflRH1J/9Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DABACF80548; Tue, 23 May 2023 21:28:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C434F80249;
	Tue, 23 May 2023 21:28:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6048F8024E; Tue, 23 May 2023 21:28:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8EDCF8016A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 21:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8EDCF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hn/XpaiW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 305D761272;
	Tue, 23 May 2023 19:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA5EC433EF;
	Tue, 23 May 2023 19:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684870111;
	bh=9570lVFvsab3sHmAwYsy5Py+ie11vRvjp4TrSWAcHOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hn/XpaiWgJB1341Kul8AmNnuMLemxuYYiLj/dkCLRlKo4sWLCmiHtkgZllmoN6NRW
	 8WOZJTmLK7Pzb1kx8f6PIU0cYU+8SQRZqM6c6iW1764eiV37/CQjfW3Xobo3VOxCN7
	 npk0amvCb3CLIvNrfQCEm2feRSjz58RZS1KrLoW/vcDl36+mZe2e8XORsWPytpux9M
	 bNZnhL2VAsue7Cw2VunzBNYMqNg/nVe49dyyibqnlpaiJ8Z1sxs0U84wdMX1WKf9yY
	 18wkF2RRRwjquBXxYoChA/dpv1fCKOINm84zbnuiFg7k941ub838KqyZ1M0OiHdFjc
	 nBPs1KLjAiTYg==
Date: Tue, 23 May 2023 20:28:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rt5682: Use a maple tree based register cache
Message-ID: <73925372-33dc-46ac-9d01-a43f10988d28@sirena.org.uk>
References: <20230419-asoc-rt5682-maple-v1-1-ed40369c9099@kernel.org>
 <1ce6bb84-3140-3953-e995-00eb7b16f386@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7GEEcFt0ec12B4U5"
Content-Disposition: inline
In-Reply-To: <1ce6bb84-3140-3953-e995-00eb7b16f386@linux.intel.com>
X-Cookie: Beware of low-flying butterflies.
Message-ID-Hash: RYRZAPHKVPQ25F5U4O4JEBFF2G4PMIIP
X-Message-ID-Hash: RYRZAPHKVPQ25F5U4O4JEBFF2G4PMIIP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYRZAPHKVPQ25F5U4O4JEBFF2G4PMIIP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7GEEcFt0ec12B4U5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 23, 2023 at 02:24:53PM -0500, Pierre-Louis Bossart wrote:

> Wondering if this is the root cause of the regression we're seeing in
> [1] on a Chromebook with rt5682 in SoundWire mode?

> I don't see any other changes to this codec driver and the first problem
> detected seemed to happen when we did an upstream merge last week.
> Unfortunately the last merge was on April 24 (sof-dev-rebase-20230424)
> which is just the day before this commit was added...

Try a revert?

--7GEEcFt0ec12B4U5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRtE9kACgkQJNaLcl1U
h9DMXQf+MOlb6P/vm6s61dsrFcCJjZL3nsqRyomvvwZvv0Cuybf06OdSw56IDX35
HIC0p5lcmUqZvPocsp47VhHsdKmjgXcOZlTmJ4Cgv547WTDYJ7J/mBW0UEmuw60K
PSxDlc+baG3nwwRBMID2kPvR3tMbZfg2uWuMdibKONgxXZCq8oXLAlcnU3SSNK0h
nzb1BaI37CrmXI86piOPbfKs38K86LjXwHiP8PICite6lqgDnD1dAL0H0Ua6LOnR
+Wv0114uO7OQkfI3qsGKfjLKK/Vg3I0s4PAc59u0jjQrIz515oOY6ASwasmxZcOZ
y9G71AGSmWmxJyM4rxQywNsl75Rr4A==
=29Ur
-----END PGP SIGNATURE-----

--7GEEcFt0ec12B4U5--
