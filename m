Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EC4570C93
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 23:15:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2D6D84A;
	Mon, 11 Jul 2022 23:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2D6D84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657574139;
	bh=JcY58mUjFzQV7aELgw4yRTdXIwS5FxxPCUqD7jAVwDA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DUIEwfIAoISI2Rb8Ug0Rqb2+0J0hzyLnjtmhxjF8y7AaWy+F3nNqYQUGazc7E2Kzl
	 eLw8m1skDxHQDuHg3tWEULh1/tnXyjEsX9/1QwXX8aQR3yqXNHOKFuhBeNBFjiDF/B
	 mvrb+advBGvSjhztsQ5dd1PwvK2wSC8vVpt9Q2LI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48361F80256;
	Mon, 11 Jul 2022 23:14:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3BC7F80163; Mon, 11 Jul 2022 23:14:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2163F80152
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 23:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2163F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ux9otN0/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A386FCE181F;
 Mon, 11 Jul 2022 21:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA57C341C8;
 Mon, 11 Jul 2022 21:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657574067;
 bh=JcY58mUjFzQV7aELgw4yRTdXIwS5FxxPCUqD7jAVwDA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ux9otN0/i61ZPI9LRHyYkIPveh61gkAZ4Uv9CQhYHBtCxVcVFy3bQzLiP+d9V3n8e
 JdSxW3/U8i0i8c1LNLSycVTlDrOJnNR8KvbnnQ0UjXfnBJuXt6/RuTgJCdXB059vZD
 jbo/lxS6UytJdeNOFfEx1mEiIEXyFeJp7yRjIj7juKOlc9bx7+HNSMyneVbVOXW/Eg
 2QZzOlYhv82jHF+8LarUfzEZ/cxS9byXEcWgqSEwwqWORcbuCIf/xjgi4RfBRbeGct
 /QHhzmKgA93JtYxmqH1vFV7yQfg4I+a5Gch/Uf9uQWRGl1srhu5dKIov3VJIKK0h3O
 Gkp8NZll87MvA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, cezary.rojewski@intel.com
In-Reply-To: <20220707124153.1858249-1-cezary.rojewski@intel.com>
References: <20220707124153.1858249-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/12] ASoC: Intel: avs: Updates and cleanups
Message-Id: <165757406548.1989033.12593483290329464621.b4-ty@kernel.org>
Date: Mon, 11 Jul 2022 22:14:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, tiwai@suse.com,
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

On Thu, 7 Jul 2022 14:41:41 +0200, Cezary Rojewski wrote:
> Series consists of loosely connected patches and does not concentrate on
> one specific subject.
> 
> First, as generic HDAudio codec driver is now part of ASoC, avs-driver
> core is updated to register missing ext_bus operations. This completes
> driver's core implementation.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: Intel: avs: Register HDAudio ext-bus operations
        commit: c50cea054e04769471d2f17a57fafd7c5dfe8df8
[02/12] ASoC: Intel: avs: Assign I2S gateway when parsing topology
        commit: 5f267aa4adad13f764e0b00926c349f8728fce77
[03/12] ASoC: Intel: avs: Relax DSP core transition timings
        commit: 8192d24cccfbd93dadefd2b7553ff15e41d0e680
[04/12] ASoC: Intel: avs: Copy only as many RX bytes as necessary
        commit: 3c1923a119a61534f8ce221766041ddf470c9307
[05/12] ASoC: Intel: avs: Shield LARGE_CONFIG_GETs against zero payload_size
        commit: 00566ad4ce9d394c6ebaacde12eda06eef4e5279
[06/12] ASoC: Intel: avs: Block IPC channel on suspend
        commit: daa36bbcd78bca24db84e273bcafec9a8f81c767
[07/12] ASoC: Intel: avs: Set max DMA segment size
        commit: 8544eebc78c96f1834a46b26ade3e7ebe785d10c
[08/12] ASoC: Intel: avs: Use helper function to set up DMA
        commit: a5bbbde2b81e41cea7fa1b38911e88da5febc2d5
[09/12] ASoC: Intel: avs: Recognize FW_CFG_RESERVED
        commit: 79c351fb50e7e37eacf93f55f1e7056148d0d814
[10/12] ASoC: Intel: avs: Replace hardcodes with SD_CTL_STREAM_RESET
        commit: 4b38bd16ca6d8b16c1dc2cc4aa61663193b0b893
[11/12] ASoC: Intel: avs: Lower UNLOAD_MULTIPLE_MODULES IPC timeout
        commit: 8758ae88f0f4ade16e6a1b709eb5ea7271f62320
[12/12] ASoC: Intel: avs: Update AVS_FW_INIT_TIMEOUT_US declaration
        commit: f1eea11523e4394d6670f10a51356e9b7c8567a8

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
