Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1A8546BAA
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 19:30:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D05101897;
	Fri, 10 Jun 2022 19:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D05101897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654882216;
	bh=+hc7L7k/gklycGXfFSbWz0yYcUQbnmAaL61ML3i9Jbw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0Hwf6OX6xV7u+IMD0F0doxf/RPi8M0uxdlUJ4loxZdEVtDWRqiITopFMq9rA8TYV
	 5x5bM/YZaMQXOhE8zWCl2qMGe5D9W1yRU7+ZpsTvEEC3b2GSC7NeCKqAgaodNaB7jP
	 emR2WxEBSXMELa78n8VRev00q1mIxe9f/XwVavQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E8DCF800DF;
	Fri, 10 Jun 2022 19:29:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EA3DF804D2; Fri, 10 Jun 2022 19:29:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AE8FF800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 19:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AE8FF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IMjp7wtk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9307062162;
 Fri, 10 Jun 2022 17:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9227AC34114;
 Fri, 10 Jun 2022 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654882147;
 bh=+hc7L7k/gklycGXfFSbWz0yYcUQbnmAaL61ML3i9Jbw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IMjp7wtkFZtroxSxsCyD6L9W7wsbth2uE+TCY/knrpESypqzGLdUq8zUu7yRBsekN
 D4Cl1/ugR/l3izSYWMsInYBrDRieShOVloMZQvU3AhCgAtEr2cZOEJau8rGOQJZAJG
 OyJXd1kG2Zzn+zaDZGacqfq8zVjM2d5ON0iZhjYuPADxvHk8jzhuICDiEp1TCOqruI
 Kd9EplJ4mYdB5I6rxUSgTfneAlfuH8ReoBgDe9em/yhu65GYGJ2TDxr2AMETbrzYke
 SrmP5O/0dXM+Mrl/3LDRN+ubU9RyxobjDSawaw99oI/3drFTpsQ3oNhibjppAPW4i8
 wlY+6bzb8sEeg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220610083549.16773-1-peter.ujfalusi@linux.intel.com>
References: <20220610083549.16773-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: SOF: Add support ctx_save with IPC4
Message-Id: <165488214532.1950235.17225623714036691940.b4-ty@kernel.org>
Date: Fri, 10 Jun 2022 18:29:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

On Fri, 10 Jun 2022 11:35:43 +0300, Peter Ujfalusi wrote:
> The context save functionality with IPC4 is triggered by sending a message to
> the firmware about the pending power down of the primary core by the host.
> 
> In order to have this functionality implemented in a clean way we need to
> introduce a new IPC level PM ops for core state management and use that instead
> of open coding IPC messages here and there.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: SOF: make ctx_store and ctx_restore as optional
      commit: 03f69725749f453b9a4d454a92805f8eb5f095c2
[2/6] ASoC: SOF: sof_ipc_pm_ops: Add support for DSP core power management
      commit: b41252d8820c7009078c3d401a807a9da899075f
[3/6] ASoC: SOF: ipc3: Add set_core_state pm_ops implementation
      commit: 0a047dafefafbccc931fab2d187ce75c302088d5
[4/6] ASoC: SOF: ipc4: Add set_core_state pm_ops implementation
      commit: bd3df9ff25b32b66630c283bb2e065e8bb822e72
[5/6] ASoC: SOF: Intel: Switch to use the generic pm_ops.set_core_state
      commit: 7a5677407300e8ba6af95e66f4e8cfe23059f4a7
[6/6] ASoC: SOF: ipc4: implement pm ctx_save callback
      commit: 63b9069653a710b08d5fd174ac05d43711356541

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
