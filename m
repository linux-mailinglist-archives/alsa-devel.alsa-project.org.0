Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 610C65766FF
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 20:57:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4A2D1918;
	Fri, 15 Jul 2022 20:57:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4A2D1918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657911474;
	bh=/ILBLXahCZh5xZY7AbUdKhWXtjqXHIPDWzAycNBCnd8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TqDy5NxA+fhnH9Fg93ZoKQkiMGpL+vvXLjmgdt84NoOpWaMln2NWU00HLw/dJMsG9
	 R2r+ofJK50ulqw8N0+rHPU8huwXefsjtXwUAH/1rELLjMeaPQ59RyD0W8in5hur8ts
	 EfQsnt3CYTU1RSRlujdkFyPUSewIaiz4jBohsbqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CAC1F8012F;
	Fri, 15 Jul 2022 20:56:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44BDCF8015B; Fri, 15 Jul 2022 20:56:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEEBAF8012F
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 20:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEEBAF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lhlYV1YM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 31571B82DFC;
 Fri, 15 Jul 2022 18:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1EEC3411E;
 Fri, 15 Jul 2022 18:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657911405;
 bh=/ILBLXahCZh5xZY7AbUdKhWXtjqXHIPDWzAycNBCnd8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lhlYV1YM2AsiR2dthrEBBciieJQVl+v14BXprdcm4XPaFulcz8ILgr0wxSC9OllBF
 GNXojYGyAGyYvElm90+Ozz3J63KhwF2E+AM1PzjoUAjajujKbQ6mkz2jzBm+5v48zx
 SCYmRzLyciZnN4EbLwF+Sxo2bINYf8rRpYNltFcH6x8W+rmlT8kf02e1wbqkeBrzCE
 ez+UxHAHCdYiqGtM5jqtL2OO6LQGIWVG1MBCn6nvHLKTDBUJVdEEqxuqUsHnL8zG8J
 fD9EHoPnhQ4NOHGLuJGpMwWlj1AWaLbiPqqureqsbGMcIXtYXgMsB4zYh4c83mvsDj
 +JeBl87xzT0wg==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220624134317.3656128-1-cezary.rojewski@intel.com>
References: <20220624134317.3656128-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/4] ASoC: Intel: Mark BE DAIs as nonatomic for hsw and
Message-Id: <165791140443.4025820.796867311883167473.b4-ty@kernel.org>
Date: Fri, 15 Jul 2022 19:56:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 24 Jun 2022 15:43:13 +0200, Cezary Rojewski wrote:
> Address the warning: "Codec: dpcm_be_connect: FE is nonatomic but BE is
> not, forcing BE as nonatomic" by marking BE DAI as nonatomic. Aligns
> with what is already done for FE DAIs.
> 
> This patchset iterates the change over all HSW and BDW related machine
> board drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: hsw_rt5640: Mark BE DAI as nonatomic
      commit: 58ef0d3d5716000c153acc5401109fd90afbdf09
[2/4] ASoC: Intel: bdw_rt286: Mark BE DAI as nonatomic
      commit: 6d7e011808504e0aabbbf3b66d4c14982394abae
[3/4] ASoC: Intel: bdw_rt5650: Mark BE DAI as nonatomic
      commit: 5c4ef9529b12865c2402784a7506c880178effda
[4/4] ASoC: Intel: bdw_rt5677: Mark BE DAI as nonatomic
      commit: bdd15ec4888a375848030cbf7d9fc16c7f430f48

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
