Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 739F25BEF37
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 23:35:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1467FE11;
	Tue, 20 Sep 2022 23:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1467FE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663709730;
	bh=4395CS/iWJ9A+nK+7JU5SsbXNb7TCWqK3DuvT50cdTA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SL27tY4lLZoUi7GaGJefNgYNvK5LR1j4hNSus5Hp5S7VXEoVMPIuPhUGUFguoFUkf
	 sTg3d24vJbtRb+N4kZNgU8qfvvobryBefQd8+RaK99/1ixnKXx1euoK2C+FsIkryHB
	 fjpUxOzE51YZmKdiCjoxOxh6EPmaSu5k/53KMotk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14CA1F80543;
	Tue, 20 Sep 2022 23:33:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23AB6F80549; Tue, 20 Sep 2022 23:33:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7811F80543
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 23:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7811F80543
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AxBlf2kc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 302E4B82D14;
 Tue, 20 Sep 2022 21:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8C8C433D6;
 Tue, 20 Sep 2022 21:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663709608;
 bh=4395CS/iWJ9A+nK+7JU5SsbXNb7TCWqK3DuvT50cdTA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AxBlf2kc7Ozo8M3xX92w+wHooioueiJ3WxMuz0kBIJJ1ajyrg5WD47tJIlyB63mbA
 rGcGnCoMk7OifAL7Cs1nKlU1MSfzekrCg7bRxxeBLYFlyCNLJGL/HQC9N4/k+HTRrW
 cRoIVgL4CyTVpRX/oUJOvYA1QlUl74SV+Qe0hYz2xBHI72CZG4YO3/N9nuR0Vk2+pH
 G2XNQjsNmDKF2Hq6RXUA/jGzPXWYzuHLQc7fTeBceoQ3O33d9VeBudgT8fCxMDdCtd
 ra0uoIezyrX3/mV5v+EHTPZc0sSl+qiSwA3Q1mxQ2REU8QLy1GfFWKLgbgrZiLt6MD
 chOa2RTicXl/g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220920150107.2090695-1-pierre-louis.bossart@linux.intel.com>
References: <20220920150107.2090695-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: sof-audio: fix prepare/unprepare
Message-Id: <166370960433.476248.3901483440313426675.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 22:33:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
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

On Tue, 20 Sep 2022 17:01:05 +0200, Pierre-Louis Bossart wrote:
> 2 patches from Rander required to enable mixing usages with multiple
> pipelines.
> 
> Rander Wang (2):
>   ASoC: SOF: clear prepare state when widget is unprepared
>   ASoC: SOF: don't unprepare widget used other pipelines
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: clear prepare state when widget is unprepared
      commit: ce59804d26432d7e2c1a8c906245a230a2b4505c
[2/2] ASoC: SOF: don't unprepare widget used other pipelines
      commit: 9862dcf70245c2d03764012b81966d8c2ea95a48

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
