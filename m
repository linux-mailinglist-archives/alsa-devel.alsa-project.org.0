Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0584D6969
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 21:24:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 172231932;
	Fri, 11 Mar 2022 21:23:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 172231932
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647030267;
	bh=IOZV1tT8bDn5sLauJsxEERmTewue+CrSNNHxQuwAP4c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z3Y+OYxL24keZ11w98yTE7I+PDUOHg75P5cHgqSqUhhlUn+zoL2qR8uVHaJe1+6M2
	 h1LJJiueIkz8fUCQiPDrkmfYURzwRmqD3c/Nr+wBx4iWcXDRwlyPF/QR2mrdTqR4Mq
	 Jm+TZa6C7WtbTPEYOrG4+4sh76EITaNVT3vhPV7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE4B8F80517;
	Fri, 11 Mar 2022 21:22:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEF45F804CC; Fri, 11 Mar 2022 21:22:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEE9AF801D8
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 21:22:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEE9AF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tnpo4N1a"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F2E73B82CF3;
 Fri, 11 Mar 2022 20:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115C5C340F3;
 Fri, 11 Mar 2022 20:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647030159;
 bh=IOZV1tT8bDn5sLauJsxEERmTewue+CrSNNHxQuwAP4c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tnpo4N1a5/EIXGo45pTu8ybqrW9B6lNu0APFslHxbeB59/WEoYlKkzAgYFvyvkHaW
 aXu5Y7mnKkA4jIoDFTjI6okrMFuvb90jLW4Rb0bLOFPud7x40f406N5GfZy+V2y9mz
 nGWkVMgg+p8c3T9cfdlEmrR0Gk2sgFUSvtRk3gWlnrOWM/hdIU6dUrQ3BF4peHh2R2
 06u7Aow/Mi4CQePjyGf3CYIhu9sShG94464X29aO2jcs1rt+h1c8/6AWgd44SYjWvH
 gaUL0RKS/6m128Lg3E4E3KDXjcveWUkgAsrXR/wJsdi/cnc3mUs443QbbiimECBHPX
 kX2BsPCh/JXIA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220310171651.249385-1-pierre-louis.bossart@linux.intel.com>
References: <20220310171651.249385-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: SOF/Intel: small fixes and updates for 5.18
Message-Id: <164703015879.264137.14919539287740853551.b4-ty@kernel.org>
Date: Fri, 11 Mar 2022 20:22:38 +0000
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

On Thu, 10 Mar 2022 11:16:46 -0600, Pierre-Louis Bossart wrote:
> One important fix from Kai to restore DM1 L1 functionality, one
> important update from Peter to use DMA trace buffers as capture-only
> and sync them and a couple of minor updates for Intel/SOF platforms.
> 
> Brent Lu (1):
>   ASoC: SOF: Intel: add topology overwrite for Taniks
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: Intel: enable DMI L1 for playback streams
      commit: a174e72e2355b9025205b4b6727bf43047eac6c6
[2/5] ASoC: SOF: compress: fix null check after dereference
      commit: 7e4bfcf10a03981cb3056d723bb2f92eead5c0bb
[3/5] ASoC: SOF: trace: Use proper DMA direction for the trace data buffer
      commit: d8b502a7c353a63269d5ac3cfa7e5a04308df6a1
[4/5] ASoC: SOF: Intel: add topology overwrite for Taniks
      commit: 24320c55566138426ee0f9ec866dd3d656071799
[5/5] ASoC: Intel: soc-acpi: Add entry for rt711-sdca-sdw in ADL match table
      commit: d7be9e33c4ad71c299fd58c5d46d4407c0b42d86

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
