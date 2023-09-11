Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7517279A7F6
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 14:36:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48804846;
	Mon, 11 Sep 2023 14:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48804846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694435801;
	bh=2yYlnLDcQr0wJy6CrkPZpvlV0KavzexY53zkN7IrZyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qv6gFF55FXKOrHgnLkGUFdEVgZ0GIYI+MB1zNW5b4d7ysfQvya+OOqoDvYRPBrz4w
	 z6s3lLxRKiX891G2VFLRQFvrVijwzn6EtkYbeXYphoc5USfgwoZCr/SwpE9oWprmnW
	 mmSmUec01H1rKhLnU1JEXdFbyW1T+WZP4Y/socho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92228F80425; Mon, 11 Sep 2023 14:35:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36EB5F80246;
	Mon, 11 Sep 2023 14:35:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24EB7F80425; Mon, 11 Sep 2023 14:35:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3757F800AA
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 14:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3757F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=UffwBR4K
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D0DA866072FE;
	Mon, 11 Sep 2023 13:35:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694435743;
	bh=2yYlnLDcQr0wJy6CrkPZpvlV0KavzexY53zkN7IrZyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UffwBR4KOcQEm5v+0L+6qB8gGt/bAVeSbNBmhf1a73zN/RDNGbGcrKnCtHMwSGRiL
	 rTjGEvDl+QywFdr4MH/eG440yLj+DtbxvhC3GcH+0dfXHue/6c+qFHqlH/lfBhdBnJ
	 aOrn5xGIMqycaf/ZpkGgnHsYs+KwDejH7J+Fo82Eu++1sW144013s4HL007wQn898U
	 so5cg/WoraKt2fvXc+oZk4URl0cNZoboD0Ha2VUc5dw59lbT0G8IxJjmw1idzyWnm5
	 p0czQT6hLWTfEIL5sNcEL1k/868b8ZyXV5w1Am6UcLoSpPZA23Xn1MrlQBleo/HP3N
	 RgWQuS1ECqEuQ==
Date: Mon, 11 Sep 2023 08:35:37 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, kernel@collabora.com,
	Jaroslav Kysela <perex@perex.cz>, Shuah Khan <shuah@kernel.org>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] kselftest/alsa: Mark test plan as skipped when no cards
 are available
Message-ID: <868a8f08-ba39-4550-8e7b-0572ea03c4e7@notapiano>
References: <20230908181242.95714-1-nfraprado@collabora.com>
 <0fa0901e-d271-438d-bc2b-11399ad3b07c@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fa0901e-d271-438d-bc2b-11399ad3b07c@sirena.org.uk>
Message-ID-Hash: NDYQH2JWW26ACY6T2MBQPS3TCIU6FCN4
X-Message-ID-Hash: NDYQH2JWW26ACY6T2MBQPS3TCIU6FCN4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NDYQH2JWW26ACY6T2MBQPS3TCIU6FCN4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Sep 09, 2023 at 12:08:22AM +0100, Mark Brown wrote:
> On Fri, Sep 08, 2023 at 02:12:40PM -0400, Nícolas F. R. A. Prado wrote:
> > When no soundcards are available, it won't be possible to run any tests.
> > Currently, when this happens, in both pcm-test and mixer-test, 0
> > tests are reported, and the pass exit code is returned. Instead, call
> > ksft_exit_skip() so that the whole test plan is marked as skipped in the
> > KTAP output and it exits with the skip exit code.
> 
> Why?

To better reflect the actual test plan status. If 0 tests were run, it doesn't
really make sense to say that the test plan passed, rather it was skipped since
nothing was run. So with this change, if there's a regression that prevents the
soundcard driver from even probing, the result won't be "pass", but "skip", and
the reason 'No soundcard available' will be in the logs.

Thanks,
Nícolas
