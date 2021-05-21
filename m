Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E3738C9CF
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 17:10:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 803BF16BA;
	Fri, 21 May 2021 17:09:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 803BF16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621609806;
	bh=pjMNYTsflgDHf41geuHYbgIi78V2ZG2YzPQdHoxswm8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E9NYQFd5gz9HdupEPhVcK0nKDQ16h2Lm04FWK93Mq5hrq1gNc/v2HNd90Pi7M3iBO
	 stth6KLBaKUw8bWUUX3tfN/5mkVAojs5q7/y285u0uHOYT0iBixNdfn6NYJ8tg5ozP
	 sb4a/FGn5RN9TzNixVWh4WkjBCY8Vpj3PSq9xfLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AC9FF80249;
	Fri, 21 May 2021 17:08:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4763F80249; Fri, 21 May 2021 17:08:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0FEBF800E5
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 17:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0FEBF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AwANhlT8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28D01613CC;
 Fri, 21 May 2021 15:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621609693;
 bh=pjMNYTsflgDHf41geuHYbgIi78V2ZG2YzPQdHoxswm8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AwANhlT8ADpYKR312WsK0fm8zI7KIv1GUoIALdyyy4yPSwQDPSYJcnJRCK486Gqa3
 z8cYk5vo00GDSFKZeKgA00V8QNrHQ6rC/UdKLIwYc7El2d/19FB6SHkg8owxjxXXYD
 jwNqHJTQukfBivrigrUnO9EQ9ShaZm3zcsZJy4BVgnKci7s1mq7ylcl1dkrfh/CEqU
 srRuCq2Y3OhVebR+ZC8yQ4sbUzDeiFtkgbKx60MBCvDDztuZ+O/G5e++8QqyTBWYRH
 +H4xCwdi1/PcCpQEDPt7xPS8J+i86TY29DwBriRyDQy5W8yVZZvpIZzMTZZ9nB3fuo
 s50j2cbmWeq/Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: SOF: code cleanups for 5.14
Date: Fri, 21 May 2021 16:08:02 +0100
Message-Id: <162160953476.10636.14317063420021438612.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210521092804.3721324-1-kai.vehmanen@linux.intel.com>
References: <20210521092804.3721324-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
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

On Fri, 21 May 2021 12:27:57 +0300, Kai Vehmanen wrote:
> Set of code cleanups for issues found in code review.
> 
> Jaska Uimonen (1):
>   ASoC: SOF: topology: fix assignment to use le32_to_cpu
> 
> Keyon Jie (1):
>   ASoC: SOF: ops: print out the polling register
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: SOF: Check desc->ops directly in acpi/pci/of probe functions
      commit: fd979ec12eebcfb718f2c7c28b336d891d439f85
[2/7] ASoC: SOF: pci: No need to cast second time to save the desc
      commit: e5eaa4e66f538b8ba4928785a62edf8ffcf7c053
[3/7] ASoC: SOF: ops: print out the polling register
      commit: 3b2e93ed12381fa1c33169202f2cdffbb18157c4
[4/7] ASoC: SOF: loader: Use snd_sof_dsp_block_read() instead sof_block_read()
      commit: c03459415c5120fe03dd7d9824880acc8b7f2693
[5/7] ASoC: SOF: topology: fix assignment to use le32_to_cpu
      commit: ccaea61a8d1b8180cc3c470e383381884e4bc1f2
[6/7] ASoC: SOF: ops: don't return void value
      commit: 4f50f16e9414ea41d5c142fd880faab060472a6b
[7/7] ASoC: SOF: Intel: hda: Remove conditions against CONFIG_PCI
      commit: 9d5536e0e1ca8409665bdd80d951941d5ce19b8a

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
