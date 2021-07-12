Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B923C546F
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 12:53:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34B5316A1;
	Mon, 12 Jul 2021 12:52:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34B5316A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626087221;
	bh=uFKZUcxNXvFFw4G5DZqnPtxsEn6x4z8FXcNoG6LIHjg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ryaw+Wc8TfZHLx34k9oJ23yIPRC9KiEycOwnRzcc5jY9gXwiM4y+IKDNL90UZjfAm
	 2z13VUJQ+KAvYqFkeiv7erv0lQYmrg6IRMJURuakDXwrAqY2O7dsJvjb18K7WNC7Xy
	 ttsOmHPI81d/V+XJOslfp0t2c1AXZ2UDz1MJLwEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3285DF8052E;
	Mon, 12 Jul 2021 12:48:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0D8CF8052D; Mon, 12 Jul 2021 12:48:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6A9CF8051C
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 12:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6A9CF8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LiU9m96l"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3FBE61158;
 Mon, 12 Jul 2021 10:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626086893;
 bh=uFKZUcxNXvFFw4G5DZqnPtxsEn6x4z8FXcNoG6LIHjg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LiU9m96l3e6mu9zH2H1BrDEqjFsnJfFkN0ZfLDwf3zlevCkmp986ILHlNA1Sd9q+i
 tM/8n8CBVic66xhQpbcnDesBdeTQnslz0t2x2bTsYbtRE+aKgZJj5v8v55TLz5rUY9
 MbMRJQe0wl5J/27uqgioi3eEwG/m0Ck0njA6WjOFv4HTivEq412u/m948vxzN7MoY1
 NyhY96u2zqnc4Lf6/iUExeGVlUxC9tKOsxA9DWaR3hu8nvcc6bZwWQDocoPwUE2zvi
 kpeHQxNa+8ieINcWeYeIyTWBW/KSymqinFQLtypZPc+YE1D6cSio/ifr5uJV+dgKYX
 j14htIzy+aBGA==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	tony@atomide.com
Subject: Re: (subset) [PATCH v2 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode
 and OMAP4 support
Date: Mon, 12 Jul 2021 11:46:10 +0100
Message-Id: <162608623153.3192.5424493872584215268.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: hns@goldelico.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
 linux-omap@vger.kernel.org
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

On Mon, 5 Jul 2021 22:42:44 +0300, Peter Ujfalusi wrote:
> Changes since v1:
> - Do not calculat that we allow one serializer in DIT mode, just set the
>   max_active_serializers to 1.
>   Reported-by: kernel test robot <lkp@intel.com>
> 
> it has been on my todo list for several years to support McASP on OMAP4 devices.
> For Galaxy Nexus we had an omap-mcasp driver (which was mostly a stripped down
> davinci-mcasp driver) to support what was needed on that specific phone + it's
> dock for S/PDIF (48KHz, 16bit, stereo).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: ti: davinci-mcasp: Fix DIT mode support
      commit: bbdd3f4dbe81e19b9123bc54e23ed54517615524
[2/5] ASoC: dt-bindings: davinci-mcasp: Add compatible string for OMAP4
      commit: 5dcd276e1525e0c7ae7aa1f0426b6343ebf994e0
[3/5] ASoC: ti: davinci-mcasp: Add support for the OMAP4 version of McASP
      commit: 0238bcf80e972f2ce25d767e54f89a9e49773f6e

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
