Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E064638C1F
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 15:27:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D545016E0;
	Fri, 25 Nov 2022 15:27:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D545016E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669386471;
	bh=38JwjD/C5FNo0jUKuncqYVo+CgiXbFz+7+2U9Lj5sa4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZSuAXUzVdsfR4oVSPch9zzDZZW82RL2qhhKqOuZXkrSjmZ1ymUXentVXp9l4MBX4U
	 pTw8XHD9jqrRqjturRSm8DZSQtASoT9tEHwa/kHThE/wgjTNKR6WHPmDRHQiQPn+4b
	 8tLCQqFDcAYe/DJcC6B9aZLF5r/Xay0olQ7VrUm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47500F804C2;
	Fri, 25 Nov 2022 15:26:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6F16F8047C; Fri, 25 Nov 2022 15:26:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95CBEF800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 15:26:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95CBEF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Xa8swSKh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E7EFEB82AFF;
 Fri, 25 Nov 2022 14:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C81C433D6;
 Fri, 25 Nov 2022 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669386409;
 bh=38JwjD/C5FNo0jUKuncqYVo+CgiXbFz+7+2U9Lj5sa4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Xa8swSKhI1sjhFeLV3MxqvjKnzkLGEoTWEDX7WDLZ42UwSOzPNhzCL1fZsH7lAou/
 r3yr5Z8gMilOYTZQV5cHat9I3pYVQ87alsmztG6Fy873EaSB/zwhqqn3HMnoRy+QQp
 vvRvyCgGSVK8q8eMFNQMwd57gTn1SjPzzaXzgsvAH43gHgyqXP6MzRmjaFW3cFoDy/
 Dw7mbvCZUtQLExDlK2+hDi2QqcPCY49cTMBk5MbNZhwLaOUXFWlFmRrW6TwVgGfRuF
 tubDFlOQZXKOUqWciKsvsm8XVvRUMb0GmI3+8Cu36OjyZQmW0UUTr+VjCJMh5+U6B0
 GwCV5s1LCI67Q==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20221111042653.45520-1-yung-chuan.liao@linux.intel.com>
References: <20221111042653.45520-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/8] ASoC/soundwire: revisit interrupt and lcount handling
Message-Id: <166938640772.506633.6957070884814610112.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 14:26:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, bard.liao@intel.com, vinod.koul@linaro.org
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

On Fri, 11 Nov 2022 12:26:45 +0800, Bard Liao wrote:
> The code in drivers/soundwire/intel_init.c is hardware-dependent and the
> code does not apply to new generations starting with MeteorLake. Refactor
> and clean-up the code to make this intel_init.c hardware-agnostic and
> move all hardware-dependencies in the SOF driver using chip descriptors.
> 
> The ASoC patches are dependent on some patches that are applied to ASoC
> tree recently. So, this series won't apply to SoundWire tree. @Vinod Could
> you Ack if it looks good to you, and lets go through ASoC tree?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] soundwire: intel_init: remove useless interrupt enablement in interrupt thread
      commit: c5e5da1eb3d3009ed861f1514b41bec323c191d1
[2/8] ASoC: SOF: Intel: hda: add per-chip enable_sdw_irq() callback
      commit: 8ebc90741e96646af7320336ac4433eea175390a
[3/8] ASoC: SOF: Intel: mtl: factor interrupt enable/disable interrupt functions
      commit: 00f4f3380745da4950de2bf65f15af767d54dfe1
[4/8] ASoC: SOF: Intel: mtl: move SoundWire interrupt enabling to callback
      commit: aa70a580930a42781f57ac0d8b281ed2f6b0d8ec
[5/8] ASoC: SOF: Intel: hda: add callback to check SoundWire lcount information
      commit: 625339caaea15c0e69d833227652d2f5b6e365cc
[6/8] soundwire: intel_init: remove sdw_intel_enable_irq()
      commit: 562bb228cebea475cc967c4a53df97ca62aa90b5
[7/8] soundwire: intel_init: remove check on number of links
      commit: 2cd24c318cc943b54cbd2d855cee798314619c4e
[8/8] ASoC: SOF: Intel: hda: read multi-link capabilities earlier
      commit: 5e2cbc4a813e866885f812f1b64fdf33a9a16700

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
