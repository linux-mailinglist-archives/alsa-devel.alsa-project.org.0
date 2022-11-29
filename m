Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC5163C5D2
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 17:58:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BEF5168B;
	Tue, 29 Nov 2022 17:57:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BEF5168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669741112;
	bh=CpZ6gT7uGV+SQxKzoeZYVIuIko1cajmackRKjYZva2Q=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c5eCcpJiAeMFs9kpGqweyuzd52ME8iDblXv2IKpVkLXGZpDITI8J/6a/73Pv4CObX
	 1st7rb9syX5a3M4yLqkeVdF34Z8c1/18zMG55SHfWdr2lHaDtxVApDfQsRsW39zgbm
	 VAa7eD9OlY8Qtt+N2rq5BMXQtJ7U/IkhrhmWqzCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A797BF80137;
	Tue, 29 Nov 2022 17:57:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C3D3F801F7; Tue, 29 Nov 2022 17:57:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98771F80137
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 17:57:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98771F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bjYwSySa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4181617F3;
 Tue, 29 Nov 2022 16:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E727C433D6;
 Tue, 29 Nov 2022 16:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669741046;
 bh=CpZ6gT7uGV+SQxKzoeZYVIuIko1cajmackRKjYZva2Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bjYwSySa7zsXcoBK1MAUMf/eK7HaZCMTOjOdZ4nCzwVQQ0aPt9eonk2222v7AhfY5
 DjWLBqCY+zaE8gP3sepPHyXW9aTNfkf1nELunQjLqoTmp1rC6upG0HRzL/8e3u/zYj
 QNlnoO8mWMogKeBVtx+RUFOD4ENKcTz8KzI04M1NXl/xJzxhPHmSLvUfQZoEIckfqM
 K24Lqm+HR65dg3RTjlRUdLQwl4q3r+/JHaSWJR3ncRsuZ9in8wHpTyTBBHC0QxCfMU
 f32Y9S/GTlz4sAgAE0G7zWDoOwuc6AWkeTjbFNBYNGo/PaiOCBFtb/+ZoN928CQ+wP
 AUSO0axu1/KHA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20221125184032.2565979-1-cezary.rojewski@intel.com>
References: <20221125184032.2565979-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/11] ASoC: Intel: avs: Refactor jack handling
Message-Id: <166974104510.322279.17804831081622628308.b4-ty@kernel.org>
Date: Tue, 29 Nov 2022 16:57:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Fri, 25 Nov 2022 19:40:21 +0100, Cezary Rojewski wrote:
> For all the boards included in this patchset, a similar set of changes
> is proposed:
> 
> 1) Move jack unassignment from platform_device->remove() to
>    dai_link->exit(). This is done to make jack init and deinit flows
>    symmetric
> 2) Remove platform_device->remove() function
> 3) Simplify card->suspend_pre() and card->resume_post() by making use of
>    snd_soc_card_get_codec_dai() helper
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: Intel: bdw_rt286: Refactor jack handling
        commit: d60a197e50eca5017076b3867c1a49cb5118d597
[02/11] ASoC: Intel: avs: da7219: Refactor jack handling
        commit: 833e250ef592c3c02dda400c1c44306f74241d33
[03/11] ASoC: Intel: avs: nau8825: Refactor jack handling
        commit: 9febcd7a0180b1ea5b49cda1838aef49ef936805
[04/11] ASoC: Intel: avs: rt274: Refer to DAI name through a constant
        commit: 58391e7ca04be3960579a51d9a47d0fbc1b1607e
[05/11] ASoC: Intel: avs: rt274: Refactor jack handling
        commit: a08797afc1f9792b16356f59ba047114dd06a25e
[06/11] ASoC: Intel: avs: rt286: Add define for codec DAI name
        commit: af8ced412d6ee680faca06700fa784bbef6de702
[07/11] ASoC: Intel: avs: rt286: Refactor jack handling
        commit: 2f292443b4c88ccd469e724d022c669349abcbb5
[08/11] ASoC: Intel: avs: rt298: Add define for codec DAI name
        commit: 1fa675a00a5028f4f49bd19eaab016ea2d765ba8
[09/11] ASoC: Intel: avs: rt298: Refactor jack handling
        commit: 28baae9bfc1fb9fdaff2e8bd328b2a5b12a14273
[10/11] ASoC: Intel: avs: rt5682: Add define for codec DAI name
        (no commit info)
[11/11] ASoC: Intel: avs: rt5682: Refactor jack handling
        (no commit info)

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
