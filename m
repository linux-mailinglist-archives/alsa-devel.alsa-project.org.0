Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B815AD6B2
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 17:40:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E02571660;
	Mon,  5 Sep 2022 17:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E02571660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662392423;
	bh=vf9hq+zxQlqGvspoGjLNLjAvPVtnIzHUqUPzMNofp2c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PM9DCcZWXXZxcDgbz6p4tb2Gpv0K4bUd5hV2ePHJaUx6Xz3z8Ctgyxq1qHNAGzPWp
	 Te5bF4HO4W5aQh2/05x2HWBOpNEGcXAbfxu3eqLZy6H1xEoVEtkohU4ipfsCRmUgoO
	 6GLJCbzHrm0p+2PoF7MmK6VCjd6we3c1QKASWv7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 080D3F80525;
	Mon,  5 Sep 2022 17:39:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AFA1F80506; Mon,  5 Sep 2022 17:38:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5EFAF80165
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 17:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5EFAF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q8Bu3t2p"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA68EB811F0;
 Mon,  5 Sep 2022 15:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A750BC433D6;
 Mon,  5 Sep 2022 15:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662392329;
 bh=vf9hq+zxQlqGvspoGjLNLjAvPVtnIzHUqUPzMNofp2c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=q8Bu3t2pQYZXAHeNQqW5m2HlLR320JDfH9FgB69+i1BIpZhKM5050t5paziDdvxoG
 5bA3qHnslHgT6zdLHs5mF6pbwQb8zzddC7MdHLE1D+9NICjhM4K9S00wIos1yT87W7
 GohjViOZrEYWLRgx5af36DymIV/n7Wx2axDd7tma/5p1y4X8oMOST0oqDcZg6Q6hRT
 H8Mfi3PkqGExx6PpfCCIzpiGHZ58Q2ME31hojnblMcaAvT0IZbcb0ce+ZNwZIEsj13
 ulMQyBvdYIrSTqeqTZLBa+5qV00/GB6jmPKYa0EIJKJ9nsQlhciEhvcJ1mf89OBYHP
 wvgm67mLyv+Gg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Martin Povišer <povik+lin@cutebit.org>
In-Reply-To: <20220825142226.80929-1-povik+lin@cutebit.org>
References: <20220825142226.80929-1-povik+lin@cutebit.org>
Subject: Re: [PATCH 0/2] Untested TAS2562 power setting fixes
Message-Id: <166239232739.736206.17258746656389143736.b4-ty@kernel.org>
Date: Mon, 05 Sep 2022 16:38:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-kernel@vger.kernel.org, navada@ti.com, asyrus@ti.com, raphael-xu@ti.com,
 shenghao-ding@ti.com, Stephen Kitt <steve@sk2.org>
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

On Thu, 25 Aug 2022 16:22:24 +0200, Martin Povišer wrote:
> The tas2562 driver does the same thing with the setting of PWR_CTRL
> field as the tas2764/tas2770 drivers were doing.
> Link: https://lore.kernel.org/alsa-devel/20220808141246.5749-1-povik+lin@cutebit.org/T/#t
> Link: https://lore.kernel.org/alsa-devel/20220825140241.53963-1-povik+lin@cutebit.org/T/#t
> 
> These are blindly written patches without testing since I don't have
> the hardware. (I even tried TI's formal sample request program but
> was refused there. CCing @ti.com addresses I found on other series
> recently submitted.)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tas2562: Drop conflicting set_bias_level power setting
      commit: b6b55b232564ade5cd91e9b9e2228b49f230d67f
[2/2] ASoC: tas2562: Fix mute/unmute
      commit: 2848d34c3ba1fc6f1ece0736a4faa16c6277f4d3

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
