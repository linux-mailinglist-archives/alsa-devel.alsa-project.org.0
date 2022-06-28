Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E94155C034
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 12:32:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC49FAE8;
	Tue, 28 Jun 2022 12:31:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC49FAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656412345;
	bh=haCH7P825Xua46bMHZAIrSou726HuCRKAA+dDp/ShHg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aRIrRF/5a+KeltrYxIGAa/67CSJDIPHxb8WY+eyBilBF6FhxiZBvO5JWRgjJ2B1WU
	 Prx8gJZ5vq9wVs1Q4Xn8TN4WBxtK7b+yqZYpbvnZBIOoa5d86aGcz5ZTpEQxU14P7+
	 dH6ezI+qKQHofYnu/ujKGzl9PHdaUE43H83BfmvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D01EF80163;
	Tue, 28 Jun 2022 12:31:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B01ABF8049E; Tue, 28 Jun 2022 12:31:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8416F80166
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 12:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8416F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qtXLGa11"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1512461913;
 Tue, 28 Jun 2022 10:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC83AC341CB;
 Tue, 28 Jun 2022 10:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656412278;
 bh=haCH7P825Xua46bMHZAIrSou726HuCRKAA+dDp/ShHg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qtXLGa11dqrPod7YqaUE+FyvoRZWaFbcbAm2ybUhM3Jz5/LLEl2x3brxq7IsNmXjD
 TxfwE94BaX7IxY6+FYIhClGqxkkRcbI9zk82Thng9TWLVMYQyieJBdUuBWqoH6fZ+x
 WGoNbNqF5U7BFxtNu1CYOFSbcdqcDfhBAybnOa+zSwp/7O3BN3UkpNEDFRIYKyrt44
 t3ZtM9BPQy8Ch+1AETKENK4GCLaTKtbD76bz7CqVOcF05RjF+6Y/i50UW43vpQRJYo
 UbzArgwv69rJLMLw/9w5F3SqBaO2qNlhtdVhMq6bpxSFLmly3yoQTldmjDArNcfZte
 CoHVRT+I/aFvg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
References: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: (subset) [PATCH 00/11] ASoC: use pm_runtime_resume_and_get() when
 possible
Message-Id: <165641227755.254424.3183160195337631550.b4-ty@kernel.org>
Date: Tue, 28 Jun 2022 11:31:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, cezary.rojewski@intel.com,
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

On Thu, 16 Jun 2022 17:04:16 -0500, Pierre-Louis Bossart wrote:
> After a set of SOF-specific changes, this patchset correct problematic
> uses of pm_runtime_get_sync() in ASoC, or simplifies the flow with no
> functional changes. Two patches for Intel platforms also add a test on
> resume success.
> 
> Additional changes were initially suggested to completely remove the
> use of pm_runtime_get_sync(). These changes were dropped since they
> are way too invasive, specifically in cases where the return values
> were not tested, which would lead to duplicate pm_runtime_put(). The
> remaining uses of pm_runtime_get_sync() cannot really be blindly
> modified without context and knowledge of each driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: Intel: catpt: use pm_runtime_resume_and_get()
        commit: 82102a24c930986aedc572f89b437cd9e4d44d7e
[02/11] ASoC: Intel: skylake: skl-pcm: use pm_runtime_resume_and_get()
        commit: 7213170a9515109322f75c08b5268d8e9cdad8e4
[04/11] ASoC: wcd-mbhc-v2: use pm_runtime_resume_and_get()
        commit: ddea4bbf287b6028eaa15a185d0693856956ecf2
[05/11] ASoC: wsa881x: use pm_runtime_resume_and_get()
        commit: 9a1a28610a1c49bf93777d017aa3fe121eef944e
[06/11] ASoC: rockchip: i2s_tdm: use pm_runtime_resume_and_get()
        commit: 8c8a13e83c29472044d733dfb1fced2ccd025d35
[07/11] ASoC: fsl: fsl_sai: use pm_runtime_resume_and_get()
        commit: 37cb8a58013fc6ca2febaed355f6559012699542
[08/11] ASoC: img: img-i2s-out: use pm_runtime_resume_and_get()
        commit: 57d714535051b1baca9ffd92e79fbda1fae3177a
[09/11] ASoC: rockchip: pdm: use pm_runtime_resume_and_get()
        commit: 76a6f4537650e6d2211f34661de35630487c7c64
[10/11] ASoC: tas2552: use pm_runtime_resume_and_get()
        commit: 05b71fb2a5014d2430ff6c5678db021c67afa9ec
[11/11] ASoC: ti: davinci-mcasp: use pm_runtime_resume_and_get()
        commit: cecc81d6a5deb094bdbc6a1d7f2c014ba9b71cf8

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
