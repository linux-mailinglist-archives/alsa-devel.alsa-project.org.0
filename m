Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A9679D981
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 21:24:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35C9AA4D;
	Tue, 12 Sep 2023 21:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35C9AA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694546691;
	bh=L5LXCOa8/2p57HUzV4WLPFe2Xu5lNiNBgeYv6A6lup4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OzRDhKVjyCwtK/HPbp8qltXHIZWbjcup79P0+jnRZOUPUkX1F3F/NQAhmg81aBJE6
	 tuS1IBnp4gaRrSFdYNTglMb6IVrz4s4erGWELJK1moVE8vAniCw8cuVG3xAlv6z+5B
	 tmWOC2akBfWqGSTcZbfyaopgJ4Z/wGE9wlkiiIqc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C52BF80246; Tue, 12 Sep 2023 21:23:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD4CDF80246;
	Tue, 12 Sep 2023 21:23:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD359F80425; Tue, 12 Sep 2023 21:23:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2750FF80212
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 21:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2750FF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=iGMNuICe
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 16E3566072FA;
	Tue, 12 Sep 2023 20:23:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694546619;
	bh=L5LXCOa8/2p57HUzV4WLPFe2Xu5lNiNBgeYv6A6lup4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iGMNuICeZavLkjCjzs0HR+aITpCAoLOzcgQo2B7IjI/edLsI4fMJ/cJmE5kh5ztrv
	 759iOSvTYFhUZNT2o+Z2o9+ckESdkjk4VJ6aE/oQNX2y4mVJ6aYH0fEhRkRiwo4e5V
	 dQnJk6R42GtChT5a08UERktaP4mGRy7HkJlN2gcbFJPPxJP1p9NxgmYjCPYbRCOw7G
	 TF6FU0QlfRafRa7CKhJ/Y7KNh4lHgUyd+IVJMuRD5edD57JftZqR2vsjDFGYYtzIta
	 Fib19nE1fo5qmo99YuvD4SpUTIQ8uPcjik5UnooUaQVMNkvpLzeT9LYaJimDQrdWta
	 82TDu0ONiYN2Q==
Date: Tue, 12 Sep 2023 15:23:34 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, kernel@collabora.com,
	Jaroslav Kysela <perex@perex.cz>, Shuah Khan <shuah@kernel.org>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] kselftest/alsa: Mark test plan as skipped when no cards
 are available
Message-ID: <a12b1144-bea0-4bd7-a429-da800dc8f568@notapiano>
References: <20230908181242.95714-1-nfraprado@collabora.com>
 <0fa0901e-d271-438d-bc2b-11399ad3b07c@sirena.org.uk>
 <868a8f08-ba39-4550-8e7b-0572ea03c4e7@notapiano>
 <ZP8kLM5ln2YBCHap@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZP8kLM5ln2YBCHap@finisterre.sirena.org.uk>
Message-ID-Hash: BOU6K2RGUQZBRBCWZVZPPFXWDV2I6BPR
X-Message-ID-Hash: BOU6K2RGUQZBRBCWZVZPPFXWDV2I6BPR
X-MailFrom: nfraprado@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOU6K2RGUQZBRBCWZVZPPFXWDV2I6BPR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 11, 2023 at 03:29:00PM +0100, Mark Brown wrote:
> On Mon, Sep 11, 2023 at 08:35:37AM -0400, Nícolas F. R. A. Prado wrote:
> > On Sat, Sep 09, 2023 at 12:08:22AM +0100, Mark Brown wrote:
> 
> > > Why?
> 
> > To better reflect the actual test plan status. If 0 tests were run, it doesn't
> > really make sense to say that the test plan passed, rather it was skipped since
> > nothing was run. So with this change, if there's a regression that prevents the
> > soundcard driver from even probing, the result won't be "pass", but "skip", and
> > the reason 'No soundcard available' will be in the logs.
> 
> So, I would interpret the overall result for the suite as being "No
> errors were found in any of the cards discovered" if there is no
> configuration file specified which enumerates the set of cards that are
> expected (if there is a config file that's a different matter, we know
> what we're expecting).  I'm not sure that the different behaviour for 0
> cards is super useful.

Right... So what we want to be doing is adding a config file for every platform
defining the card(s) and PCMs expected, so that when they're missing a test
failure will be triggered which is even more helpful. Although I've noticed that
only missing PCMs are detected currently, but I imagine it should be possible to
to extend the code to detect missing cards as well.

I take it the intention is to expand the conf.d directory with configs for all
platforms currently being tested then? There's only one example file there so I
wasn't sure.

Thanks,
Nícolas
