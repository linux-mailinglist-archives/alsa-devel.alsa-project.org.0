Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 989474A0486
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 00:48:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EA88172E;
	Sat, 29 Jan 2022 00:47:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EA88172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643413720;
	bh=ES26pkYG1ltAWXV3kwdmrXqxALNDPOzBDQillEvqFs4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EH/lXpNWJmYDL400mT4mfWdGTYIadjrOYWS5mSIKr9OYUDjk1lA0Rvfofp4OINTu2
	 9ubhP1odoXsVzKT1UFO9VlwDuy3spQGfN9gJyxBpJ8cXkZtCA7HrD8kp2oX5zSoHSt
	 bDRNlATH/rhF6Oql1Rj+/DWgxO2IYAc6jCCO4JYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9870F80506;
	Sat, 29 Jan 2022 00:47:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86952F8023B; Sat, 29 Jan 2022 00:46:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AE69F80240
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 00:46:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AE69F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M2zZDQ3c"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 036B361F35;
 Fri, 28 Jan 2022 23:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3D1C340EB;
 Fri, 28 Jan 2022 23:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643413607;
 bh=ES26pkYG1ltAWXV3kwdmrXqxALNDPOzBDQillEvqFs4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=M2zZDQ3c43kxqEN0vjmmdR0woLcofJFaUV9lKNfyC02e7IFwvHA5qi9C1+S3U1gVo
 0KBznwt9J7bTH7//SEiWuHYrudqrm+Al00fquucLYXMNOud+K3vu/XhipK1qVhgE3H
 wiBlLQV3gMj3VdS+5IXk2TH5pZBYxYAAJaCqblou2OgtFHpONYIVvta9EVt9+/KgKH
 NqDBmwDH/CHsgRyWicrwa5Q4arLmyawwoxD49zIMT8mH06j4jM6jzBrhPXx6Kds/FF
 WBJprOih3p9UgR82+PwWuLYwic5ZCur6b3QlR6d+jDWTznuP7Ioiz6smCS6Tq5r51A
 KssS0oP8mAYaQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 oder_chiou@realtek.com, derek.fang@realtek.com
In-Reply-To: <20220126100325.16513-1-peter.ujfalusi@linux.intel.com>
References: <20220126100325.16513-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt5682: Fix deadlock on resume
Message-Id: <164341360576.694662.8165762074889752292.b4-ty@kernel.org>
Date: Fri, 28 Jan 2022 23:46:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

On Wed, 26 Jan 2022 12:03:25 +0200, Peter Ujfalusi wrote:
> On resume from suspend the following chain of events can happen:
> A rt5682_resume() -> mod_delayed_work() for jack_detect_work
> B DAPM sequence starts ( DAPM is locked now)
> 
> A1. rt5682_jack_detect_handler() scheduled
>  - Takes both jdet_mutex and calibrate_mutex
>  - Calls in to rt5682_headset_detect() which tries to take DAPM lock, it
>    starts to wait for it as B path took it already.
> B1. DAPM sequence reaches the "HP Amp", rt5682_hp_event() tries to take
>     the jdet_mutex, but it is locked in A1, so it waits.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: rt5682: Fix deadlock on resume
      commit: 4045daf0fa87846a27f56329fddad2deeb5ca354

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
