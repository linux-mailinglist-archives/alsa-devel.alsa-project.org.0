Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF024702CB7
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 14:29:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BABC84A;
	Mon, 15 May 2023 14:28:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BABC84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684153778;
	bh=+MCskmCGmJIvWHAj2wGlAPgVjUersyVw3itl9FDTp5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fqugZ7fnyzpBQ805pgnL1zPOzN4AwJ/Hi/Ql0BrrksGoDOUqMxbMUaouBeoMgihmm
	 vmuBX0aKVpJLyi6ninYIuKhUd5vnK6SLgu5FVCnrLvziAJKZ2CA1QWRFY9Tgs/NwRQ
	 NeUKVVOrpReSfyJXQIkfvHaeG4hAzF5ENvISa4Ww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD3A5F805E9; Mon, 15 May 2023 14:26:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56F31F805E6;
	Mon, 15 May 2023 14:26:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21B58F80272; Mon, 15 May 2023 11:43:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7F8BF8016A
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 11:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7F8BF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=ka60WAbh
Received: from localhost (unknown
 [IPv6:2a0c:5a83:9203:ad00:2382:dff5:d060:ac62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6933966031D7;
	Mon, 15 May 2023 10:43:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684143793;
	bh=+MCskmCGmJIvWHAj2wGlAPgVjUersyVw3itl9FDTp5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ka60WAbh4l1VgDuo+v2GG9+WQHy4LUUFlDeIMv+GY0t0i8NC2P1YMLiHO6akxXi+Y
	 Tx8aNMGzzrcof4O+eCPsPnUyAUwgaBIRHmcsbsrLM5hxhL92g0wkv+e72M3toM8Jv9
	 1ih7eTozqvjiNZUHWWKbt6RvEn87/R1LrtFE/StQuKYlLkydl120lRDXDZXSexyEoM
	 1evc/M2rz7U+NNKMsqbFjhwsUvQelBvDMJhiNy8FaxDBatvaW45ZoCGnfbssq9y6u8
	 WQewBeTvw2wttPsMIpy00MR0MR3txkWpsmM/g2mZqWdtCAWuPQKJ9P1QEbhrwCWdGu
	 ni22R/h32NcuQ==
Date: Mon, 15 May 2023 11:43:10 +0200
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
	Mark Brown <broonie@kernel.org>, kernel@collabora.com,
	Jaroslav Kysela <perex@perex.cz>, Shuah Khan <shuah@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] kselftest/alsa: Increase kselftest timeout
Message-ID: <20230515094310.hulpyhhtb4sxxn7i@rcn-XPS-13-9305>
References: <20221213183242.1908249-1-nfraprado@collabora.com>
 <2ee34e21-44bd-71e7-6da2-f4bea9a35452@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ee34e21-44bd-71e7-6da2-f4bea9a35452@linuxfoundation.org>
X-MailFrom: ricardo.canuelo@collabora.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZT3IKW7D7TD2JLJCUZFACLRAQLCW6GDB
X-Message-ID-Hash: ZT3IKW7D7TD2JLJCUZFACLRAQLCW6GDB
X-Mailman-Approved-At: Mon, 15 May 2023 12:26:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shuah,

Bumping an old thread, this is still an issue for this test [1] and it
could end up affecting many others.

On mar 13-12-2022 11:37:56, Shuah Khan wrote:
> On 12/13/22 11:32, Nícolas F. R. A. Prado wrote:
> > The default timeout for kselftests is 45 seconds, but pcm-test can take
> > longer than that to run depending on the number of PCMs present on a
> > device.
> > 
> > As a data point, running pcm-test on mt8192-asurada-spherion takes about
> > 1m15s.
> > 
> > Set the timeout to 10 minutes, which should give enough slack to run the
> > test even on devices with many PCMs.
> > 
> 
> 10 minutes is way too long.

Is there a downside to that? There'll be some tests that take more time,
I don't think that's a problem with the tests or a reason to let them
timeout. IMO it's the test framework which should adapt to the needs of
different types of tests, and the solution provided by this patch is
good enough, it addresses the problem for this particular test suite.

If the solution is still unacceptable, do you have an alternative
proposal in mind that we can try to implement?

Thanks,
Ricardo

[1] https://linux.kernelci.org/test/case/id/646127cf62438996ba2e8648/
