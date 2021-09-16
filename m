Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6445140DDD4
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 17:19:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00BA918AA;
	Thu, 16 Sep 2021 17:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00BA918AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631805558;
	bh=0/SD8lPLMQr7C3m0XUHwyMpWENtaJmimoof7kMcAqJU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lLdh2zuQagdhvJ0YbKEWjf7YbVA8LK64QfleTqFEm+kabquNvzvoP3ygVZPE10/s4
	 y6nsxaVHnboOea4PRTrw7fYLoj70o/Lwn9RL6JZFEnXCV/I+qprWHCOj0a5pl3jMM9
	 OpAQQW8JMApzEoLAcEa8Ze0EScndHwiqynDUjbhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C12DAF80515;
	Thu, 16 Sep 2021 17:15:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 349B4F804FE; Thu, 16 Sep 2021 17:15:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B02BBF804F3
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 17:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B02BBF804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SjsT4g27"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4455560296;
 Thu, 16 Sep 2021 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631805338;
 bh=0/SD8lPLMQr7C3m0XUHwyMpWENtaJmimoof7kMcAqJU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SjsT4g27Ii8Gs1C3c3k6tJr8a/Auz0VkaR583sRXID0hX13PeMf4/+A5vBfWGPmqE
 PlKhAbok/aiU2+DfZPJNySIrASuAKW2/O+duF5GtPzvwwvbfh0yiDclZYFjpPKW4A5
 EZBGgxd5aawCgf3fmSCCKi5ZAzklOIiN+Q3yFGE+3IqGnXOh55VKXJW3Ps5pOOKmsA
 hrS3puo8Qq0vnCN/BbUAUxXTrlYL64v/D2zhvH5Vw0hADKFAeC6WKY7m7YRdNoHgch
 nS0gusN/kFictMv3AdtQyMkjSkeieIeDWol9zCTOCrQUla86lWBjO36qiVRvrnNS2i
 G1DDYVbs/MXHQ==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: SOF: Clean up the probe support
Date: Thu, 16 Sep 2021 16:14:36 +0100
Message-Id: <163180495858.19842.15708472959577490852.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916103211.1573-1-peter.ujfalusi@linux.intel.com>
References: <20210916103211.1573-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 daniel.baluta@nxp.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On Thu, 16 Sep 2021 13:32:05 +0300, Peter Ujfalusi wrote:
> The probe debug feature of SOF can be used to extract streams of data from a
> given point of a pipeline for analysis.
> 
> The support is implemented by using the ALSA/ASoC compress support for the
> capture stream, but the code can not be used by/for a normal compressed data
> stream. It is a debug feature.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: SOF: ipc: Add probe message logging to ipc_log_header()
      commit: 4ba344dc792fc665c6e95d08ac13ba30f908bbf7
[2/6] ASoC: SOF: pcm: Remove non existent CONFIG_SND_SOC_SOF_COMPRESS reference
      commit: 8a720724589e8d782ad3ad4e0f08977de00bea5f
[3/6] ASoC: SOF: compress: move and export sof_probe_compr_ops
      commit: 2dc51106ccc6c64b9ea68ddd9ec533f7e67e081d
[4/6] ASoC: SOF: probe: Merge and clean up the probe and compress files
      commit: 7bbdda8009001d66611314e67a3f498d4b412c64
[5/6] ASoC: SOF: Intel: Rename hda-compress.c to hda-probes.c
      commit: f95b4152ad75274734ed23d0546d24f5e7fc9c3c
[6/6] ASoC: SOF: sof-probes: Correct the function names used for snd_soc_cdai_ops
      commit: 49efed50588547b0f13897b6fc69f155c2e2af50

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
