Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7DE4D6968
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 21:24:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66B76190C;
	Fri, 11 Mar 2022 21:23:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66B76190C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647030265;
	bh=GxpEd1eRUSiywTmeHjpnQsf8euG4TcT6pAjlnGRoMus=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=clE9vFvJYMQmjDyP48oBXXICShKT5U+aC9kbDadDbLyFp4ad8/nlrE6eHy4A1ERsL
	 Zvsv8B5UPB8vevOgvt7Dgp6Wtzlklh2aUw7N2ODBXotq5IsGxBjYJxMtNknIqr2AIp
	 dA7glOp8uNC9k6jL5cSSh0c9RAHViomnJNWjU3ek=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E3C9F80238;
	Fri, 11 Mar 2022 21:22:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D738F80238; Fri, 11 Mar 2022 21:22:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A5E7F8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 21:22:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A5E7F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hUhuaF7C"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A119661F6E;
 Fri, 11 Mar 2022 20:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631C5C340E9;
 Fri, 11 Mar 2022 20:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647030156;
 bh=GxpEd1eRUSiywTmeHjpnQsf8euG4TcT6pAjlnGRoMus=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hUhuaF7CykyFgDLsz2tykoAKCx9LMDxLHJGDW2TkkiBfrWnYaLdVW0rU5sBWzEPvq
 KBu+dUJbj1chIzoFYu3g3XxnYwQ5f1jZxpkEtvf44Y0oZyRCw/Iv0NYRCz/kwLRll6
 sNe3SA4S5H0uzeCchCI/sLvFsxihV3s41NuEZLRQxc1SU8k4t+vsxEpldaFigoRGWs
 TjXIxJK2tT7IEx0Zn227bRiGugs/nPHa0KFryuHH32lZ2vXszR9trLHE9HFxAtH56C
 6gtDpEaMMZm7s0hAhHYmKvC3trLBpiZmY9udv9/evPOpvw2dRVcHR21xxLKsNfGppX
 CEEDEaM1QZV6A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
References: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 00/10] Make the SOF pcm_hw_params DSP op IPC agnostic
Message-Id: <164703015511.264137.5399182478107568712.b4-ty@kernel.org>
Date: Fri, 11 Mar 2022 20:22:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Wed, 9 Mar 2022 20:27:10 -0800, Ranjani Sridharan wrote:
> In preparation for supporting the newly introduced IPC version in the SOF
> firmware, this patchset adds the changes required to make the
> pcm_hw_params DSP op IPC agnostic.
> 
> Peter Ujfalusi (10):
>   ASoC: SOF: sof-priv: Remove stale snd_sof_ipc_stream_pcm_params()
>     declaration
>   ASoC: SOF: Make pcm_hw_params snd_sof_dsp_ops callback IPC neutral
>   ASoC: SOF: pcm: Remove sof_pcm_dsp_params() wrapper
>   ASoC: SOF: Introduce optional callback to configure stream data offset
>   ASoC: SOF: Mark snd_sof_dsp_ops.ipc_pcm_params() callback optional
>   ASoC: SOF: stream-ipc: Add sof_set_stream_data_offset()
>   ASoC: SOF: Intel: hda-ipc: Add hda_set_stream_data_offset()
>   ASoC: SOF: Intel: Convert to use the generic set_stream_data_offset
>     ops
>   ASoC: SOF: imx: Convert to use the generic set_stream_data_offset ops
>   ASoC: SOF: Remove ipc_pcm_params() ops
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: SOF: sof-priv: Remove stale snd_sof_ipc_stream_pcm_params() declaration
        commit: d7bc6ddef016d851cb0ff97ae16ac98d5f3c85ee
[02/10] ASoC: SOF: Make pcm_hw_params snd_sof_dsp_ops callback IPC neutral
        commit: 31f60a0c943d6a7e84b06686b1ed86ddadf484fa
[03/10] ASoC: SOF: pcm: Remove sof_pcm_dsp_params() wrapper
        commit: d1b1146fc708eff661c2becb9bf78374adde6db7
[04/10] ASoC: SOF: Introduce optional callback to configure stream data offset
        commit: 757ce8103c9e5b83cf18a669fe38484b0be3cfaf
[05/10] ASoC: SOF: Mark snd_sof_dsp_ops.ipc_pcm_params() callback optional
        commit: a6db22a68b0b2183184659d27c0a74df96f0d6d0
[06/10] ASoC: SOF: stream-ipc: Add sof_set_stream_data_offset()
        commit: 9a0a809a5aaeb09458c5f0d26fac63c213b0adb6
[07/10] ASoC: SOF: Intel: hda-ipc: Add hda_set_stream_data_offset()
        commit: 29e3aa0bb934e44c6ec0127cbe96983dc9b82b0e
[08/10] ASoC: SOF: Intel: Convert to use the generic set_stream_data_offset ops
        commit: cf73363e4a55579e3131f5de38c3b7b70bb4d639
[09/10] ASoC: SOF: imx: Convert to use the generic set_stream_data_offset ops
        commit: f0383aded3c6e61e044b90662bf99b3d850c5d90
[10/10] ASoC: SOF: Remove ipc_pcm_params() ops
        commit: 00f19253633710877880ad062d6cee3c13deb9a5

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
