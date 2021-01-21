Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1312FF4D2
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 20:43:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A7921929;
	Thu, 21 Jan 2021 20:42:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A7921929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611258204;
	bh=FRCZ4e5i8h7FJWzAWrXVkKAdLyevp/j6/ZDUmvuTogA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BLQlwfk58SJTJsppJG9N4PPAb1VKljJuO0mPxdOGiRcqBfoGN276etPwjW5uutruB
	 A/WglasXt2cR90HIhS2t7/6pQidJIvqntl5droc/uGvp+TeLF0BS6G75l/egWXS3qB
	 omC4LPfptGlODwjiAWz2cSdNk3dsCXsF6gyuoN94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2A52F804E5;
	Thu, 21 Jan 2021 20:40:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4472F804E4; Thu, 21 Jan 2021 20:40:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C479EF804E2
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 20:40:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C479EF804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YPSnm+OB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC0AF23A40;
 Thu, 21 Jan 2021 19:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611258016;
 bh=FRCZ4e5i8h7FJWzAWrXVkKAdLyevp/j6/ZDUmvuTogA=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=YPSnm+OBrSKTNtsgv0TfK3yS6YfstFBu+7VVqPgNZfItrq//GH70KAavgkIQqzWXF
 FcXubMilZUCBZCRK2Sh+d7ldwVuSfkDcX2js1a8uRWchQONkshWVK2YYYGz7c8xt7f
 4nWm8tsXyBKMyUuN7Ckbeba/lPHd0LHrLQik948uWG/Ou1xnk9YW9yuH9gAo026hEY
 xce/RfjkL/fqiQHm8Ve6ZTzrEqB+9uWDZSed+2qUaE6PgIHslwOd1RCABdehZ0wiqI
 +WhTOjhGKd0S8sZzHqhjhLtwimvyFcv9W19UymBNPsiF5aUGTn74qsPRGUCr8G5Fwm
 oWNRAuv3hEpjQ==
From: Mark Brown <broonie@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Lukasz Majczak <lma@semihalf.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20210121171644.131059-1-ribalda@chromium.org>
References: <20210121171644.131059-1-ribalda@chromium.org>
Subject: Re: [PATCH v2 1/2] ASoC: Intel: Skylake: skl-topology: Fix OOPs ib
 skl_tplg_complete
Message-Id: <161125795422.35635.2779871383414045346.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 19:39:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 21 Jan 2021 18:16:43 +0100, Ricardo Ribalda wrote:
> If dobj->control is not initialized we end up in an OOPs during
> skl_tplg_complete:
> 
> [   26.553358] BUG: kernel NULL pointer dereference, address:
> 0000000000000078
> [   26.561151] #PF: supervisor read access in kernel mode
> [   26.566897] #PF: error_code(0x0000) - not-present page
> [   26.572642] PGD 0 P4D 0
> [   26.575479] Oops: 0000 [#1] PREEMPT SMP PTI
> [   26.580158] CPU: 2 PID: 2082 Comm: udevd Tainted: G         C
> 5.4.81 #4
> [   26.588232] Hardware name: HP Soraka/Soraka, BIOS
> Google_Soraka.10431.106.0 12/03/2019
> [   26.597082] RIP: 0010:skl_tplg_complete+0x70/0x144 [snd_soc_skl]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: Skylake: skl-topology: Fix OOPs ib skl_tplg_complete
      commit: c1c3ba1f78354a20222d291ed6fedd17b7a74fd7
[2/2] ASoC: Intel: Skylake: Zero snd_ctl_elem_value
      commit: 1d8fe0648e118fd495a2cb393a34eb8d428e7808

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
