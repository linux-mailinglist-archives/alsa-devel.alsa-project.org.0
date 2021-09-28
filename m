Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9D841B3CD
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 18:25:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67BA016A5;
	Tue, 28 Sep 2021 18:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67BA016A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632846325;
	bh=E4RnQVxWqV/qjJuo4YWM7UgFCP5N/ZjHd1ZD4N1Gr1w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s6KSg86i+uFBRuxGs3SxiU37kdMWtEQ+7cu2tbdU2r0UNFTn31mNVkwr07BkMrJPW
	 okfDlHrkuX+QkPjdZBtd0rAYGqU1ObrqyM0G2JwtyeGpu21aEJjH1EYseQFke5OBk7
	 7vpcNxJZOtvpMDTlY7ISsAGuzbvfHwwwXJC0syHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB367F804D6;
	Tue, 28 Sep 2021 18:24:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FAF9F804BC; Tue, 28 Sep 2021 18:24:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AD36F8032C
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 18:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AD36F8032C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TZHHyEIT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DC1260462;
 Tue, 28 Sep 2021 16:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632846240;
 bh=E4RnQVxWqV/qjJuo4YWM7UgFCP5N/ZjHd1ZD4N1Gr1w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TZHHyEITQkbMdX26thBmnK8AKmODgqseLLQzDo0RgDa+IXXVThOqkKXAYocSaR9Jy
 5NYiuCrM5IWup2v5tH2GobkGLoKlsiGEHtwzYY1y4TYySEBjnEoneZgW1CJF/J4cS+
 nJnET+eWsqGuFDFcfH5RKrpqCDvSmiZdy9iU2VsyKlOWw5DjxYDXhvFUHLQGG6GQfX
 2+NfdGn7Uaf02sIWC1L6t/X8Earr+QJ2Vy8S9eF6sWsJff1yJ3qal2onCQVAbV4b3i
 h5fvOhVY48K18wz4ySpMMFQL0nh2t4mAnuo/UZpNuE4xRePacpjh1hFZ5pdHxsKehA
 LziFVsU1jsk6g==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-stream: Print stream name on
 STREAM_SD_OFFSET timeout
Date: Tue, 28 Sep 2021 17:23:00 +0100
Message-Id: <163284573552.17390.11099395869139218293.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210928081744.4785-1-peter.ujfalusi@linux.intel.com>
References: <20210928081744.4785-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
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

On Tue, 28 Sep 2021 11:17:44 +0300, Peter Ujfalusi wrote:
> In order to provide more information in case of timeout observed while
> reading STREAM_SD_OFFSET, print out the stream name or in case there is
> no audio stream associated (like dma-trace), print "--"
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-stream: Print stream name on STREAM_SD_OFFSET timeout
      commit: 22c861fd7f8efacc088704f8229410bee781a95f

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
