Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 547B61F3F5F
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 17:30:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A37DD1672;
	Tue,  9 Jun 2020 17:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A37DD1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591716625;
	bh=nQ51rqGb4s3DMzpx5/tEQ5vWRgZw1/ly56m8v8m/A/c=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D1ro7T8++d22rSDxmGc1s+RKeBntLjo/7FAuyWYr9NUy2Ey7gwu5xy6mMpPrKjkQo
	 cKCWt5MFkUTnmHc7YDg1oxIeyXX5llFrY2ZBWsulCYU8Drq20QxU30c2CRhjImmaVG
	 IBoiFOLWprfoA8okRgs5Uo3LWkSrVh+6oYSg/gAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5F43F80124;
	Tue,  9 Jun 2020 17:28:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11318F8028C; Tue,  9 Jun 2020 17:28:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8224EF80088
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 17:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8224EF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sVPA8/e2"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1AEE02072F;
 Tue,  9 Jun 2020 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591716510;
 bh=nQ51rqGb4s3DMzpx5/tEQ5vWRgZw1/ly56m8v8m/A/c=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=sVPA8/e2Nv/Ov87Mz1d/akLrTWoN/KWGAHfMT1Y1ATSIjYKmMc0BTUD7j/3T87j16
 m6YR0SPwd7BNW8lkZVaj/vzJoEAQFF7HHDBsQNf94wKssoYOpMMv4dMKcawVwyD2+y
 ovnaqe59ul0C45x45lmFuZuM8Y1lF2BPMLSR4HgE=
Date: Tue, 09 Jun 2020 16:28:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>
In-Reply-To: <20200608204634.93407-1-hdegoede@redhat.com>
References: <20200608204634.93407-1-hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] ASoC: Intel: bytcr_rt5640: Add quirk for Toshiba
 Encore WT10-A tablet
Message-Id: <159171650846.43267.12643195115095945105.b4-ty@kernel.org>
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

On Mon, 8 Jun 2020 22:46:33 +0200, Hans de Goede wrote:
> The Toshiba Encore WT10-A tablet almost fully works with the default
> settings for Bay Trail CR devices. The only issue is that it uses a
> digital mic. connected the the DMIC1 input instead of an analog mic.
> 
> Add a quirk for this model using the default settings with the input-map
> replaced with BYT_RT5640_DMIC1_MAP.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: bytcr_rt5640: Add quirk for Toshiba Encore WT10-A tablet
      commit: 199a5e8fda54ab3c8c6f6bf980c004e97ebf5ccb
[2/2] ASoC: rt5645: Add platform-data for Asus T101HA
      commit: 79d4f823a06796656289f97b922493da5690e46c

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
