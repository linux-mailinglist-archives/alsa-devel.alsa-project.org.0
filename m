Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0540C337920
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 17:21:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2AB918CA;
	Thu, 11 Mar 2021 17:20:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2AB918CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615479681;
	bh=AFZsDVrJrAtJWcG1GG6obs737AUKvX7hTKFiz+JZZUg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cduwHUHzw3kOgQ8ygEPiRBQxWXqsC+khRZPd4eT3azgGu3q4SBxZb1QT9CBMoWrRg
	 y+j5MpxtqRGvKCatnryxMYZOwgiZTCRLxNAbEbzuSK8aSLbz4CBdvoOj8SZV+0mPCw
	 zxm8+aABY37oD5AGi1Q6laf1RLLMRrT06ufO0888=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E7BDF8032D;
	Thu, 11 Mar 2021 17:19:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 279E9F802D2; Thu, 11 Mar 2021 17:19:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3BFCF8015B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 17:19:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3BFCF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r1JtU5sj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84D9464F97;
 Thu, 11 Mar 2021 16:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615479571;
 bh=AFZsDVrJrAtJWcG1GG6obs737AUKvX7hTKFiz+JZZUg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=r1JtU5sjp3BLfF9gHUENNxLxY79k7OPlkh1srmbQ7Y+WbT6av82T4RB7ntRanXv+b
 AwdOQI48IGX2lcQ2Z1teGxn0mjC4NaftgNso9qzTuyEAMnCuXpg/9zUnU1FZnbQE4u
 WRQjwVbvxrl2kjvY/gGeyKnTq3UGgbc3R6ifDpmVZp9g5nBSrLwt5RFjRKYvRfKu/2
 QltXMs4+zspF859ua4Mk5tH024cTcC4G7+8OKZYklLA0UXPG4me2qymCPI+Q8MLlhw
 J9J7tF09GTFQIiofuompfwzvsjiqbB7j9Y8qhzAWJ7YFmgyPeafNwQwhip/OHAmtTT
 UqSSSihiMz0Yw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20210310193928.108850-1-pierre-louis.bossart@linux.intel.com>
References: <20210310193928.108850-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-core: fix DMI handling
Message-Id: <161547949199.51229.15758316133624899795.b4-ty@kernel.org>
Date: Thu, 11 Mar 2021 16:18:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Jean Delvare <jdelvare@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 tiwai@suse.de, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jon Hunter <jonathanh@nvidia.com>
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

On Wed, 10 Mar 2021 13:39:27 -0600, Pierre-Louis Bossart wrote:
> When DMI information is not present, trying to assign the card long
> name results in the following warning.
> 
> WARNING KERN tegra-audio-graph-card sound: ASoC: no DMI vendor name!
> 
> The initial solution suggested was to test if the card device is an
> ACPI one. This causes a regression visible to userspace on all Intel
> platforms, with UCM unable to load card profiles based on DMI
> information: the card devices are not necessarily ACPI ones, e.g. when
> the parent creates platform devices on Intel devices.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: fix DMI handling
      commit: c68fded79a9fe1376a60049f2ab45d611969de5c

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
