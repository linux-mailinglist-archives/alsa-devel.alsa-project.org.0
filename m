Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC60751C3A0
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 17:14:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 904AA17F7;
	Thu,  5 May 2022 17:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 904AA17F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651763651;
	bh=3e8AnhyMxsNI7aG3d0fNwDUXubyauqM5LEVk5obqnJg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mfnURICP84WND+huMwanaNh8nk125jci13FRWMOjJRYZOEe4KgGd+8cN0G4Gf5GzJ
	 a1FJNgmJHSaVR2cqTxFQIUjzE7U6yyXFa9GZRXtN2SFT0u4BImTAjtdLnYSZWKSL0w
	 uGojUBgg6vuBAY1bgPC4pvXD7LvYtKiazzO7mdto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77814F80516;
	Thu,  5 May 2022 17:12:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6370F80508; Thu,  5 May 2022 17:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57CDCF80506
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 17:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57CDCF80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B1+rdYLG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2AAB1B82DC0;
 Thu,  5 May 2022 15:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A62C385AE;
 Thu,  5 May 2022 15:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651763536;
 bh=3e8AnhyMxsNI7aG3d0fNwDUXubyauqM5LEVk5obqnJg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=B1+rdYLG3W/F3Wn+TOVjQ44oy8Q8CLez7i2MElJyJmuvP9l5JI98EEDVM6sVPyq37
 SISW/ZUvluNE4GK/0FqaHzDNkzoKmoM4OMok6kwAPYh+FsWNVE+MaiUDF3BUfCTL6i
 BjPriQllpRRH3km/Dt+IoJHKD9om9DSAnm/DJKD9JGCruQ6WbeO9EYKpdk8GKuUBjG
 U9rsrueQn242Vz//uo4nx1Q0jdOTMTb+TFY2KBL1433Kao338GoEcSKmbY2XXHDvsq
 VTx0TfRvG/KdmXgC78COHdx9JAPHgAwcY6UUbcLvouez6tNGgCkD9GhEUbv6gEC9kW
 iFc9WHWyy3EpQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, rander.wang@intel.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com
In-Reply-To: <20220505094818.10346-1-peter.ujfalusi@linux.intel.com>
References: <20220505094818.10346-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: IPC4: Introduce message handling
 functionality
Message-Id: <165176353361.543130.8301108227391416521.b4-ty@kernel.org>
Date: Thu, 05 May 2022 16:12:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
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

On Thu, 5 May 2022 12:48:15 +0300, Peter Ujfalusi wrote:
> The series adds the basic IPC4 message handling code, implementing the ipc
> callbacks.
> Due to the difference between IPC3 and IPC4 messaging we need to introduce new
> message container for IPC4, but the SOF internal callbacks and structures can be
> kept as they were and leaving it for the IPC specific code to handle the
> differences.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Add rx_data pointer to snd_sof_ipc_msg struct
      commit: 84c2dca3c3d4b8e011a2536fc7aaf2a2bdc77972
[2/3] ASoC: SOF: Add initial header file for ipc4
      commit: ed85a6e6fe7c01faff4504af9d5569e8ba417999
[3/3] ASoC: SOF: ipc4: Add support for mandatory message handling functionality
      commit: ceb89acc4dc8f071f63f8d64442c7a5d768e4c9d

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
