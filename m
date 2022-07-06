Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 714AF568AF0
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 16:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F007169E;
	Wed,  6 Jul 2022 16:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F007169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657116675;
	bh=+JtukXBA766gOI7S3LFDUUjkO+RnBFyznT0x7iJLGpA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HK+DLX8iC30ai5RG/9QFUIKCGN6HY2IMTf4EwgNKE4r6UtLYuGPlEAKag83hmY+F7
	 SUN8nPMGBhMOY8Mwqujrg2RA4Pk44F+x0gZUsc8SkVirtNNo26ZzqsI6Fn8wnOpVXy
	 MHbm/o+Ntf/oCIPURxytOAqfW3XTkTz++uV+VwvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99A8EF8016B;
	Wed,  6 Jul 2022 16:09:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21E5FF804ED; Wed,  6 Jul 2022 16:09:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9038BF8012A
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 16:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9038BF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ImFBD4gU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8B068B81ADA;
 Wed,  6 Jul 2022 14:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243CFC341C6;
 Wed,  6 Jul 2022 14:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657116577;
 bh=+JtukXBA766gOI7S3LFDUUjkO+RnBFyznT0x7iJLGpA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ImFBD4gU9gBuLfbijkPj7gCgLLRFFXMCCBb0xhqby5u4CwArtAnozBT0FWEUO/8Bn
 5cQ42fRrPuXZDf7msTYW7K6VtX/c3F+NErpP/l0NDYRVf5Ym9zWxn4+vz1ihuO34BB
 u0SDBSHshhs+eV4iF52qHv9zgc9qrtc5b3aV2jaowZ48ZyeWqp6xCGq8ctx8yA3l6U
 IIue77kxvs3TMml1o6y72CU//lTz6Yz8DxLfP2jNds4ZHs5UI1qF1QDWGMZByVSRmg
 LOsbpbTvTVOGCtZqMQAGAgiZWZjQPUoI3YA3e4iPE8pSCA0fXGWTn95wypP1xAKV9u
 r8ht0ZBwfNqKw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, cezary.rojewski@intel.com
In-Reply-To: <20220706062952.251704-1-cezary.rojewski@intel.com>
References: <20220706062952.251704-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Fix i2s_test card name initialization
Message-Id: <165711657487.3718491.15631357198534177792.b4-ty@kernel.org>
Date: Wed, 06 Jul 2022 15:09:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: sfr@canb.auug.org.au, lkp@intel.com, linux-kernel@vger.kernel.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, lukas.bulwahn@gmail.com
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

On Wed, 6 Jul 2022 08:29:52 +0200, Cezary Rojewski wrote:
> Update printf formatting as 'ssp_port' argument is of type 'int', not
> 'long int'.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Fix i2s_test card name initialization
      commit: f1fd46e068f52893608469df98d4608672e3e45f

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
