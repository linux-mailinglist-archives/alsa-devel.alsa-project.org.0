Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AD345FADA
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Nov 2021 02:31:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB02172D;
	Sat, 27 Nov 2021 02:31:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB02172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637976716;
	bh=wvFpSOodcDauha9vPIUhNtEP/0dAEv41a2dbqA3kxrc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DjwLow8Cm7PrBAmSzcx5GFwUZBXtLn2UxVh4Y1FEJrqCZnugUk27zA5KcfqVl0Gtz
	 naYdH3nLeIzL8p2fG1kILxyYEt+TbTbtTLvaVz02Pj2B1CsPoc30u7CyM6zJRbO+uC
	 2n03R6qsHT/xn2TPRDCgyn+BT7aViN66uky4NP1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B294DF804CF;
	Sat, 27 Nov 2021 02:29:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6834BF80302; Sat, 27 Nov 2021 02:29:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E80FF80212
 for <alsa-devel@alsa-project.org>; Sat, 27 Nov 2021 02:29:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E80FF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="joyfxSWW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2386BB829B4;
 Sat, 27 Nov 2021 01:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C5CC004E1;
 Sat, 27 Nov 2021 01:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637976587;
 bh=wvFpSOodcDauha9vPIUhNtEP/0dAEv41a2dbqA3kxrc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=joyfxSWW/KnArMx73fxx4rTnZ+qsQduTW762lumm9lyOEDlGnA+zm76eMddgdBgQY
 3Y5ZpqxsMfpDGZ34fnvwhnAKqF6i32YzWbEDwwG8EKBLqPghVQPeJFRrQEHY3D85WN
 PNSyPj7hCQo9VKffQBqlChxzxn1dH/DnWJg8wodgL5T2HNeEhMgC8ROKBxuW5iavaJ
 R0d12gGb2Jupf2+uWvuDp3vfGYlhhVDqW5AMCMIdRQLK2ebIW7fTLIeIWyXyubZAvU
 R7h8h4KMmVbdjjvayT9kPW3HZ17B3Fkj8pHI8MnLfwZuZNp/tLP+mUQyukZ3tlKmcW
 etPUy2o0SgrGA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20211125101520.291581-1-kai.vehmanen@linux.intel.com>
References: <20211125101520.291581-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 00/10] ASoC: SOF: Fixes for Intel HD-Audio DMA stopping
Message-Id: <163797658586.2987942.9235055791379265106.b4-ty@kernel.org>
Date: Sat, 27 Nov 2021 01:29:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

On Thu, 25 Nov 2021 12:15:10 +0200, Kai Vehmanen wrote:
> Implement an updated programming sequence to handle DMA stop for Intel
> HD-Audio DMA.
> 
> The new flow is only used if the firmware is sufficiently new to support
> the feature. SOF1.9.2 is the first release with the updated flow. The kernel
> changes are backwards compatible with old firmware releases. Likewise new
> firmware releases will work with old kernel.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: SOF: Intel: hda: clear stream before freeing the DAI widget
        commit: e14cddc5888418cc9f2ba66c01a04cdbab3b5b25
[02/10] ASoC: SOF: Intel: hda: Add a helper function for stream reset
        commit: 2b1acedccf36434924ae530410e008e7eb427cd3
[03/10] ASoC: SOF: Intel: hda: reset stream before coupling host and link DMA's
        commit: 4794601a52d40a425542be1b88f8f5614fcf45b4
[04/10] ASoC: SOF: pcm: invoke platform hw_free for STOP/SUSPEND triggers
        commit: 0dd71a3340b92b503278af4565156f086ccbca3f
[05/10] ASoC: SOF: call platform hw_free for paused streams during suspend
        commit: 47934e0fcbbe2bf488bcae2d68431b9ea5972488
[06/10] ASoC: SOF: Add a helper for freeing PCM stream
        commit: d9a7246534753efa383ad8d05ab3691df846c4b4
[07/10] ASoC: SOF: pcm: move the check for prepared flag
        commit: 85d7acd0ef18725b1d3a7980eee8b84d46296b91
[08/10] ASoC: SOF: align the hw_free sequence with stop
        commit: 0b639dcd457b1d3fc660e5a77b02cf65acde3b5a
[09/10] ASoC: SOF: IPC: dai: Expand DAI_CONFIG IPC flags
        commit: a0f84dfb3f6d9f78f862cbe885036d3e4449fc6f
[10/10] ASoC: SOF: Intel: hda: send DAI_CONFIG IPC during pause
        commit: 69acac569031426e2ab9b5244593b60d0c9abd04

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
