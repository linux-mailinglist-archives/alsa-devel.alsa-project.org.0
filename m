Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB0E1B0E5E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 16:29:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B752A168E;
	Mon, 20 Apr 2020 16:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B752A168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587392994;
	bh=udY56RbFO4TWs1vmEHg1p+s0GN8HPgS3vPqH5SrFHgo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AW2XWCZSZtSfgYqsH+xNQ2hxKVo22ZrLOJUm8GSqCzh9mnVmZFbG3ohbDEN+A9p1J
	 KJld1DRBznApW6acW7Zg+lUbtq7uWH23wzIy9DAdzZjBMo62FkpsteTw3Crn0IOUUQ
	 qnxXgUqKRs9bi/AGbPwnF7GV8bgOt8HPVo4m6GuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C0F8F8025E;
	Mon, 20 Apr 2020 16:27:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84A62F8012F; Mon, 20 Apr 2020 16:27:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AECD1F8020C
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 16:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AECD1F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WM0zbz8g"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A673620B1F;
 Mon, 20 Apr 2020 14:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587392846;
 bh=udY56RbFO4TWs1vmEHg1p+s0GN8HPgS3vPqH5SrFHgo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=WM0zbz8g01DFfKBJfq/qEssg16tvNBh5Bp+wvoTXmpSwOwkrep5lRe09GlB+mhZNU
 ifW5thuOzGhXnkkMEyMU6L0mkJmvd8hRNEpAmTzDpJ6wqD2SYxYLINaf6WJyGEN355
 J+lDRGSvobtBByHzLF80bhulEHbeH1opF/UuAX08=
Date: Mon, 20 Apr 2020 15:27:23 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, "mac.chiang@intel.com" <mac.chiang@intel.com>
In-Reply-To: <1584931764-2778-1-git-send-email-mac.chiang@intel.com>
References: <1584931764-2778-1-git-send-email-mac.chiang@intel.com>
Subject: Re: [PATCH v3] ASoC: Intel: boards: split woofer and tweeter support
Message-Id: <158739283776.7647.16067773923060434711.b4-ty@kernel.org>
Cc: sathya.prakash.m.r@intel.com, naveen.m@intel.com,
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

On Mon, 23 Mar 2020 10:49:24 +0800, mac.chiang@intel.com wrote:
> From: Mac Chiang <mac.chiang@intel.com>
> 
> Support Woofer stereo speakers by default and optionally
> Tweeter stereo speakers with a DMI quirk
> 
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> 
> [...]

Applied to

	https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/1] ASoC: Intel: boards: split woofer and tweeter support
      commit: b5e5dc0ec0a4e97b9f642722db5119d95f6b0215

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
