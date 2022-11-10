Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9F66248CC
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 18:57:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C62B1688;
	Thu, 10 Nov 2022 18:56:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C62B1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668103040;
	bh=1ZiOgcZ5dO+xDxvGJQ7qAMOODxVWHhgW3wMMK0igvTg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UbkxLD4r1bYLd/30XZG/wzCqI1eNIV3nl+8btJt3TrWlruqsQssfSG4Vr+6NCp2Ix
	 1V0aeMxruaMxM46bxwY58pF53V5D1FDNFXLKOSa/vFX8d/wzo/NSQPDEXqDcW8AVkP
	 k3I0Lq4/5vDB38QMnIwRSnHUMDooiwKooRsh4Ync=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D3A7F80162;
	Thu, 10 Nov 2022 18:55:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BCB7F8055B; Thu, 10 Nov 2022 18:55:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C475CF80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 18:55:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C475CF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="piBsAvhr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31C1961535;
 Thu, 10 Nov 2022 17:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37196C433D6;
 Thu, 10 Nov 2022 17:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668102932;
 bh=1ZiOgcZ5dO+xDxvGJQ7qAMOODxVWHhgW3wMMK0igvTg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=piBsAvhr7ZPfkUropi5FMew6lu5vd0YqIMi3gNrK1Ca66kH0DUc5GtJTF07ca7V2d
 Gcy+0w/DzEXvxC2F636Jj+T8zn+xf4uXv9wahf5ADPNJ5XKkg9c1nt3J0PDBOdRYJz
 A+1VdWc+fatmMvzLCkXwngfvzJm5JUw3rWffC2NnrY2yv5qyp+r7AIvFrdcL9/ZYw9
 Q2EeQxzwiCjdjkEf8gkGq6x3+er4m28JHqXzeG+NokljmVp5MT1Pir8iX8vrgOpQbU
 mAq7HqNxNDC1Cm21vnDUXVhJKoSYDOhT85cLBqsEwP1zAyYWqTK2HSNglFpaZTjdkf
 9/UC9uy0Y4dAA==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com
In-Reply-To: <20221107084158.26629-1-peter.ujfalusi@linux.intel.com>
References: <20221107084158.26629-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Implement
 tear_down_all_pipelines callback
Message-Id: <166810293094.959181.13707607180841603528.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 17:55:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

On Mon, 7 Nov 2022 10:41:58 +0200, Peter Ujfalusi wrote:
> During system suspend there is a chance that the running stream undergo
> an xrun and instead of the expected SNDRV_PCM_TRIGGER_SUSPEND trigger
> we will receive SNDRV_PCM_TRIGGER_STOP.
> 
> The handling of SUSPEND and STOP triggers differ that case of the later
> the sof_pcm_stream_free() will be called with free_widget_list = false.
> But we must make sure that all active widgets and streams are free before
> entering suspend in order to be able to resume without error.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Implement tear_down_all_pipelines callback
      commit: 18cd1f3227768f4a76c4f7aa95c1256f07ce8647

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
