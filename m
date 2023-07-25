Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F617620AD
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 19:56:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B905284A;
	Tue, 25 Jul 2023 19:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B905284A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690307797;
	bh=eE/4yoAUnkvFYyNbhfYL9lID09cewjAU1hktCrISD9U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZR5WKpXkRYSy9c2uly2sEgpuB+iOwPFTqC5ZoFqh7joHTVTV8IzPt42C4vKaaUw/3
	 9u203QAjY1blpRAEjXLyRnB/wSZ6k5ThuJnFrJCqmKDDX+FuGCu7BOxnV4kfGV3C0b
	 hQ+nO3GiD64FBWz5XnX+lG4jQ7sDIC5xGAQa9AOU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69A4CF805A1; Tue, 25 Jul 2023 19:54:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97625F80588;
	Tue, 25 Jul 2023 19:54:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF082F8057B; Tue, 25 Jul 2023 19:54:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78219F80563
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 19:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78219F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NqCW5AWU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3A4CA61853;
	Tue, 25 Jul 2023 17:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A362C433C7;
	Tue, 25 Jul 2023 17:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690307651;
	bh=eE/4yoAUnkvFYyNbhfYL9lID09cewjAU1hktCrISD9U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NqCW5AWUeJpz0M8l6576quXRoQIsP4nuinnJTIfYGljpoz2WENFl9SysVLPEHrWHi
	 SHrXDo+YwLcK4QMfnYgzqNokd1E0gcU+YHyOKvGP6olo1/5S0WLztEjKVL5QHiU9Mv
	 sRrUygaQM9eLIIBgX3ISgw067CSFphJo9Jqql2B+pyV9qzrhAzRUdUAGsCVKioL8M1
	 LNCII715q9npD0lj0neCXgE3wsNQtwWXyjh3blNBOdVaFbEgbHcYDbpPktpwGEvmOT
	 aCuxq5b8eXazca6HBkz+SDxuqh045LnyZVzJznG+S5qlOtXmUq4rsbLzf4tx1iCWBO
	 BNu2QVO5FMWeQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 Vijendar.Mukunda@amd.com, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20230721090721.128264-1-shumingf@realtek.com>
References: <20230721090721.128264-1-shumingf@realtek.com>
Subject: Re: [PATCH v2 4/5] ASoC: rt712-sdca: fix for JD event handling in
 ClockStop Mode0
Message-Id: <169030764796.1533302.11581972239413692710.b4-ty@kernel.org>
Date: Tue, 25 Jul 2023 18:54:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: JF7PKCUL67AIT4AIOBGXDJEJGA73I3MD
X-Message-ID-Hash: JF7PKCUL67AIT4AIOBGXDJEJGA73I3MD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JF7PKCUL67AIT4AIOBGXDJEJGA73I3MD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023 17:07:21 +0800, shumingf@realtek.com wrote:
> When the system suspends, peripheral SDCA interrupts are disabled.
> When system level resume is invoked, the peripheral SDCA interrupts
> should be enabled to handle JD events.
> Enable SDCA interrupts in resume sequence when ClockStop Mode0 is applied.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[4/5] ASoC: rt712-sdca: fix for JD event handling in ClockStop Mode0
      commit: 7a8735c1551e489351172d0da96128f6f8b52b2d

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

