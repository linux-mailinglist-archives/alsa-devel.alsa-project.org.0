Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B625689CF6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 16:09:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA4A342;
	Fri,  3 Feb 2023 16:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA4A342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675436943;
	bh=vLcSxG6OxueRtNft61IytUHlS5UMOS0PFEatfvka+LI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VQwc46rco9NTPo9hLgn9D5q6hs0mmYE+YUSjTMFMISCF1Y9dnweBVEw5a6HLv6Vpr
	 3zx1sCFS6MI9Xyw8fXLVjG87ciSqbsjJ9aY3oxsXB5O4EcwtbUpHiWuO6w2mLSmEEO
	 UIPXrCz9BYMVszbEXsVmJbr9s1x5QO7MNlbFh9bA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DA38F802E8;
	Fri,  3 Feb 2023 16:08:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DB48F8001D; Fri,  3 Feb 2023 16:08:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99AD1F8001D
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 16:07:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99AD1F8001D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Bb5CC5r3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 70071B82AEE;
 Fri,  3 Feb 2023 15:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509B5C4339B;
 Fri,  3 Feb 2023 15:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675436877;
 bh=vLcSxG6OxueRtNft61IytUHlS5UMOS0PFEatfvka+LI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Bb5CC5r3OHYm1XOaJCsOj04pbFL8ArxG6GZPPacqLz0OOAikoj46QmVOjwEhT3Q4+
 FWqYETbQe6mVKNTQtrjLY8y5J0y+iDGSA9CtaIA1lNNhIatEVbNd63dajJfrGteXVS
 YxlEWxQvloZY7yhcoVngODz2VUa6pRbroiE/g3eSI9eyYruOC5Qu8yrh9dT6tsC87p
 izbJO5uEqbbILCqmazaaFz0Kg9RArKt3VkIAvTTi/FOBIf/rakHLdEqp9thFoakn6Z
 +Rbdupu3FKlEdRt5NahGPG/2hwHcFVB7TuIZTvyvn3bH4e687x0jGrvzl/hqsXLKnJ
 +oWPW7d0isYVw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230201123231.26361-1-peter.ujfalusi@linux.intel.com>
References: <20230201123231.26361-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/9] ASoC: SOF: core/ipc4/mtl: Add support for PCM
 delay reporting
Message-Id: <167543687504.955300.7802819124628276586.b4-ty@kernel.org>
Date: Fri, 03 Feb 2023 15:07:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 01 Feb 2023 14:32:22 +0200, Peter Ujfalusi wrote:
> The following series adds support for the PCM delay reporting in SOF core level
> and implements the needed infrastructure with IPC4 to finally enable it for MTL.
> 
> Currently this is only supported on MTL (and via IPC4), but with the
> infrastructure in place it will be possible to support other platforms with
> DeepBuffer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: SOF: add ipc4_fw_reg header file
      commit: 2740dcce918f385aea0fb0a026cc0b91629479af
[2/9] ASoC: SOF: add fw_info_box support
      commit: 4700bfb2bb3acae63ff4cbf82fbde35a325ebdf2
[3/9] ASoC: SOF: add time info structure for ipc4 path
      commit: 65a8ef494aff8bceac9a952ae8f6a1681231aee5
[4/9] ASoC: SOF: ipc4-pcm: allocate time info for pcm delay feature
      commit: af74dbd0dbcf49e8a3ae3e766683e13ecaf71e3b
[5/9] ASoC: SOF: ipc4-pcm: add hw_params
      commit: 7cb19007baba0c7a76bd3f8f324a6b6548025968
[6/9] ASoC: SOF: add delay function support in sof framework
      commit: 27c2100b6bc8b0b064f89250eb4081431299115f
[7/9] ASoC: SOF: add get_stream_position ops for pcm delay
      commit: 7f956297272bbc3535a02fa32579375a0d40283c
[8/9] ASoC: SOF: Intel: mtl: add get_stream_position support
      commit: faceb3445aaf1704583744b48c622dbc96ef9ab2
[9/9] ASoC: SOF: ipc4-pcm: add delay function support
      commit: 3937a76c64931109dfafa999a0c78b4df2a6e0a1

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

