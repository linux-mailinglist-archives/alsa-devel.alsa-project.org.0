Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 189A74F2988
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:36:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 065F41838;
	Tue,  5 Apr 2022 11:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 065F41838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151400;
	bh=1/yHLJggErvWyfFpt6FkTgsjWvy6bO4Uh0Q+bBTTZr4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q1xtE1fCpCMa+UYYn1GpvOfLxhMHPUO2MQHKlgGBGAFFjF9aj+RNhBW+7MOVi68++
	 ASTSmhsyKRzvdChRJ/+mrkg1LK/5EX7FnrSMURLTcHHgsKRzzjMTI9rVps31JGToBk
	 DvOwUQ+dxh6tsryq/botZeW1fuHpHGQyHy0723o8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC96EF805A0;
	Tue,  5 Apr 2022 11:31:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 272E2F80579; Tue,  5 Apr 2022 11:31:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C0E5F80578
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C0E5F80578
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bcyG2Ybs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 50476B81CC1;
 Tue,  5 Apr 2022 09:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D61C385A4;
 Tue,  5 Apr 2022 09:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151102;
 bh=1/yHLJggErvWyfFpt6FkTgsjWvy6bO4Uh0Q+bBTTZr4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bcyG2Ybs1PziEVFREQYbI4K+v1XuDbx84wmrM7fMq89hIGTe18jELnc2vJ6Rq59Ci
 WWBjwY9ap8lqcRRxmYNbW2advdUfbNYTFiGmgvnEjvXkJAVLZvYpgFhqBaE2yOPXLX
 R5rNY51QRy9zG2YBMZBTvZzu+RMMSswhIyfgIjaK9RMxxk2XIQoUuecMm5FyvYktO7
 OtPO8njvxb0mrvaslreLBiZsJlTVUTgVi9wst0d9t5Sc6wCnWlvjh8IGXyyp3RU9Ae
 xQjp7LXY44s8wisqteXLs5cl5vsVoUYbIawFBPKO0kXIX7esua9M9i92lE26vz6Z69
 jJGbhwZNfonEg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com
In-Reply-To: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
References: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 00/11] ASoC: SOF: Miscellaneous fixes for IPC and trace
Message-Id: <164915110108.276574.16106154110481764474.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:41 +0100
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

On Wed, 30 Mar 2022 13:19:15 -0700, Ranjani Sridharan wrote:
> This series includes some miscellaenous fixes pertaining to IPC, DMA
> buffer and DMA trace.
> 
> Libin Yang (2):
>   ASoC: SOF: extend the interface to stop DMA trace
>   ASoC: SOF: disable dma trace in s0ix
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: SOF: Intel: hda-loader: Use local snd_dma_buffer
        commit: ea5ffef079a72478d8612b4071c2986e364f82d2
[02/11] ASoC: SOF: Remove dmab and dmab_bdl from snd_sof_dev struct
        commit: 7f0a1335d3b67745d4b51dc634c3b400c3f1d42b
[03/11] ASoC: SOF: ipc: Add max_payload_size field in struct snd_sof_ipc
        commit: a3e6b3691b35c6312cff32127ffc01e81d6e6d41
[04/11] ASoC: SOF: ipc: Use ipc->max_payload_size for message/reply size checking
        commit: 78935913573b7c0397b5e3d4512ee0f67b280d3b
[05/11] ASoC: SOF: Drop support for mapped control data
        commit: 7d8e9d79276492cbc66575a301d7ab8b92786699
[06/11] ASoC: SOF: extend the interface to stop DMA trace
        commit: 758f24d49bff2707812fb8dfac53930603e26312
[07/11] ASoC: SOF: disable dma trace in s0ix
        commit: 249ee180874dd48a809caf70981b2aa800329d27
[08/11] ASoC: SOF: ipc: Use msg->reply_data directly in snd_sof_ipc_get_reply()
        commit: 5db8eb5b9e35c712cc63fcebf04c80ace9812961
[09/11] ASoC: SOF: Drop 'header' parameter from tx_message() API
        commit: 2a51c0f81adda8cc32b02e8ca7b7d9d13ad4376a
[10/11] ASoC: SOF: Remove header from struct snd_sof_ipc_msg
        commit: 30b50b9734ddf08b0bb7321f47f4b849cba54875
[11/11] ASoC: SOF: Remove redundant return statements
        commit: 9e116f5a6e95e59145f90a82ad37ee0e53f686a9

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
