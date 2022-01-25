Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBA449B13E
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 11:24:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3472727FD;
	Tue, 25 Jan 2022 11:23:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3472727FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643106254;
	bh=+fclevw+qK/qkvHdiC+IxYySl5sZ4hCtOSt8CTZmnCY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mNkBCJEqGH6d0mAr8Rxh6st4jm4S2MTUl9K1aqqWCUN1aLkBOgclmsIbD4uz21gQQ
	 X85R9hC8rrMoYakshTpXnv2CAY8xGRpeL4kjDJ1A3aRzfPEyhkBJY+p2XNdoGE+Cgw
	 UUt4s7LghgCxz9oS4kvC877pTfn+9YeWiJIrBEko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF59F80548;
	Tue, 25 Jan 2022 11:20:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8CEFF80535; Tue, 25 Jan 2022 11:20:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8D55F80525
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 11:20:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8D55F80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hUDVmVDZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 67CE9B8174B;
 Tue, 25 Jan 2022 10:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A3EC340E9;
 Tue, 25 Jan 2022 10:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643106034;
 bh=+fclevw+qK/qkvHdiC+IxYySl5sZ4hCtOSt8CTZmnCY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hUDVmVDZfEyXaoIYXjsYKLRZ7NZFpIoPa0kqOawhZTW1iuNKVjDTrcim/co9THcYP
 8Os6ZnjXy45ZvfrSMToBf5+9H38a28jnOpqoiwgYyPLBwuPM09B1HWub355oNp8EPv
 giJsZO5Gz2/N81JMwhCy0JjiqkU2JJPhYSIFSPI+Su04eNv92bwmCsavrXx/eOP3t0
 NEBxIZWh0Bil9AEE+eXacq1d7t8AIaWLNqCkit6Lt94VCp84bW7nh0hcTL9+pTtE1+
 agSoLQ4UvcsoTGZRYtWKDCQnG3aQ60hXrKOqOKNFqjkREJ9Rg2TVok3saiQ1juxCI8
 q7byKUx5NGHZg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20220120231532.196926-1-pierre-louis.bossart@linux.intel.com>
References: <20220120231532.196926-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: SOF: Intel: don't download firmware at each
 resume
Message-Id: <164310603322.74844.800269420089030232.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 10:20:33 +0000
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

On Thu, 20 Jan 2022 17:15:27 -0600, Pierre-Louis Bossart wrote:
> After the first firmware boot, the firmware is capable of
> saving/restoring its context to/from IMR (Isolated Memory Region, set
> aside by BIOS on startup). This capability improves the resume speed.
> 
> Due to an unexplained issue on Up2 boards, this capability is disabled
> on ApolloLake.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: add _D3_PERSISTENT flag to fw_ready message
      commit: 1dafede34dda19fc2878724145dc16c0b51dc174
[2/5] ASoC: SOF: Intel: use inclusive language for SSP clocks
      commit: bd586a0292e0724fac571a2e4b629134ab2c686c
[3/5] ASoC: SOF: Intel: hda-loader: add SSP helper
      commit: a749d744561ccc8658cebe23fc284034a57e6ceb
[4/5] ASoC: SOF: Intel: hda-loader: add IMR restore support
      commit: 5fb5f51185126059e1d7eb4e452e08c7b17c3301
[5/5] ASoC: SOF: add flag to disable IMR restore to sof_debug
      commit: d7a8fbd17bfef174e85d81d94507b8015732a58e

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
