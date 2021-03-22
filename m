Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A7A34447B
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 14:03:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 292DA15F2;
	Mon, 22 Mar 2021 14:02:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 292DA15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616418190;
	bh=7DYx3XTcZIDSd/Yh62FnX1RO37xiq5KQmE62rcWToq0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n2VhZHq+NOXlZxyISRTgtumO7YQhiiYOYcx9lKOzQg6TYOuMPti+U1rxUjrDuqSWL
	 STkT+mTEiqz3nc5mNti3Ue8Egk1jdFLvjgwYSsfwTyFssn3GlQ/c10ZMWx32F75NqP
	 CggY4t8u65axH28IozqzDWYyhX6B31k6s3M8dQTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DC66F8025F;
	Mon, 22 Mar 2021 14:00:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1500F80107; Mon, 22 Mar 2021 14:00:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34BE8F80107
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 14:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34BE8F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nEmoDhtN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD21661606;
 Mon, 22 Mar 2021 13:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616418044;
 bh=7DYx3XTcZIDSd/Yh62FnX1RO37xiq5KQmE62rcWToq0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nEmoDhtN8jwxpOLSob/NcBDmKRt+eg0Cs5GxrDvaA/y4OFpI9Hd6rrraHGFEs0HWZ
 Em9uX+hSD3jNfZLdmr97Ww6gPNPrH3+FlLdW166YC8Aa1HoBKhmNEPmSD4Vjees/Yo
 39njxZauqFxcqGwDrGbk3bykeptRgKV6yVsVwFuAU9RnzFRl9eGI6hgpKuzbwT9Haf
 PJC/F1C8s09QgQOh7GPmRkdiOahygwsNHugnRCejWCuTQ0WaXjvg9qkgDQ/5vOUnaB
 aPST73yOFyNa2GlBWb6Jduw3yYpGepWNVLp/T+YXearJrUjaT6tEh0e2gkzAAnQ1FO
 LiwWVv4ap0JLQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v5 1/2] ASoC: amd: Add support for RT5682 codec in machine
 driver
Date: Mon, 22 Mar 2021 13:00:31 +0000
Message-Id: <161641797251.25992.139451453109004005.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1616118056-5506-1-git-send-email-Vijendar.Mukunda@amd.com>
References: <1616118056-5506-1-git-send-email-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Chuhong Yuan <hslester96@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, shumingf@realtek.com,
 Alexander.Deucher@amd.com, flove@realtek.com
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

On Fri, 19 Mar 2021 07:10:42 +0530, Vijendar Mukunda wrote:
> Add support for RT5682 codec in machine driver.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: Add support for RT5682 codec in machine driver
      commit: 7e71b48f9e27e437ca523432ea285c2585a539dc

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
