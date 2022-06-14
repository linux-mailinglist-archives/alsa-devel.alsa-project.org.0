Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2318754AE4E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 12:27:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD9C01856;
	Tue, 14 Jun 2022 12:27:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD9C01856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655202477;
	bh=LNuguHv6a3ygHKbLId8SPEpXPEI0BlVXr4d/sXv+34E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nd0m4QGLXY2ZoViPp3lGAiJxDMIP2BSxm2JL9fFEHKUSMt8OvQ1P0wqZl7PkuUnjc
	 youzwmE8rqlonT7T4s11yGs+09nQZUVoVVt+MORJqNkCJd2udi0F/KQyPMgyKFxqM2
	 MRyVjJnVUs4GwVfMiMMHhY9kl0uLseT6Z40hrL+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE2ABF8053B;
	Tue, 14 Jun 2022 12:25:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 083D5F80539; Tue, 14 Jun 2022 12:25:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2CA5F80537
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 12:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2CA5F80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Dt7ywmCb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0798B817BF;
 Tue, 14 Jun 2022 10:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F0EC3411B;
 Tue, 14 Jun 2022 10:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655202318;
 bh=LNuguHv6a3ygHKbLId8SPEpXPEI0BlVXr4d/sXv+34E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Dt7ywmCbxWefHYFH/23+oznH63CwSCAy8D//+6XRbBpOEEEe6MONgyMGYMUKtBRD4
 Id6JDgSKWczC9s+Co3HmWgSBdPm82Tr6Ff2BCXLMZD2+N2NZG225rPGKhddnqQP4MX
 ytnqxK5zfiIXwgBNlI1gKaSI3HOe8s8ZLHqZ6P83a9eCjGBIjSxMC4ICpGikMPStfh
 w0YtbGegGTyCWzLSRn8lGNiU63Ckp/M0dC3XEK14RVOqZwPKVYgHWCkPY15HEzOZzU
 EoPWNpat2fP8gof2uuWbLSAFuUweHcHYhIpu7ZBPvWtFvO2A5Kmagbzk2KWSsKOWg/
 usr0HUa9fbzNA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20220614075618.28605-1-peter.ujfalusi@linux.intel.com>
References: <20220614075618.28605-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Compile and runtime IPC version selection
Message-Id: <165520231693.3607327.15875256703939130687.b4-ty@kernel.org>
Date: Tue, 14 Jun 2022 11:25:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
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

On Tue, 14 Jun 2022 10:56:17 +0300, Peter Ujfalusi wrote:
> The new IPC4 version is only supported by Intel platforms, iMX, AMD and
> MediaTek only uses the standard SOF IPC.
> There is no need for these platforms to build kernel support for IPC4 as
> it is just dead code for them.
> 
> SND_SOC_SOF_IPC3 and SND_SOC_SOF_INTEL_IPC4 is introduced to allow compile
> time selection and exclusion of IPC implementations.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Compile and runtime IPC version selection
      commit: 7ed1f83bb4f05fe460984ae49e98d1c1be38fb5f

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
