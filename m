Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B634D08AE
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 21:43:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC20417E5;
	Mon,  7 Mar 2022 21:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC20417E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646685818;
	bh=djKpErc6UQb7reTdBr8nR5bnnVR0FP+c+KKKeCJE7HQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PwRJ8FQ63EYLf7WudzRGuCRx7U9pfl9MkxdHYbgDDHAyhgj8SItd3OgCjerm19ZTc
	 ngwSLlb5TdHK28/T9Fal8Y6onW1g+/eWG1bd+LFu9bjNAOH93S6lMp+cNV6Yz62Pa3
	 I+kqkR8cBrRLpJ+JBtXLIV5gAGzzLRndWuowNH7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E5A6F8055C;
	Mon,  7 Mar 2022 21:39:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68EEFF80549; Mon,  7 Mar 2022 21:39:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E86DEF80534
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 21:39:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E86DEF80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LwD2P4a0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6BA55B81706;
 Mon,  7 Mar 2022 20:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B696C340EB;
 Mon,  7 Mar 2022 20:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646685561;
 bh=djKpErc6UQb7reTdBr8nR5bnnVR0FP+c+KKKeCJE7HQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LwD2P4a0dvMOx/gRI2qQAHmtyt47pmRnVmYh2cJe2iZ+c3VaaZH80morks5M8Lb79
 bofJQO/MqrnPhnrHc8u37B/6hl9VIRGfS1MYr8Km5YNry6u0fKT719kzvSOOCeQc7K
 QqNGjcX1JcHdrt0bNhog0h86pHiXdVbm+NdXhxTM5HqU69XoH4lfUnAx+FXmk/PRF4
 j9oAjToxSkV7GUoWyJxgVs37fu/JMBlq14nvNo+NBzL1UL3qGg2U5NJ2BeNJywL6Gk
 chSTL/J90bTWcvclIdGVncYl+li/BdwShPYhH5L6mL7oBJrzWnGaFUCoQezgl/ae7G
 Mw2VWgmK86tNQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
References: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/10] ASoC: SOF: updates for 5.18
Message-Id: <164668556017.3137316.12327982803432015261.b4-ty@kernel.org>
Date: Mon, 07 Mar 2022 20:39:20 +0000
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

On Fri, 4 Mar 2022 14:57:23 -0600, Pierre-Louis Bossart wrote:
> A couple of updates for Intel and AMD hardware, along with minor
> cleanups
> 
> Ajit Kumar Pandey (4):
>   ASoC: SOF: amd: Flush cache after ATU_BASE_ADDR_GRP register update
>   ASoC: SOF: amd: Use semaphore register to synchronize ipc's irq
>   ASoC: SOF: amd: Move group register configuration to acp-loader
>   ASoC: SOF: amd: Increase ACP_HW_SEM_RETRY_COUNT value
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: SOF: Intel: pci-tgl: add RPL-S support
        commit: d66c57c5ff8a24859fe7506d290d0b705c2576c0
[02/10] ASoC: SOF: amd: acp-pcm: Take buffer information directly from runtime
        commit: edca0623f6d7928b312780d4e885258ca9e562fe
[03/10] ASoC: SOF: amd: Do not set ipc_pcm_params ops as it is optional
        commit: 9c2611b2a620f90219f85e4b40bbe3e26ab81e2c
[04/10] ASoC: SOF: amd: Flush cache after ATU_BASE_ADDR_GRP register update
        commit: b7485ec850591ad62fde0526bd7fdc56cdc04efd
[05/10] ASoC: SOF: amd: Use semaphore register to synchronize ipc's irq
        commit: dc0d4ed26dd2166b47c29d6a9829ac798e62a0fc
[06/10] ASoC: SOF: amd: Move group register configuration to acp-loader
        commit: 7cf467ac9cf33f0975095f080a79f6ec6d9be5b6
[07/10] ASoC: SOF: amd: Increase ACP_HW_SEM_RETRY_COUNT value
        commit: 8e85cab858562734b9d323f392ba9956bbdc133c
[08/10] ASoC: SOF: fix 32 signed bit overflow
        commit: 4aaa06b227f737da5c10feb93a6b203920d5a1e7
[09/10] ASoC: SOF: debug: clarify operator precedence
        commit: 9188812539d1d9a13dac690c95ec657259859ba4
[10/10] ASoC: SOF: Intel: hda: clarify operator precedence
        commit: 0f33105bb2f77c870542d5bc08cf94b8c4e26f36

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
