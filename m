Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD479573AA0
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 17:54:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E08816FE;
	Wed, 13 Jul 2022 17:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E08816FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657727680;
	bh=RLAlbg/ljGHtCwtTI1C+Qj2j4SMelIPhBh6jbFb1/wE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kq3l7A0UuaP8s+gkQsunyVDKKvtolQ9bdq6BIZuPV9NlzzLYKHQ6BpbWJLhvtPzga
	 cSEP4P+2VszqRekNQwkpM6ohE9OSGkE8IJ/YeRQHTjS75UkQ4jiH+UZ3RnvOztyuK6
	 gxcYXXQzuqQxVfhTgniYd/KKQ9p1s210jT5efdog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E525CF80254;
	Wed, 13 Jul 2022 17:53:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 846EDF80249; Wed, 13 Jul 2022 17:53:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CCB2F8012B
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 17:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CCB2F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W0sUWld8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8A753B81D5A;
 Wed, 13 Jul 2022 15:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31707C34114;
 Wed, 13 Jul 2022 15:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657727611;
 bh=RLAlbg/ljGHtCwtTI1C+Qj2j4SMelIPhBh6jbFb1/wE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=W0sUWld8/5j9/EUWbwHhDi43z7rkQj6uNlXyqsWKnHPxCrEoQ1lfmSKlY0n090Cys
 grsjSXFTqkM5v4N0scqFwIDz5oVLqvT+6+70FRnQLKWbe24bFWg63XOEumqC3A+Ys6
 Wk6FsY0y4w6P2o4y4j4qY7Jtd17c9d3qwAnA9wI1mRUQNi0CEj7D3EKo7lSc26ieBN
 s1uaWGcyugmcjklZ470VcGiX4/9g9fA4IC5chSiYH5SzuQICIkH8p3a+l6mmxY+df6
 4CZsBFp2UzOKRgZ89PfF3WxrxWnmGkkmlunmPRC5uVqOCWTqll5qsEYhyjV/YU1//4
 85joRwZfhU0gQ==
From: Mark Brown <broonie@kernel.org>
To: yung-chuan.liao@linux.intel.com, vkoul@kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20220708061312.25878-1-yung-chuan.liao@linux.intel.com>
References: <20220708061312.25878-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [RESEND PATCH v3 0/2] ASoC/SoundWire: Intel: add sdw BE dai
 trigger
Message-Id: <165772760890.142759.10751775895640491241.b4-ty@kernel.org>
Date: Wed, 13 Jul 2022 16:53:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

On Fri, 8 Jul 2022 14:13:10 +0800, Bard Liao wrote:
> For SOF IPC4, we need to set pipeline state in BE DAI trigger.
> @Mark, resending this series in case it is lost in your mailbox.
> 
> v2:
>  - Change "#if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)" to
>    "if (IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE))"
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] soundwire: Intel: add trigger callback
      commit: 6d1c1a73e1126572de0a8b063fe62fe43786ed59
[2/2] ASoC: SOF: Intel: add trigger callback into sdw_callback
      commit: 2a1be12c4d77d4f7b122568383382e006a60381b

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
