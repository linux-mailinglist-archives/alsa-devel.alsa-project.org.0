Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDA0703158
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 17:18:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCDA41EC;
	Mon, 15 May 2023 17:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCDA41EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684163916;
	bh=KU4BqCM4n71vKAlw8lJ0MrV0o99IJJ6fQDjar/DiEG0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JW/gw8uWDZ8fCoFn2xiGauBz+mCFymodtrFwMlh9/hKxESYFEIGlLEnFQRiryBdn2
	 cvwBL4mhEbMrg63A/UWe+Q+WxGIh8L4TORPUSmd/LWRVGhJL3OggRAK2lpod7GnyLD
	 hx0roD/rDX+iYIMn8eyuwYstA7DlAIiz2PsvdjrA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA4C4F8055A; Mon, 15 May 2023 17:17:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CBD5F80548;
	Mon, 15 May 2023 17:17:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CBAAF8025A; Mon, 15 May 2023 17:16:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3334DF8016A
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 17:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3334DF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GgauIa+x
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 96A8A60FAB;
	Mon, 15 May 2023 15:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732E2C433D2;
	Mon, 15 May 2023 15:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684163812;
	bh=KU4BqCM4n71vKAlw8lJ0MrV0o99IJJ6fQDjar/DiEG0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GgauIa+x958XV683MvcHX5s2eohPHte65PM6c1jWvTTuPdUYPE4Jn5A2ys1rCaHnt
	 HkQKKMSYd2yhERvh90GlbEOyfgJcJrmqqhGyMUgQU8sSMEXFx+S/5IBO9zOdMLgY2z
	 wxyp7Q9eZ83KDtZUmZv5y6s5ryXCSY36fg3KcYsc/Bsut9Dk2ZD5rEVqQxox8XKI3O
	 N8ojUEZRzsSltkwWjD22hZ/ySAB9YvMqwEY3mSC9mRDwATtUrsDE61MOIItrk+GYbg
	 SBTifIzOPdWcWan4DHMwXEcs9hN1SwQo3txd/Wwg97w85l+jPUsI2K6E4DwlBDMsNw
	 ANIS5a/m0zHZQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
In-Reply-To: <20230515085200.17094-1-peter.ujfalusi@linux.intel.com>
References: <20230515085200.17094-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: topology: Fix tuples array allocation
Message-Id: <168416380731.410886.7009179094300948680.b4-ty@kernel.org>
Date: Tue, 16 May 2023 00:16:47 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: YOVWGSAF4BXM65PC6SKOD3XPMW4L32TI
X-Message-ID-Hash: YOVWGSAF4BXM65PC6SKOD3XPMW4L32TI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOVWGSAF4BXM65PC6SKOD3XPMW4L32TI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 May 2023 11:52:00 +0300, Peter Ujfalusi wrote:
> The memory allocated for the tuples array assumes that there's 1
> instance of all tokens already. So for those tokens that have multiple
> instances in topology, we need to exclude the initial instance that has
> already been accounted for.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: Fix tuples array allocation
      commit: 1c0d023c8c2f7c56750a3d58207b263a39d39554

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

