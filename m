Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C743313DD1
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 19:42:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC70816A9;
	Mon,  8 Feb 2021 19:41:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC70816A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612809744;
	bh=5IBhQ7c3BzKenFcsQ0x87dAwNhuhz1U+iCIXHPWQyxM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ISJYTKFI8Vxwqh8cu9EkKXV0uHVsJO/xVZibYp0JFCmbPQIUT177l7gF+L3e6Lw8a
	 7HOJ92UHM2gYLIfyGE1gMn3qrP7SPK/6KTsZLFSfM9jCmbyd17abXipJ8pCFFh8Q5B
	 rpxwj4JvpY4FAMkB1gtwBDYusXMiKRuAVaTvzwAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45DCBF802E2;
	Mon,  8 Feb 2021 19:39:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05E7BF802E0; Mon,  8 Feb 2021 19:39:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CEE6F802DB
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 19:39:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CEE6F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VU2VcT7T"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C962F64E6C;
 Mon,  8 Feb 2021 18:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612809569;
 bh=5IBhQ7c3BzKenFcsQ0x87dAwNhuhz1U+iCIXHPWQyxM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VU2VcT7TaDO3lBZ+GiDsY1XzFCoiEFRHjkWoyS5jY75bIxBkybh+BXvUmZR3aQexr
 i5/tDc4C08lpVQ6qJWPmzIg4cjhfZuowj47xMC1wkaV05c6mSTupTFN+IhSfIq/Fxs
 DTHkE4k3cBun8UqU0mmmDvlDQnYIlVSOO2GOv7tK9/Vm4Rn0BKHp881myK23Y9NMei
 l3AEJUcKYtBlrfOvjaQaiQTiwBDnVk0YqrwCylJf9hABDBIkCsKohzRxg5NrC4XZjH
 AoCt9qt7JjwtYz2JujdAeicrUJLpNmVH2b1xvTDhsrbIsP6duqD3JfJ4xw26EKb6Ct
 BqF7FZYwICdcQ==
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20210120214957.140232-1-hdegoede@redhat.com>
References: <20210120214957.140232-1-hdegoede@redhat.com>
Subject: Re: (subset) [PATCH v4 0/5] MFD/ASoC: Add support for Intel Bay Trail
 boards with WM5102 codec
Message-Id: <161280948306.10741.6212553639750410303.b4-ty@kernel.org>
Date: Mon, 08 Feb 2021 18:38:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

On Wed, 20 Jan 2021 22:49:52 +0100, Hans de Goede wrote:
> Here is v4 of my series to add support for Intel Bay Trail based devices
> which use a WM5102 codec for audio output/input.
> 
> This was developed and tested on a Lenovo Yoga Tablet 1051L.
> 
> The MFD and ASoC parts do not have any build-time dependencies
> on each other. But the follow-up jack-detect series does have
> patches depending on each-other and on this series. So IMHO it
> would be best if this entire series would be merged through the
> MFD tree to make merging the follow-up series easier.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[4/5] ASoC: Intel: Add DMI quirk table to soc_intel_is_byt_cr()
      commit: 8ade6d8b02b1ead741bd4f6c42921035caab6560
[5/5] ASoC: Intel: bytcr_wm5102: Add machine driver for BYT/WM5102
      commit: 9a87fc1e061900e81ab13d823e85012a78849244

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
