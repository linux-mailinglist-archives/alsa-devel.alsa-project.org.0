Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58034546A4D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 18:23:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E29591AB2;
	Fri, 10 Jun 2022 18:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E29591AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654878197;
	bh=RMpIJOAwOk+bREJ9kEzUllxolyW/GSqEunoQiBOMHBo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qTJnJywWLihfFXCIpTyE4gEx3L+Hy92OJ7MCZA/vZZnGE5UzH3eEF7UfTsWJmbVAC
	 fNHzgvQJiPBFgou6Pm3AA8dep5hkCcjBDK/fkCHAPZPI9VI6mDsn6zx+ImqqCTyAEu
	 ZKnohEJGMLvp9dWaEGQ2/C0v9uboM0JOBfBOfY9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FC01F800E5;
	Fri, 10 Jun 2022 18:22:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3107F804D2; Fri, 10 Jun 2022 18:22:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50A3AF800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 18:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50A3AF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Su8pZOpH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51CAD62032;
 Fri, 10 Jun 2022 16:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BCDC34114;
 Fri, 10 Jun 2022 16:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654878136;
 bh=RMpIJOAwOk+bREJ9kEzUllxolyW/GSqEunoQiBOMHBo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Su8pZOpHPUHMgnyHPcUj9g1JyFeIaPwmjHdyPhgXeFQ0m8oIiFdPTuDcOMLkDgGXm
 WiizNHrlV2hCih5dFAXyHKloDKj9HEY3+7S2Qj5LzzxwPqTyX9A5FOu2ZMeBa8g3PS
 m6m0IgRdQALebEmZj9q4ln3LGTetRukz9ETy4/DPQZYHYqeMVEj9G6XaEGeN9jpOW6
 un1yugX+qfo5y4RHPDRyNiqZLOr+od8PokN/2lLJuJfcImeaLGY8y+x9WXN92LhHhw
 88bllIhHK8jDP4qfAPRWafJqqOYKhu1TIoRwkX2ajB0IFkP+4iIve37vj0Kv/1zsZq
 zLxf7eYbs2a9g==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, daniel.baluta@nxp.com
In-Reply-To: <20220610080119.30880-1-peter.ujfalusi@linux.intel.com>
References: <20220610080119.30880-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: ipc3-dtrace: Handle race during
 initialization
Message-Id: <165487813486.1801145.1584054622059682049.b4-ty@kernel.org>
Date: Fri, 10 Jun 2022 17:22:14 +0100
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

On Fri, 10 Jun 2022 11:01:16 +0300, Peter Ujfalusi wrote:
> This series handles the race which can result missing the first position update
> after the trace is enabled.
> In short: the firmware might send the position update (if we have enough
> trace data generated) after the dma-trace is enabled by the TRACE_DMA_PARAMS_EXT
> message. Depending on scheduling, load, preemption on Linux side we have seen
> that occasionally this first position update got missed and we missed reading it
> out.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: ipc3-dtrace: Introduce SOF_DTRACE_INITIALIZING state
      commit: 135786c32ed057068bec56f67a54064cfc845bde
[2/3] ASoC: SOF: ipc3-dtrace: Add helper function to update the sdev->host_offset
      commit: b66f9e703f0bee4e1aa7010299914b7b2009b4e0
[3/3] ASoC: SOF: ipc3-dtrace: Return from dtrace_read if there is no new data available
      commit: 1e90de2c9a40d7d0af5c7b0a6e2d362ffba94772

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
