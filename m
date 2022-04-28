Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFFF513827
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 17:20:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53AEF1620;
	Thu, 28 Apr 2022 17:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53AEF1620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651159208;
	bh=9oBX6wnJdmrQZGDX1frfpp8FPP+Tz5ihHtmLmR4Zj2o=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IrJz6vxb1ZorD9puyAewBvqXoCzmjginvN2+GsICFtA0M0QHS9Zyxnrl+Rwz2+7JA
	 8oSwBu6AqoqVfAbRxg2BfnLlirCvKHqgZ7Rucw++NGBQUOZBEglcl2IY5P7JK7XtvG
	 22s7M5Dq2BHwn3ftm+ekmX6jZE+EMYb6NQB4kP10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93CA8F8020D;
	Thu, 28 Apr 2022 17:19:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE7D4F8016E; Thu, 28 Apr 2022 17:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A59BF8012B
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 17:19:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A59BF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XC3CWE7r"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AED22B82DE8;
 Thu, 28 Apr 2022 15:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7766BC385A9;
 Thu, 28 Apr 2022 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651159141;
 bh=9oBX6wnJdmrQZGDX1frfpp8FPP+Tz5ihHtmLmR4Zj2o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XC3CWE7rpy2Ow2+2uRZA9OnxvsGux1ZYgx5QkmyAIJQMUrY4I+jKnoPQbnsZLNodF
 MEKCOHSujZi4InpneAb86eeUeZhscosw5Aacrer78AFk+ovO6pxztsOLsVl94pNszO
 djDzmyGo4VJWpm2PRtNae2dcWO/BS9t9IKEM7XxNzE7/s15k49zEp1YcDa3ibQv2eS
 JK2etAOJNnDWfuoqQMx42FwXqal8m+oLBjRiDoGTzUSoUrldbS6dfolYgfeDbAZiyY
 xLLyOsADgyZwB7O0o6aTNoPRwXtaA5B1pn7DgrJRdd5tm/wVX4vWytwNi5s3xy1mXN
 6Otn/+e4wyxIw==
From: Mark Brown <broonie@kernel.org>
To: yang.jie@linux.intel.com, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, hdegoede@redhat.com
In-Reply-To: <20220427134918.527381-1-hdegoede@redhat.com>
References: <20220427134918.527381-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Add quirk for the HP Pro
 Tablet 408
Message-Id: <165115913896.2739776.2191671080865096717.b4-ty@kernel.org>
Date: Thu, 28 Apr 2022 16:18:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Wed, 27 Apr 2022 15:49:18 +0200, Hans de Goede wrote:
> Add a quirk for the HP Pro Tablet 408, this BYTCR tablet has no CHAN
> package in its ACPI tables and uses SSP0-AIF1 rather then SSP0-AIF2 which
> is the default for BYTCR devices.
> 
> It also uses DMIC1 for the internal mic rather then the default IN3
> and it uses JD2 rather then the default JD1 for jack-detect.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcr_rt5640: Add quirk for the HP Pro Tablet 408
      commit: ce216cfa84a4e1c23b105e652c550bdeaac9e922

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
