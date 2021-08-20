Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 969653F2E46
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Aug 2021 16:42:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D75841;
	Fri, 20 Aug 2021 16:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D75841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629470540;
	bh=RAFYNhvc+f+UcSbiowtw89lcxIUk81ITaUNpcgTkWqQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E0lSlA7bumIU134CUzRXj/q8i9WajYLu9PUPCNg1ImolM1Yln9YFT7K+mCpMTAuCZ
	 KIM3lJLl+19Ol8fftWNvSvLU+4bHx7V1ccX4k8pFp8FzB7zdDilb9xOJkNXJQUZJzL
	 3CVUHfcF5Qq0AguVLA47NdGBsMWHi95qmh0zp5IE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC976F804E4;
	Fri, 20 Aug 2021 16:40:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05CBFF80259; Fri, 20 Aug 2021 16:39:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B25F2F800CC
 for <alsa-devel@alsa-project.org>; Fri, 20 Aug 2021 16:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B25F2F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZLZWxI3o"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 385BF61131;
 Fri, 20 Aug 2021 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629470388;
 bh=RAFYNhvc+f+UcSbiowtw89lcxIUk81ITaUNpcgTkWqQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZLZWxI3osuUaozLCU6P/Q9LXFNDljtJ281LrM/h+v/HUr7Apsbi9lBynEg4b1EZbl
 hq7jnYs4qULYLs3whr6xRoIBhF78SZd0id4jhMg9l5Rfl8Fxs6o3832XLYJpB0mCGo
 L6ZdV2WObXrCDMsSsuLvTd/NPJT9/k5tudyrF5zXtH7TkA5Kw62HJ1Qpx8DV3uxuhR
 iTg12RIcdiIr7ewM6jfVPfqhJJ8wQgUAPjrAULKiXwsVbrIMJHO97jsVphI1yfzCjd
 BtykbiE0qgNNdbt6jUqytdghfuuniAUXASn/V9Y/h23hZ5yGGIMh+rk1QBw1pp99iz
 hNIO21bR6G9Eg==
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: Intel/rt5640: Add support for HP Elite Pad
 1000G2 jack-detect
Date: Fri, 20 Aug 2021 15:39:13 +0100
Message-Id: <162947011160.28998.16273139990598704474.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210815154935.101178-1-hdegoede@redhat.com>
References: <20210815154935.101178-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <bard.liao@intel.com>
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

On Sun, 15 Aug 2021 17:49:30 +0200, Hans de Goede wrote:
> The HP Elitepad 1000 G2 tablet has 2 headset jacks:
> 
> 1. on the dock which uses the output of the codecs built-in HP-amp +
> the standard IN2 input which is always used with the headset-jack.
> 
> 2. on the tablet itself, this uses the line-out of the codec + an external
> HP-amp, which gets enabled by the ALC5642 codec's GPIO1 pin; and IN1 for
> the headset-mic.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: rt5640: Move rt5640_disable_jack_detect() up in the rt5640.c file
      commit: 5caab9f48b96f6998fb23d38a7b57fca91ef1653
[2/5] ASoC: rt5640: Delay requesting IRQ until the machine-drv calls set_jack
      commit: 15d54840ecf6f00061d03180394a0a21ff8ffa48
[3/5] ASoC: rt5640: Add optional hp_det_gpio parameter to rt5640_detect_headset()
      commit: d21213b4503ea66777313e4345e116cc8a5366bf
[4/5] ASoC: rt5640: Add rt5640_set_ovcd_params() helper
      commit: e3f2a6603a982467601e0831d706786ed1ade833
[5/5] ASoC: Intel: bytcr_rt5640: Add support for HP Elite Pad 1000G2 jack-detect
      commit: 9ba00856686ade106afee2884b5e8ac1e09d137a

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
