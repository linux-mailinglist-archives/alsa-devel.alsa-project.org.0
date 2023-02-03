Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D2E689D3C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 16:09:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 300AE84C;
	Fri,  3 Feb 2023 16:08:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 300AE84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675436969;
	bh=BBtPJZjlylan3yySZw9Gkl+gnno+wj0wx5HgGd6te1A=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=A6nDVmfU/PtntwwuZ0sdfIdonotaJh2zk7G1QfshMxETx6SpNTqO+Y1EBKM6hWuWW
	 kGDlSYoeV74Tv1+8JI3ZdoBXAbAhUhNaLXJS/uo7y+qnaRxZdMtyW7V4UYYj72bdpT
	 xJ8jLkMym7OfvRZxLhUYJjAKDypT0BsFbcoL1de8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6241AF80543;
	Fri,  3 Feb 2023 16:08:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7815DF8047D; Fri,  3 Feb 2023 16:08:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AC5CF8001D
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 16:08:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AC5CF8001D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cqmNiM/v
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB5BCB829B9;
 Fri,  3 Feb 2023 15:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908B3C433EF;
 Fri,  3 Feb 2023 15:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675436879;
 bh=BBtPJZjlylan3yySZw9Gkl+gnno+wj0wx5HgGd6te1A=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cqmNiM/vmUWjfu5UIdHDS06LkTXPNcwuxjtWCDiGubMtuOzjLeSmPM/aEowuOAOSD
 vdIkKQ8/ynzLH8WFqX+sEEC5cU8ACpPyTdXBfinJR0R7AdkcdGKFx+lZGRxTxB2F89
 uGlPUr4brkQOW80S0R77mYuswNfNLf/Y54/5h1MyPFAAEQXIuNSmKURzpdqk9PEPWZ
 4QtLwnMb1pGeRtCLcIpuWBkeod0FrUjZ8oQXWIUT6AQ2tmk1kBV+Hp6RML5uQTZ9XP
 qG5jskKSi8F9sTzz1XsZYatbtrDj02VBsmIKyVQxIXmSWz9i8Z0wHxaKmYK1HTLZ7t
 uS8Uvh1KwnWsg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230202132954.26773-1-peter.ujfalusi@linux.intel.com>
References: <20230202132954.26773-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v3 0/9] ASoC: SOF: core/ipc4/mtl: Add support for PCM
 delay reporting
Message-Id: <167543687729.955300.8575073693335113237.b4-ty@kernel.org>
Date: Fri, 03 Feb 2023 15:07:57 +0000
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

On Thu, 02 Feb 2023 15:29:45 +0200, Peter Ujfalusi wrote:
> Changes since v2:
> - Use div64_u64_rem() to make the code compile and work on non 64bit architectures
> 
> Changes since v1:
> - The delay calculation updated to take into account the counter wrapping on both
>   ends (host and link side).
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

