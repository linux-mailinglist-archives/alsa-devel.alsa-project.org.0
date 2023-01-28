Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B63767F9CE
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Jan 2023 18:20:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2E64E74;
	Sat, 28 Jan 2023 18:19:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2E64E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674926400;
	bh=ebsuhB5NCgrDkbzLI5N2kYa6CckG11G1QNLUFSDkcT0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UqUBVd7JryT22RXaxaoH3BAKqCOccM6eN8cC49u+tqukQFEwqTJNdSa6VkckfYRtU
	 /3oehJnLMg1ia3UUfHdq4PkueuLAe+wWvX8Xyl9s1NtVPGMKXdWUiebfn8nrZkMTA+
	 H+gI8MUik5kj1gr7n/BW0c4z32Jnh1a5cfcp3Fig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08658F804D2;
	Sat, 28 Jan 2023 18:19:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FBC4F8030F; Sat, 28 Jan 2023 18:19:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7984F8007C
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 18:18:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7984F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=THswDB7F
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 784A660B4D;
 Sat, 28 Jan 2023 17:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80B7C433D2;
 Sat, 28 Jan 2023 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674926331;
 bh=ebsuhB5NCgrDkbzLI5N2kYa6CckG11G1QNLUFSDkcT0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=THswDB7F3eczz9n/Kf3SV/6ILfHrAhshoHvR4OzZ5sWPpBuWNByUC8kbph54IeThp
 UT4k0kfG328Rx7g9c9pYemOJMYpanrPMfGeDIqdxlrUFn+hGbjkb2V6gOdH79QI1Gg
 9umWJXV2N9pXxUysoeDsw7tXrMqrQezyFsERbJzrutHByYYProxvYMbFK9eoh0GZIz
 metoo3ZDA+BEmTRx+/xEnPt2Di00LuoDJmZjudbDvVG8/uWMczcIA10tI8QQY3NZSC
 HG2e5SaC6r1/Je/jK1/6WURMRilLp+vDCMU9FHx3qSOGmrFjQcW53BSqyfpox8/7Qw
 wJ6Oh7m/uhZOQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871qnkvo1s.wl-kuninori.morimoto.gx@renesas.com>
References: <871qnkvo1s.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-compress.c: fixup private_data on
 snd_soc_new_compress()
Message-Id: <167492632947.2479102.13120011953910726059.b4-ty@kernel.org>
Date: Sat, 28 Jan 2023 17:18:49 +0000
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 23 Jan 2023 23:17:20 +0000, Kuninori Morimoto wrote:
> commit d3268a40d4b19f ("ASoC: soc-compress.c: fix NULL dereference")
> enables DPCM capture, but it should independent from playback.
> This patch fixup it.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-compress.c: fixup private_data on snd_soc_new_compress()
      commit: ffe4c0f0bfaa571a676a0e946d4a6a0607f94294

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

