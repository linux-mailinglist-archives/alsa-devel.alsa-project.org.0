Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7EB7B6C16
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 16:50:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 590F0845;
	Tue,  3 Oct 2023 16:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 590F0845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696344636;
	bh=+Ho8OQ8KZ6j0Fkyejtlca4SZ/HaEVS5nu63V95Lo0rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WxkIqB8VxG24Cuk9dazGVD9oVISwxbSDd0QOp4pmd393++8LSL7mI9yaQingNRR5V
	 brLwmJMq0oFCFw0s8kJfFokWRO/HrGJI9TBspt/hiavcsvhMTfeg7Ng65+G374zLT0
	 CvVj6/psTFRB2+NyPlQT7dY1caQ5DB6k2E3fkvXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30BAAF80558; Tue,  3 Oct 2023 16:49:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8718AF80310;
	Tue,  3 Oct 2023 16:49:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6740AF8047D; Tue,  3 Oct 2023 16:49:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DD3EF801EB
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 16:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DD3EF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UMzh7wm2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66A066125E;
	Tue,  3 Oct 2023 14:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3FFFC433C9;
	Tue,  3 Oct 2023 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696344548;
	bh=+Ho8OQ8KZ6j0Fkyejtlca4SZ/HaEVS5nu63V95Lo0rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UMzh7wm26I2LcyNKyLn7E8AH/ScySYJlF/+3NbK5vxyPNFU95Rc2ft3ztJx4TfCi3
	 JTITHfZlsgaWWp+E7ofLc22kb5lqz46HY/zVgcHQJhXgAc5A3UQn6FkIGX7k45fStM
	 0CeIj8c6YGqSd+nGTc+a6RnRjVJyzXBviZaLj/sHWKx90qbK5mijPPXj3DMIxE1jTP
	 fkJQ6FBOqDuyrahb5K42N+1nbSEn801FFA2ZeyfJrXv6Z+801QVpo5VIk2HbmBLQrc
	 DCLV+QfJO9SiGC1weVHeeQWfQ3N12ofo2sxJgJjZOE2GxWuwcl+pdY7h5TvYfYmKY9
	 SrYxhPhTjjphw==
Date: Tue, 3 Oct 2023 10:49:06 -0400
From: Sasha Levin <sashal@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 6.5] ASoC: cs35l56: Call pm_runtime_dont_use_autosuspend()
Message-ID: <ZRwp4q2zEPojTgWB@sashalap>
References: <20231002125059.4091982-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20231002125059.4091982-1-rf@opensource.cirrus.com>
Message-ID-Hash: QWJD3T5VTSONY4VE2LS3PPXK47AZ2XRC
X-Message-ID-Hash: QWJD3T5VTSONY4VE2LS3PPXK47AZ2XRC
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QWJD3T5VTSONY4VE2LS3PPXK47AZ2XRC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 02, 2023 at 01:50:59PM +0100, Richard Fitzgerald wrote:
>commit ec03804552e9a723569e14d2512f36a8e70dc640 upstream
>
>Driver remove() must call pm_runtime_dont_use_autosuspend().
>
>Drivers that call pm_runtime_use_autosuspend() must disable
>it in driver remove(). Unfortunately until recently this was
>only mentioned in 1 line in a 900+ line document so most
>people hadn't noticed this. It has only recently been added
>to the kerneldoc of pm_runtime_use_autosuspend().
>
>Backport note: This is the same change as the upstream
>commit but the cs35l56->base.dev argument in the upstream
>code is cs35l56->dev in older releases.

Queued up, thanks!

-- 
Thanks,
Sasha
